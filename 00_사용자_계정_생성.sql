
-- 한 줄 주석

/*
 * 범위 주석
 * */

-- 11G 버전 이전의 문법을 사용 가능하도록 함
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- CTRL + ENTER : 선택한 SQL 수행 (마우스 커서 올려두고 CTRL ENTER 눌러야함)

-- 사용자 계정 생성(관리자 계정에서 가능)
-- CREATE USER exam_sjy IDENTIFIED BY exam_sjy;
-- CREATE USER kh_sjy IDENTIFIED BY kh1234;
CREATE USER board_project IDENTIFIED BY board1234;

--DROP USER kh_psc CASCADE;

-- 사용자 계정에 권한 부여
-- GRANT RESOURCE, CONNECT TO exam_sjy;
-- GRANT RESOURCE, CONNECT TO kh_sjy;
GRANT RESOURCE, CONNECT TO board_project;

-- 객체가 생성될 수 있는 공간 할당량 지정
-- ALTER USER exam_sjy DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
-- ALTER USER kh_sjy DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
ALTER USER board_project DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;