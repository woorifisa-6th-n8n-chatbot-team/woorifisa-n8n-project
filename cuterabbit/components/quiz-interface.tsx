"use client";

import { Empty, EmptyHeader, EmptyTitle, EmptyDescription, EmptyMedia } from "@/components/ui/empty";
import { RabbitAvatar } from "./rabbit-avatar";
import { useEffect, useState } from "react";

type QuizType = "multiple_choice" | "short_answer" | "ox_scenario";
interface QuizQuestion {
  id: string;
  type: QuizType;
  question: string;
  options?: string[];
  hint?: string;
}
interface QuizAnswer {
  id: string;
  answer: string;
  explanation: string;
}
interface QuizSet {
  title: string;
  introduction: string;
  questions: QuizQuestion[];
  answers: QuizAnswer[];
}

export function QuizInterface() {
  const QUIZ_WEBHOOK_KEY = "quiz_webhook_url";
  const [quiz, setQuiz] = useState<QuizSet | null>(null);
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState<string | null>(null);
  const [inputValue, setInputValue] = useState("");
  const [result, setResult] = useState<string | null>(null);
  const [showAnswer, setShowAnswer] = useState(false);
  const [loading, setLoading] = useState(false);
  const [score, setScore] = useState(0);
  const [webhookUrl, setWebhookUrl] = useState<string>("");

  // Load webhookUrl from localStorage on mount
  useEffect(() => {
    if (typeof window !== "undefined") {
      const saved = localStorage.getItem(QUIZ_WEBHOOK_KEY);
      if (saved) setWebhookUrl(saved);
    }
  }, []);

  // Save webhookUrl to localStorage when changed
  useEffect(() => {
    if (typeof window !== "undefined" && webhookUrl) {
      localStorage.setItem(QUIZ_WEBHOOK_KEY, webhookUrl);
    }
  }, [webhookUrl]);
  // 퀴즈 세트 불러오기
  const fetchQuiz = async () => {
    setLoading(true);
    setResult(null);
    setShowAnswer(false);
    setSelected(null);
    setInputValue("");
    setScore(0);
    setCurrent(0);
    try {
      if (!webhookUrl) {
        setQuiz({
          title: "오류!",
          introduction:
            "퀴즈 Webhook URL이 설정되지 않았어요. 메인 메뉴의 설정에서 입력해주세요! 🐰",
          questions: [],
          answers: [],
        });
      } else {
        const res = await fetch(webhookUrl, {
          headers: { "Content-Type": "application/json" },
        });
        const data = await res.json();
        setQuiz(data[0]);
      }
    } catch {
      setResult("퀴즈를 불러오지 못했어요 🐰");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (!quiz && webhookUrl) fetchQuiz();
  }, [webhookUrl]);


  if (!webhookUrl) {
    return (
      <div className="flex flex-col items-center justify-center min-h-screen px-4">
        <Empty>
          <EmptyHeader>
            <EmptyMedia variant="icon">
              <RabbitAvatar size="md" />
            </EmptyMedia>
            <EmptyTitle>Webhook URL이 필요해요</EmptyTitle>
            <EmptyDescription>
              퀴즈 기능을 사용하려면 우측 상단 톱니바퀴(설정)에서 Webhook URL을 먼저 입력해주세요!<br />
              <span className="text-xs text-muted-foreground">n8n에서 발급한 Webhook URL을 입력해야 합니다.</span>
            </EmptyDescription>
          </EmptyHeader>
        </Empty>
      </div>
    );
  }

  if (!quiz) {
    return (
      <div className="flex flex-col items-center justify-center min-h-screen px-4">
        <div className="flex w-full max-w-2xl justify-center items-center mb-4 mx-auto">
          <h1 className="text-xl font-bold">🐰 퀴즈</h1>
        </div>
        {loading ? (
          <div>문제를 불러오는 중...</div>
        ) : (
          <button
            className="w-full max-w-md py-3 rounded-xl bg-primary text-white font-semibold text-lg shadow hover:bg-primary/90 transition mx-auto"
            onClick={fetchQuiz}
          >
            퀴즈 시작
          </button>
        )}
      </div>
    );
  }

  if (quiz.questions.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center min-h-screen px-4">
        <div className="flex w-full max-w-2xl justify-center items-center mb-4 mx-auto">
          <h1 className="text-xl font-bold text-center">🐰 오류</h1>
        </div>
        <div className="mt-2 text-sm text-muted-foreground text-center whitespace-pre-line max-w-md">
          {quiz.introduction}
        </div>
        <button
          className="w-full max-w-md py-3 rounded-xl bg-primary text-white font-semibold text-lg shadow hover:bg-primary/90 transition mx-auto mt-4"
          onClick={fetchQuiz}
        >
          다시 시도
        </button>
      </div>
    );
  }

  const q = quiz.questions[current];
  const answerObj = quiz.answers.find((a) => a.id === q.id);

  // 정답 확인
  const handleSubmit = () => {
    let isCorrect = false;
    if (q.type === "multiple_choice") {
      isCorrect =
        selected === answerObj?.answer ||
        selected === q.options?.[Number(answerObj?.answer) - 1];
    } else if (q.type === "short_answer") {
      isCorrect =
        inputValue.trim().toLowerCase() ===
        (answerObj?.answer || "").trim().toLowerCase();
    } else if (q.type === "ox_scenario") {
      isCorrect = selected === answerObj?.answer;
    }
    setResult(isCorrect ? "정답! 🎉" : "오답 😢");
    setShowAnswer(true);
    if (isCorrect) setScore((s) => s + 1);
  };

  // 다음 문제로 이동
  const handleNext = () => {
    setCurrent((c) => c + 1);
    setSelected(null);
    setInputValue("");
    setResult(null);
    setShowAnswer(false);
  };

  // 퀴즈 종료
  const isLast = current === quiz.questions.length - 1;

  return (
    <div className="flex flex-col items-center justify-center min-h-screen px-4">
      <div className="flex w-full max-w-2xl justify-center items-center mb-2 mx-auto ">
        <h1 className="text-xl font-bold text-center">{quiz.title}</h1>
      </div>
      <div className="text-sm text-muted-foreground mb-4 text-center whitespace-pre-line max-w-2xl mx-auto">
        {quiz.introduction}
      </div>
      <div className="mb-2 text-xs text-muted-foreground max-w-2xl mx-auto">
        {current + 1} / {quiz.questions.length} 문제
      </div>
      <div className="w-full max-w-md bg-card rounded-2xl p-6 shadow-md mb-6 mx-auto">
        <div className="text-base font-semibold mb-4 text-center">
          {q.question}
        </div>
        {q.type === "multiple_choice" && q.options && (
          <div className="flex flex-col gap-3">
            {q.options.map((opt, idx) => (
              <button
                key={opt}
                className={`w-full py-3 rounded-xl border text-lg font-medium transition-all ${selected === String(idx + 1) ? (showAnswer ? (selected === answerObj?.answer ? "bg-green-200 border-green-400" : "bg-red-200 border-red-400") : "bg-primary/10 border-primary") : "bg-secondary border-border hover:bg-primary/10"}`}
                onClick={() => !showAnswer && setSelected(String(idx + 1))}
                disabled={showAnswer}
              >
                {opt}
              </button>
            ))}
          </div>
        )}
        {q.type === "short_answer" && (
          <div className="flex flex-col gap-2">
            <input
              type="text"
              className="w-full border rounded-lg px-3 py-2 text-base"
              placeholder={q.hint || "정답을 입력하세요"}
              value={inputValue}
              onChange={(e) => setInputValue(e.target.value)}
              disabled={showAnswer}
            />
          </div>
        )}
        {q.type === "ox_scenario" && (
          <div className="flex gap-3 justify-center">
            {["O", "X"].map((opt) => (
              <button
                key={opt}
                className={`w-20 py-3 rounded-xl border text-lg font-bold transition-all ${selected === opt ? (showAnswer ? (selected === answerObj?.answer ? "bg-green-200 border-green-400" : "bg-red-200 border-red-400") : "bg-primary/10 border-primary") : "bg-secondary border-border hover:bg-primary/10"}`}
                onClick={() => !showAnswer && setSelected(opt)}
                disabled={showAnswer}
              >
                {opt}
              </button>
            ))}
          </div>
        )}
        {showAnswer && (
          <div className="mt-4 text-center font-bold text-lg">{result}</div>
        )}
        {showAnswer && answerObj?.explanation && (
          <div className="mt-2 text-sm text-muted-foreground text-center whitespace-pre-line">
            {answerObj.explanation}
          </div>
        )}
        {!showAnswer && (
          <button
            className="w-full py-3 rounded-xl bg-primary text-white font-semibold text-lg mt-6 shadow hover:bg-primary/90 transition"
            onClick={handleSubmit}
            disabled={
              q.type === "multiple_choice"
                ? !selected
                : q.type === "short_answer"
                  ? !inputValue.trim()
                  : q.type === "ox_scenario"
                    ? !selected
                    : true
            }
          >
            정답 제출
          </button>
        )}
        {showAnswer && !isLast && (
          <button
            className="w-full py-3 rounded-xl bg-primary text-white font-semibold text-lg mt-6 shadow hover:bg-primary/90 transition"
            onClick={handleNext}
          >
            다음 문제
          </button>
        )}
        {showAnswer && isLast && (
          <div className="mt-6 text-center">
            <div className="font-bold text-lg">퀴즈 종료!</div>
            <div className="mt-2 text-base">
              총 {quiz.questions.length}문제 중 {score}문제 정답
            </div>
            <button
              className="w-full py-3 rounded-xl bg-primary text-white font-semibold text-lg mt-4 shadow hover:bg-primary/90 transition"
              onClick={fetchQuiz}
            >
              다시 풀기
            </button>
          </div>
        )}
      </div>
    </div>
  );
}
