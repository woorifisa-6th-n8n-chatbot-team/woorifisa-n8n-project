"use client";
import { useRouter } from "next/navigation";
import { QuizInterface } from "../../components/quiz-interface";

export default function QuizPage() {
  const router = useRouter();
  return (
    <main className="min-h-screen bg-background">
      <button
        className="absolute top-4 left-4 z-20 bg-card/80 rounded-full p-2 shadow hover:bg-muted transition"
        onClick={() => router.push("/")}
        title="뒤로가기"
      >
        <svg width="24" height="24" fill="none" viewBox="0 0 24 24">
          <path stroke="currentColor" strokeWidth="2" d="M15 19l-7-7 7-7" />
        </svg>
      </button>
      <QuizInterface />
    </main>
  );
}
