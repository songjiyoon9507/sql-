﻿CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NULL,
	"MEMBER_ADDRESS"	VARCHAR2(300)		NULL,
	"PROFILE_IMG"	VARCHAR2(150)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원번호(PK)';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원비밀번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원전화번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_ADDRESS" IS '회원주소';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '프로필이미지';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '회원가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '탈퇴여부(Y/N)';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '권한(1:일반,2:관리자)';

CREATE TABLE "AUTH_KEY" (
	"KEY_NO"	NUMBER		NOT NULL,
	"EMAIL"	NVARCHAR2(50)		NOT NULL,
	"AUTH_KEY"	CHAR(6)		NOT NULL,
	"CREATE_TIME"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "AUTH_KEY"."KEY_NO" IS '인증키 구분 번호(시퀀스)(PK)';

COMMENT ON COLUMN "AUTH_KEY"."EMAIL" IS '인증 이메일';

COMMENT ON COLUMN "AUTH_KEY"."AUTH_KEY" IS '인증 번호';

COMMENT ON COLUMN "AUTH_KEY"."CREATE_TIME" IS '인증 번호 생성 시간';

COMMENT ON COLUMN "AUTH_KEY"."MEMBER_NO" IS '회원번호(PK)';

CREATE TABLE "LECTURE_DAYS" (
	"LECTURE_DAYS_NO"	NUMBER		NOT NULL,
	"DAY_OF_WEEK"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LECTURE_DAYS"."LECTURE_DAYS_NO" IS '강의요일기본키(PK)';

COMMENT ON COLUMN "LECTURE_DAYS"."DAY_OF_WEEK" IS '월요일에서 일요일 숫자';

COMMENT ON COLUMN "LECTURE_DAYS"."LECTURE_NO" IS '강의번호(FK)';

CREATE TABLE "LECTURE_REVIEW" (
	"LECTURE_REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(500)		NOT NULL,
	"REVIEW_IMG"	VARCHAR2(300)		NULL,
	"CREATE_DATE_REVIEW"	DATE	DEFAULT SYSDATE	NOT NULL,
	"COMMENT_DEL_FL"	CHAR(2)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"PARENT_REVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LECTURE_REVIEW"."LECTURE_REVIEW_NO" IS '강의후기번호(PK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."REVIEW_CONTENT" IS '후기내용';

COMMENT ON COLUMN "LECTURE_REVIEW"."REVIEW_IMG" IS '후기이미지';

COMMENT ON COLUMN "LECTURE_REVIEW"."CREATE_DATE_REVIEW" IS '후기작성일';

COMMENT ON COLUMN "LECTURE_REVIEW"."COMMENT_DEL_FL" IS '댓글 삭제 여부(Y/N)';

COMMENT ON COLUMN "LECTURE_REVIEW"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."PARENT_REVIEW_NO" IS '부모댓글번호';

CREATE TABLE "LECTURE" (
	"LECTURE_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NULL,
	"LECTURE_CATEGORY_NUM"	NUMBER		NOT NULL,
	"LECTURE_HOME_TITLE"	VARCHAR2(300)		NOT NULL,
	"LECTURE_HOME_CONTENT"	VARCHAR2(300)		NOT NULL,
	"LECTURE_TITLE"	VARCHAR2(300)		NOT NULL,
	"LECTURE_CONTENT"	CLOB		NOT NULL,
	"PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"INSTRUCTOR_INTRODUCTION"	VARCHAR2(300)		NOT NULL,
	"LECTURE_LEVEL"	NUMBER		NOT NULL,
	"START_TIME"	NUMBER		NOT NULL,
	"HOW_LONG"	NUMBER		NOT NULL,
	"ACCEPTABLE_NUMBER"	NUMBER		NOT NULL,
	"REST_NUMBER"	NUMBER		NOT NULL,
	"START_DATE"	DATE		NOT NULL,
	"END_DATE"	DATE		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LECTURE_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "LECTURE"."LECTURE_NO" IS '강의번호(PK)';

COMMENT ON COLUMN "LECTURE"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "LECTURE"."LECTURE_CATEGORY_NUM" IS '강의분류';

COMMENT ON COLUMN "LECTURE"."LECTURE_HOME_TITLE" IS '홈화면강의제목';

COMMENT ON COLUMN "LECTURE"."LECTURE_HOME_CONTENT" IS '홈화면강의내용';

COMMENT ON COLUMN "LECTURE"."LECTURE_TITLE" IS '강의상세보기제목';

COMMENT ON COLUMN "LECTURE"."LECTURE_CONTENT" IS '강의상세보기내용';

COMMENT ON COLUMN "LECTURE"."PRICE" IS '강의가격';

COMMENT ON COLUMN "LECTURE"."INSTRUCTOR_INTRODUCTION" IS '강사소개';

COMMENT ON COLUMN "LECTURE"."LECTURE_LEVEL" IS '초급:1,중급:2,고급:3';

COMMENT ON COLUMN "LECTURE"."START_TIME" IS '강의시작시간';

COMMENT ON COLUMN "LECTURE"."HOW_LONG" IS '강의끝나는시간';

COMMENT ON COLUMN "LECTURE"."ACCEPTABLE_NUMBER" IS '수용가능인원';

COMMENT ON COLUMN "LECTURE"."REST_NUMBER" IS '현재 남은 자리';

COMMENT ON COLUMN "LECTURE"."START_DATE" IS '강의시작날짜';

COMMENT ON COLUMN "LECTURE"."END_DATE" IS '강의종료날짜';

COMMENT ON COLUMN "LECTURE"."ENROLL_DATE" IS '강의등록날짜';

COMMENT ON COLUMN "LECTURE"."LECTURE_DEL_FL" IS '강의삭제여부(Y/N)';

CREATE TABLE "LECTURE_FILE" (
	"LECTURE_FILE_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(500)		NULL,
	"ORIGINAL_NAME"	VARCHAR2(300)		NULL,
	"FILE_RENAME"	VARCHAR2(100)		NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"LECTURE_NO2"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LECTURE_FILE"."LECTURE_FILE_NO" IS '강의파일번호';

COMMENT ON COLUMN "LECTURE_FILE"."FILE_PATH" IS '파일경로';

COMMENT ON COLUMN "LECTURE_FILE"."ORIGINAL_NAME" IS '원본파일명';

COMMENT ON COLUMN "LECTURE_FILE"."FILE_RENAME" IS '파일변경명';

COMMENT ON COLUMN "LECTURE_FILE"."UPLOAD_DATE" IS '파일등록일';

COMMENT ON COLUMN "LECTURE_FILE"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_FILE"."LECTURE_NO2" IS '강의번호(PK)';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"BOARD_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."BOARD_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_DEL_FL" IS '게시글삭제여부(Y/N)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성한 회원번호(FK)';

CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_ORDER"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지번호(PK)';

COMMENT ON COLUMN "BOARD_IMG"."IMG_PATH" IS '이미지 요청 경로';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL_NAME" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORDER" IS '이미지 순서';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글번호(FK)';

CREATE TABLE "BOARD_LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_LIKE"."MEMBER_NO" IS '회원번호(PFK)';

COMMENT ON COLUMN "BOARD_LIKE"."BOARD_NO" IS '게시글번호(PFK)';

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	NVARCHAR2(500)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"PARENT_COMMENT"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(PK)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(Y/N)';

COMMENT ON COLUMN "COMMENT"."PARENT_COMENT" IS '부모 댓글 번호';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글번호(FK)';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "AUTH_KEY" ADD CONSTRAINT "PK_AUTH_KEY" PRIMARY KEY (
	"KEY_NO"
);

ALTER TABLE "LECTURE_DAYS" ADD CONSTRAINT "PK_LECTURE_DAYS" PRIMARY KEY (
	"LECTURE_DAYS_NO"
);

ALTER TABLE "LECTURE_REVIEW" ADD CONSTRAINT "PK_LECTURE_REVIEW" PRIMARY KEY (
	"LECTURE_REVIEW_NO"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "PK_LECTURE" PRIMARY KEY (
	"LECTURE_NO"
);

ALTER TABLE "LECTURE_FILE" ADD CONSTRAINT "PK_LECTURE_FILE" PRIMARY KEY (
	"LECTURE_FILE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "PK_BOARD_IMG" PRIMARY KEY (
	"IMG_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

COMMIT;



---------------------- CHECK -----------------------

-- 게시글 삭제 여부
ALTER TABLE "BOARD" ADD
CONSTRAINT "BOARD_DEL_CHECK"
CHECK("BOARD_DEL_FL" IN ('Y', 'N') );

-- 댓글 삭제 여부
ALTER TABLE "COMMENT" ADD
CONSTRAINT "COMMENT_DEL_CHECK"
CHECK("COMMENT_DEL_FL" IN ('Y', 'N') );

-------------------------------------------------------
/* 게시글 번호 시퀀스 생성 */
CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;


/* 게시판(BOARD) 테이블 샘플 데이터 삽입(PL/SQL)*/


SELECT * FROM "MEMBER";

-- DBMS_RANDOM.VALUE(0,3) : 0.0 이상, 3.0 미만의 난수
-- CEIL( DBMS_RANDOM.VALUE(0,3) ) : 1,2,3 중 하나

-- ALT + X 로 실행
BEGIN
	FOR I IN 1..2000 LOOP
		
		INSERT INTO "BOARD"
		VALUES(SEQ_BOARD_NO.NEXTVAL,
					 SEQ_BOARD_NO.CURRVAL || '번째 게시글',
					 SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다',
					 DEFAULT, DEFAULT, DEFAULT, DEFAULT,
					 1 -- MEMBER_NO(작성회원번호)
		);
		
	END LOOP;
END;

COMMIT;

-- 게시판 종류별 샘플 데이터 삽입 확인
SELECT COUNT(*)
FROM "BOARD";

-- 부모 댓글 번호 NULL 허용
ALTER TABLE "COMMENT" 
MODIFY PARENT_COMMENT NUMBER NULL;

/* 댓글 번호 시퀀스 생성 */
CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE;

/* 댓글 ("COMMNET") 테이블에 샘플 데이터 추가 */

BEGIN
	FOR I IN 1..2000 LOOP
		INSERT INTO "COMMENT"	
		VALUES(
			SEQ_COMMENT_NO.NEXTVAL,
			SEQ_COMMENT_NO.CURRVAL || '번째 댓글 입니다',
			DEFAULT, DEFAULT,
			NULL, -- 부모댓글번호
			CEIL( DBMS_RANDOM.VALUE(0, 2000) ), -- 게시글번호
			2 -- 댓글작성회원번호
		);
	END LOOP;
END;

SELECT * FROM BOARD;

SELECT * FROM "MEMBER";

SELECT * FROM "COMMENT";

COMMIT;

/* BOARD_IMG 테이블용 시퀀스 생성 */
CREATE SEQUENCE SEQ_IMG_NO NOCACHE;

/* BOARD_IMG 테이블에 샘플 데이터 삽입 */
INSERT INTO "BOARD_IMG" VALUES(
	SEQ_IMG_NO.NEXTVAL, '/images/board/', '원본1.jpg', 'test1.jpg', 0, 1950
);

INSERT INTO "BOARD_IMG" VALUES(
	SEQ_IMG_NO.NEXTVAL, '/images/board/', '원본2.jpg', 'test2.jpg', 1, 1950
);

INSERT INTO "BOARD_IMG" VALUES(
	SEQ_IMG_NO.NEXTVAL, '/images/board/', '원본3.jpg', 'test3.jpg', 2, 1950
);

INSERT INTO "BOARD_IMG" VALUES(
	SEQ_IMG_NO.NEXTVAL, '/images/board/', '원본4.jpg', 'test4.jpg', 3, 1950
);

INSERT INTO "BOARD_IMG" VALUES(
	SEQ_IMG_NO.NEXTVAL, '/images/board/', '원본5.jpg', 'test5.jpg', 4, 1950
);

COMMIT;

SELECT * FROM BOARD_IMG;

/* 좋아요 테이블(BOARD_LIKE) 샘플 데이터 추가 */
INSERT INTO "BOARD_LIKE"
VALUES(1, 2000); -- 1번 회원이 1998번 글에 좋아요를 클릭함

COMMIT;

SELECT * FROM BOARD_LIKE;