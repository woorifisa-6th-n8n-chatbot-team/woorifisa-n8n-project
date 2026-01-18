# 설치 메뉴얼

## 교안 크롤러 URL 설정

- `notion-crawler` 디렉토리에 `.env` 파일 생성
- NOTION_URL 환경변수 설정:
  ```bash
  # notion-crawler/.env
  NOTION_URL=https://your-notion-published-page-url
  ```

## Docker compose 실행

- 현재 프로젝트에서 Terminal 생성
- docker-compose up -d --build 명령어 실행
  - compose가 없는 경우 추천 명령어 확인해서 설치

## 실행되는 서비스

- **n8n** (http://localhost:5678): 워크플로우 자동화 플랫폼
- **MySQL** (localhost:3306): 채팅 히스토리 데이터베이스
  - 데이터베이스: woorifisa
  - 사용자: fisa01 / 비밀번호: fisa01
  - 테이블:
    - fisa_chat_histories (질문유형, 학습카테고리, 답변 등 저장)
    - fisa_crawl_histories (타입, 링크)
- **Redis** (localhost:6379): 채팅 세션 메모리 저장소
  - 사용자: fisa01 / 비밀번호: fisa01
  - 용도: n8n 채팅 히스토리 임시 저장
- **Elasticsearch** (http://localhost:9200): 검색 및 분석 엔진
- **Kibana** (http://localhost:5601): 데이터 시각화 대시보드
- **Logstash**: MySQL 데이터를 Elasticsearch로 동기화 (5분마다 자동 실행)
- **Notion Crawler** (http://localhost:3000): Notion 교안 크롤링 API 서버
  - GET / : 서버 상태 확인
  - POST /crawl : Notion 페이지 크롤링 (body: { maxDepth?: 2, excludeUrls?: [] })
  - maxDepth: 크롤링 깊이 제어 (기본값 2)
  - excludeUrls: 링크는 타고 들어가지만 데이터는 수집하지 않을 URL 목록
  - depth 2 이상에서는 excludeUrls에 있는 페이지 조회 생략 (성능 최적화)

## Notion Crawler 사용 예제

### 기본 크롤링

```bash
curl -X POST http://localhost:3000/crawl \
  -H "Content-Type: application/json" \
  -d '{}'
```

### 깊이 제어 및 URL 제외

```bash
curl -X POST http://localhost:3000/crawl \
  -H "Content-Type: application/json" \
  -d '{
    "maxDepth": 3,
    "excludeUrls": [
      "https://www.notion.so/index-page",
      "https://www.notion.so/old-content"
    ]
  }'
```

### 응답 형식

```json
{
  "success": true,
  "totalPages": 15,
  "pages": [
    {
      "title": "Docker 기초",
      "url": "https://www.notion.so/docker-basics",
      "content": "Docker는 컨테이너 기반의...",
      "crawledAt": "2026-01-17T12:34:56.789Z",
      "depth": 0
    }
  ]
}
```

- **Notion Crawler** (http://localhost:3000): Notion 교안 크롤링 API 서버
  - GET / : 서버 상태 확인
  - POST /crawl : Notion 페이지 크롤링 (body: { maxDepth?: 2, excludeUrls?: [] })
  - maxDepth: 크롤링 깊이 제어 (기본값 2)
  - excludeUrls: 링크는 타고 들어가지만 데이터는 수집하지 않을 URL 목록
  - depth 2 이상에서는 excludeUrls에 있는 페이지 조회 생략 (성능 최적화)

## MySQL 데이터베이스

- 초기 테이블은 `mysql/init.sql` 파일에서 자동으로 생성됩니다
- **fisa_chat_histories** 테이블 구조:
  - id: 고유 ID
  - question_type: 질문유형
  - learning_category: 학습카테고리
  - general_answer: 일반답변
  - basic_knowledge_summary: 기본지식요약
  - schedule: 일정
  - course_material: 수업자료
  - blog_material: 블로그자료
  - created_at: 생성일

- **fisa_schedule** 테이블 구조:
  - id: 고유 ID
  - schedule_date: 일정 날짜
  - main_schedule: 주요 일정
  - detail_schedule: 세부 일정
  - special_lecture: 특강
  - exam: 시험 여부
  - extra_schedule: 추가 일정
  - created_at: 생성일

- **fisa_crawl_histories** 테이블 구조:
  - id: 고유 ID
  - source_type: 출처 타입 (notion, blog)
  - url: 크롤링한 URL
  - created_at: 생성일

## Kibana 데이터 시각화

- http://localhost:5601 접속
- Menu > Discover에서 데이터 확인
- MySQL의 chat_histories 데이터가 Logstash를 통해 자동으로 동기화됩니다

## n8n 구성

- http://localhost:5678 접속
- 회원가입 및 설정 진행
  - 실제 사용하는 이메일로 설정
  - 이메일 쿠폰 확인 후 적용

## n8n 프로젝트 구성 불러오기

- flows/WooriFisa.json 파일 불러오기
- 워크플로우 활성화

## pinecone API 키 연결

- [pinecone](https://www.pinecone.io/) 접속
- 회원가입
- 데이터베이스 생성
- 인덱스 2개 생성(생성할 때 dimension 1024 설정 꼭 확인)
  - woorifisa-blogs
  - woorifisa-lectures
  - ![dimension](./pinecone/dimension.png)
    ![indexes](./pinecone/indexes.png)
- api key 조회
  ![api-key](./pinecone/api-key.png)
- n8n credentials에 연결
  ![pinecone-add-key](./pinecone/add-key.png)

## firecrawl API 키 연결

- [firecrawl](https://www.firecrawl.dev/) 접속
- 회원가입
- api key 조회
  ![api-key](./firecrawl/api-key.png)
- n8n credentials에 연결
  ![firecrawl-add-key](./firecrawl/api-key.png)

## openai API 키 연결

- [openai](https://platform.openai.com/settings)
- openai key 가져와서 n8n credentials에 연결
  ![api-key](./openai/api-key.png)

## MySQL 연결

- mysql 노드 선택
- credentials 추가
- host: mysql
- database: woorifisa
- user: fisa01
- password: fisa01

## Redis 채팅 히스토리

- n8n에서 Redis 노드 사용 시 연결 정보:
  - Host: `redis` (Docker 컨테이너 간 통신은 서비스 이름 사용)
  - Port: 6379
  - Username: fisa01
  - Password: fisa01
