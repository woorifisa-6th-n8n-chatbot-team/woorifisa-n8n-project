import "dotenv/config";
import express from "express";
import puppeteer from "puppeteer";

interface CrawledPage {
  title: string;
  url: string;
  content: string;
  crawledAt: string;
  depth: number;
}

async function crawlNotion(
  rootUrl: string,
  maxDepth: number = 2,
  excludeUrls: string[] = [],
): Promise<CrawledPage[]> {
  const rootHost = new URL(rootUrl).host;
  const pages: CrawledPage[] = [];
  const queue: Array<{ url: string; depth: number }> = [
    { url: rootUrl, depth: 0 },
  ];
  const enqueued = new Set<string>([rootUrl]);
  const excludeSet = new Set(excludeUrls);

  const browser = await puppeteer.launch({
    headless: true,
    args: ["--no-sandbox", "--disable-setuid-sandbox"],
  });

  const page = await browser.newPage();
  await page.setUserAgent(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36",
  );

  try {
    while (queue.length > 0) {
      const current = queue.shift();
      if (!current) break;

      const { url, depth } = current;

      // depth 2부터는 excludeUrls에 있으면 건너뛰기 (페이지 조회 안함)
      if (depth >= 2 && excludeSet.has(url)) {
        console.log(`[건너뜀] 깊이 ${depth}: ${url} (제외 목록)`);
        continue;
      }

      console.log(`[크롤링] 깊이 ${depth}: ${url}`);

      try {
        await page.goto(url, {
          waitUntil: "domcontentloaded",
          timeout: 60000,
        });
        // 페이지 로딩 대기
        await new Promise((resolve) => setTimeout(resolve, 2000));
        await page
          .waitForSelector(".notion-page-content", { timeout: 5000 })
          .catch(() => null);

        // 데이터 수집 (excludeUrls에 없는 경우만)
        const shouldCollectData = url === rootUrl || !excludeSet.has(url);

        if (shouldCollectData) {
          const data = await page.evaluate(() => {
            const titleCandidate = document.querySelector(
              ".notion-page-content h1, header h1, h1",
            );
            const pageTitle = titleCandidate
              ? (titleCandidate as HTMLElement).innerText.trim()
              : (document.title || "Untitled Notion Page").trim();

            const contentRoot = document.querySelector(
              ".notion-page-content",
            ) as HTMLElement | null;
            const textContent = contentRoot
              ? contentRoot.innerText.trim()
              : document.body
                ? document.body.innerText.trim()
                : "";

            return {
              title: pageTitle || "Untitled Notion Page",
              content: textContent,
            };
          });

          pages.push({
            title: data.title,
            url,
            content: data.content,
            crawledAt: new Date().toISOString(),
            depth,
          });

          console.log(`  ✅ 데이터 수집 완료: ${data.title}`);
        } else {
          console.log(`  ⏭️  제외된 페이지 (링크만 추출)`);
        }

        // 다음 깊이 탐색
        if (depth < maxDepth) {
          const foundLinks = await page.evaluate(() => {
            const linkElements = Array.from(
              document.querySelectorAll<HTMLAnchorElement>("a[href]"),
            );
            return linkElements
              .map((anchor) => anchor.href)
              .filter((href) => href && !href.startsWith("javascript:"));
          });

          const nextUrls = foundLinks
            .map((link) => {
              try {
                const linkUrl = new URL(link);
                linkUrl.hash = "";
                return linkUrl.toString();
              } catch {
                return "";
              }
            })
            .filter((absUrl) => {
              if (!absUrl) return false;
              try {
                const inspected = new URL(absUrl);
                if (
                  inspected.protocol !== "http:" &&
                  inspected.protocol !== "https:"
                ) {
                  return false;
                }
                return inspected.host === rootHost;
              } catch {
                return false;
              }
            });

          for (const nextUrl of nextUrls) {
            if (!enqueued.has(nextUrl)) {
              queue.push({ url: nextUrl, depth: depth + 1 });
              enqueued.add(nextUrl);
            }
          }
        }

        await new Promise((resolve) => setTimeout(resolve, 300));
      } catch (error) {
        console.error(`[크롤링 실패] ${url}:`, error);
      }
    }
  } finally {
    await page.close();
    await browser.close();
  }

  console.log(`✅ 총 ${pages.length}개 페이지 크롤링 완료`);
  return pages;
}

function main() {
  const app = express();
  app.use(express.json());

  app.get("/", (req, res) => {
    res.send("Notion Crawler API Server");
  });

  // 노션 크롤링 (제외 URL은 링크만 타고 데이터는 수집 안함)
  app.post("/crawl", async (req, res) => {
    try {
      const notionUrl = process.env.NOTION_URL;

      if (!notionUrl) {
        return res.status(400).json({
          error: "NOTION_URL 환경변수가 설정되지 않았습니다.",
        });
      }

      const { excludeUrls = [], maxDepth = 2 } = req.body;

      console.log(
        `🚀 노션 크롤링 시작: ${notionUrl} (깊이: ${maxDepth}, 제외: ${excludeUrls.length}개)`,
      );

      const pages = await crawlNotion(notionUrl, maxDepth, excludeUrls);

      res.json({
        success: true,
        totalPages: pages.length,
        pages,
      });
    } catch (error) {
      console.error("❌ 크롤링 실패:", error);
      res.status(500).json({
        success: false,
        error: error instanceof Error ? error.message : "크롤링 실패",
      });
    }
  });

  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`🚀 Notion Crawler Server running on port ${PORT}`);
    console.log(`   GET / - 서버 상태 확인`);
    console.log(
      `   POST /crawl - 노션 크롤링 (body: { maxDepth?: 2, excludeUrls?: [] })`,
    );
    console.log(
      `   ※ excludeUrls: 링크는 타고 들어가지만 데이터는 수집하지 않음`,
    );
  });
}

main();
