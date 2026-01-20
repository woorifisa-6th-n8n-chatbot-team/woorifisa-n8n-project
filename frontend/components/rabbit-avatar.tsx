"use client";

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
      <svg viewBox="0 0 100 100" className="w-full h-full">
        {/* Left Ear */}
        <ellipse
          cx="35"
          cy="25"
          rx="12"
          ry="25"
          fill="#FFB6C1"
          className={
            isTyping ? "animate-[wiggle_0.5s_ease-in-out_infinite]" : ""
          }
          style={{ transformOrigin: "35px 50px" }}
        />
        <ellipse cx="35" cy="25" rx="6" ry="15" fill="#FF91A4" />

        {/* Right Ear */}
        <ellipse
          cx="65"
          cy="25"
          rx="12"
          ry="25"
          fill="#FFB6C1"
          className={
            isTyping ? "animate-[wiggle_0.5s_ease-in-out_infinite_0.1s]" : ""
          }
          style={{ transformOrigin: "65px 50px" }}
        />
        <ellipse cx="65" cy="25" rx="6" ry="15" fill="#FF91A4" />

        {/* Face */}
        <circle cx="50" cy="60" r="32" fill="#FFE4E9" />

        {/* Cheeks */}
        <ellipse cx="28" cy="65" rx="8" ry="6" fill="#FFB6C1" opacity="0.6" />
        <ellipse cx="72" cy="65" rx="8" ry="6" fill="#FFB6C1" opacity="0.6" />

        {/* Eyes */}
        <ellipse cx="38" cy="55" rx="5" ry="6" fill="#333" />
        <ellipse cx="62" cy="55" rx="5" ry="6" fill="#333" />
        <circle cx="40" cy="53" r="2" fill="#fff" />
        <circle cx="64" cy="53" r="2" fill="#fff" />

        {/* Nose */}
        <ellipse cx="50" cy="68" rx="5" ry="4" fill="#FF91A4" />

        {/* Mouth */}
        <path
          d="M 45 74 Q 50 80 55 74"
          fill="none"
          stroke="#FF91A4"
          strokeWidth="2"
          strokeLinecap="round"
        />
      </svg>
    </div>
  );
}
