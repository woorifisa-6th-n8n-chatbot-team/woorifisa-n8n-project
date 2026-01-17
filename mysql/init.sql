SET NAMES utf8mb4;
SET character_set_client = utf8mb4;
SET character_set_connection = utf8mb4;
SET character_set_results = utf8mb4;

-- 채팅 히스토리 테이블
CREATE TABLE IF NOT EXISTS fisa_chat_histories (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    question_type TEXT COMMENT '질문유형',
    learning_category TEXT COMMENT '학습카테고리',
    general_answer TEXT COMMENT '답변',
    schedule TEXT COMMENT '일정',
    course_material TEXT COMMENT '수업자료',
    blog_material TEXT COMMENT '블로그자료',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '채팅 히스토리';

-- 스케줄 테이블
CREATE TABLE IF NOT EXISTS fisa_schedule (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    schedule_date DATE NOT NULL COMMENT '일정 날짜',
    main_schedule TEXT COMMENT '주요 일정',
    detail_schedule TEXT COMMENT '상세 일정',
    special_lecture TEXT COMMENT '특별 강의',
    exam BOOLEAN DEFAULT FALSE COMMENT '시험 여부',
    extra_schedule TEXT COMMENT '추가 일정',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '스케줄 정보';

-- 스케줄 데이터 삽입
INSERT INTO fisa_schedule
(schedule_date, main_schedule, detail_schedule, special_lecture, exam, extra_schedule)
VALUES
('2025-12-30','웹서비스','서비스 프로그래밍','오리엔테이션',FALSE,NULL),
('2025-12-31','웹 서비스','서비스 프로그래밍',NULL,FALSE,NULL),
('2026-01-02','웹 서비스','서비스 프로그래밍',NULL,FALSE,NULL),
('2026-01-05','웹 서비스','서비스 프로그래밍',NULL,FALSE,NULL),
('2026-01-06','웹 서비스','서비스 프로그래밍',NULL,FALSE,NULL),
('2026-01-07','웹 서비스','서비스 프로그래밍',NULL,FALSE,NULL),
('2026-01-08','웹 서비스','데이터베이스',NULL,FALSE,NULL),
('2026-01-09','웹 서비스','데이터베이스',NULL,FALSE,NULL),

('2026-01-12','데이터 분석과 웹서비스','데이터베이스',NULL,FALSE,NULL),
('2026-01-13','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-14','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-15','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-16','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-19','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-20','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-21','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-22','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,NULL),
('2026-01-23','데이터 분석과 웹서비스','서비스 프레임워크',NULL,FALSE,'n8n 발표'),

('2026-01-24',NULL,NULL,'금융 테크 실무',FALSE,NULL),

('2026-02-04','데이터 분석과 웹서비스','서비스 프레임워크',NULL,TRUE,NULL),
('2026-02-05','기술 세미나',NULL,NULL,FALSE,NULL),
('2026-02-06','취업 특강',NULL,NULL,FALSE,NULL),
('2026-02-07',NULL,NULL,'금융 테크 실무',FALSE,NULL),

('2026-03-16','클라우드 엔지니어링','Devops',NULL,TRUE,NULL),
('2026-04-21','클라우드 엔지니어링','클라우드',NULL,TRUE,NULL),

('2026-06-18','프로젝트','발표회',NULL,FALSE,NULL),
('2026-06-19','프로젝트','발표회',NULL,FALSE,NULL),
('2026-06-22','융합해커톤',NULL,NULL,FALSE,NULL),
('2026-06-23','융합해커톤',NULL,NULL,FALSE,NULL),
('2026-06-24','취업특강',NULL,NULL,FALSE,NULL),
('2026-06-25','수료식',NULL,NULL,FALSE,NULL);

-- 크롤링 이력 테이블
CREATE TABLE IF NOT EXISTS fisa_crawl_history (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    source_type TEXT NOT NULL COMMENT '출처 타입 (notion, blog)',
    url TEXT NOT NULL COMMENT '크롤링한 URL',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '크롤링 시간',
    INDEX idx_source_type (source_type(50)),
    INDEX idx_url (url(255))
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '크롤링 이력';
