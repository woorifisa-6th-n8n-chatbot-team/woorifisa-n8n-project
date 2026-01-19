import { NextResponse } from "next/server";

export async function POST(request: Request) {
  try {
    const { message, webhookUrl: customWebhookUrl } = await request.json();

    if (!message) {
      return NextResponse.json(
        { error: "메시지가 필요합니다" },
        { status: 400 },
      );
    }

    const webhookUrl = customWebhookUrl;

    if (!webhookUrl) {
      return NextResponse.json(
        {
          response: "n8n 웹훅이 설정되지 않았어요. 환경변수를 확인해주세요! 🐰",
        },
        { status: 200 },
      );
    }

    const n8nResponse = await fetch(webhookUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        chatInput: message,
        sessionId: "cuterabbit-session",
      }),
    });

    if (!n8nResponse.ok) {
      try {
        console.log(await n8nResponse.json());
      } catch {}
      throw new Error(`n8n responded with status: ${n8nResponse.status}`);
    }

    // n8n이 여러 JSON 오브젝트를 stream으로 보내는 경우 처리
    const reader = n8nResponse.body?.getReader();
    let decoder = new TextDecoder();
    let done = false;
    let buffer = "";
    let contentArr: string[] = [];
    if (reader) {
      while (!done) {
        const { value, done: doneReading } = await reader.read();
        done = doneReading;
        if (value) {
          buffer += decoder.decode(value, { stream: !done });
          let lines = buffer.split(/\r?\n/);
          buffer = lines.pop() || "";
          for (const line of lines) {
            if (!line.trim()) continue;
            try {
              const obj = JSON.parse(line);
              if (
                obj.type === "item" &&
                typeof obj.content === "string" &&
                obj.content
              ) {
                contentArr.push(obj.content);
              }
            } catch {}
          }
        }
      }
      // 마지막 남은 버퍼 처리
      if (buffer.trim()) {
        try {
          const obj = JSON.parse(buffer);
          if (
            obj.type === "item" &&
            typeof obj.content === "string" &&
            obj.content
          ) {
            contentArr.push(obj.content);
          }
        } catch {}
      }
    }
    let botResponse = contentArr.join("");
    return NextResponse.json({ response: botResponse });
  } catch (error) {
    console.error("Chat API Error:", error);
    return NextResponse.json(
      {
        response:
          "죄송해요, 지금은 응답할 수 없어요. 잠시 후 다시 시도해주세요! 🐰",
      },
      { status: 200 },
    );
  }
}
