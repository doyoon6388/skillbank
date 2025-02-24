CREATE TABLE user_test_db (
                        id number(5) PRIMARY KEY,
                        username VARCHAR2(50) NOT NULL,
                        password VARCHAR2(255) NOT NULL,
                        email VARCHAR2(100)
);
create sequence user_test_db_seq;

insert into user_test_db values (user_test_db_seq.nextval, '11','22','asd@asd.com');

select * from user_test_db;

commit;


