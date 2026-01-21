"use client";

import { RabbitAvatar } from "./rabbit-avatar";

interface ChatMessageProps {
  content: string;
  isBot: boolean;
  timestamp?: Date;
}

export function ChatMessage({ content, isBot, timestamp }: ChatMessageProps) {
  return (
    <div className={`flex gap-3 ${isBot ? "flex-row" : "flex-row-reverse"}`}>
      {isBot ? (
        <RabbitAvatar size="sm" />
      ) : (
        <div className="w-8 h-8 rounded-full bg-primary flex items-center justify-center text-primary-foreground text-sm font-medium">
          나
        </div>
      )}
      <div
        className={`max-w-[75%] px-4 py-3 rounded-2xl ${
          isBot
            ? "bg-card text-card-foreground rounded-tl-sm shadow-sm"
            : "bg-primary text-primary-foreground rounded-tr-sm"
        }`}
      >
        <p className="text-sm leading-relaxed whitespace-pre-wrap">{content}</p>
        {timestamp && (
          <p
            className={`text-xs mt-1 ${isBot ? "text-muted-foreground" : "text-primary-foreground/70"}`}
          >
            {timestamp.toLocaleTimeString("ko-KR", {
              hour: "2-digit",
              minute: "2-digit",
            })}
          </p>
        )}
      </div>
    </div>
  );
}
