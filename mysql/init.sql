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

-- 채팅 히스토리 예시 데이터 삽입
INSERT INTO fisa_chat_histories
    (question_type, learning_category, general_answer, schedule, course_material, blog_material, created_at)
VALUES
    ('수업 내용 질문', '자바', '컬렉션(List/Map/Set) 차이와 사용 예시를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-06 09:15:00'),
    ('개념 질문', '자바', 'GC 동작(Young/Old, STW) 흐름을 설명했습니다.', '해당 없음', '없음', '없음', '2026-01-06 13:40:00'),
    ('과제 질문', 'Spring', 'DI/IoC 개념과 @Autowired 주의점을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-06 21:05:00'),
    ('오류 해결', 'DB', '트랜잭션 커밋/롤백이 안 되는 원인을 점검했습니다.', '해당 없음', '없음', '없음', '2026-01-07 02:20:00'),
    ('수업 내용 질문', '네트워크', 'HTTP 상태코드와 캐시 헤더를 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-07 10:30:00'),
    ('개념 질문', '자바', '예외 처리(checked/unchecked)와 throws 사용을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-07 15:55:00'),
    ('오류 해결', 'Docker', 'compose up 시 포트 충돌 해결 방법을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-07 23:10:00'),
    ('과제 질문', '보안', 'CSRF 동작 원리와 방어 토큰 흐름을 설명했습니다.', '해당 없음', '없음', '없음', '2026-01-08 07:05:00'),
    ('수업 내용 질문', 'SPRING', 'Filter/Interceptor 차이를 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-08 11:45:00'),
    ('개념 질문', 'DB', '인덱스가 느려지는 경우와 카디널리티를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-08 19:20:00'),
    ('오류 해결', '자바', '자바 버전/의존성 충돌로 빌드 실패한 케이스를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-09 01:40:00'),
    ('수업 내용 질문', '네트워크', '쿠키/세션/JWT 차이를 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-09 09:10:00'),
    ('과제 질문', '보안', 'Access/Refresh 토큰 재발급 플로우를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-09 14:25:00'),
    ('개념 질문', 'Docker', '이미지 레이어/캐시 전략을 요약했습니다.', '해당 없음', '없음', '없음', '2026-01-09 22:55:00'),
    ('오류 해결', '스프링', 'Bean 생성 실패 원인(컴포넌트 스캔/순환참조)을 점검했습니다.', '해당 없음', '없음', '없음', '2026-01-10 03:30:00'),
    ('수업 내용 질문', '자바', 'Stream과 for-loop 성능/가독성 trade-off를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-10 08:50:00'),
    ('개념 질문', 'DB', '정규화 vs 반정규화 기준을 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-10 12:15:00'),
    ('오류 해결', '네트워크', 'HTTPS 인증서 오류의 대표 원인을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-10 20:40:00'),
    ('과제 질문', '자바', '멀티스레드 동기화 방법을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-11 01:10:00'),
    ('수업 내용 질문', '보안', 'SQL Injection 방어(PreparedStatement)를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-11 06:35:00'),
    ('개념 질문', 'Spring', '트랜잭션 전파(propagation) 개념을 요약했습니다.', '해당 없음', '없음', '없음', '2026-01-11 11:05:00'),
    ('오류 해결', 'Docker', '볼륨 권한 문제로 DB가 안 뜨는 케이스를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-11 19:30:00'),
    ('과제 질문', '네트워크', '로드밸런서/리버스프록시 역할을 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-12 02:00:00'),
    ('수업 내용 질문', '자바', 'Servlet vs JSP 역할을 간단히 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-12 08:10:00'),
    ('개념 질문', 'DB', '조인 종류와 사용 기준을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-12 13:55:00'),
    ('오류 해결', '보안', '권한(403)과 인증(401) 오류 원인 체크리스트를 만들었습니다.', '해당 없음', '없음', '없음', '2026-01-12 21:25:00'),
    ('과제 질문', 'Spring', 'Validation 실패 시 메시지 처리 방법을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-13 04:45:00'),
    ('수업 내용 질문', '네트워크', '웹소켓과 HTTP 폴링 차이를 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-13 09:35:00'),
    ('개념 질문', '자바', '빌더 패턴/팩토리 메서드 장단점을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-13 16:10:00'),
    ('오류 해결', 'DB', '타임존 때문에 날짜 집계가 틀어지는 문제를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-13 23:50:00'),
    ('과제 질문', 'Docker', '멀티 스테이지 빌드로 이미지 크기 줄이는 방법을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-14 03:20:00'),
    ('수업 내용 질문', '보안', 'JWT 서명/검증 과정과 alg 주의점을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-14 10:05:00'),
    ('개념 질문', '스프링', '서블릿 필터 체인 순서를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-14 14:40:00'),
    ('오류 해결', '자바', '문자열 split/regex 때문에 예외가 나는 케이스를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-14 22:10:00'),
    ('과제 질문', '네트워크', 'CORS preflight(OPTIONS) 흐름을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-15 06:25:00'),
    ('수업 내용 질문', 'DB', 'EXPLAIN 보는 법과 튜닝 포인트를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-15 11:35:00'),
    ('개념 질문', '보안', '비밀번호 해싱(bcrypt/salt) 이유를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-15 17:55:00'),
    ('오류 해결', 'Docker', '컨테이너 내부 DNS 해석 문제를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-16 01:05:00'),
    ('과제 질문', '자바', '람다/함수형 인터페이스 사용 예시를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-16 08:45:00'),
    ('수업 내용 질문', 'Spring', '컨트롤러 예외 처리 전략을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-16 13:20:00'),
    ('개념 질문', '네트워크', 'OSI 7계층과 TCP/IP 매핑을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-16 20:30:00'),
    ('오류 해결', 'DB', '락 경합으로 응답이 느려지는 원인을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-17 02:40:00'),
    ('수업 내용 질문', 'Spring', '스프링 AOP가 필요한 이유를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-17 09:05:00'),
    ('과제 질문', '보안', '권한 설계에서 Role/Authority 구분을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-17 15:50:00'),
    ('개념 질문', '자바', 'equals/hashCode 계약과 HashMap 동작을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-17 22:35:00'),
    ('오류 해결', '네트워크', '요청이 간헐적으로 타임아웃 나는 원인들을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-18 05:15:00'),
    ('수업 내용 질문', 'DB', '페이징 성능(OFFSET vs 커서)을 비교했습니다.', '해당 없음', '없음', '없음', '2026-01-18 10:55:00'),
    ('과제 질문', 'JAVA', '제네릭(와일드카드) 사용 규칙을 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-18 18:05:00'),
    ('오류 해결', '보안', 'XSS 방어(escape/Content-Security-Policy)를 정리했습니다.', '해당 없음', '없음', '없음', '2026-01-19 00:20:00');

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
CREATE TABLE IF NOT EXISTS fisa_crawl_histories (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    source_type TEXT NOT NULL COMMENT '출처 타입 (notion, blog)',
    url TEXT NOT NULL COMMENT '크롤링한 URL',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '크롤링 시간',
    INDEX idx_source_type (source_type(50)),
    INDEX idx_url (url(255))
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '크롤링 이력';

-- 퀴즈 테이블
CREATE TABLE IF NOT EXISTS fisa_quiz_questions (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    question_id VARCHAR(10) NOT NULL COMMENT '질문 ID (Q1, Q2, Q3 ...)',
    type ENUM('multiple_choice', 'short_answer', 'ox_scenario') NOT NULL COMMENT '질문 유형',
    question TEXT NOT NULL COMMENT '질문 내용',
    options JSON NULL COMMENT '선택지가 있는 경우에만 JSON 배열로 저장',   
    answer VARCHAR(255) NOT NULL COMMENT '정답',
    explanation TEXT COMMENT '해설',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
);
