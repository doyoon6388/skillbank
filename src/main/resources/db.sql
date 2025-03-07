CREATE TABLE user_account
(
    user_pk          NUMBER PRIMARY KEY,                 -- 유저 고유번호
    user_email       VARCHAR2(100 char) NOT NULL UNIQUE, -- 이메일 (유니크)
    user_pw          VARCHAR2(100 char) NOT NULL,        -- 비밀번호
    user_name        varchar2(100 char) not null,        -- 이름
    user_gender      VARCHAR2(2 char) not null,          -- 성별 (선택 사항)
    user_address     varchar2(1000 char) not null,       -- 주소
    user_birth       DATE,                               -- 생일 (선택 사항)
    user_phone       VARCHAR2(20 char) not null,         -- 전화번호 (선택 사항)
    user_profile_img VARCHAR2(1000 char),                -- 프로필사진 경로 또는 URL (선택 사항)
    user_nickname    VARCHAR2(50 char),                  -- 닉네임 (선택 사항)
    user_hasPro      number(1)                           -- 프로 계정 유무
);

drop table user_account cascade constraints purge;

create sequence user_account_seq;

insert into user_account
values (user_account_seq.nextval, '11', '22', '홍승완', '남', '상도동', sysdate, '01023232323', null, null, 0);

select *
from user_account;

ALTER TABLE user_account MODIFY user_gender NULL;
ALTER TABLE user_account MODIFY user_address NULL;
ALTER TABLE user_account MODIFY user_birth NULL;
ALTER TABLE user_account MODIFY user_phone NULL;
ALTER TABLE user_account MODIFY user_profile_img NULL;

CREATE TABLE community_post
(
    commu_post_id      NUMBER PRIMARY KEY,     -- 게시글 (고유번호 PK)
    commu_post_category varchar2(100 char) not null,
    commu_user_id      NUMBER,                 -- 작성자 (user_account 테이블의 user_pk를 참조)
    commu_title        VARCHAR2(255) NOT NULL, -- 제목
    commu_date           DATE DEFAULT sysdate,   -- 작성일자 (sysdate 사용)
    commu_content         CLOB,                   -- 내용
    commu_image         varchar2(500 char),
    CONSTRAINT fk_user_account
        FOREIGN KEY (commu_user_id) REFERENCES user_account (user_pk)
);

drop table community_post cascade constraints purge;

create sequence community_post_seq;


insert into community_post values (community_post_seq.nextval,'askpro',4,'hellllllo',sysdate,'asdasdddd',null);

select * from community_post;
