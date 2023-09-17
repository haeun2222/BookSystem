

SELECT *
	FROM TB_RESVE tr 
WHERE BOOK_SEQ ='47' AND USER_SEQ ='1' ;

SELECT *
	FROM TB_RESVE tr 
	WHERE BOOK_SEQ ='35';




UPDATE TB_RESVE SET RESVE_STEP = RESVE_STEP-1
WHERE RESVE_STEP  > 
			(SELECT RESVE_STEP 
				FROM TB_RESVE
				WHERE BOOK_SEQ ='35' AND USER_SEQ ='3');
			
DELETE FROM TB_RESVE
WHERE BOOK_SEQ ='35' AND USER_SEQ ='3';



SELECT U.USER_NAME AS user_name, B.BOOK_SEQ AS book_seq, B.BOOK_TITLE AS book_title, R.RESVE_SEQ, R.RESVE_STATUS, R.RESVE_STEP
FROM BOOK.TB_RESVE R
INNER JOIN BOOK.TB_USER U ON R.USER_SEQ = U.USER_SEQ
INNER JOIN BOOK.TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
AND RESVE_STATUS = 'Y';
				



SELECT
    U.USER_NAME AS user_name,
    B.BOOK_SEQ AS book_seq,
    B.BOOK_TITLE AS book_title,
    R.RESVE_SEQ,
    R.RESVE_STATUS,
    R.RESVE_STEP
FROM
    BOOK.TB_RESVE R
INNER JOIN
    BOOK.TB_USER U ON R.USER_SEQ = U.USER_SEQ
INNER JOIN
    BOOK.TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
WHERE
    U.USER_SEQ = 4
    AND R.RESVE_STATUS = 'Y'
ORDER BY
    R.RESVE_STEP;
   
SELECT
    U.USER_NAME AS user_name,
    B.BOOK_SEQ AS book_seq,
    B.BOOK_TITLE AS book_title,
    R.RESVE_SEQ,
    R.RESVE_STATUS,
    CASE
        WHEN R.RESVE_STEP IS NOT NULL THEN RANK() OVER (ORDER BY R.RESVE_STEP)
        ELSE NULL
    END AS RESVE_STEP
FROM BOOK.TB_RESVE R
INNER JOIN BOOK.TB_USER U ON R.USER_SEQ = U.USER_SEQ
INNER JOIN BOOK.TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
ORDER BY RESVE_STEP;
     AND RESVE_STEP = NULL
   
   
     
UPDATE TB_RESVE
SET RESVE_STATUS = 'N', RESVE_STEP = NULL
WHERE BOOK_SEQ = 100 AND RESVE_STATUS = 'Y' AND USER_SEQ =1;





--개인
SELECT
    U.USER_NAME AS user_name,
    B.BOOK_SEQ AS book_seq,
    B.BOOK_TITLE AS book_title,
    R.RESVE_SEQ,
    R.RESVE_STATUS,
    (SELECT COUNT(DISTINCT RESVE_STEP) FROM BOOK.TB_RESVE WHERE BOOK_SEQ = B.BOOK_SEQ AND RESVE_STEP IS NOT NULL AND RESVE_STEP <= R.RESVE_STEP) AS RESVE_STEP
FROM BOOK.TB_RESVE R
INNER JOIN BOOK.TB_USER U ON R.USER_SEQ = U.USER_SEQ
INNER JOIN BOOK.TB_BOOK B ON R.BOOK_SEQ = B.BOOK_SEQ
WHERE U.USER_SEQ = 10
ORDER BY RESVE_STEP;



INSERT INTO TB_RESVE
(RESVE_SEQ, USER_SEQ, BOOK_SEQ, RESVE_STEP, RESVE_STATUS)
SELECT
    SQ_RESVE.NEXTVAL,
    U.USER_SEQ,
    B.BOOK_SEQ,
    COALESCE((SELECT MAX(R2.RESVE_STEP) + 1
              FROM TB_RESVE R2
              WHERE R2.BOOK_SEQ = B.BOOK_SEQ AND R2.RESVE_STATUS = 'Y'
             ), 1), 
    'Y'
FROM
    TB_USER U
CROSS JOIN
    TB_BOOK B
WHERE
    U.USER_SEQ = 12
    AND B.BOOK_SEQ = 100;
    
   
UPDATE BOOK.TB_RESVE
SET RESVE_STATUS = 'R',
    RESVE_STEP = CASE
        WHEN RESVE_STEP = (SELECT MIN(RESVE_STEP) FROM BOOK.TB_RESVE WHERE BOOK_SEQ = 100 AND RESVE_STATUS = 'Y') THEN NULL
        ELSE RESVE_STEP
    END
WHERE BOOK_SEQ = 100 AND RESVE_STATUS = 'Y';



UPDATE BOOK.TB_RESVE
SET RESVE_STATUS = 'R',
    RESVE_STEP = CASE
        WHEN RESVE_STEP = (SELECT MIN(RESVE_STEP) FROM BOOK.TB_RESVE WHERE BOOK_SEQ = 100 AND RESVE_STATUS = 'Y') THEN NULL
        ELSE RESVE_STEP
    END
WHERE BOOK_SEQ = 100 AND RESVE_STEP = (SELECT MIN(RESVE_STEP) FROM BOOK.TB_RESVE WHERE BOOK_SEQ = 100 AND RESVE_STATUS = 'Y') AND RESVE_STATUS = 'Y';