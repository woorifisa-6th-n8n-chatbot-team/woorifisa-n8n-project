FROM node:20-alpine

# Puppeteer 실행에 필요한 패키지 설치
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Puppeteer가 설치된 Chromium을 사용하도록 설정
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

WORKDIR /app

# pnpm 설치
RUN corepack enable && corepack prepare pnpm@9.15.4 --activate

# 의존성 파일 복사
COPY package.json pnpm-lock.yaml ./

# 의존성 설치
RUN pnpm install --frozen-lockfile

# .env 파일 복사 (dotenv 사용)
COPY .env* ./

# 소스 코드 복사
COPY . .

# TypeScript 빌드
RUN pnpm build

# 포트 노출
EXPOSE 3000

# 애플리케이션 실행
CMD ["pnpm", "start"]
