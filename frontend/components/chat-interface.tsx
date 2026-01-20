"use client";

import React from "react";

import { useState, useRef, useEffect } from "react";
import { Send } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ChatMessage } from "./chat-message";
import { TypingIndicator } from "./typing-indicator";
import { RabbitAvatar } from "./rabbit-avatar";
import { Empty, EmptyHeader, EmptyTitle, EmptyDescription, EmptyMedia } from "@/components/ui/empty";

interface Message {
  id: string;
  content: string;
  isBot: boolean;
  timestamp: Date;
}

export function ChatInterface() {
  const CHAT_KEY = "chat_history";
  const WEBHOOK_KEY = "chat_webhook_url";
  const [messages, setMessages] = useState<Message[]>(() => {
    if (typeof window !== "undefined") {
      const saved = localStorage.getItem(CHAT_KEY);
      if (saved) {
        try {
          const parsed = JSON.parse(saved);
          // 날짜 복원
          return parsed.map((msg: any) => ({
            ...msg,
            timestamp: new Date(msg.timestamp),
          }));
        } catch {}
      }
    }
    return [
      {
        id: "welcome",
        content: "안녕하세요! 저는 CuteRabbit이에요 🐰\n무엇이든 물어보세요!",
        isBot: true,
        timestamp: new Date(),
      },
    ];
  });
  const [webhookUrl, setWebhookUrl] = useState<string>("");
  const [input, setInput] = useState("");
  // Load webhookUrl from localStorage on mount
  useEffect(() => {
    if (typeof window !== "undefined") {
      const saved = localStorage.getItem(WEBHOOK_KEY);
      if (saved) setWebhookUrl(saved);
    }
  }, []);

  // Save webhookUrl to localStorage when changed
  useEffect(() => {
    if (typeof window !== "undefined" && webhookUrl) {
      localStorage.setItem(WEBHOOK_KEY, webhookUrl);
    }
  }, [webhookUrl]);
  const [isLoading, setIsLoading] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages, isLoading]);

  // 메시지 변경 시 localStorage에 저장
  useEffect(() => {
    if (typeof window !== "undefined") {
      localStorage.setItem(
        CHAT_KEY,
        JSON.stringify(
          messages.map((msg) => ({
            ...msg,
            timestamp: msg.timestamp.toISOString(),
          })),
        ),
      );
    }
  }, [messages]);

  const sendMessage = async () => {
    if (!input.trim() || isLoading) return;
    if (!webhookUrl) {
      setMessages((prev) => [
        ...prev,
        {
          id: Date.now().toString(),
          content:
            "Webhook URL이 설정되지 않았어요. 우측 상단 톱니바퀴에서 설정해주세요!",
          isBot: true,
          timestamp: new Date(),
        },
      ]);
      return;
    }

    const userMessage: Message = {
      id: Date.now().toString(),
      content: input.trim(),
      isBot: false,
      timestamp: new Date(),
    };

    setMessages((prev) => [...prev, userMessage]);
    setInput("");
    setIsLoading(true);

    try {
      const response = await fetch(webhookUrl, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          chatInput: userMessage.content,
          sessionId: "cuterabbit-session",
        }),
      });

      if (!response.ok) {
        throw new Error(`n8n responded with status: ${response.status}`);
      }

      // n8n이 여러 JSON 오브젝트를 stream으로 보내는 경우 처리
      const reader = response.body?.getReader();
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

      const botMessage: Message = {
        id: (Date.now() + 1).toString(),
        content: botResponse || "죄송해요, 응답을 받지 못했어요 🐰",
        isBot: true,
        timestamp: new Date(),
      };

      setMessages((prev) => [...prev, botMessage]);
    } catch {
      const errorMessage: Message = {
        id: (Date.now() + 1).toString(),
        content: "연결에 문제가 생겼어요. 다시 시도해주세요! 🐰",
        isBot: true,
        timestamp: new Date(),
      };
      setMessages((prev) => [...prev, errorMessage]);
    } finally {
      setIsLoading(false);
      inputRef.current?.focus();
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  };

  // 웹훅 URL이 없으면 안내 UI를 보여줌
  if (!webhookUrl) {
    return (
      <div className="flex flex-col h-screen max-w-2xl mx-auto items-center justify-center">
        <Empty>
          <EmptyHeader>
            <EmptyMedia variant="icon">
              <RabbitAvatar size="md" />
            </EmptyMedia>
            <EmptyTitle>Webhook URL이 필요해요</EmptyTitle>
            <EmptyDescription>
              채팅 기능을 사용하려면 설정 페이지에서 Webhook URL을 먼저 입력해주세요!<br />
              <span className="text-xs text-muted-foreground">n8n에서 발급한 Webhook URL을 입력해야 합니다.</span>
            </EmptyDescription>
          </EmptyHeader>
        </Empty>
      </div>
    );
  }

  return (
    <div className="flex flex-col h-screen max-w-2xl mx-auto">
      {/* Header */}
      <header className="flex items-center gap-4 px-6 py-4 bg-card/80 backdrop-blur-sm border-b border-border sticky top-0 z-10">
        <RabbitAvatar size="md" />
        <div>
          <h1 className="font-semibold text-lg text-foreground">CuteRabbit</h1>
          <p className="text-sm text-muted-foreground">당신의 귀여운 AI 학습 도우미</p>
        </div>
        <div className="ml-auto flex items-center gap-2">
          <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse" />
          <span className="text-xs text-muted-foreground">온라인</span>
        </div>
      </header>

      {/* Messages */}
      <main className="flex-1 overflow-y-auto px-4 py-6 space-y-4">
        {messages.map((message) => (
          <ChatMessage
            key={message.id}
            content={message.content}
            isBot={message.isBot}
            timestamp={message.timestamp}
          />
        ))}
        {isLoading && <TypingIndicator />}
        <div ref={messagesEndRef} />
      </main>

      {/* Input */}
      <footer className="p-4 bg-card/80 backdrop-blur-sm border-t border-border sticky bottom-0">
        <div className="flex items-center gap-3 bg-input rounded-2xl px-4 py-2 focus-within:ring-2 focus-within:ring-primary/50 transition-all">
          <input
            ref={inputRef}
            type="text"
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={handleKeyDown}
            placeholder="메시지를 입력하세요..."
            className="flex-1 bg-transparent outline-none text-foreground placeholder:text-muted-foreground text-sm"
            disabled={isLoading}
          />
          <Button
            onClick={sendMessage}
            disabled={!input.trim() || isLoading}
            size="icon"
            className="rounded-full w-10 h-10 shrink-0"
          >
            <Send className="w-4 h-4" />
            <span className="sr-only">메시지 전송</span>
          </Button>
        </div>
        <p className="text-xs text-center text-muted-foreground mt-2">
          CuteRabbit은 n8n으로 구동됩니다
        </p>
      </footer>
    </div>
  );
}
