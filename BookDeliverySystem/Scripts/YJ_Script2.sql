INSERT INTO TB_USER
(USER_SEQ,USER_EMAIL,USER_PASSWORD,USER_NAME,USER_PHONE,USER_BIRTH,
USER_AUTH,USER_DELFLAG,JOINDATE,USER_GENDER)
VALUES ('57','test55@test.com','440138','김영진','010-1111-3333','1992-10-26',
		'U','N',SYSDATE,'M');
		
CREATE SEQUENCE SQ_USER START WITH 60 INCREMENT BY 1;

SELECT *
	FROM TB_BOOK
	WHERE BOOK_SEQ = '1';
	


CREATE SEQUENCE SQ_BOOK START WITH 200 INCREMENT BY 1;