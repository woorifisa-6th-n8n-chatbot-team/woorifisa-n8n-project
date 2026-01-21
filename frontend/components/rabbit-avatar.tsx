"use client";

import Image from "next/image";

interface RabbitAvatarProps {
  size?: "sm" | "md" | "lg";
  isTyping?: boolean;
}

export function RabbitAvatar({
  size = "md",
  isTyping = false,
}: RabbitAvatarProps) {
  const sizeClasses = {
    sm: "w-8 h-8",
    md: "w-12 h-12",
    lg: "w-16 h-16",
  };

  return (
    <div className={`${sizeClasses[size]} relative`}>
      <Image src="/icon.png" alt="WOORIFISA Avatar" fill />
    </div>
  );
}
