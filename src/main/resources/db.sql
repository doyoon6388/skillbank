CREATE TABLE user_account
(
    user_pk          NUMBER PRIMARY KEY,                  -- 유저 고유번호
    user_email       VARCHAR2(100 char)  NOT NULL UNIQUE, -- 이메일 (유니크)
    user_pw          VARCHAR2(100 char)  NOT NULL,        -- 비밀번호
    user_name        varchar2(100 char)  not null,
    user_gender      VARCHAR2(2 char)    not null,        -- 성별 (선택 사항)
    user_address     varchar2(1000 char) not null,
    user_birth       DATE,                                -- 생일 (선택 사항)
    user_phone       VARCHAR2(20 char)   not null,        -- 전화번호 (선택 사항)
    user_profile_img VARCHAR2(1000 char),                 -- 프로필사진 경로 또는 URL (선택 사항)
    user_nickname    VARCHAR2(50 char),                   -- 닉네임 (선택 사항)
    user_hasPro      number(1)                            --
);

drop table user_account cascade constraints purge;

create sequence user_account_seq;

insert into user_account
values (user_account_seq.nextval, '11', '22', '홍승완', '남', '상도동', sysdate, '01023232323', null, null, 0);

select *
from user_account;