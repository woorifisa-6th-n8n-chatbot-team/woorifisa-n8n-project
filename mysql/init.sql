-- 채팅 히스토리 테이블
CREATE TABLE IF NOT EXISTS chat_histories (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유 ID',
    question_type VARCHAR(100) COMMENT '질문유형',
    learning_category VARCHAR(100) COMMENT '학습카테고리',
    general_answer TEXT COMMENT '일반답변',
    basic_knowledge_summary TEXT COMMENT '기본지식요약',
    schedule TEXT COMMENT '일정',
    course_material TEXT COMMENT '수업자료',
    blog_material TEXT COMMENT '블로그자료',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '생성일'
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '채팅 히스토리';
