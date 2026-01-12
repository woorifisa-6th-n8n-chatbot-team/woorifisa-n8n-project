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
    ('수업 내용 질문', '파이썬', '리스트/딕셔너리 차이', '해당 없음', '없음', '없음', '2025-01-10 09:30:00'),
    ('개념 질문', '파이썬', '가비지 컬렉션 동작', '해당 없음', '없음', '없음', '2025-01-12 14:15:00'),
    ('과제 질문', '자바', '클래스와 객체의 차이', '해당 없음', '없음', '없음', '2025-01-15 10:20:00'),
    ('오류 해결', '자바', 'NullPointerException 원인', '해당 없음', '없음', '없음', '2025-01-18 16:45:00'),
    ('수업 내용 질문', 'HTML', '시맨틱 태그 종류', '해당 없음', '없음', '없음', '2025-01-22 11:00:00'),
    ('개념 질문', 'CSS', 'Flex/Grid 차이', '해당 없음', '없음', '없음', '2025-01-25 13:30:00'),
    ('과제 질문', 'JavaScript', '클로저/스코프 설명', '해당 없음', '없음', '없음', '2025-02-03 09:40:00'),
    ('오류 해결', 'JavaScript', 'undefined 타입 에러', '해당 없음', '없음', '없음', '2025-02-07 15:20:00'),
    ('수업 내용 질문', '리눅스', '파일 권한/퍼미션 설명', '해당 없음', '없음', '없음', '2025-02-14 10:10:00'),
    ('개념 질문', '리눅스', '프로세스/스레드 차이', '해당 없음', '없음', '없음', '2025-02-20 14:50:00'),
    ('과제 질문', 'Node.js', '비동기 처리와 콜백', '해당 없음', '없음', '없음', '2025-03-05 11:30:00'),
    ('오류 해결', 'MySQL', '인덱스 손상 복구', '해당 없음', '없음', '없음', '2025-03-12 16:00:00'),
    ('수업 내용 질문', 'MySQL', 'JOIN 최적화 방법', '해당 없음', '없음', '없음', '2025-03-18 13:20:00'),
    ('개념 질문', 'DB', '트랜잭션 ACID 설명', '해당 없음', '없음', '없음', '2025-03-25 09:15:00'),
    ('과제 질문', 'React', 'useEffect 동작 원리', '해당 없음', '없음', '없음', '2025-04-02 10:45:00'),
    ('오류 해결', 'React', '상태관리 useState 오류', '해당 없음', '없음', '없음', '2025-04-08 14:10:00'),
    ('수업 내용 질문', '네트워크', 'TCP/UDP 차이와 활용', '해당 없음', '없음', '없음', '2025-04-15 11:50:00'),
    ('개념 질문', '네트워크', 'REST API 설계 원칙', '해당 없음', '없음', '없음', '2025-04-22 15:30:00'),
    ('과제 질문', 'Spring', 'DI/IoC 개념 설명', '해당 없음', '없음', '없음', '2025-05-03 09:20:00'),
    ('오류 해결', 'Spring', 'BeanCreationException 해결', '해당 없음', '없음', '없음', '2025-05-10 13:40:00'),
    ('수업 내용 질문', 'Spring', 'AOP 적용 사례', '해당 없음', '없음', '없음', '2025-05-17 10:55:00'),
    ('개념 질문', 'JPA', '영속성 컨텍스트란', '해당 없음', '없음', '없음', '2025-05-24 14:25:00'),
    ('과제 질문', 'Docker', 'Dockerfile 작성법', '해당 없음', '없음', '없음', '2025-06-05 11:15:00'),
    ('오류 해결', 'Docker', '컨테이너 포트 바인딩 오류', '해당 없음', '없음', '없음', '2025-06-12 16:50:00'),
    ('수업 내용 질문', 'Docker', 'Docker Compose 활용', '해당 없음', '없음', '없음', '2025-06-20 10:30:00'),
    ('개념 질문', 'AWS', 'EC2와 Lambda 차이', '해당 없음', '없음', '없음', '2025-07-02 13:00:00'),
    ('과제 질문', 'AWS', 'S3 버킷 정책 설정', '해당 없음', '없음', '없음', '2025-07-10 15:45:00'),
    ('오류 해결', 'Git', 'Merge Conflict 해결', '해당 없음', '없음', '없음', '2025-07-18 09:50:00'),
    ('수업 내용 질문', 'Git', 'Rebase와 Merge 차이', '해당 없음', '없음', '없음', '2025-08-01 11:20:00'),
    ('개념 질문', '보안', 'SQL Injection 방어법', '해당 없음', '없음', '없음', '2025-08-12 14:35:00'),
    ('과제 질문', '보안', 'JWT 토큰 구조 분석', '해당 없음', '없음', '없음', '2025-08-25 10:40:00'),
    ('오류 해결', 'Go', '고루틴 데드락 문제', '해당 없음', '없음', '없음', '2025-09-05 16:15:00'),
    ('수업 내용 질문', 'Go', '인터페이스/임베딩', '해당 없음', '없음', '없음', '2025-09-15 13:10:00'),
    ('개념 질문', 'Kotlin', '널 안정성 메커니즘', '해당 없음', '없음', '없음', '2025-09-25 09:30:00'),
    ('과제 질문', 'Python', '리스트 컴프리헨션 심화', '해당 없음', '없음', '없음', '2025-10-05 11:45:00'),
    ('오류 해결', 'Python', 'ImportError 경로 문제', '해당 없음', '없음', '없음', '2025-10-12 15:55:00'),
    ('수업 내용 질문', 'ELK', 'Logstash 파이프라인 설정', '해당 없음', '없음', '없음', '2025-10-20 10:25:00'),
    ('개념 질문', 'Redis', '캐싱 전략 패턴', '해당 없음', '없음', '없음', '2025-11-02 14:05:00'),
    ('과제 질문', 'Vue', '컴포넌트 생명주기', '해당 없음', '없음', '없음', '2025-11-15 11:10:00'),
    ('오류 해결', 'Vue', 'Reactivity 갱신 안됨', '해당 없음', '없음', '없음', '2025-11-25 16:30:00'),
    ('수업 내용 질문', 'TypeScript', '제네릭 유틸리티 타입', '해당 없음', '없음', '없음', '2025-12-05 10:50:00'),
    ('개념 질문', 'MSA', '서비스 디스커버리란', '해당 없음', '없음', '없음', '2025-12-12 13:40:00'),
    ('과제 질문', 'Kubernetes', 'Pod 생명주기 관리', '해당 없음', '없음', '없음', '2025-12-20 15:20:00'),
    ('오류 해결', 'Kubernetes', 'CrashLoopBackOff 원인', '해당 없음', '없음', '없음', '2025-12-28 17:00:00');

INSERT INTO fisa_chat_histories
    (question_type, learning_category, general_answer, schedule, course_material, blog_material, created_at)
VALUES
    -- 1분기: 기초 다지기 (Java, Python, Git)
    ('오류 해결', 'Git', 'git push 거부됨 (non-fast-forward)', '해당 없음', '없음', '없음', '2025-01-05 14:20:00'),
    ('개념 질문', 'CS', '동기 vs 비동기 차이점', '해당 없음', '없음', '없음', '2025-01-08 09:10:00'),
    ('수업 내용 질문', 'Java', 'Overloading vs Overriding', '해당 없음', '없음', '없음', '2025-01-12 11:00:00'),
    ('과제 질문', 'Python', '별찍기 반복문 로직', '해당 없음', '없음', '없음', '2025-01-15 23:40:00'),
    ('오류 해결', 'Java', 'Scanner 입력 버퍼 문제', '해당 없음', '없음', '없음', '2025-01-20 16:30:00'),
    ('수업 내용 질문', 'Linux', 'chmod 755 의미', '해당 없음', '없음', '없음', '2025-02-02 10:15:00'),
    ('개념 질문', 'DB', 'PK와 FK의 관계', '해당 없음', '없음', '없음', '2025-02-10 13:20:00'),
    ('과제 질문', 'Java', '객체지향 5원칙 (SOLID)', '해당 없음', '없음', '없음', '2025-02-18 20:00:00'),
    ('오류 해결', 'Linux', 'sudo command not found', '해당 없음', '없음', '없음', '2025-02-25 01:10:00'),
    ('수업 내용 질문', 'Network', 'HTTP Status 404 vs 500', '해당 없음', '없음', '없음', '2025-03-03 11:45:00'),
    ('개념 질문', 'OS', '컨텍스트 스위칭 비용', '해당 없음', '없음', '없음', '2025-03-10 15:30:00'),
    ('과제 질문', 'DB', 'ERD 다이어그램 그리기', '해당 없음', '없음', '없음', '2025-03-22 17:00:00'),
    ('오류 해결', 'Java', 'ConcurrentModificationException', '해당 없음', '없음', '없음', '2025-03-28 14:50:00'),

    -- 2분기: 웹 개발 심화 (Spring, React, SQL)
    ('수업 내용 질문', 'Spring', 'Spring Bean LifeCycle', '해당 없음', '없음', '없음', '2025-04-05 10:00:00'),
    ('개념 질문', 'Network', 'TCP 3-way handshake', '해당 없음', '없음', '없음', '2025-04-12 13:10:00'),
    ('과제 질문', 'Spring', 'MyBatis 동적 쿼리 작성', '해당 없음', '없음', '없음', '2025-04-20 22:30:00'),
    ('오류 해결', 'MySQL', 'Too many connections 에러', '해당 없음', '없음', '없음', '2025-04-25 09:40:00'),
    ('수업 내용 질문', 'React', 'Virtual DOM 작동 원리', '해당 없음', '없음', '없음', '2025-05-02 11:20:00'),
    ('개념 질문', 'Spring', 'PSA (Portable Service Abstraction)', '해당 없음', '없음', '없음', '2025-05-10 16:00:00'),
    ('과제 질문', 'React', 'Redux 상태 관리 흐름', '해당 없음', '없음', '없음', '2025-05-18 14:15:00'),
    ('오류 해결', 'Spring', 'Whitelabel Error Page 404', '해당 없음', '없음', '없음', '2025-05-25 19:50:00'),
    ('수업 내용 질문', 'JPA', 'N+1 문제 해결 방법', '해당 없음', '없음', '없음', '2025-06-03 10:30:00'),
    ('개념 질문', 'DB', 'NoSQL vs RDBMS 차이', '해당 없음', '없음', '없음', '2025-06-12 15:40:00'),
    ('과제 질문', 'Spring', 'RESTful API 설계 규칙', '해당 없음', '없음', '없음', '2025-06-20 23:10:00'),
    ('오류 해결', 'Git', 'Detached HEAD 상태 복구', '해당 없음', '없음', '없음', '2025-06-28 08:50:00'),

    -- 3분기: 인프라 및 배포 (Docker, AWS, CI/CD)
    ('수업 내용 질문', 'Docker', 'Image vs Container 차이', '해당 없음', '없음', '없음', '2025-07-05 11:00:00'),
    ('개념 질문', 'AWS', 'VPC 서브넷 구조', '해당 없음', '없음', '없음', '2025-07-15 14:20:00'),
    ('과제 질문', 'Docker', 'docker-compose.yml 작성법', '해당 없음', '없음', '없음', '2025-07-22 16:45:00'),
    ('오류 해결', 'AWS', 'EC2 SSH 접속 시간 초과', '해당 없음', '없음', '없음', '2025-07-30 02:00:00'),
    ('수업 내용 질문', 'CI/CD', 'Jenkins Pipeline 문법', '해당 없음', '없음', '없음', '2025-08-05 10:10:00'),
    ('개념 질문', 'DevOps', 'Immutable Infrastructure란', '해당 없음', '없음', '없음', '2025-08-12 13:50:00'),
    ('과제 질문', 'AWS', 'RDS 파라미터 그룹 설정', '해당 없음', '없음', '없음', '2025-08-20 21:30:00'),
    ('오류 해결', 'Docker', 'Volume 마운트 권한 거부', '해당 없음', '없음', '없음', '2025-08-28 17:20:00'),
    ('수업 내용 질문', 'Security', 'HTTPS 암호화 과정', '해당 없음', '없음', '없음', '2025-09-02 11:30:00'),
    ('개념 질문', 'AWS', 'IAM Role vs User', '해당 없음', '없음', '없음', '2025-09-10 15:00:00'),
    ('과제 질문', 'CI/CD', 'GitHub Actions 워크플로우', '해당 없음', '없음', '없음', '2025-09-18 19:40:00'),
    ('오류 해결', 'Nginx', '502 Bad Gateway 원인', '해당 없음', '없음', '없음', '2025-09-25 14:10:00'),

    -- 4분기: 심화 및 최종 프로젝트 (K8s, MSA, Troubleshooting)
    ('수업 내용 질문', 'K8s', 'Pod vs Node 차이', '해당 없음', '없음', '없음', '2025-10-05 10:40:00'),
    ('개념 질문', 'MSA', 'Circuit Breaker 패턴', '해당 없음', '없음', '없음', '2025-10-12 13:20:00'),
    ('과제 질문', 'K8s', 'Service NodePort 설정', '해당 없음', '없음', '없음', '2025-10-20 22:15:00'),
    ('오류 해결', 'K8s', 'CrashLoopBackOff 무한 반복', '해당 없음', '없음', '없음', '2025-10-28 03:30:00'),
    ('수업 내용 질문', 'Terraform', 'State 파일 관리 방법', '해당 없음', '없음', '없음', '2025-11-05 11:50:00'),
    ('개념 질문', 'Monitoring', 'Prometheus vs Grafana', '해당 없음', '없음', '없음', '2025-11-15 15:10:00'),
    ('과제 질문', 'K8s', 'Deployment 롤링 업데이트', '해당 없음', '없음', '없음', '2025-11-22 18:00:00'),
    ('오류 해결', 'Terraform', 'Provider 버전 충돌', '해당 없음', '없음', '없음', '2025-11-28 14:30:00'),
    ('수업 내용 질문', 'ArgoCD', 'GitOps 개념 설명', '해당 없음', '없음', '없음', '2025-12-05 10:20:00'),
    ('개념 질문', 'Cloud', 'Serverless 아키텍처 장단점', '해당 없음', '없음', '없음', '2025-12-10 13:45:00'),
    ('과제 질문', 'Project', '최종 프로젝트 아키텍처 검토', '해당 없음', '없음', '없음', '2025-12-18 21:00:00'),
    ('오류 해결', 'Project', 'DB 데드락 발생 분석', '해당 없음', '없음', '없음', '2025-12-24 01:20:00');

INSERT INTO fisa_chat_histories
    (question_type, learning_category, general_answer, schedule, course_material, blog_material, created_at)
VALUES
    -- 1월~3월: 파이썬 & 데이터 기초 (주말/새벽 집중)
    ('오류 해결', 'Python', 'IndentationError 해결', '해당 없음', '없음', '없음', '2025-01-11 02:15:00'),
    ('수업 내용 질문', 'Python', '얕은 복사 vs 깊은 복사', '해당 없음', '없음', '없음', '2025-01-18 14:30:00'),
    ('과제 질문', 'Pandas', 'DataFrame 결측치 처리', '해당 없음', '없음', '없음', '2025-01-26 23:50:00'),
    ('개념 질문', 'CS', '자료구조 Stack vs Queue', '해당 없음', '없음', '없음', '2025-02-01 10:00:00'),
    ('오류 해결', 'Python', 'pip install 버전 충돌', '해당 없음', '없음', '없음', '2025-02-09 16:20:00'),
    ('수업 내용 질문', 'SQL', 'GROUP BY와 HAVING 조건', '해당 없음', '없음', '없음', '2025-02-15 13:40:00'),
    ('과제 질문', 'Algorithm', '이진 탐색 구현 로직', '해당 없음', '없음', '없음', '2025-02-23 21:10:00'),
    ('개념 질문', 'Network', 'DNS 작동 원리', '해당 없음', '없음', '없음', '2025-03-01 11:30:00'),
    ('오류 해결', 'Git', 'gitignore 적용 안됨', '해당 없음', '없음', '없음', '2025-03-09 15:55:00'),
    ('수업 내용 질문', 'Linux', 'Vim 에디터 종료 방법', '해당 없음', '없음', '없음', '2025-03-15 00:30:00'),
    ('과제 질문', 'SQL', '서브쿼리 성능 이슈', '해당 없음', '없음', '없음', '2025-03-23 19:40:00'),
    ('오류 해결', 'Python', 'RecursionError 최대 깊이 초과', '해당 없음', '없음', '없음', '2025-03-30 03:10:00'),

    -- 4월~6월: 웹 프론트엔드 & 백엔드 기초 (평일 저녁/시험 기간)
    ('수업 내용 질문', 'HTML/CSS', 'Box Model 마진 병합', '해당 없음', '없음', '없음', '2025-04-06 19:20:00'),
    ('개념 질문', 'JavaScript', 'Hoisting 발생 이유', '해당 없음', '없음', '없음', '2025-04-13 10:50:00'),
    ('과제 질문', 'JavaScript', 'Promise.all 사용법', '해당 없음', '없음', '없음', '2025-04-19 22:15:00'),
    ('오류 해결', 'React', 'Map key prop 누락 경고', '해당 없음', '없음', '없음', '2025-04-27 14:00:00'),
    ('수업 내용 질문', 'Network', 'CORS 에러 해결 헤더', '해당 없음', '없음', '없음', '2025-05-04 16:45:00'),
    ('개념 질문', 'Spring', 'DispatcherServlet 역할', '해당 없음', '없음', '없음', '2025-05-11 09:30:00'),
    ('과제 질문', 'Spring', 'DTO vs Entity 분리 이유', '해당 없음', '없음', '없음', '2025-05-17 21:00:00'),
    ('오류 해결', 'Java', 'JDBC Connection Timeout', '해당 없음', '없음', '없음', '2025-05-24 13:20:00'),
    ('수업 내용 질문', 'DB', 'Index 타는 쿼리 작성법', '해당 없음', '없음', '없음', '2025-06-01 11:10:00'),
    ('개념 질문', 'Security', 'JWT vs Session 인증 차이', '해당 없음', '없음', '없음', '2025-06-08 15:50:00'),
    ('과제 질문', 'Spring', 'Interceptor 구현 예제', '해당 없음', '없음', '없음', '2025-06-15 20:30:00'),
    ('오류 해결', 'React', 'Rendering Infinite Loop', '해당 없음', '없음', '없음', '2025-06-22 02:45:00'),
    ('수업 내용 질문', 'JPA', 'Fetch Type Lazy vs Eager', '해당 없음', '없음', '없음', '2025-06-29 10:15:00'),

    -- 7월~9월: 클라우드 & 배포 심화 (휴가철에도 공부하는 독한 유형)
    ('개념 질문', 'Docker', 'Layer Cache 활용법', '해당 없음', '없음', '없음', '2025-07-06 14:00:00'),
    ('과제 질문', 'AWS', 'S3 정적 웹 호스팅 설정', '해당 없음', '없음', '없음', '2025-07-13 16:30:00'),
    ('오류 해결', 'Linux', 'Disk Space Full (No Space)', '해당 없음', '없음', '없음', '2025-07-20 09:10:00'),
    ('수업 내용 질문', 'Network', 'Load Balancer 알고리즘', '해당 없음', '없음', '없음', '2025-07-27 11:45:00'),
    ('개념 질문', 'CI/CD', 'Blue/Green 배포 전략', '해당 없음', '없음', '없음', '2025-08-03 13:20:00'),
    ('과제 질문', 'Docker', 'Multi-stage Build 최적화', '해당 없음', '없음', '없음', '2025-08-10 22:50:00'),
    ('오류 해결', 'Spring', 'Profile 설정 불일치', '해당 없음', '없음', '없음', '2025-08-17 15:10:00'),
    ('수업 내용 질문', 'AWS', 'Route53 도메인 연결', '해당 없음', '없음', '없음', '2025-08-24 10:40:00'),
    ('개념 질문', 'K8s', 'ReplicaSet 동작 원리', '해당 없음', '없음', '없음', '2025-08-31 16:00:00'),
    ('과제 질문', 'Terraform', 'Module 재사용성 높이기', '해당 없음', '없음', '없음', '2025-09-07 19:30:00'),
    ('오류 해결', 'K8s', 'ImagePullBackOff 원인', '해당 없음', '없음', '없음', '2025-09-14 01:20:00'),
    ('수업 내용 질문', 'Monitoring', 'ELK 스택 로그 수집 구조', '해당 없음', '없음', '없음', '2025-09-21 11:55:00'),
    ('개념 질문', 'Security', 'OAuth 2.0 Grant Types', '해당 없음', '없음', '없음', '2025-09-28 14:10:00'),

    -- 10월~12월: 파이널 프로젝트 (멘탈 붕괴 & 질문 폭주)
    ('과제 질문', 'Project', 'MSA 트랜잭션 관리(Saga)', '해당 없음', '없음', '없음', '2025-10-04 20:00:00'),
    ('오류 해결', 'Flutter', 'Android Build Gradle 오류', '해당 없음', '없음', '없음', '2025-10-11 10:30:00'),
    ('수업 내용 질문', 'K8s', 'Ingress Controller 설정', '해당 없음', '없음', '없음', '2025-10-19 13:45:00'),
    ('개념 질문', 'AI', 'RAG(검색 증강 생성) 개념', '해당 없음', '없음', '없음', '2025-10-26 16:20:00'),
    ('과제 질문', 'Project', 'Redis 캐시 만료 정책', '해당 없음', '없음', '없음', '2025-11-02 23:10:00'),
    ('오류 해결', 'DB', 'Deadlock Found When Trying...', '해당 없음', '없음', '없음', '2025-11-09 04:00:00'),
    ('수업 내용 질문', 'DevOps', 'ArgoCD Sync Policy', '해당 없음', '없음', '없음', '2025-11-16 11:15:00'),
    ('개념 질문', 'Architecture', 'Event-Driven Architecture', '해당 없음', '없음', '없음', '2025-11-23 14:50:00'),
    ('과제 질문', 'Project', '웹소켓 실시간 채팅 구현', '해당 없음', '없음', '없음', '2025-11-30 17:30:00'),
    ('오류 해결', 'AWS', 'Lambda Timeout 발생', '해당 없음', '없음', '없음', '2025-12-07 10:10:00'),
    ('수업 내용 질문', 'Spring', 'WebFlux 비동기 처리', '해당 없음', '없음', '없음', '2025-12-14 15:20:00'),
    ('개념 질문', 'Career', '백엔드 개발자 면접 질문', '해당 없음', '없음', '없음', '2025-12-21 21:00:00'),
    ('오류 해결', 'Project', '배포 시 504 Gateway Timeout', '해당 없음', '없음', '없음', '2025-12-28 02:20:00');
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

INSERT INTO fisa_quiz_questions 
(question_id, type, question, options, answer, explanation)
VALUES
    -- Set 1: Spring Boot 기초
    ('Q1', 'multiple_choice', 'Spring에서 의존성 주입(DI)을 위해 사용하는 대표적인 어노테이션은?', '["@Autowired", "@Inject", "@Resource", "@Component"]', '@Autowired', '스프링에서는 @Autowired를 주로 사용하여 빈을 주입받습니다.'),
    ('Q2', 'short_answer', 'Spring Boot 애플리케이션의 진입점이 되는 어노테이션은?', NULL, '@SpringBootApplication', '@SpringBootApplication 어노테이션이 붙은 클래스의 main 메소드에서 애플리케이션이 시작됩니다.'),
    ('Q3', 'ox_scenario', 'Spring Bean은 기본적으로 프로토타입(Prototype) 스코프를 가진다.', NULL, 'X', '스프링 빈은 기본적으로 싱글톤(Singleton) 스코프입니다.'),

    -- Set 2: Java 심화
    ('Q1', 'multiple_choice', 'Java에서 상속받을 수 없는 클래스를 만들 때 사용하는 키워드는?', '["final", "static", "abstract", "private"]', 'final', 'final 키워드가 붙은 클래스는 상속할 수 없습니다.'),
    ('Q2', 'short_answer', 'JVM 메모리 영역 중, 객체가 생성되는 공간의 이름은?', NULL, 'Heap', '모든 객체 인스턴스와 배열은 Heap 영역에 할당됩니다.'),
    ('Q3', 'ox_scenario', '인터페이스(Interface)는 생성자를 가질 수 있다.', NULL, 'X', '인터페이스는 생성자를 가질 수 없습니다.'),

    -- Set 3: Docker & Container
    ('Q1', 'multiple_choice', '도커 컨테이너를 중지하지 않고 빠져나오는 단축키 조합은?', '["Ctrl+P, Ctrl+Q", "Ctrl+C", "Ctrl+D", "exit"]', 'Ctrl+P, Ctrl+Q', 'Ctrl+P, Ctrl+Q를 입력하면 컨테이너를 종료하지 않고 터미널만 분리(detach)합니다.'),
    ('Q2', 'short_answer', '도커 이미지를 빌드하기 위한 설정 파일의 이름은?', NULL, 'Dockerfile', 'Dockerfile에 정의된 명령어들을 기반으로 이미지가 빌드됩니다.'),
    ('Q3', 'ox_scenario', '도커 컨테이너는 호스트 OS의 커널을 공유한다.', NULL, 'O', '컨테이너는 가상머신과 달리 호스트의 커널을 공유하여 가볍고 빠릅니다.'),

    -- Set 4: Network Basics
    ('Q1', 'multiple_choice', 'OSI 7계층 중 4계층(전송 계층)에 해당하는 프로토콜은?', '["TCP", "IP", "HTTP", "Ethernet"]', 'TCP', 'TCP와 UDP는 전송 계층(Transport Layer)의 대표적인 프로토콜입니다.'),
    ('Q2', 'short_answer', 'HTTP 통신에서 "클라이언트가 요청한 리소스가 없음"을 나타내는 상태 코드는?', NULL, '404', '404 Not Found는 요청한 자원을 찾을 수 없을 때 반환됩니다.'),
    ('Q3', 'ox_scenario', 'UDP는 데이터 전송의 신뢰성을 보장한다.', NULL, 'X', 'UDP는 비연결형으로 신뢰성보다 속도를 중시합니다. 신뢰성은 TCP가 보장합니다.'),

    -- Set 5: Database (MySQL/RDBMS)
    ('Q1', 'multiple_choice', '트랜잭션의 특징(ACID) 중 "모두 수행되거나 하나도 수행되지 않아야 함"을 의미하는 것은?', '["Atomicity", "Consistency", "Isolation", "Durability"]', 'Atomicity', '원자성(Atomicity)은 트랜잭션 내의 작업이 모두 성공하거나 모두 실패해야 함을 의미합니다.'),
    ('Q2', 'short_answer', 'SELECT 문의 결과에서 중복된 행을 제거하는 키워드는?', NULL, 'DISTINCT', 'SELECT DISTINCT ... 형태로 사용하여 중복을 제거합니다.'),
    ('Q3', 'ox_scenario', 'Primary Key(기본키)는 NULL 값을 가질 수 있다.', NULL, 'X', '기본키는 유일해야 하며 NULL을 허용하지 않습니다(Not Null).'),

    -- Set 6: Git & Version Control
    ('Q1', 'multiple_choice', '원격 저장소의 내용을 로컬로 처음 가져올 때 사용하는 명령어는?', '["git clone", "git pull", "git fetch", "git push"]', 'git clone', 'git clone 명령어로 원격 저장소를 로컬에 복제합니다.'),
    ('Q2', 'short_answer', '작업 디렉토리의 변경 내용을 스테이지(Staging Area)에 올리는 명령어는?', NULL, 'git add', 'git add 명령어를 통해 커밋할 파일을 준비시킵니다.'),
    ('Q3', 'ox_scenario', 'git pull 명령어는 git fetch와 git merge를 합친 것과 같다.', NULL, 'O', 'git pull은 원격 변경사항을 가져와서(fetch) 현재 브랜치에 병합(merge)합니다.'),

    -- Set 7: Frontend (React)
    ('Q1', 'multiple_choice', '리액트에서 컴포넌트의 렌더링 결과에 영향을 주는, 변경 가능한 데이터는?', '["State", "Props", "Component", "Element"]', 'State', 'State는 컴포넌트 내부에서 관리되며 변경 시 리렌더링을 유발합니다.'),
    ('Q2', 'short_answer', '리액트 컴포넌트가 화면에 마운트된 직후 실행되는 Hook은?', NULL, 'useEffect', 'useEffect(() => { ... }, []) 형태로 마운트 시점에 로직을 실행할 수 있습니다.'),
    ('Q3', 'ox_scenario', '부모 컴포넌트에서 자식 컴포넌트로 전달하는 Props는 자식에서 수정 가능하다.', NULL, 'X', 'Props는 읽기 전용(Read-only)이며 자식 컴포넌트에서 직접 수정할 수 없습니다.'),

    -- Set 8: AWS Cloud
    ('Q1', 'multiple_choice', 'AWS의 대표적인 서버리스 컴퓨팅 서비스는?', '["Lambda", "EC2", "S3", "RDS"]', 'Lambda', 'AWS Lambda는 서버를 프로비저닝하거나 관리하지 않고 코드를 실행할 수 있는 서비스입니다.'),
    ('Q2', 'short_answer', '확장 가능한 객체 스토리지 서비스로, 정적 웹 호스팅도 가능한 서비스는?', NULL, 'S3', 'S3(Simple Storage Service)는 객체 스토리지 서비스입니다.'),
    ('Q3', 'ox_scenario', 'EC2 인스턴스를 중지(Stop)했다가 다시 시작하면 퍼블릭 IP가 변경될 수 있다.', NULL, 'O', '탄력적 IP(Elastic IP)를 할당하지 않은 경우, 재시작 시 퍼블릭 IP가 바뀔 수 있습니다.'),

    -- Set 9: Linux Command
    ('Q1', 'multiple_choice', '현재 실행 중인 프로세스 목록을 확인하는 명령어는?', '["ps", "ls", "pwd", "cd"]', 'ps', 'ps 명령어(또는 top, htop)로 실행 중인 프로세스를 확인합니다.'),
    ('Q2', 'short_answer', '파일의 권한(Permission)을 변경하는 명령어는?', NULL, 'chmod', 'chmod(change mode) 명령어로 파일/디렉토리의 권한을 설정합니다.'),
    ('Q3', 'ox_scenario', '리눅스에서 루트(Root) 디렉토리는 /home 이다.', NULL, 'X', '리눅스의 최상위 루트 디렉토리는 슬래시(/) 하나로 표현됩니다.'),

    -- Set 10: Computer Science (OS)
    ('Q1', 'multiple_choice', '두 개 이상의 프로세스가 서로 상대방의 작업이 끝나기만을 기다리며 무한 대기에 빠지는 현상은?', '["Deadlock", "Starvation", "Context Switching", "Paging"]', 'Deadlock', '교착 상태(Deadlock)에 대한 설명입니다.'),
    ('Q2', 'short_answer', 'CPU가 현재 실행 중인 프로세스의 상태를 저장하고, 다음 프로세스를 실행하기 위해 상태를 복구하는 작업은?', NULL, 'Context Switching', '문맥 교환(Context Switching)은 멀티태스킹의 핵심 메커니즘입니다.'),
    ('Q3', 'ox_scenario', '스레드(Thread)는 프로세스 내의 코드, 데이터, 힙 영역을 공유한다.', NULL, 'O', '스레드는 스택(Stack) 영역만 따로 가지고 나머지는 프로세스 자원을 공유합니다.'),

    -- Set 11: Web Security (심화)
    ('Q1', 'multiple_choice', '웹 사이트에서 스크립트를 삽입하여 악성 동작을 수행하게 하는 공격 방식은?', '["XSS", "CSRF", "SQL Injection", "DDOS"]', 'XSS', 'XSS(Cross Site Scripting)는 악성 스크립트를 삽입하는 공격입니다.'),
    ('Q2', 'short_answer', 'JWT(Json Web Token)의 구성 요소 3가지는 Header, Payload, 그리고 무엇인가?', NULL, 'Signature', 'JWT는 Header, Payload, Signature로 구성됩니다.'),
    ('Q3', 'ox_scenario', 'HTTPS는 DNS 조회 과정까지 암호화하여 ISP가 방문 사이트를 알 수 없게 한다.', NULL, 'X', '기본 HTTPS는 도메인 이름(SNI)을 평문으로 전송하므로 ISP가 접속 사이트를 알 수 있습니다.'),

    -- Set 12: TypeScript
    ('Q1', 'multiple_choice', 'TypeScript에서 모든 타입을 허용하며, 사실상 타입 검사를 포기하는 타입은?', '["any", "void", "never", "unknown"]', 'any', 'any 타입을 쓰면 컴파일러가 타입 검사를 하지 않습니다.'),
    ('Q2', 'short_answer', 'TypeScript에서 인터페이스나 클래스가 반드시 구현해야 할 형태를 정의하는 키워드는?', NULL, 'interface', 'interface를 통해 객체의 구조를 정의합니다.'),
    ('Q3', 'ox_scenario', 'TypeScript 코드는 브라우저에서 직접 실행될 수 있다.', NULL, 'X', '브라우저는 TS를 이해 못 하므로 JS로 컴파일(Transpile)해야 실행됩니다.'),

    -- Set 13: MSA & Architecture
    ('Q1', 'multiple_choice', 'MSA 환경에서 특정 서비스 장애가 전파되는 것을 막기 위한 디자인 패턴은?', '["Circuit Breaker", "Singleton", "Adapter", "Observer"]', 'Circuit Breaker', '서킷 브레이커는 장애 발생 시 연결을 차단하여 연쇄 오류를 방지합니다.'),
    ('Q2', 'short_answer', '클라이언트의 요청을 받아 적절한 마이크로서비스로 라우팅해주는 서버의 역할은?', NULL, 'API Gateway', 'API Gateway가 단일 진입점 역할을 하며 라우팅, 인증 등을 처리합니다.'),
    ('Q3', 'ox_scenario', 'MSA(Microservices Architecture)에서는 모든 서비스가 하나의 통합 DB를 공유해야 한다.', NULL, 'X', 'MSA는 서비스별로 DB를 분리하는 것(Database per Service)이 원칙입니다.'),

    -- Set 14: Data Structure (Algorithm)
    ('Q1', 'multiple_choice', '해시 테이블(Hash Table)의 평균적인 검색 시간 복잡도는?', '["O(1)", "O(n)", "O(log n)", "O(n^2)"]', 'O(1)', '해시 테이블은 키를 통해 직접 접근하므로 평균 O(1)입니다.'),
    ('Q2', 'short_answer', '정렬된 배열에서 중간값을 비교하며 탐색 범위를 반으로 줄여가는 알고리즘은?', NULL, 'Binary Search', '이진 탐색(Binary Search)은 정렬된 데이터에서 효율적입니다.'),
    ('Q3', 'ox_scenario', '재귀 함수(Recursion)는 종료 조건(Base Case)이 없으면 스택 오버플로우가 발생한다.', NULL, 'O', '종료 조건이 없으면 무한히 호출되어 스택 메모리가 꽉 찹니다.'),

    -- Set 15: Cloud Native (DevOps)
    ('Q1', 'multiple_choice', '서버나 인프라를 코드로 관리하고 배포하는 방식(IaC)의 대표적 도구는?', '["Terraform", "Excel", "PowerPoint", "Notion"]', 'Terraform', '테라폼은 대표적인 IaC(Infrastructure as Code) 도구입니다.'),
    ('Q2', 'short_answer', '컨테이너 오케스트레이션 도구인 쿠버네티스의 명령어 라인 툴(CLI) 이름은?', NULL, 'kubectl', '큐브컨트롤(kubectl)로 클러스터를 제어합니다.'),
    ('Q3', 'ox_scenario', '클라우드 네이티브 애플리케이션은 "상태 비저장(Stateless)"을 지향한다.', NULL, 'O', '확장성(Scaling)을 위해 애플리케이션은 상태를 저장하지 않는 것이 좋습니다.');

INSERT INTO fisa_quiz_questions 
(question_id, type, question, options, answer, explanation)
VALUES
    ('Q1', 'multiple_choice', '쿠버네티스에서 파드(Pod)의 상태를 주기적으로 체크하여 문제가 있으면 재시작시키는 기능은?', '["Liveness Probe", "Readiness Probe", "Startup Probe", "Health Check"]', 'Liveness Probe', 'Liveness Probe는 애플리케이션이 살아있는지 확인하고 실패 시 컨테이너를 재시작합니다.'),
    ('Q2', 'short_answer', '쿠버네티스 클러스터의 모든 상태 데이터를 저장하는 키-값(Key-Value) 저장소의 이름은?', NULL, 'etcd', 'etcd는 클러스터의 모든 설정 및 상태 데이터를 저장하는 고가용성 저장소입니다.'),
    ('Q3', 'ox_scenario', '쿠버네티스 Service의 타입 중 NodePort는 외부 로드밸런서 없이도 외부 접속이 가능하다.', NULL, 'O', 'NodePort는 모든 노드의 특정 포트를 개방하여 외부에서 접속할 수 있게 합니다.'),

    ('Q1', 'multiple_choice', '공개키 암호화 방식에서 데이터를 암호화할 때 사용하는 키는?', '["공개키(Public Key)", "개인키(Private Key)", "세션키(Session Key)", "마스터키(Master Key)"]', '공개키(Public Key)', '데이터를 보낼 때는 수신자의 공개키로 암호화하고, 수신자는 자신의 개인키로 복호화합니다.'),
    ('Q2', 'short_answer', '네트워크 패킷을 중간에서 가로채어 도청하거나 변조하는 공격 기법은?', NULL, 'Sniffing', '스니핑(Sniffing)은 네트워크 트래픽을 도청하는 행위입니다.'),
    ('Q3', 'ox_scenario', 'VPN(Virtual Private Network)은 공중망을 통해 데이터를 전송하지만 전용선처럼 보안을 유지한다.', NULL, 'O', '터널링과 암호화 기술을 사용하여 공용 네트워크에서도 보안성을 확보합니다.'),

    ('Q1', 'multiple_choice', '파이썬에서 제너레이터(Generator)를 만들기 위해 함수 내부에서 사용하는 키워드는?', '["yield", "return", "gen", "emit"]', 'yield', 'yield 키워드를 사용하면 함수는 제너레이터가 되어 값을 하나씩 반환하고 상태를 유지합니다.'),
    ('Q2', 'short_answer', '파이썬에서 데코레이터(@Decorator)가 내부적으로 사용하는 개념으로, 함수를 감싸는 함수는?', NULL, 'Closure', '데코레이터는 클로저(Closure)를 활용하여 기존 함수의 기능을 확장합니다.'),
    ('Q3', 'ox_scenario', '파이썬의 멀티스레딩은 GIL(Global Interpreter Lock) 때문에 CPU 멀티코어를 100% 활용하지 못한다.', NULL, 'O', 'GIL 때문에 한 시점에 하나의 스레드만 바이트코드를 실행할 수 있어 CPU 연산 위주 작업에는 불리합니다.'),

    ('Q1', 'multiple_choice', '리액트에서 컴포넌트 내에서 불변 변수처럼 값을 유지하지만, 값이 바뀌어도 리렌더링을 유발하지 않는 Hook은?', '["useRef", "useState", "useEffect", "useMemo"]', 'useRef', 'useRef는 값이 바뀌어도 렌더링을 트리거하지 않으며 DOM 접근이나 값 유지에 쓰입니다.'),
    ('Q2', 'short_answer', '리액트에서 자식 컴포넌트가 불필요하게 재생성되는 것을 막기 위해 함수를 메모이제이션하는 Hook은?', NULL, 'useCallback', 'useCallback은 함수를 메모이제이션하여 의존성 배열이 바뀌지 않으면 기존 함수를 재사용합니다.'),
    ('Q3', 'ox_scenario', 'useReducer는 복잡한 상태 로직을 리듀서 함수로 분리하여 관리할 수 있게 해준다.', NULL, 'O', 'Redux의 리듀서처럼 상태 업데이트 로직을 분리하여 관리할 때 유용합니다.'),

    ('Q1', 'multiple_choice', 'SQL 쿼리 성능 최적화를 위해 실행 계획을 확인하는 명령어는?', '["EXPLAIN", "DESCRIBE", "SHOW PLAN", "ANALYZE"]', 'EXPLAIN', 'EXPLAIN 명령어를 통해 쿼리가 인덱스를 타는지, 스캔 방식은 무엇인지 확인할 수 있습니다.'),
    ('Q2', 'short_answer', '데이터베이스 정규화 과정 중, 이행적 함수 종속을 제거하여 기본키가 아닌 속성 간의 종속을 없애는 단계는?', NULL, '3NF', '제3정규형(3NF)은 이행적 종속을 제거하는 단계입니다.'),
    ('Q3', 'ox_scenario', '인덱스는 읽기 성능을 높여주지만 쓰기(INSERT, UPDATE, DELETE) 성능은 저하시킬 수 있다.', NULL, 'O', '데이터 변경 시 인덱스도 함께 업데이트해야 하므로 오버헤드가 발생합니다.');