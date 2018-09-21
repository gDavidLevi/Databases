```sql
create database mysqldb;
use mysqldb;

CREATE USER david IDENTIFIED BY 'david'; 
grant usage on *.* to david@localhost identified by 'david';
grant all privileges on mysqldb.* to david@localhost;

CREATE TABLE comments (
        id INT NOT NULL AUTO_INCREMENT,
        MYUSER VARCHAR(30) NOT NULL,
        EMAIL VARCHAR(30),
        WEBPAGE VARCHAR(100) NOT NULL,
        DATUM DATE NOT NULL,
        SUMMARY VARCHAR(40) NOT NULL,
        COMMENTS VARCHAR(400) NOT NULL,
        PRIMARY KEY (ID)
    );

INSERT INTO comments values (default, 'David', 'gDavidLevy@gmail.com','https://davidlevi.ru', '2018-09-18 10:33:11', 'Summary','My first comment' );








``` 