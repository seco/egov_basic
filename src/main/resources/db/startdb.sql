CREATE MEMORY TABLE LOGIN(NUM VARCHAR(16) NOT NULL PRIMARY KEY, ID VARCHAR(16) NOT NULL, IP VARCHAR(15) NOT NULL, LOGIN_DATE DATE NOT NULL, LOGOUT_DATE DATE )

CREATE MEMORY TABLE USER_JOIN(ID VARCHAR(16) NOT NULL, PASSWORD VARCHAR(20) NOT NULL, NAME VARCHAR(20), MAIL VARCHAR(30), CREATE_DATE DATE, MODIFY_DATE DATE )

CREATE MEMORY TABLE USER_IDS(TABLE_NAME VARCHAR(16) NOT NULL PRIMARY KEY,NEXT_ID DECIMAL(30) NOT NULL)