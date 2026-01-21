# AI-Driven Learning Assistant Platform

![banner](./docs/readme/banner.png)

## 📖 Project Overview

**LLM & RAG 기반의 교육 도메인 특화 지식 관리 및 학습 보조 솔루션**

교육 과정에서 발생하는 **지식 휘발성(Knowledge Volatility)** 문제와 강사와 수강생 간의 **피드백 루프 단절**을 해결하기 위해 설계되었습니다. 교육 과정의 비정형 데이터(Notion, Blog 등)를 벡터화하여 RAG(Retrieval-Augmented Generation) 파이프라인을 구축하고, 학습자의 질의 로그를 ELK Stack으로 수집·분석하여 정량적인 성취도 지표를 시각화합니다.

## 👨‍👩‍👧 팀원 소개

|                                                                         |                                                                    |                                                                         |
| :---------------------------------------------------------------------: | :----------------------------------------------------------------: | :---------------------------------------------------------------------: |
| <img src="https://avatars.githubusercontent.com/u/60088307?v=4?s=200"/> | <img src="https://avatars.githubusercontent.com/u/122732599?v=4"/> | <img src="https://avatars.githubusercontent.com/u/72748734?v=4?s=200"/> |
|               [**손정원**](https://github.com/handgarden)               |            [**이동욱**](https://github.com/cuterrabbit)            |                 [**이승준**](https://github.com/HiLeeS)                 |

## 🏗 System Architecture

#### 1. Custom Crawler & ETL Pipeline (Express + FireCrawl)

- **Architecture**: Notion API의 Rate Limit 및 블록 렌더링 제약을 우회하기 위해 Headless Browser 기반의 커스텀 크롤러 구현.
- **Function**: Notion, Tistory, Velog 등 이기종 플랫폼에 분산된 기술 문서의 DOM을 파싱하고, 마크다운 형태로 정규화(Normalization)하여 학습 데이터셋 구축.

#### 2. RAG Engine (n8n + OpenAI + Pinecone)

- **Vector Search**: Pinecone Vector DB를 활용하여 수강생 질문과 가장 유사도(Cosine Similarity)가 높은 커리큘럼 컨텍스트를 실시간 조회.

#### 3. Quiz Generator

- **Workflow**: 학습자의 누적 질의 키워드와 수집한 문서를 매핑하여 개인화된 퀴즈 문항 자동 생성 (Webhook Trigger).
- **Data Persistence**: 퀴즈 수행 결과를 MySQL에 적재하여 학습 성취도 추적.

#### 4. Analytics Dashboard (ELK Stack)

- **Log Aggregation**: Logstash 파이프라인을 통해 MySQL의 질의/퀴즈 로그를 실시간 수집.
- **Visualization**: Elasticsearch 인덱싱 및 Kibana 대시보드를 통해 '질문 빈도 히트맵', '이해도 추이', '취약 토픽 분석' 등 인사이트 시각화.

#### 5. Automated Reporting Service

- **Batch Processing**: 주간 단위 트리거를 통해 학습 로그 집계 및 QuickChart API 기반의 시각화 객체 생성.
- **Delivery**: 수강생별 맞춤형 주간 리포트 이메일 자동 발송 시스템 구축.

## 🛠 Tech Stack

| 구분          | 기술                                                                                                                                                                                                                                                           | 비고                            |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| **Backend**   | <img src="https://img.shields.io/badge/n8n-FF6584?logo=n8n&logoColor=white" /> <img src="https://img.shields.io/badge/Express-000000?logo=express&logoColor=white" />                                                                                          | 워크플로우 자동화 및 크롤링     |
| **Frontend**  | <img src="https://img.shields.io/badge/Next.js-000000?logo=nextdotjs&logoColor=white" />                                                                                                                                                                       | 채팅 및 퀴즈 인터페이스         |
| **AI / LLM**  | <img src="https://img.shields.io/badge/OpenAI-412991?logo=openai&logoColor=white" />                                                                                                                                                                           | GPT / Embedding                 |
| **Database**  | <img src="https://img.shields.io/badge/Pinecone-000000?logo=pinecone&logoColor=white" /> <img src="https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white" /> <img src="https://img.shields.io/badge/Redis-DC382D?logo=redis&logoColor=white" /> | 벡터 검색 / RDBMS / 캐시·메모리 |
| **Analytics** | <img src="https://img.shields.io/badge/Elastic%20Stack-005571?logo=elastic&logoColor=white" />                                                                                                                                                                 | 로그 수집·검색·시각화           |
| **DevOps**    | <img src="https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white" />                                                                                                                                                                           | 컨테이너 배포                   |

## 🔧 Technical Issues & Solutions

### 1. Data Persistence & Volume Mapping Strateg

![볼륨이슈](./docs/readme/docekr-compose-volume-issue.png)

- **Issue**: Docker Compose 볼륨 재생성 이슈.
- **Analysis**: 호스트-컨테이너 간 볼륨 마운트 경로 설정 미흡.
- **Solution**: 기존 볼륨을 백업 후 새 볼륨으로 복원하는 방법으로 데이터 복원.

### 2. Virtualization Resource Scheduling Optimization

![리소스이슈](./docs/readme/virtualbox-issue.png)

- **Issue**: 리소스 증설(Scale-up) 후 오히려 응답 지연(Latency)이 증가하는 역설적 성능 저하 발생.
- **Analysis**: 호스트 자원 대비 과도한 vCPU 할당으로 인한 **Co-Scheduling Overhead** 및 **CPU Ready Time** 급증 확인.
- **Solution**: vCPU 할당량을 최소화하여 해결.

---

## 📂 Directory Structure

```text
.
├── frontend/          # Next.js Client Application
├── backend/           # n8n Workflows & Configuration
├── crawler/           # Custom Scraper (Express, Puppeteer/FireCrawl)
├── db/                # MySQL Schema & Init Scripts
├── elk/               # Logstash Pipeline & ELK Config
├── docker/            # Docker Compose & Environment Setup
└── assets/            # Documentation Resources

```

---

## 📬 설치 및 실행

**1. Clone Repository**

```bash
git clone https://github.com/your-repo/ai-learning-helper.git
cd ai-learning-helper

```

**2. Setup Environment Configuration**

```bash
# Set Notion Target URL & API Keys
echo "NOTION_URL={{TARGET_URL}}" > ./crawler/.env

```

**3. Build & Run Containers**

```bash
docker-compose up -d --build

```

**4. 서비스 주소**

- **웹**: `http://localhost:4000`
- **N8N**: `http://localhost:5678`
- **Kibana**: `http://localhost:5601`

---
