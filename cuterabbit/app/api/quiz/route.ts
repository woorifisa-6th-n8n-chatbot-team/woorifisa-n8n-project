import { NextResponse } from "next/server";

// 데모: n8n 퀴즈 webhook 응답 포맷
const demoQuiz = {
  title: "이번 주 복습 퀴즈 (Weekly Review)",
  introduction:
    "안녕하세요! 이번 주에 학습한 주요 내용을 복습해 볼까요?\n가볍게 퀴즈를 풀며 본인의 이해도를 체크해 보세요! 🔥",
  questions: [
    {
      id: "Q1",
      type: "multiple_choice",
      question:
        "Java 제네릭에서 와일드카드(?)의 역할로 올바른 것은 무엇인가요?",
      options: [
        "컴파일 오류를 무시하기 위해 사용한다",
        "모든 타입을 무조건 허용하는 의미만 갖는다",
        "? extends T는 T와 그 하위 타입만 허용한다",
        "? super T는 T보다 하위 타입만 허용한다",
      ],
    },
    {
      id: "Q2",
      type: "short_answer",
      question:
        "XSS 공격을 방어하기 위해 HTML 문서에 설정하는 보안 정책 명칭은 무엇인가요?",
      hint: "웹 브라우저에서 리소스가 로드되는 방식을 제한하는 HTTP 헤더입니다.",
    },
    {
      id: "Q3",
      type: "ox_scenario",
      question:
        "equals와 hashCode 메서드는 서로 관련 없는 기능으로 수정을 각각 독립적으로 해도 문제없다. OX?",
    },
  ],
  answers: [
    {
      id: "Q1",
      answer: "3",
      explanation:
        "와일드카드 '? extends T'는 T 타입과 그 하위 타입만 허용해 안전한 읽기 전용 접근을 제공한다.",
    },
    {
      id: "Q2",
      answer: "Content-Security-Policy",
      explanation:
        "Content-Security-Policy 헤더는 XSS 공격 등 스크립트 실행을 제어하여 보안을 강화한다.",
    },
    {
      id: "Q3",
      answer: "X",
      explanation:
        "equals와 hashCode는 반드시 일관성 있게 구현되어야 하며, 둘 중 하나라도 잘못 구현하면 컬렉션에서 문제를 일으킬 수 있다.",
    },
  ],
};

export async function POST(request: Request) {
  try {
    const { webhookUrl } = await request.json();

    if (!webhookUrl) {
      return NextResponse.json(
        {
          title: "오류!",
          introduction:
            "퀴즈 Webhook URL이 설정되지 않았어요. 메인 메뉴의 설정에서 입력해주세요! 🐰",
          questions: [],
          answers: [],
        },
        { status: 200 },
      );
    }

    const n8nResponse = await fetch(webhookUrl, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (!n8nResponse.ok) {
      try {
        console.log(await n8nResponse.json());
      } catch {}
      throw new Error(`n8n responded with status: ${n8nResponse.status}`);
    }

    const data = await n8nResponse.json();
    return NextResponse.json(data);
  } catch (error) {
    console.error("Quiz API Error:", error);
    return NextResponse.json(demoQuiz);
  }
}
