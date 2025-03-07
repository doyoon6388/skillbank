CREATE TABLE user_account
(
    user_pk          NUMBER PRIMARY KEY,            -- 유저 고유번호
    user_email       VARCHAR2(100 char) NOT NULL UNIQUE, -- 이메일 (유니크)
    user_pw          VARCHAR2(100 char) NOT NULL,        -- 비밀번호
    user_name        varchar2(100 char) not null,
    user_gender      VARCHAR2(2 char) not null, -- 성별 (선택 사항)
    user_address     varchar2(1000 char) not null,
    user_birth       DATE,                          -- 생일 (선택 사항)
    user_phone       VARCHAR2(20 char) not null,                  -- 전화번호 (선택 사항)
    user_profile_img VARCHAR2(1000 char) ,                 -- 프로필사진 경로 또는 URL (선택 사항)
    user_nickname    VARCHAR2(50 char),                   -- 닉네임 (선택 사항)
    user_hasPro      number(1)                      --
);

drop table user_account cascade constraints purge;

create sequence user_account_seq;

insert into user_account values (user_account_seq.nextval, '11', '22', '홍승완','남', '상도동',sysdate, '01023232323', null, null,0);

select *
from user_account;

CREATE TABLE request (
                         request_no NUMBER PRIMARY KEY,
                         r_user_id NUMBER(5) NOT NULL,
                         request_type NUMBER(3) NOT NULL,  -- 1: 이사, 2: 청소, 3: 폐기물 처리
                         request1 VARCHAR2(200 CHAR),
                         request2 VARCHAR2(200 CHAR),
                         request3 VARCHAR2(200 CHAR),
                         request4 VARCHAR2(200 CHAR),
                         request5 VARCHAR2(200 CHAR),
                         request6 VARCHAR2(200 CHAR),
                         request7 VARCHAR2(200 CHAR),
                         request8 VARCHAR2(200 CHAR),
                         request9 VARCHAR2(200 CHAR),
                         request10 VARCHAR2(200 CHAR),
                         request11 VARCHAR2(200 CHAR),
                         request12 VARCHAR2(200 CHAR),
                         request13 VARCHAR2(200 CHAR),
                         request14 VARCHAR2(200 CHAR),
                         CONSTRAINT fk_request_user FOREIGN KEY (r_user_id) REFERENCES user_account(user_pk)
);

create sequence request_no_seq;

select * from request;

delete request where request_no=5;


