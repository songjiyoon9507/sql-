﻿CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(300)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NULL,
	"MEMBER_ADDRESS"	VARCHAR2(300)		NULL,
	"PROFILE_IMG"	VARCHAR2(150)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL
);

CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

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

-------------------------------------------------------------------

CREATE TABLE "AUTH_KEY" (
	"KEY_NO"	NUMBER		NOT NULL,
	"EMAIL"	NVARCHAR2(50)		NOT NULL,
	"AUTH_KEY"	CHAR(6)		NOT NULL,
	"CREATE_TIME"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE SEQUENCE SEQ_KEY_NO NOCACHE;

COMMENT ON COLUMN "AUTH_KEY"."KEY_NO" IS '인증키 구분 번호(시퀀스)(PK)';

COMMENT ON COLUMN "AUTH_KEY"."EMAIL" IS '인증 이메일';

COMMENT ON COLUMN "AUTH_KEY"."AUTH_KEY" IS '인증 번호';

COMMENT ON COLUMN "AUTH_KEY"."CREATE_TIME" IS '인증 번호 생성 시간';

-----------------------------------------------------------------------------

CREATE TABLE "LECTURE_REVIEW" (
	"LECTURE_REVIEW_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(500)		NULL,
	"REVIEW_IMG"	VARCHAR2(300)		NULL,
	"CREATE_DATE_REVIEW"	DATE	DEFAULT SYSDATE	NOT NULL,
	"PARENT_REVIEW_NO"	NUMBER		NULL,
	"REVIEW_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_REVIEW_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_REVIEW"."LECTURE_REVIEW_NO" IS '강의후기번호(PK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_REVIEW"."REVIEW_CONTENT" IS '후기내용';

COMMENT ON COLUMN "LECTURE_REVIEW"."REVIEW_IMG" IS '후기이미지';

COMMENT ON COLUMN "LECTURE_REVIEW"."CREATE_DATE_REVIEW" IS '후기작성일';

COMMENT ON COLUMN "LECTURE_REVIEW"."PARENT_REVIEW_NO" IS '부모댓글번호';

COMMENT ON COLUMN "LECTURE_REVIEW"."REVIEW_DEL_FL" IS '후기 삭제 여부(Y/N)';

------------------------------------------------------------------------------------

CREATE TABLE "LECTURE" (
	"LECTURE_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_CATEGORY_NUM"	NUMBER		NOT NULL,
	"LECTURE_HOME_TITLE"	VARCHAR2(300)		NOT NULL,
	"LECTURE_HOME_CONTENT"	VARCHAR2(300)		NOT NULL,
	"LECTURE_TITLE"	VARCHAR2(300)		NOT NULL,
	"LECTURE_CONTENT"	CLOB		NOT NULL,
	"PRICE"	NUMBER	DEFAULT 0	NOT NULL,
	"INSTRUCTOR_INTRODUCTION"	VARCHAR2(300)		NOT NULL,
	"LECTURE_LEVEL"	NUMBER		NOT NULL,
	"START_TIME"	NVARCHAR2(8)		NOT NULL,
	"HOW_LONG"	NUMBER		NOT NULL,
	"ACCEPTABLE_NUMBER"	NUMBER		NOT NULL,
	"REST_NUMBER"	NUMBER		NOT NULL,
	"START_DATE"	DATE		NOT NULL,
	"END_DATE"	DATE		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"LECTURE_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_NO NOCACHE;

COMMENT ON COLUMN "LECTURE"."LECTURE_NO" IS '강의번호(PK)';

COMMENT ON COLUMN "LECTURE"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "LECTURE"."LECTURE_CATEGORY_NUM" IS '강의 분류(FK)';

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

--------------------------------------------------------------------------------

CREATE TABLE "LECTURE_FILE" (
	"LECTURE_FILE_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(500)		NOT NULL,
	"ORIGINAL_NAME"	VARCHAR2(300)		NOT NULL,
	"FILE_RENAME"	VARCHAR2(100)		NOT NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_FILE_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_FILE"."LECTURE_FILE_NO" IS '강의파일번호';

COMMENT ON COLUMN "LECTURE_FILE"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_FILE"."FILE_PATH" IS '파일경로';

COMMENT ON COLUMN "LECTURE_FILE"."ORIGINAL_NAME" IS '원본파일명';

COMMENT ON COLUMN "LECTURE_FILE"."FILE_RENAME" IS '파일변경명';

COMMENT ON COLUMN "LECTURE_FILE"."UPLOAD_DATE" IS '파일등록일';

----------------------------------------------------------------------------

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TITLE"	NVARCHAR2(100)		NOT NULL,
	"BOARD_CONTENT"	CLOB		NOT NULL,
	"BOARD_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"BOARD_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"BOARD_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

CREATE SEQUENCE SEQ_BOARD_NO NOCACHE;

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호(PK)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."BOARD_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."BOARD_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "BOARD"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "BOARD"."BOARD_DEL_FL" IS '게시글삭제여부(Y/N)';

COMMENT ON COLUMN "BOARD"."MEMBER_NO" IS '작성한 회원번호(FK)';

--------------------------------------------------------------------------

CREATE TABLE "BOARD_IMG" (
	"IMG_NO"	NUMBER		NOT NULL,
	"IMG_PATH"	VARCHAR2(200)		NOT NULL,
	"IMG_ORIGINAL_NAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_RENAME"	NVARCHAR2(50)		NOT NULL,
	"IMG_ORDER"	NUMBER		NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

CREATE SEQUENCE SEQ_IMG_NO NOCACHE;

COMMENT ON COLUMN "BOARD_IMG"."IMG_NO" IS '이미지번호(PK)';

COMMENT ON COLUMN "BOARD_IMG"."IMG_PATH" IS '이미지 요청 경로';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORIGINAL_NAME" IS '이미지 원본명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_RENAME" IS '이미지 변경명';

COMMENT ON COLUMN "BOARD_IMG"."IMG_ORDER" IS '이미지 순서';

COMMENT ON COLUMN "BOARD_IMG"."BOARD_NO" IS '게시글번호(FK)';

--------------------------------------------------------------------------------

CREATE TABLE "BOARD_LIKE" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD_LIKE"."MEMBER_NO" IS '회원번호(PFK)';

COMMENT ON COLUMN "BOARD_LIKE"."BOARD_NO" IS '게시글번호(PFK)';

--------------------------------------------------------------------------------

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	NVARCHAR2(500)		NOT NULL,
	"COMMENT_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"PARENT_COMMENT"	NUMBER		NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

CREATE SEQUENCE SEQ_COMMENT_NO NOCACHE;

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(PK)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_WRITE_DATE" IS '댓글 작성일';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(Y/N)';

COMMENT ON COLUMN "COMMENT"."PARENT_COMMENT" IS '부모 댓글 번호';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "COMMENT"."BOARD_NO" IS '게시글번호(FK)';

------------------------------------------------------------------------------

CREATE TABLE "LECTURE_TYPE" (
	"LECTURE_CATEGORY_NUM"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	NVARCHAR2(30)		NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_CATEGORY_NUM NOCACHE;

COMMENT ON COLUMN "LECTURE_TYPE"."LECTURE_CATEGORY_NUM" IS '강의 분류 번호';

COMMENT ON COLUMN "LECTURE_TYPE"."CATEGORY_NAME" IS '강의 분류 이름';

----------------------------------------------------------------------------

CREATE TABLE "REGISTER_AUTH" (
	"REGISTER_AUTH_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"AUTH_KEY"	NVARCHAR2(4)		NOT NULL,
	"PASS_FLAG"	NUMBER	DEFAULT 0	NOT NULL
);

CREATE SEQUENCE SEQ_REGISTER_AUTH_NO NOCACHE;

COMMENT ON COLUMN "REGISTER_AUTH"."REGISTER_AUTH_NO" IS '인증번호';

COMMENT ON COLUMN "REGISTER_AUTH"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "REGISTER_AUTH"."AUTH_KEY" IS '인증키';

COMMENT ON COLUMN "REGISTER_AUTH"."PASS_FLAG" IS '통과확인(통과하면1,통과전0)';

------------------------------------------------------------------------------------

CREATE TABLE "LECTURE_ADDRESS" (
	"LECTURE_ADDRESS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"POST_CODE"	NVARCHAR2(30)		NOT NULL,
	"ROAD_ADDRESS"	NVARCHAR2(30)		NULL,
	"JIBUN_ADDRESS"	NVARCHAR2(30)		NULL,
	"DETAIL_ADDRESS"	NVARCHAR2(100)		NULL
);

CREATE SEQUENCE SEQ_LECTURE_ADDRESS_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_ADDRESS"."LECTURE_ADDRESS_NO" IS '강의주소번호';

COMMENT ON COLUMN "LECTURE_ADDRESS"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "LECTURE_ADDRESS"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_ADDRESS"."POST_CODE" IS '우편번호';

COMMENT ON COLUMN "LECTURE_ADDRESS"."ROAD_ADDRESS" IS '도로명주소';

COMMENT ON COLUMN "LECTURE_ADDRESS"."JIBUN_ADDRESS" IS '지번주소';

COMMENT ON COLUMN "LECTURE_ADDRESS"."DETAIL_ADDRESS" IS '상세주소';

-------------------------------------------------------------------------------

CREATE TABLE "LECTURE_MAP" (
	"LECTURE_MAP_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"LATITUDE"	NVARCHAR2(300)		NOT NULL,
	"HARDNESS"	NVARCHAR2(300)		NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_MAP_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_MAP"."LECTURE_MAP_NO" IS '강의지도번호';

COMMENT ON COLUMN "LECTURE_MAP"."LECTURE_NO" IS '강의번호(PK)';

COMMENT ON COLUMN "LECTURE_MAP"."LATITUDE" IS '위도';

COMMENT ON COLUMN "LECTURE_MAP"."HARDNESS" IS '경도';

--------------------------------------------------------------------------------

CREATE TABLE "LECTURE_ORDERS" (
	"LECTURE_ORDERS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"MERCHANT_UID"	VARCHAR2(300)		NOT NULL,
	"AMOUNT"	NUMBER		NOT NULL,
	"QUANTITY"	NUMBER		NOT NULL,
	"STATUS"	VARCHAR2(300)		NOT NULL,
	"FAIL_REASON"	VARCHAR2(300)		NULL,
	"CREATED"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_ORDERS_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_ORDERS"."LECTURE_ORDERS_NO" IS '강의주문번호';

COMMENT ON COLUMN "LECTURE_ORDERS"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "LECTURE_ORDERS"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_ORDERS"."MERCHANT_UID" IS '주문번호';

COMMENT ON COLUMN "LECTURE_ORDERS"."AMOUNT" IS '주문가격';

COMMENT ON COLUMN "LECTURE_ORDERS"."QUANTITY" IS '주문수량';

COMMENT ON COLUMN "LECTURE_ORDERS"."STATUS" IS '주문상태';

COMMENT ON COLUMN "LECTURE_ORDERS"."FAIL_REASON" IS '실패이유';

COMMENT ON COLUMN "LECTURE_ORDERS"."CREATED" IS '생성시점';

--------------------------------------------------------------------------------------

CREATE TABLE "LECTURE_PAYMENTS" (
	"LECTURE_PAYMENTS_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_ORDERS_NO"	NUMBER		NOT NULL,
	"IMP_UID"	VARCHAR2(300)		NULL,
	"MERCHANT_UID"	VARCHAR2(300)		NULL,
	"AMOUNT"	NUMBER		NULL,
	"CURRENCY"	VARCHAR2(300)		NULL,
	"STATUS"	VARCHAR2(300)		NULL,
	"FAIL_REASON"	VARCHAR2(300)		NULL,
	"FAILED_AT"	DATE		NULL,
	"PAY_METHOD"	VARCHAR2(300)		NULL,
	"NAME"	VARCHAR2(300)		NULL,
	"PAID_AT"	DATE		NULL,
	"RECEIPT_URL"	VARCHAR2(300)		NULL,
	"STARTED_AT"	DATE		NULL,
	"USER_AGENT"	VARCHAR2(300)		NULL,
	"BUYER_NAME"	VARCHAR2(300)		NULL,
	"BUYER_TEL"	VARCHAR2(300)		NULL,
	"BUYER_ADDR"	VARCHAR2(300)		NULL,
	"BUYER_POSTCODE"	VARCHAR2(300)		NULL,
	"BUYER_EMAIL"	VARCHAR2(300)		NULL,
	"APPLY_NUM"	VARCHAR2(300)		NULL,
	"CARD_CODE"	VARCHAR2(300)		NULL,
	"CARD_NAME"	VARCHAR2(300)		NULL,
	"CARD_NUMBER"	VARCHAR2(300)		NULL,
	"CARD_QUOTA"	NUMBER		NULL,
	"CARD_TYPE"	NUMBER		NULL,
	"BANK_CODE"	VARCHAR2(300)		NULL,
	"BANK_NAME"	VARCHAR2(300)		NULL,
	"VBANK_CODE"	VARCHAR2(300)		NULL,
	"VBANK_DATE"	NUMBER		NULL,
	"VBANK_HOLDER"	VARCHAR2(300)		NULL,
	"VBANK_ISSUED_AT"	DATE		NULL,
	"VBANK_NUM"	VARCHAR2(300)		NULL,
	"VBANK_NAME"	VARCHAR2(300)		NULL,
	"CUSTOM_DATA"	VARCHAR2(300)		NULL,
	"CUSTOMER_UID"	VARCHAR2(300)		NULL,
	"CUSTOMER_UID_USAGE"	VARCHAR2(300)		NULL,
	"CHANNEL"	VARCHAR2(300)		NULL,
	"CASH_RECEIPT_ISSUED"	VARCHAR2(300)		NULL,
	"ESCROW"	VARCHAR2(300)		NULL,
	"PG_ID"	VARCHAR2(300)		NULL,
	"PG_PROVIDER"	VARCHAR2(300)		NULL,
	"EMB_PG_PROVIDER"	VARCHAR2(300)		NULL,
	"PG_TID"	VARCHAR2(300)		NULL,
	"CANCEL_AMOUNT"	NUMBER		NULL,
	"CANCEL_REASON"	VARCHAR2(300)		NULL,
	"CANCELLED_AT"	VARCHAR2(300)		NULL
);

CREATE SEQUENCE SEQ_LECTURE_PAYMENTS_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_PAYMENTS"."LECTURE_PAYMENTS_NO" IS '강의결제번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."LECTURE_ORDERS_NO" IS '강의주문번호(FK)';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."IMP_UID" IS '포트원주문번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."MERCHANT_UID" IS '주문번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."AMOUNT" IS '결제가격';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CURRENCY" IS '화폐';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."STATUS" IS '결제상태';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."FAIL_REASON" IS '실패이유';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."FAILED_AT" IS '실패시간';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."PAY_METHOD" IS '결제방법';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."NAME" IS '결제이름';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."PAID_AT" IS '결제시간';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."RECEIPT_URL" IS '영수증';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."STARTED_AT" IS '시작시간';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."USER_AGENT" IS '사용자';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BUYER_NAME" IS '구매자이름';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BUYER_TEL" IS '구매자번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BUYER_ADDR" IS '구매자주소';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BUYER_POSTCODE" IS '구매자우편번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BUYER_EMAIL" IS '구매자이메일';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."APPLY_NUM" IS '승인번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CARD_CODE" IS '카드코드';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CARD_NAME" IS '카드이름';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CARD_NUMBER" IS '카드번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CARD_QUOTA" IS '카드쿼터';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CARD_TYPE" IS '카드타입';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BANK_CODE" IS '은행코드';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."BANK_NAME" IS '은행이름';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_CODE" IS '가상계좌코드';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_DATE" IS '가상계좌입금기한';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_HOLDER" IS '가상계좌예금주';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_ISSUED_AT" IS '가상계좌발급시간';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_NUM" IS '가상계좌번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."VBANK_NAME" IS '가상계좌이름';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CUSTOM_DATA" IS '고객정보';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CUSTOMER_UID" IS '빌링키';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CUSTOMER_UID_USAGE" IS '빌링키사용';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CHANNEL" IS '채널';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CASH_RECEIPT_ISSUED" IS '현금영수증발급여부';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."ESCROW" IS '에스크로';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."PG_ID" IS 'PG사아이디';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."PG_PROVIDER" IS 'PG사구분코드';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."EMB_PG_PROVIDER" IS '간편결제구분코드';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."PG_TID" IS 'PG사 거래번호';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CANCEL_AMOUNT" IS '취소가격';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CANCEL_REASON" IS '취소이유';

COMMENT ON COLUMN "LECTURE_PAYMENTS"."CANCELLED_AT" IS '취소시간';

-------------------------------------------------------------------------------

CREATE TABLE "LECTURE_RESTNUM" (
	"LECTURE_RESTNUM_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"LECTURE_DATE"	DATE		NOT NULL,
	"REST_NUM"	NUMBER		NOT NULL
);

CREATE SEQUENCE SEQ_LECTURE_RESTNUM_NO NOCACHE;

COMMENT ON COLUMN "LECTURE_RESTNUM"."LECTURE_RESTNUM_NO" IS '강의남은자리기본키';

COMMENT ON COLUMN "LECTURE_RESTNUM"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "LECTURE_RESTNUM"."LECTURE_DATE" IS '강의날짜';

COMMENT ON COLUMN "LECTURE_RESTNUM"."REST_NUM" IS '남은자리';

---------------------------------------------------------------------------------

CREATE TABLE "REGISTERED_MEMBER" (
	"REGISTERED_MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"LECTURE_DATE"	DATE		NOT NULL,
	"MERCHANT_UID"	VARCHAR2(300)		NOT NULL,
	"REGISTERED_MEMBER_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

CREATE SEQUENCE SEQ_REGISTERED_MEMBER_NO NOCACHE;

COMMENT ON COLUMN "REGISTERED_MEMBER"."REGISTERED_MEMBER_NO" IS '등록회원기본키';

COMMENT ON COLUMN "REGISTERED_MEMBER"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "REGISTERED_MEMBER"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "REGISTERED_MEMBER"."LECTURE_DATE" IS '강의날짜';

COMMENT ON COLUMN "REGISTERED_MEMBER"."MERCHANT_UID" IS '주문번호';

COMMENT ON COLUMN "REGISTERED_MEMBER"."REGISTERED_MEMBER_FL" IS '등록여부(N/Y)';

---------------------------------------------------------------------------------------

CREATE TABLE "FEE_SETTLEMENT" (
	"FEE_SETTLEMENT_NO"	NUMBER		NOT NULL,
	"LECTURER_MEMBER_NO"	NUMBER		NOT NULL,
	"SETTLEMENT_AMOUNT"	NUMBER		NOT NULL,
	SETTLEMENT_STATUS NVARCHAR2(30) DEFAULT 'UNSETTLED' NOT NULL
);

CREATE SEQUENCE SEQ_FEE_SETTLEMENT_NO NOCACHE;

COMMENT ON COLUMN "FEE_SETTLEMENT"."FEE_SETTLEMENT_NO" IS '정산번호기본키';

COMMENT ON COLUMN "FEE_SETTLEMENT"."LECTURER_MEMBER_NO" IS '강사회원번호(FK)';

COMMENT ON COLUMN "FEE_SETTLEMENT"."SETTLEMENT_AMOUNT" IS '정산금액';

-----------------------------------------------------------------------------------

CREATE TABLE "REFUND_CUSTOMER" (
	"REFUND_CUSTOMER_NO"	NUMBER		NOT NULL,
	"LECTURE_NO"	NUMBER		NOT NULL,
	"MERCHANT_UID"	VARCHAR2(300)		NOT NULL,
	"REFUND_CUSTOMER_MEMBER_NO"	NUMBER		NOT NULL,
	"REFUND_AMOUNT"	NUMBER		NOT NULL,
	"REFUND_REASON"	VARCHAR2(300)		NOT NULL,
	"REFUND_STATUS"	VARCHAR2(300)		NOT NULL,
	"REFUND_REQUEST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REFUND_PROCESSING_DATE"	DATE		NULL
);

CREATE SEQUENCE SEQ_REFUND_CUSTOMER_NO NOCACHE;

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_CUSTOMER_NO" IS '환불고객기본키';

COMMENT ON COLUMN "REFUND_CUSTOMER"."LECTURE_NO" IS '강의번호(FK)';

COMMENT ON COLUMN "REFUND_CUSTOMER"."MERCHANT_UID" IS '주문번호';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_CUSTOMER_MEMBER_NO" IS '환불회원번호(FK)';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_AMOUNT" IS '환불금액';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_REASON" IS '환불이유';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_STATUS" IS '환불상태';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_REQUEST_DATE" IS '환불요청날짜';

COMMENT ON COLUMN "REFUND_CUSTOMER"."REFUND_PROCESSING_DATE" IS '환불완료날짜';

------------------------------------------------------------------------------------------

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "AUTH_KEY" ADD CONSTRAINT "PK_AUTH_KEY" PRIMARY KEY (
	"KEY_NO"
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

COMMIT;
ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "LECTURE_TYPE" ADD CONSTRAINT "PK_LECTURE_TYPE" PRIMARY KEY (
	"LECTURE_CATEGORY_NUM"
);

ALTER TABLE "REGISTER_AUTH" ADD CONSTRAINT "PK_REGISTER_AUTH" PRIMARY KEY (
	"REGISTER_AUTH_NO"
);

ALTER TABLE "LECTURE_ADDRESS" ADD CONSTRAINT "PK_LECTURE_ADDRESS" PRIMARY KEY (
	"LECTURE_ADDRESS_NO"
);

ALTER TABLE "LECTURE_MAP" ADD CONSTRAINT "PK_LECTURE_MAP" PRIMARY KEY (
	"LECTURE_MAP_NO"
);

ALTER TABLE "LECTURE_ORDERS" ADD CONSTRAINT "PK_LECTURE_ORDERS" PRIMARY KEY (
	"LECTURE_ORDERS_NO"
);

ALTER TABLE "LECTURE_PAYMENTS" ADD CONSTRAINT "PK_LECTURE_PAYMENTS" PRIMARY KEY (
	"LECTURE_PAYMENTS_NO"
);

ALTER TABLE "LECTURE_RESTNUM" ADD CONSTRAINT "PK_LECTURE_RESTNUM" PRIMARY KEY (
	"LECTURE_RESTNUM_NO"
);

ALTER TABLE "REGISTERED_MEMBER" ADD CONSTRAINT "PK_REGISTERED_MEMBER" PRIMARY KEY (
	"REGISTERED_MEMBER_NO"
);

ALTER TABLE "FEE_SETTLEMENT" ADD CONSTRAINT "PK_FEE_SETTLEMENT" PRIMARY KEY (
	"FEE_SETTLEMENT_NO"
);

ALTER TABLE "REFUND_CUSTOMER" ADD CONSTRAINT "PK_REFUND_CUSTOMER" PRIMARY KEY (
	"REFUND_CUSTOMER_NO"
);

------------------------------------------------------------------------------------------------

ALTER TABLE "LECTURE_REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_REVIEW_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LECTURE_REVIEW" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_REVIEW_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "LECTURE_REVIEW" ADD CONSTRAINT "FK_LECTURE_REVIEW_TO_LECTURE_REVIEW_1" FOREIGN KEY (
	"PARENT_REVIEW_NO"
)
REFERENCES "LECTURE_REVIEW" (
	"LECTURE_REVIEW_NO"
);

ALTER TABLE "LECTURE" ADD CONSTRAINT "FK_LECTURE_TYPE_TO_LECTURE_1" FOREIGN KEY (
	"LECTURE_CATEGORY_NUM"
)
REFERENCES "LECTURE_TYPE" (
	"LECTURE_CATEGORY_NUM"
);

ALTER TABLE "LECTURE_FILE" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_FILE_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD_IMG" ADD CONSTRAINT "FK_BOARD_TO_BOARD_IMG_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_LIKE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOARD_LIKE" ADD CONSTRAINT "FK_BOARD_TO_BOARD_LIKE_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_COMMENT_TO_COMMENT_1" FOREIGN KEY (
	"PARENT_COMMENT"
)
REFERENCES "COMMENT" (
	"COMMENT_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_MEMBER_TO_COMMENT_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "FK_BOARD_TO_COMMENT_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "REGISTER_AUTH" ADD CONSTRAINT "FK_MEMBER_TO_REGISTER_AUTH_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LECTURE_ADDRESS" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_ADDRESS_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LECTURE_ADDRESS" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_ADDRESS_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "LECTURE_MAP" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_MAP_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "LECTURE_ORDERS" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_ORDERS_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LECTURE_ORDERS" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_ORDERS_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "LECTURE_PAYMENTS" ADD CONSTRAINT "FK_MEMBER_TO_LECTURE_PAYMENTS_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "LECTURE_PAYMENTS" ADD CONSTRAINT "FK_LECTURE_ORDERS_TO_LECTURE_PAYMENTS_1" FOREIGN KEY (
	"LECTURE_ORDERS_NO"
)
REFERENCES "LECTURE_ORDERS" (
	"LECTURE_ORDERS_NO"
);

ALTER TABLE "LECTURE_RESTNUM" ADD CONSTRAINT "FK_LECTURE_TO_LECTURE_RESTNUM_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "REGISTERED_MEMBER" ADD CONSTRAINT "FK_MEMBER_TO_REGISTERED_MEMBER_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REGISTERED_MEMBER" ADD CONSTRAINT "FK_LECTURE_TO_REGISTERED_MEMBER_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "FEE_SETTLEMENT" ADD CONSTRAINT "FK_MEMBER_TO_FEE_SETTLEMENT_1" FOREIGN KEY (
	"LECTURER_MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REFUND_CUSTOMER" ADD CONSTRAINT "FK_LECTURE_TO_REFUND_CUSTOMER_1" FOREIGN KEY (
	"LECTURE_NO"
)
REFERENCES "LECTURE" (
	"LECTURE_NO"
);

ALTER TABLE "REFUND_CUSTOMER" ADD CONSTRAINT "FK_MEMBER_TO_REFUND_CUSTOMER_1" FOREIGN KEY (
	"REFUND_CUSTOMER_MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

CREATE TABLE "REGISTERED_MESSAGE" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MESSAGE_TITLE"	NVARCHAR2(50)		NULL,
	"MESSAGE_CONTENT"	NVARCHAR2(300)		NULL,
	"MESSAGE_CHECK"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MESSAGE_REGDATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REGISTERED_MEMBER_NO"	NUMBER		NOT NULL,
	"MESSAGE_ONESIDE_DEL_FL" CHAR(1) NULL
);

CREATE SEQUENCE SEQ_REGISTERED_MESSAGE_NO NOCACHE;

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MESSAGE_NO" IS '메세지기본키';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MEMBER_NO" IS '회원번호(FK)';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MESSAGE_TITLE" IS '메세지제목';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MESSAGE_CONTENT" IS '메세지내용';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MESSAGE_CHECK" IS '확연여부(N/Y)';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."MESSAGE_REGDATE" IS '메세지수정일';

COMMENT ON COLUMN "REGISTERED_MESSAGE"."REGISTERED_MEMBER_NO" IS '등록회원기본키';

ALTER TABLE "REGISTERED_MESSAGE" ADD CONSTRAINT "PK_REGISTERED_MESSAGE" PRIMARY KEY (
	"MESSAGE_NO"
);

ALTER TABLE "REGISTERED_MESSAGE" ADD CONSTRAINT "FK_MEMBER_TO_REGISTERED_MESSAGE_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "REGISTERED_MESSAGE" ADD CONSTRAINT "FK_REGISTERED_MEMBER_TO_REGISTERED_MESSAGE_1" FOREIGN KEY (
	"REGISTERED_MEMBER_NO"
)
REFERENCES "REGISTERED_MEMBER" (
	"REGISTERED_MEMBER_NO"
);

-------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION NEXT_IMG_NO
RETURN NUMBER
IS IMG_NO NUMBER;
BEGIN
	SELECT SEQ_IMG_NO.NEXTVAL
	INTO IMG_NO
	FROM DUAL;
	RETURN IMG_NO;
END;

-------------------------------------------------------------------------------------

INSERT INTO LECTURE_TYPE VALUES (
SEQ_LECTURE_CATEGORY_NUM.NEXTVAL,
'비누'
);
INSERT INTO LECTURE_TYPE VALUES (
SEQ_LECTURE_CATEGORY_NUM.NEXTVAL,
'유리 공예'
);
INSERT INTO LECTURE_TYPE VALUES (
SEQ_LECTURE_CATEGORY_NUM.NEXTVAL,
'드로잉'
);
INSERT INTO LECTURE_TYPE VALUES (
SEQ_LECTURE_CATEGORY_NUM.NEXTVAL,
'가죽 공예'
);
INSERT INTO LECTURE_TYPE VALUES (
SEQ_LECTURE_CATEGORY_NUM.NEXTVAL,
'요리'
);

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

BEGIN
	FOR I IN 1..2000 LOOP
		INSERT INTO "COMMENT"	
		VALUES(
			SEQ_COMMENT_NO.NEXTVAL,
			SEQ_COMMENT_NO.CURRVAL || '번째 댓글 입니다',
			DEFAULT, DEFAULT,
			NULL, -- 부모댓글번호
			2, -- 댓글작성회원번호
			CEIL( DBMS_RANDOM.VALUE(0, 2000) ) -- 게시글번호
		);
	END LOOP;
END;

COMMIT;

SELECT * FROM "MEMBER";
SELECT * FROM LECTURE_ADDRESS la ;
SELECT * FROM BOARD ORDER BY BOARD_NO DESC ;
SELECT * FROM "COMMENT";