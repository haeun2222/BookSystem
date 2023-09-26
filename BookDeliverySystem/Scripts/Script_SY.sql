SELECT B.BOOK_IMG,B.BOOK_SEQ 
FROM (
  		SELECT R.BOOK_SEQ
  		FROM TB_BOOK_RENT R
  		GROUP BY R.BOOK_SEQ
  		ORDER BY COUNT(*) DESC
  		FETCH FIRST 5 ROWS ONLY
		) Top2Books
JOIN TB_BOOK B ON Top2Books.BOOK_SEQ = B.BOOK_SEQ;



WITH Top2Books AS (
  SELECT BOOK_SEQ , COUNT(*) AS loan_count
  FROM TB_BOOK_RENT tbr
  GROUP BY BOOK_SEQ 
  ORDER BY loan_count DESC
  FETCH FIRST 1 ROWS ONLY
),
GenderTest AS(
SELECT
  T2B.BOOK_SEQ,
  B.BOOK_TITLE,
  B.BOOK_IMG,
  U.USER_GENDER,
  COUNT(*) AS loan_count
FROM
  Top2Books T2B
  JOIN TB_BOOK_RENT R ON T2B.BOOK_SEQ = R.BOOK_SEQ
  JOIN TB_USER U ON R.USER_SEQ = U.USER_SEQ
  JOIN TB_BOOK B ON T2B.BOOK_SEQ = B.BOOK_SEQ
GROUP BY
  T2B.BOOK_SEQ,
  B.BOOK_TITLE,
  B.BOOK_IMG,
  U.USER_GENDER
)  
SELECT 
	GT.BOOK_SEQ,
	GT.BOOK_IMG,
	GT.BOOK_TITLE,
	GT.USER_GENDER,
	TO_CHAR((GT.loan_count / SUM(GT.loan_count) OVER (PARTITION BY GT.BOOK_SEQ)) * 100, 'FM99990') || '%' AS PERCENT
FROM GenderTest GT	
ORDER BY
  GT.BOOK_SEQ,
  GT.USER_GENDER;
  
WITH Top2Books AS (
  SELECT BOOK_SEQ, COUNT(*) AS loan_count
  FROM TB_BOOK_RENT
  GROUP BY BOOK_SEQ 
  ORDER BY loan_count DESC
  FETCH FIRST 1 ROWS ONLY
)
SELECT
  T2B.BOOK_SEQ,
  B.BOOK_TITLE,
  CASE 
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 19 AND EXTRACT(YEAR FROM SYSDATE) - 10 THEN '10대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 29 AND EXTRACT(YEAR FROM SYSDATE) - 20 THEN '20대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 39 AND EXTRACT(YEAR FROM SYSDATE) - 30 THEN '30대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 49 AND EXTRACT(YEAR FROM SYSDATE) - 40 THEN '40대'
    ELSE '50대 이상'
  END AS age_group,
  TO_CHAR(
    (COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY T2B.BOOK_SEQ)) * 100, 'FM99990') || '%' AS percent
FROM
  Top2Books T2B
  JOIN TB_BOOK_RENT R ON T2B.BOOK_SEQ = R.BOOK_SEQ
  JOIN TB_USER U ON R.USER_SEQ = U.USER_SEQ
  JOIN TB_BOOK B ON T2B.BOOK_SEQ = B.BOOK_SEQ
GROUP BY
  T2B.BOOK_SEQ,
  B.BOOK_TITLE,
  CASE 
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 19 AND EXTRACT(YEAR FROM SYSDATE) - 10 THEN '10대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 29 AND EXTRACT(YEAR FROM SYSDATE) - 20 THEN '20대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 39 AND EXTRACT(YEAR FROM SYSDATE) - 30 THEN '30대'
    WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 49 AND EXTRACT(YEAR FROM SYSDATE) - 40 THEN '40대'
    ELSE '50대 이상'
  END
ORDER BY
  T2B.BOOK_SEQ,
  age_group; 

BEGIN
  FOR i IN 501..700 LOOP
    INSERT INTO TB_USER (
      USER_SEQ, USER_PASSWORD, USER_NAME, USER_EMAIL, USER_PHONE,
      USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER
    ) VALUES (
      i, '비밀번호' || i, '사용자 ' || i, 'user' || i || '@example.com', '010-0000-000' || i,
      TO_CHAR(TO_DATE('1980-01-01', 'YYYY-MM-DD') + (i - 101) * 365, 'YYYY-MM-DD'), 'U', 'N',
      TO_DATE('2018-09-06', 'YYYY-MM-DD'), CASE WHEN MOD(i, 2) = 0 THEN 'M' ELSE 'F' END
    );
  END LOOP;
  COMMIT;
END;

SELECT *
	FROM TB_USER;
	
-- SQL 스크립트: 100개의 더미 대출 데이터 삽입
BEGIN
  FOR i IN 701..750 LOOP
    INSERT INTO TB_BOOK_RENT (
      RENT_SEQ, USER_SEQ, BOOK_SEQ, RENT_DATE, RENT_RETURN_DATE, RENT_STATUS
    ) VALUES (
      i, MOD(i, 400) + 101, 20, TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD')+7, 'N'
    );
  END LOOP;
  COMMIT;
END;

SELECT *
	FROM TB_BOOK_RENT tbr


 

	
	-- 배송테이블 생성
CREATE TABLE TB_DELIVERY(
   DELIVERY_SEQ NUMBER PRIMARY KEY,
   USER_SEQ NUMBER REFERENCES TB_USER(USER_SEQ),
   RENT_SEQ NUMBER REFERENCES TB_BOOK_RENT(RENT_SEQ),
   DELIVERY_NAME VARCHAR2(30) NOT NULL,
   DELIVERY_PHONE VARCHAR2(30) NOT NULL,
   POSTCODE VARCHAR2(10) NOT NULL,
   ADDRESS VARCHAR2(100) NOT NULL,
   DETADDR VARCHAR2(100),
   EXTADDR VARCHAR2(100),
   DELIVERY_NUM NUMBER
);

CREATE SEQUENCE SQ_USER START WITH 701 INCREMENT BY 1;
CREATE SEQUENCE SQ_RENT START WITH 800 INCREMENT BY 1;
DROP TABLE TB_DELIVERY;
 

SELECT *
FROM TB_DELIVERY D
INNER JOIN TB_USER U ON D.USER_SEQ = U.USER_SEQ
INNER JOIN TB_BOOK_RENT BR ON D.RENT_SEQ = BR.RENT_SEQ;

// 검색창 쿼리 (저자또는 도서명)
SELECT BOOK_SEQ ,BOOK_TITLE ,BOOK_WRITER ,BOOK_IMG ,BOOK_INTRO 
	FROM TB_BOOK tb
	WHERE BOOK_TITLE ='October Sky' 
	OR BOOK_WRITER ='Alano';

SELECT BOOK_TITLE ,BOOK_WRITER 
	FROM TB_BOOK tb 

	
	
INSERT INTO TB_USER (USER_SEQ, USER_EMAIL, USER_PASSWORD, USER_NAME, USER_PHONE, USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER)
VALUES (708, 'user@user.com', 'asd123', '김영진', '010-7555-7861', '2005-07-14', 'U', 'N', '2022-07-18', 'M');

INSERT INTO TB_USER (USER_SEQ, USER_EMAIL, USER_PASSWORD, USER_NAME, USER_PHONE, USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER)
VALUES (707, 'user2@user.com', 'asd123', '김수엽', '010-7555-7862', '2005-07-14', 'U', 'N', '2022-07-18', 'M');

INSERT INTO TB_USER (USER_SEQ, USER_EMAIL, USER_PASSWORD, USER_NAME, USER_PHONE, USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER)
VALUES (706, 'user3@user.com', 'asd123', '김지인', '010-7555-7863', '2005-07-14', 'U', 'N', '2022-07-18', 'F');

INSERT INTO TB_USER (USER_SEQ, USER_EMAIL, USER_PASSWORD, USER_NAME, USER_PHONE, USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER)
VALUES (709, 'user4@user.com', 'asd123', '박하은', '010-7555-7864', '2005-07-14', 'U', 'N', '2022-07-18', 'F');

INSERT INTO TB_USER (USER_SEQ, USER_EMAIL, USER_PASSWORD, USER_NAME, USER_PHONE, USER_BIRTH, USER_AUTH, USER_DELFLAG, JOINDATE, USER_GENDER)
VALUES (710, 'admin1@admin.com', 'asd123', '관리자', '010-7555-7864', '2005-07-14', 'U', 'N', '2022-07-18', 'F');
---------------------------------------------------------자유게시판
--게시글전체조회	
SELECT tfb.FREE_BSEQ, tfb.USER_SEQ, tfb.FREE_TITLE, tfb.FREE_REGDATE, tu.USER_NAME
    FROM TB_FREE_BOARD tfb
    JOIN TB_USER tu ON tfb.USER_SEQ = tu.USER_SEQ
    WHERE FREE_DELFLAG = 'N'
    ORDER BY FREE_REGDATE DESC ;
--새글등록
SELECT SQ_FREE_BOARD.NEXTVAL FROM DUAL;
	
	
INSERT INTO BOOK.TB_FREE_BOARD
(FREE_BSEQ, USER_SEQ, FREE_TITLE, FREE_CONTENT, FREE_REGDATE, FREE_DELFLAG)
VALUES(SQ_FREE_BOARD.NEXTVAL, SQ_FREE_BOARD.NEXTVAL, '해리포터 시리즈 재밌네요', '오랜만에 책으로 읽으니까 새롭네요 영화랑은 또 다른느낌', '2023-09-10', 'N');
--게시글 상세조회
SELECT tfb.FREE_BSEQ, tfb.FREE_TITLE, tfb.FREE_CONTENT, tfb.FREE_REGDATE, tu.USER_NAME
FROM TB_FREE_BOARD tfb
INNER JOIN TB_USER tu ON tfb.USER_SEQ = tu.USER_SEQ
WHERE tfb.FREE_BSEQ  = '43';


--게시글 삭제
UPDATE TB_FREE_BOARD SET FREE_DELFLAG = 'Y'
	WHERE FREE_DELFLAG ='N'
	AND FREE_BSEQ = '2';

SELECT SQ_FREE_COMMENT.NEXTVAL FROM DUAL;
--답글작성
INSERT INTO BOOK.TB_FREE_COMMENT
(COMMENT_SEQ, FREE_BSEQ, USER_SEQ, COMMENT_CONTENT, COMMENT_REGDATE, COMMENT_DELFLAG)
VALUES(SQ_FREE_COMMENT.NEXTVAL, '43', '701', '공감합니다 시간 너무 빨라요', SYSDATE, 'N');

--답글조회
SELECT tfc.COMMENT_SEQ ,tu.USER_NAME ,tfc.COMMENT_CONTENT ,tfc.COMMENT_REGDATE  
	FROM TB_FREE_COMMENT tfc 
	JOIN TB_USER tu ON tfc.USER_SEQ = tu.USER_SEQ 
	WHERE FREE_BSEQ = '61' AND tfc.COMMENT_DELFLAG = 'N'
	ORDER BY COMMENT_SEQ;

ALTER TABLE BOOK.TB_FREE_COMMENT MODIFY COMMENT_REGDATE DATE;

--답글삭제
UPDATE TB_FREE_COMMENT SET COMMENT_DELFLAG ='Y'
	WHERE COMMENT_DELFLAG ='N'
	AND COMMENT_SEQ = '30';
--1위책 변경
UPDATE TB_BOOK_RENT SET BOOK_SEQ = '533'
	WHERE BOOK_SEQ = '499';

--게시글수정

UPDATE TB_FREE_BOARD SET FREE_CONTENT = '수정이되나요',
	FREE_REGDATE = SYSDATE
	WHERE FREE_BSEQ = '67';


--상세페이지 해당 책의 성별 대출 한 통계
WITH GenderStats AS (
  SELECT
    B.BOOK_SEQ,
    B.BOOK_TITLE,
    B.BOOK_IMG,
    U.USER_GENDER,
    COUNT(*) AS loan_count
  FROM
    TB_BOOK_RENT R
    JOIN TB_USER U ON R.USER_SEQ = U.USER_SEQ
    JOIN TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
  WHERE
    B.BOOK_SEQ = 540  
  GROUP BY
    B.BOOK_SEQ,
    B.BOOK_TITLE,
    B.BOOK_IMG,
    U.USER_GENDER
)
SELECT 
  GS.BOOK_SEQ,
  GS.BOOK_IMG,
  GS.BOOK_TITLE,
  GS.USER_GENDER,
  TO_CHAR((GS.loan_count / SUM(GS.loan_count) OVER (PARTITION BY GS.BOOK_SEQ)) * 100, 'FM99990') || '%' AS PERCENT
FROM GenderStats GS
ORDER BY
  GS.USER_GENDER;

--상세페이지 해당도서 연령별 대출 한 통계
WITH AgeStats AS (
  SELECT
    B.BOOK_SEQ,
    B.BOOK_TITLE,
    CASE 
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 19 AND EXTRACT(YEAR FROM SYSDATE) - 10 THEN '10대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 29 AND EXTRACT(YEAR FROM SYSDATE) - 20 THEN '20대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 39 AND EXTRACT(YEAR FROM SYSDATE) - 30 THEN '30대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 49 AND EXTRACT(YEAR FROM SYSDATE) - 40 THEN '40대'
      ELSE '50대 이상'
    END AS age_group,
    TO_CHAR(
      (COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY B.BOOK_SEQ)) * 100, 'FM99990') || '%' AS percent
  FROM
    TB_BOOK_RENT R
    JOIN TB_USER U ON R.USER_SEQ = U.USER_SEQ
    JOIN TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
  WHERE
    B.BOOK_SEQ =540  
  GROUP BY
    B.BOOK_SEQ,
    B.BOOK_TITLE,
    CASE 
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 19 AND EXTRACT(YEAR FROM SYSDATE) - 10 THEN '10대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 29 AND EXTRACT(YEAR FROM SYSDATE) - 20 THEN '20대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 39 AND EXTRACT(YEAR FROM SYSDATE) - 30 THEN '30대'
      WHEN TO_NUMBER(SUBSTR(U.USER_BIRTH, 1, 4)) BETWEEN EXTRACT(YEAR FROM SYSDATE) - 49 AND EXTRACT(YEAR FROM SYSDATE) - 40 THEN '40대'
      ELSE '50대 이상'
    END
)
SELECT 
  Ages.BOOK_SEQ,
  Ages.BOOK_TITLE,
  Ages.age_group,
  Ages.percent
FROM AgeStats Ages
ORDER BY
  Ages.age_group;

 



--게시글페이징   
SELECT * FROM (
    SELECT ROWNUM AS rn, tfb.FREE_BSEQ, tfb.USER_SEQ, tfb.FREE_TITLE, tfb.FREE_REGDATE, tu.USER_NAME
    FROM TB_FREE_BOARD tfb
    JOIN TB_USER tu ON tfb.USER_SEQ = tu.USER_SEQ
    WHERE FREE_DELFLAG = 'N'
    ORDER BY FREE_REGDATE DESC
)
    WHERE RN BETWEEN 1 AND 50;

SELECT COUNT(*) 
	FROM TB_FREE_BOARD;
 

 
