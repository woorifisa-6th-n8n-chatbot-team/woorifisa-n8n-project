"use client"

import { RabbitAvatar } from "./rabbit-avatar"

export function TypingIndicator() {
  return (
    <div className="flex gap-3 items-end">
      <RabbitAvatar size="sm" isTyping />
      <div className="bg-card px-4 py-3 rounded-2xl rounded-tl-sm shadow-sm">
        <div className="flex gap-1">
          <span className="w-2 h-2 bg-muted-foreground/50 rounded-full animate-bounce" style={{ animationDelay: "0ms" }} />
          <span className="w-2 h-2 bg-muted-foreground/50 rounded-full animate-bounce" style={{ animationDelay: "150ms" }} />
          <span className="w-2 h-2 bg-muted-foreground/50 rounded-full animate-bounce" style={{ animationDelay: "300ms" }} />
        </div>
      </div>
    </div>
  )
}
