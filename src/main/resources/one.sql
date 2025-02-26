CREATE TABLE user_test_db (
                        id number(5) PRIMARY KEY,
                        username VARCHAR2(50) NOT NULL,
                        password VARCHAR2(255) NOT NULL,
                        email VARCHAR2(100) not null,
                        hasPro number(1) default 0
);
create sequence user_test_db_seq;

drop table user_test_db cascade constraints purge;

insert into user_test_db values (user_test_db_seq.nextval, '11','22','asd@asd.com',default);

select * from user_test_db;

commit;


