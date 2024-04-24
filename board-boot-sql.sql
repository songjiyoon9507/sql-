-- 비밀번호 update
UPDATE "MEMBER" SET MEMBER_PW = '$2a$10$h9WqHozrLDEPb2H.WeksFu/84M8bLDi4pDYU9.kTabNp5pdDF9Lae'
WHERE MEMBER_NO = 1;

-- 로그인 SQL
SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NICKNAME, MEMBER_PW,
MEMBER_TEL, MEMBER_ADDRESS, PROFILE_IMG, AUTHORITY,
TO_CHAR(ENROLL_DATE, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"') ENROLL_DATE
FROM "MEMBER"
WHERE MEMBER_EMAIL = 'user01@kh.or.kr'
AND MEMBER_DEL_FL = 'N';

-- 이메일 중복검사
SELECT COUNT(*)
FROM "MEMBER"
WHERE MEMBER_DEL_FL = 'N'
AND MEMBER_EMAIL = 'user01@kh.or.kr';

-- 닉네임 중복 검사
SELECT COUNT(*)
FROM "MEMBER"
WHERE MEMBER_DEL_FL = 'N'
AND MEMBER_NICKNAME  = '유저일';

-- 인증번호 테이블 조회
SELECT * FROM "TB_AUTH_KEY";

-- 이메일, 인증번호 확인
SELECT COUNT(*)
FROM TB_AUTH_KEY
WHERE EMAIL = ''
AND AUTH_KEY = '';

UPDATE "MEMBER" SET
MEMBER_DEL_FL = 'Y'
WHERE MEMBER_NO = 6;

UPDATE "MEMBER" SET
MEMBER_NO = 3
WHERE MEMBER_NO = 8;

COMMIT;

DELETE FROM "MEMBER" WHERE MEMBER_NO = 3;

-- 파일 목록 조회
SELECT FILE_NO, FILE_PATH, FILE_ORIGINAL_NAME, FILE_RENAME, MEMBER_NICKNAME,
TO_CHAR(FILE_UPLOAD_DATE, 'YYYY-MM-DD') FILE_UPLOAD_DATE
FROM "UPLOAD_FILE"
JOIN "MEMBER" USING (MEMBER_NO)
ORDER BY FILE_NO DESC;

UPDATE "MEMBER" SET
MEMBER_PW = '$2a$10$cUjrg0EjalRgh9w0i0Dg6OGV67WviEYVFwPL/U7krKx4l2Bdid8SO'
WHERE MEMBER_NO = 1;

SELECT * FROM "MEMBER";

UPDATE "MEMBER" SET MEMBER_DEL_FL ='N' WHERE MEMBER_NO = 4;

UPDATE UPLOAD_FILE SET
FILE_ORIGINAL_NAME = 'zzang.png'
WHERE FILE_NO = 1;

-- 게시판 종류 조회
SELECT BOARD_CODE "boardCode", BOARD_NAME "boardName"
FROM BOARD_TYPE
ORDER BY BOARD_CODE;

SELECT * FROM BOARD_TYPE
ORDER BY BOARD_CODE;

-- 게시글 목록 조회
-- 특정 게시판에 삭제되지 않은 게시글 목록 조회
-- 단, 최신글이 제일 위에 존재
-- 몇 초/분/시간 전 또는 YYYY-MM-DD 형식으로 작성일 조회
-- + 댓글 개수
-- + 좋아요 개수

-- 번호 / 제목[댓글 개수] / 작성자 닉네임 / 작성일 / 조회수 / 좋아요 개수
-- 상관 서브 쿼리
-- 1) 메인 쿼리 1행 조회
-- 2) 1행 조회 결과를 이용해서 서브쿼리 수행
--    (메인쿼리 모두 조회할 때까지 반복)

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
AND BOARD_CODE = 1
ORDER BY BOARD_NO DESC;

-- 현재 시간 - 하루 전
SELECT (SYSDATE -
	TO_DATE('2024-04-21 12:01:30', 'YYYY-MM-DD HH24:MI:SS')) * 60 * 60 * 24
FROM DUAL;

SELECT BOARD_WRITE_DATE FROM BOARD;

-- 게시글 2개 추가
BEGIN
	FOR I IN 1..2 LOOP
		
		INSERT INTO "BOARD"
		VALUES(SEQ_BOARD_NO.NEXTVAL,
					 SEQ_BOARD_NO.CURRVAL || '번째 게시글',
					 SEQ_BOARD_NO.CURRVAL || '번째 게시글 내용 입니다',
					 DEFAULT, DEFAULT, DEFAULT, DEFAULT,
					 CEIL( DBMS_RANDOM.VALUE(0,3) ), -- BOARD_CODE(게시판종류)
					 1 -- MEMBER_NO(작성회원번호)
		);
		
	END LOOP;
END;

COMMIT;

-- 특정 게시판 게시글 수 조회
SELECT COUNT(*)
FROM "BOARD"
WHERE BOARD_DEL_FL = 'N'
AND BOARD_CODE = 1;

-------------------------------------------------------
/* 게시글 상세 조회 */
SELECT BOARD_NO, BOARD_TITLE, BOARD_CONTENT, BOARD_CODE, READ_COUNT,
	MEMBER_NO, MEMBER_NICKNAME, PROFILE_IMG,
	TO_CHAR(BOARD_WRITE_DATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') BOARD_WRITE_DATE, 
	TO_CHAR(BOARD_UPDATE_DATE, 'YYYY"년" MM"월" DD"일" HH24:MI:SS') BOARD_UPDATE_DATE,
	(SELECT COUNT(*)
	 FROM "BOARD_LIKE"
	 WHERE BOARD_NO = 1950) LIKE_COUNT,
	(SELECT IMG_PATH || IMG_RENAME
	 FROM "BOARD_IMG"
	 WHERE BOARD_NO = 1950
	 AND   IMG_ORDER = 0) THUMBNAIL
FROM "BOARD"
JOIN "MEMBER" USING(MEMBER_NO)
WHERE BOARD_DEL_FL = 'N'
AND BOARD_CODE = 1
AND BOARD_NO = 1950;

---------------------------------------------

/* 상세조회 되는 게시글의 모든 이미지 조회 */
SELECT *
FROM "BOARD_IMG"
WHERE BOARD_NO = 1950
ORDER BY IMG_ORDER;

---------------------------------------------

/* 상세조회 되는 게시글의 모든 댓글 조회 */
/*계층형 쿼리*/
SELECT LEVEL, C.* FROM
	(SELECT COMMENT_NO, COMMENT_CONTENT,
	    TO_CHAR(COMMENT_WRITE_DATE, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"') COMMENT_WRITE_DATE,
	    BOARD_NO, MEMBER_NO, MEMBER_NICKNAME, PROFILE_IMG, PARENT_COMMENT_NO, COMMENT_DEL_FL
	FROM "COMMENT"
	JOIN MEMBER USING(MEMBER_NO)
	WHERE BOARD_NO = 1950) C
WHERE COMMENT_DEL_FL = 'N'
OR 0 != (SELECT COUNT(*) FROM "COMMENT" SUB
				WHERE SUB.PARENT_COMMENT_NO = C.COMMENT_NO
				AND COMMENT_DEL_FL = 'N')
START WITH PARENT_COMMENT_NO IS NULL
CONNECT BY PRIOR COMMENT_NO = PARENT_COMMENT_NO
ORDER SIBLINGS BY COMMENT_NO;

-- 현재 로그인한 회원이 게시글 좋아요를 눌렀는지 안 눌렀는지 COUNT (다시 한번 체크시 DELETE)
-- 좋아요 여부 확인 (1 : O / 0 : X)
SELECT COUNT(*) FROM BOARD_LIKE
WHERE MEMBER_NO = 1
AND BOARD_NO = 2001;
