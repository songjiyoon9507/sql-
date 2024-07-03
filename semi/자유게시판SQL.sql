SELECT COUNT(*)
FROM "BOARD"
WHERE BOARD_DEL_FL = 'N';

-- 테이블 컬럼 추가
ALTER TABLE FEE_SETTLEMENT
ADD SETTLEMENT_STATUS NVARCHAR2(30)
DEFAULT 'UNSETTLED' NOT NULL;

COMMIT;

-- 자유게시판 10개씩 10페이지씩 띄워서 조회
SELECT BOARD_NO, BOARD_TITLE, MEMBER_NICKNAME, READ_COUNT,
	(SELECT COUNT(*) 
	FROM "COMMENT" C 
	WHERE C.BOARD_NO = B.BOARD_NO) COMMENT_COUNT,
	(SELECT COUNT(*)
	FROM BOARD_LIKE L
	WHERE L.BOARD_NO = B.BOARD_NO) LIKE_COUNT,
	CASE 
		WHEN SYSDATE - BOARD_WRITE_DATE < 1 / 24 / 60
		THEN FLOOR((SYSDATE - BOARD_WRITE_DATE) * 24 * 60 * 60) || '초 전'
		
		WHEN SYSDATE - BOARD_WRITE_DATE < 1 / 24
		THEN FLOOR((SYSDATE - BOARD_WRITE_DATE) * 24 * 60) || '분 전'
		
		WHEN SYSDATE - BOARD_WRITE_DATE < 1
		THEN FLOOR((SYSDATE - BOARD_WRITE_DATE) * 24) || '시간 전'
		
		ELSE TO_CHAR(BOARD_WRITE_DATE, 'YYYY-MM-DD')
		
	END BOARD_WRITE_DATE
	
FROM BOARD B
JOIN "MEMBER" USING(MEMBER_NO)
WHERE BOARD_DEL_FL = 'N'
ORDER BY BOARD_NO DESC;

SELECT * FROM "MEMBER";

SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, READ_COUNT,
	MEMBER_NO, MEMBER_NICKNAME, PROFILE_IMG,
	TO_CHAR(BOARD_WRITE_DATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') BOARD_WRITE_DATE, 
	TO_CHAR(BOARD_UPDATE_DATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') BOARD_UPDATE_DATE,
	(SELECT COUNT(*)
	 FROM "BOARD_LIKE"
	 WHERE BOARD_NO = 2000) LIKE_COUNT,
	(SELECT IMG_PATH || IMG_RENAME
	 FROM "BOARD_IMG"
	 WHERE BOARD_NO = 2000
	 AND   IMG_ORDER = 0) THUMBNAIL,
	 (SELECT COUNT(*)
	 FROM BOARD_LIKE
	 WHERE MEMBER_NO = 1
	 AND BOARD_NO = 2000) LIKE_CHECK
FROM "BOARD"
JOIN "MEMBER" USING(MEMBER_NO)
WHERE BOARD_DEL_FL = 'N'
AND BOARD_NO = 2000;
		
SELECT *
FROM "BOARD_IMG"
WHERE BOARD_NO = 2000
ORDER BY IMG_ORDER;

SELECT * FROM BOARD_IMG;

COMMIT;

UPDATE "MEMBER"
SET MEMBER_PW = '$2a$10$nmP3uAaPv1uHAUB0htRnf.NI6L1ZcxD4SDBbga2pCit0tRYgUkqS2'
WHERE MEMBER_NO = 1;

--> SEQ를 별도로 생성하는 함수 생성

-- SEQ_IMG_NO 시퀀스의 다음 값을 반환하는 함수 생성
CREATE OR REPLACE FUNCTION NEXT_IMG_NO
-- 반환형
RETURN NUMBER
-- 사용할 변수
IS IMG_NO NUMBER;
BEGIN
	SELECT SEQ_IMG_NO.NEXTVAL
	INTO IMG_NO
	FROM DUAL;
	RETURN IMG_NO;
END;

SELECT * FROM REGISTERED_MEMBER;
SELECT * FROM REGISTERED_MESSAGE;

SELECT * FROM LECTURE;

SELECT * FROM "MEMBER";

SELECT MESSAGE_NO, MEMBER_NO, MESSAGE_TITLE, MESSAGE_CONTENT,
	MESSAGE_CHECK, TO_CHAR(MESSAGE_REGDATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') MESSAGE_REGDATE, REGISTERED_MEMBER_NO
FROM REGISTERED_MESSAGE
WHERE REGISTERED_MEMBER_NO = 3;

DELETE FROM REGISTERED_MESSAGE WHERE MESSAGE_NO = 6;
COMMIT;

SELECT * FROM REGISTERED_MESSAGE;
SELECT * FROM REGISTERED_MEMBER;

SELECT * FROM LECTURE;

SELECT * FROM "MEMBER";

INSERT INTO "REGISTERED_MESSAGE"
VALUES(
	SEQ_REGISTERED_MESSAGE_NO.NEXTVAL,
	3,
	'숨 쉬려면 폐를 챙겨오세요',
	'습하습하',
	DEFAULT,
	DEFAULT,
	3,
	4
);

UPDATE REGISTERED_MESSAGE SET MESSAGE_CONTENT = '건물 내 주차 공간이 없어 주차가 불가능하오니 대중교통 이용 부탁드립니다!' WHERE MESSAGE_NO = 23;

COMMIT;

SELECT MESSAGE_NO, R.MEMBER_NO, MESSAGE_TITLE, MESSAGE_CONTENT,
	MESSAGE_CHECK, TO_CHAR(MESSAGE_REGDATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') MESSAGE_REGDATE, 
	REGISTERED_MEMBER_NO, LECTURER_MEMBER_NO, MEMBER_NICKNAME, PROFILE_IMG
FROM REGISTERED_MESSAGE R
JOIN "MEMBER" M ON (M.MEMBER_NO = R.LECTURER_MEMBER_NO)
WHERE R.MEMBER_NO = 3;

COMMIT;

DELETE FROM "MEMBER" WHERE MEMBER_NO = 25;
COMMIT;

ALTER TABLE REGISTERED_MESSAGE
ADD (LECTURER_MEMBER_NO NUMBER);

UPDATE REGISTERED_MESSAGE SET LECTURER_MEMBER_NO = 4 WHERE MEMBER_NO = 3;

ALTER TABLE REGISTERED_MESSAGE ADD (MESSAGE_ONESIDE_DEL_FL CHAR(1));


SELECT * FROM LECTURE;

SELECT * FROM LECTURE_ADDRESS;

SELECT * FROM LECTURE_FILE;

SELECT * FROM MEMBER;

UPDATE LECTURE_FILE SET FILE_RENAME = '20240510174131_00005.jpeg' WHERE LECTURE_FILE_NO = 25;

UPDATE "MEMBER" SET PROFILE_IMG = '/lecture/file/20240510164541_00200.jpg' WHERE MEMBER_NO = 17;

DELETE FROM LECTURE WHERE LECTURE_NO = 44;
DELETE FROM LECTURE_ADDRESS WHERE LECTURE_NO = 44;
DELETE FROM LECTURE_MAP WHERE LECTURE_NO = 44;
SELECT * FROM LECTURE_MAP;
LECT
;
COMMIT;
SELECT * FROM LECTURE;
DELETE FROM LECTURE_FILE WHERE LECTURE_NO = 44;
DELETE FROM LECTURE WHERE LECTURE_NO = 5;
DELETE FROM LECTURE_RESTNUM lr WHERE LECTURE_NO = 5;
DELETE FROM LECTURE_FILE lf WHERE LECTURE_FILE_NO = 3;
DELETE FROM REGISTERED_MEMBER rm WHERE REGISTERED_MEMBER_NO = 2;
DELETE FROM LECTURE_PAYMENTS lp WHERE LECTURE_PAYMENTS_NO = 2;
DELETE FROM LECTURE_ORDERS WHERE LECTURE_ORDERS_NO = 4;

COMMIT;


DELETE FROM LECTURE_RESTNUM  WHERE LECTURE_NO = 33;
DELETE FROM LECTURE_ADDRESS WHERE LECTURE_ADDRESS_NO = 4;
DELETE FROM LECTURE_MAP WHERE LECTURE_MAP_NO = 4;
SELECT * FROM LECTURE_MAP lm ;
SELECT * FROM LECTURE_PAYMENTS lp ;
SELECT * FROM LECTURE_FILE;
SELECT * FROM REGISTERED_MEMBER;
SELECT * FROM LECTURE_RESTNUM;
SELECT * FROM LECTURE_ORDERS lo ;
SELECT * FROM LECTURE_ADDRESS;

SELECT COUNT(*) FROM BOARD b ;

INSERT INTO "BOARD"
VALUES(SEQ_BOARD_NO.NEXTVAL,
			 SEQ_BOARD_NO.CURRVAL || '번째 게시글',
			 SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다',
			 DEFAULT, DEFAULT, DEFAULT, DEFAULT,
			 3 -- MEMBER_NO(작성회원번호)
);

COMMIT;

SELECT COUNT(*) FROM LECTURE WHERE LECTURE_DEL_FL = 'N';

       SELECT
           L.LECTURE_NO,
           L.MEMBER_NO,
           L.LECTURE_CATEGORY_NUM,
           L.LECTURE_HOME_TITLE,
           L.LECTURE_HOME_CONTENT,
           L.PRICE,
           L.LECTURE_LEVEL,
            TO_CHAR(L.START_DATE, 'YYYY-MM-DD') FORMMATED_START_DATE,
           TO_CHAR(L.END_DATE, 'YYYY-MM-DD') FORMMATED_END_DATE,    
  	        TO_CHAR(L.ENROLL_DATE, 'YYYY-MM-DD') FORMMATED_ENROLL_DATE,
  
         
         LF.LECTURE_FILE_NO,
         LF.FILE_PATH,
         LF.ORIGINAL_NAME,
         LF.FILE_RENAME,
         
         M.MEMBER_NICKNAME,
           M.PROFILE_IMG
         
         
         FROM LECTURE L
         JOIN LECTURE_FILE LF ON L.LECTURE_NO = LF.LECTURE_NO
         JOIN MEMBER M ON L.MEMBER_NO = M.MEMBER_NO
         WHERE LECTURE_DEL_FL = 'N';
         
        SELECT * FROM LECTURE_FILE;
        
      SELECT COUNT(*)
      FROM "LECTURE" L
      JOIN LECTURE_ADDRESS LA ON L.LECTURE_NO = LA.LECTURE_NO
      WHERE LECTURE_DEL_FL = 'N';
      
SELECT * FROM "MEMBER";

SELECT * FROM LECTURE;

SELECT * FROM "COMMENT";
