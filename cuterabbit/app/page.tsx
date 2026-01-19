"use client";
import { useRouter } from "next/navigation";

import { useState, useEffect } from "react";

export default function Home() {
  const router = useRouter();
  const [showSettings, setShowSettings] = useState(false);
  const [chatWebhook, setChatWebhook] = useState("");
  const [quizWebhook, setQuizWebhook] = useState("");
  useEffect(() => {
    if (typeof window !== "undefined") {
      const c = localStorage.getItem("chat_webhook_url");
      const q = localStorage.getItem("quiz_webhook_url");
      if (c) setChatWebhook(c);
      if (q) setQuizWebhook(q);
    }
  }, []);
  useEffect(() => {
    if (typeof window !== "undefined") {
      localStorage.setItem("chat_webhook_url", chatWebhook);
    }
  }, [chatWebhook]);
  useEffect(() => {
    if (typeof window !== "undefined") {
      localStorage.setItem("quiz_webhook_url", quizWebhook);
    }
  }, [quizWebhook]);

  return (
    <main className="min-h-screen bg-background flex flex-col items-center justify-center px-4 relative">
      {showSettings && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/30">
          <div className="bg-card rounded-2xl p-6 w-full max-w-xs shadow-lg relative">
            <button
              className="absolute top-2 right-2 text-xl text-muted-foreground hover:text-foreground"
              onClick={() => setShowSettings(false)}
              title="닫기"
            >
              ×
            </button>
            <h2 className="font-bold text-lg mb-4">Webhook URL 설정</h2>
            <div className="mb-4">
              <label className="block text-sm font-semibold mb-1">
                채팅 Webhook URL
              </label>
              <input
                type="text"
                className="w-full border rounded-lg px-3 py-2 text-sm"
                placeholder="http://localhost:5678/webhook/..."
                value={chatWebhook}
                onChange={(e) => setChatWebhook(e.target.value)}
              />
            </div>
            <div>
              <label className="block text-sm font-semibold mb-1">
                퀴즈 Webhook URL
              </label>
              <input
                type="text"
                className="w-full border rounded-lg px-3 py-2 text-sm"
                placeholder="http://localhost:5678/webhook/..."
                value={quizWebhook}
                onChange={(e) => setQuizWebhook(e.target.value)}
              />
            </div>
            <button
              className="w-full py-2 rounded-lg bg-primary text-white font-semibold mt-4"
              onClick={() => setShowSettings(false)}
            >
              저장
            </button>
          </div>
        </div>
      )}
      <img
        src="/icon.png"
        alt="CuteRabbit Icon"
        className="w-20 h-20 mb-4 rounded-full shadow-lg border bg-white object-contain"
        style={{ marginLeft: "auto", marginRight: "auto" }}
      />
      <h1 className="text-2xl font-bold mb-8 text-center">
        CuteRabbit 학습 도우미
      </h1>
      <div className="flex flex-col gap-6 w-full max-w-xs">
        <button
          className="w-full py-5 rounded-2xl bg-primary text-white text-lg font-semibold shadow-md hover:bg-primary/90 transition"
          onClick={() => router.push("/chat")}
        >
          🐰 채팅 시작
        </button>
        <button
          className="w-full py-5 rounded-2xl bg-secondary text-foreground text-lg font-semibold shadow-md hover:bg-secondary/80 transition"
          onClick={() => router.push("/quiz")}
        >
          📝 퀴즈 시작
        </button>
        <button
          className="w-full py-5 rounded-2xl bg-blue-100 text-foreground text-lg font-semibold shadow-md hover:bg-muted/80 transition flex items-center justify-center gap-2"
          onClick={() => setShowSettings((v) => !v)}
          title="설정"
        >
          ⚙ 설정
        </button>
      </div>
    </main>
  );
}
