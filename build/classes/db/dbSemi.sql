
------------------------사용자 테이블------------------------
--USER_NO 시퀀스
DROP TABLE BG_BOARD CASCADE CONSTRAINTS;
DROP TABLE BG_COMMENT CASCADE CONSTRAINTS;
DROP TABLE BG_MYPAGEUSE CASCADE CONSTRAINTS;
DROP TABLE BG_MYPAGE_TOTAL CASCADE CONSTRAINTS;
DROP TABLE PRO_HISTORY CASCADE CONSTRAINTS;
DROP TABLE KIND_BOARD CASCADE CONSTRAINTS;
DROP TABLE MARKET_BOARD CASCADE CONSTRAINTS;
DROP TABLE BG_USER CASCADE CONSTRAINTS;
DROP SEQUENCE USER_SEQ;
DROP SEQUENCE BOARD_SEQ;
DROP SEQUENCE COMMENT_SEQ;
DROP SEQUENCE PRO_HISTORYSEQ;

select * from bg_board;
select * from bg_user;
--------------------------------------------------
--전문가 경력 넣는 쿼리문
DROP TABLE PRO_HISTORY;

DROP SEQUENCE PRO_HISTORYSEQ;

SELECT *FROM BG_USER;

CREATE TABLE PRO_HISTORY(
	USER_NO NUMBER,
	HISTORY_DATE VARCHAR2(2000),
	HISTORY VARCHAR2(2000),
	SEQ NUMBER
);

CREATE SEQUENCE PRO_HISTORYSEQ;
SELECT * FROM PRO_HISTORY

-- 맨앞숫자를 꼭 전문가의 USER_NO로 맞춰줄것
INSERT INTO PRO_HISTORY VALUES(2,'2014.3~2020.2', '안양 성결대학교 재학 및 졸업',PRO_HISTORYSEQ.NEXTVAL);

INSERT INTO PRO_HISTORY VALUES(2,'1995.1~', '우리집 멋진아들',PRO_HISTORYSEQ.NEXTVAL);

INSERT INTO PRO_HISTORY VALUES(2,'2020.1~2020.7', 'KH정보교육원 자바교육과정 수료',PRO_HISTORYSEQ.NEXTVAL);

----------------------------

CREATE SEQUENCE USER_SEQ
NOCYCLE
NOCACHE;

CREATE TABLE BG_USER(
	USER_NO NUMBER PRIMARY KEY,
	USER_ID VARCHAR2(100) NOT NULL UNIQUE,
	USER_PW VARCHAR2(100) NOT NULL,
	USER_NAME VARCHAR2(100) NOT NULL,
	USER_GENDER VARCHAR2(10) NOT NULL CHECK(USER_GENDER IN('남','여')),
	USER_BIRTH VARCHAR2(100) NOT NULL,
	USER_PHONE VARCHAR2(100) NOT NULL,
	USER_EMAIL VARCHAR2(200) NOT NULL UNIQUE,
	USER_GRADE VARCHAR2(50) NOT NULL CHECK(USER_GRADE IN('관리자', '전문가', '사용자')),
	USER_ENABLED VARCHAR2(2) NOT NULL CHECK(USER_ENABLED IN('Y','N'))
);

INSERT INTO BG_USER VALUES(0, 'ADMIN', 'Admin12#','관리자','남','20200518','01011111111','bankgap@naver.com','관리자','Y')

------------------------게시판 테이블------------------------
--BOARD_TYPE : T(팁), F(자유), E(전문가)
--BG_USER 테이블의 USER_NO 외래키

--게시판 시퀀스
CREATE SEQUENCE BOARD_SEQ
NOCYCLE
NOCACHE;


CREATE TABLE BG_BOARD(
   BOARD_NO NUMBER PRIMARY KEY,
   BOARD_WRITER VARCHAR2(50) NOT NULL,
   BOARD_TITLE VARCHAR2(100) NOT NULL,
   BOARD_CONTENT VARCHAR2(2000) NOT NULL,
   BOARD_REGDATE DATE NOT NULL,
   BOARD_VIEW NUMBER,
   BOARD_TYPE VARCHAR2(100) NOT NULL CHECK(BOARD_TYPE IN('T','F','E')),
   USER_NO NUMBER NOT NULL,
   BOARD_FILENAME VARCHAR2(100),
   BOARD_REFILENAME VARCHAR2(100),
   CONSTRAINT FK_USER_NO_BOARD FOREIGN KEY(USER_NO) REFERENCES BG_USER(USER_NO) ON DELETE CASCADE
);

INSERT INTO BG_BOARD VALUES(0, '관리자','전기세 아끼는 꿀팁 공유합니다~','1.냉장고 적정 온도로 맞추기 
	
																			냉장고 설정온도를 1℃를 올리면, 전력 소비량은 5% 줄일 수 있습니다. 그렇다고 온도를 너무 올리지는 마세요! 음식이 상할 수 있으니까요. 냉장실의 적정 온도는 0℃~5℃ 이하, 냉동실은 -18℃ 이하 입니다~.',SYSDATE,0,'T',0,'tipimg.jsp','20200518.jpg')
select * from BG_BOARD
------------------------댓글 테이블------------------------
--BG_USER 테이블의 USER_NO 외래키
--BG_BOARD 테이블의 BOARD_NO 외래키

--댓글 시퀀스
CREATE SEQUENCE COMMENT_SEQ
NOCYCLE
NOCACHE;

CREATE TABLE BG_COMMENT(
	COMM_NO NUMBER PRIMARY KEY,
	COMM_WRITER VARCHAR2(50) NOT NULL,
	COMM_CONTENT VARCHAR2(150) NOT NULL,
	COMM_REGDATE DATE NOT NULL,
	USER_NO NUMBER NOT NULL,
	BOARD_NO NUMBER NOT NULL,
	CONSTRAINT FK_USER_NO_COMMENT FOREIGN KEY(USER_NO) REFERENCES BG_USER(USER_NO) ON DELETE CASCADE,
	CONSTRAINT FK_BOARD_NO_COMMENT FOREIGN KEY(BOARD_NO) REFERENCES BG_BOARD(BOARD_NO) ON DELETE CASCADE
);

------------------------사용자(MyPage)지출 테이블------------------------
--BG_USER 테이블의 USER_NO 외래키

CREATE TABLE BG_MYPAGEUSE(
	USER_NO NUMBER NOT NULL,
	PAYNO NUMBER NOT NULL,
	CATEGORY VARCHAR2(200) NOT NULL,
	PLACE VARCHAR2(2000) NOT NULL,
	AMOUNT NUMBER NOT NULL,
	USEDATE DATE NOT NULL,
	CONSTRAINT FK_BG_MYPAGEUSE FOREIGN KEY(USER_NO) REFERENCES BG_USER(USER_NO)
);

------------------------사용자(MyPage) 해당 카테고리의 금액 총합 구하기 테이블------------------------

CREATE TABLE BG_MYPAGE_TOTAL(
	CATEGORY VARCHAR2(200) CHECK( CATEGORY IN ('공공요금','교통비','문화생활비','식비','유흥비')),
	AMOUNT_SUM NUMBER NOT NULL,
	ANOUNT_AVG NUMBER NOT NULL
);

------------------------전문가 경력 테이블------------------------
--경력 시퀀스
CREATE SEQUENCE PRO_HISTORYSEQ
NOCYCLE
NOCACHE;

CREATE TABLE PRO_HISTORY(
	USER_NO NUMBER,
	HISTORY_DATE VARCHAR2(2000),
	HISTORY VARCHAR2(2000),
	HISTORY_SEQ NUMBER
);

------------------------착한가게(api) 테이블------------------------

--"DESCRIPTION" : {"SH_RCMN":"추천수","INDUTY_CODE_SE_NAME":"분류코드명",
--"SH_PHONE":"업소 전화번호","SH_ADDR":"업소 주소","SH_INFO":"업소정보",
--"BASE_YM":"기준년월","SH_PRIDE":"자랑거리","SH_WAY":"찾아오시는 길","SH_ID":"업소아이디",
--"INDUTY_CODE_SE":"분류코드","SH_PHOTO":"업소 사진","SH_NAME":"업소명"},

CREATE TABLE KIND_BOARD(
	SH_ID VARCHAR2(1000) UNIQUE,
	SH_NAME VARCHAR2(1000),
	SH_ADDR VARCHAR2(1000),
	SH_WAY VARCHAR2(1000),
	SH_PHONE VARCHAR2(1000),
	SH_INFO VARCHAR2(4000),
	SH_PRIDE VARCHAR2(4000),
	SH_PHOTO VARCHAR2(1000),
	SH_RCMN VARCHAR2(1000),
	INDUTY_CODE_SE VARCHAR2(1000),
	INDUTY_CODE_SE_NAME VARCHAR2(1000),
	BASE_YM VARCHAR2(1000)
);

------------------------전통시장(api) 테이블------------------------

CREATE TABLE MARKET_BOARD(
	M_NAME VARCHAR2(4000),
	M_CODE VARCHAR2(4000),
	GUNAME VARCHAR2(4000),
	M_ADDR VARCHAR2(4000),
	LNG NUMBER,
	LAT NUMBER
);
