CREATE TABLE user_account
(
    user_pk          NUMBER PRIMARY KEY,                  -- 유저 고유번호
    user_email       VARCHAR2(100 char)  NOT NULL UNIQUE, -- 이메일 (유니크)
    user_pw          VARCHAR2(100 char)  NOT NULL,        -- 비밀번호
    user_name        varchar2(100 char)  not null,        -- 이름
    user_gender      VARCHAR2(2 char)    not null,        -- 성별 (선택 사항)
    user_address     varchar2(1000 char) not null,        -- 주소
    user_birth       DATE,                                -- 생일 (선택 사항)
    user_phone       VARCHAR2(20 char)   not null,        -- 전화번호 (선택 사항)
    user_profile_img VARCHAR2(1000 char),                 -- 프로필사진 경로 또는 URL (선택 사항)
    user_nickname    VARCHAR2(50 char),                   -- 닉네임 (선택 사항)
    user_hasPro      number(1)                            -- 프로 계정 유무
);

drop table user_account cascade constraints purge;

create sequence user_account_seq;

insert into user_account
values (user_account_seq.nextval, '00', '99', '이지우', '남', '금천', null, '01023232323', 'default.png', '쥬', 1);

    select *
from user_account;

DELETE
FROM user_account
WHERE user_pk = 92;

DELETE
FROM request
WHERE r_user_id = 65;


ALTER TABLE user_account
    MODIFY user_gender NULL;
ALTER TABLE user_account
    MODIFY user_address NULL;
ALTER TABLE user_account
    MODIFY user_birth NULL;
ALTER TABLE user_account
    MODIFY user_phone NULL;
ALTER TABLE user_account
    MODIFY user_profile_img NULL;

CREATE TABLE community_post
(
    commu_post_id       NUMBER PRIMARY KEY,          -- 게시글 (고유번호 PK)
    commu_post_category varchar2(100 char) not null,
    commu_user_id       NUMBER,                      -- 작성자 (user_account 테이블의 user_pk를 참조)
    commu_title         VARCHAR2(255)      NOT NULL, -- 제목
    commu_date          DATE DEFAULT sysdate,        -- 작성일자 (sysdate 사용)
    commu_content       CLOB,                        -- 내용
    commu_image         varchar2(500 char),
    CONSTRAINT fk_user_account FOREIGN KEY (commu_user_id) REFERENCES user_account (user_pk)
);

drop table community_post cascade constraints purge;
drop sequence community_post_seq;

create sequence community_post_seq;


insert into community_post
values (community_post_seq.nextval, 'askpro', 4, 'hellllllo', sysdate, 'asdasdddd', null);

select *
from community_post;

select count(*)
from community_post
where commu_post_category = 'together';


select *
from (select rownum as rn, a.*
      from (select * from community_post where commu_post_category = 'together' order by commu_date desc) a
      where rownum <= 3)
where rn >= 1;



alter table community_post
    add (
        commu_writer number(1) default 0,
        commu_like number default 0 not null
        );

ALTER TABLE community_post
    DROP COLUMN commu_tags;

ALTER TABLE community_post
    ADD commu_tags VARCHAR2(255 CHAR);

ALTER TABLE community_post
    DROP COLUMN commu_tags;

ALTER TABLE community_post
    MODIFY commu_image VARCHAR2(2000 CHAR);




create table pro_account
(
    pro_pk       NUMBER PRIMARY KEY,
    pro_category VARCHAR(100 CHAR) DEFAULT NULL,
    CONSTRAINT fk_pro_account_user FOREIGN KEY (pro_pk) REFERENCES user_account (user_pk)
);

select * from pro_account;

CREATE TABLE community_post_like
(
    post_id   NUMBER,
    user_id   NUMBER,
    like_date DATE DEFAULT sysdate,
    CONSTRAINT pk_post_like PRIMARY KEY (post_id, user_id),
    CONSTRAINT fk_post_like_post FOREIGN KEY (post_id) REFERENCES community_post (commu_post_id),
    CONSTRAINT fk_post_like_user FOREIGN KEY (user_id) REFERENCES user_account (user_pk)
);


select *
from community_post_like;

create table community_comment
(
    comment_id      number primary key,
    comment_post_id number,
    user_id         number,
    comment_content clob,
    comment_date    date default sysdate,
    constraint fk_comment_post foreign key (comment_post_id) references community_post (commu_post_id),
    constraint fk_comment_user foreign key (user_id) references user_account (user_pk)
);

create sequence community_comment_seq;

select *
from community_comment
ORDER BY comment_date DESC;

Alter table community_comment
    add (
        user_nickname varchar2(50 char) default 'asd'
        );

ALTER TABLE pro_account
    ADD (
        pro_profile_img VARCHAR2(100 CHAR),
        pro_cash NUMBER(11) DEFAULT 0
        );
ALTER TABLE pro_account
    ADD (
        pro_favorite number(6) default 0,
        pro_review NUMBER(6) DEFAULT 0
        );
ALTER TABLE pro_account
    ADD (
        pro_name varchar2(30 char) default 'hello'
        );
ALTER TABLE pro_account
    ADD (
        pro_address varchar2(1000 char) default null,
        pro_description varchar2(1000 char) default null
        );
ALTER TABLE pro_account
    ADD (
        pro_phone varchar2(20 char) default null
        );

select * from pro_account;

insert into pro_account
values (92, 'move', 'default.png', 0);
select *
from pro_account;
select *
from request;
/*
update pro_account set pro_*/

update pro_account
set pro_category = '청소'
where pro_pk = 4;

select *
from chat_room;

CREATE TABLE favorite_pro
(
    user_pk    INT NOT NULL,
    pro_pk     INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_pk, pro_pk),
    CONSTRAINT fk_favorite_user FOREIGN KEY (user_pk) REFERENCES user_account (user_pk) ON DELETE CASCADE,
    CONSTRAINT fk_favorite_pro FOREIGN KEY (pro_pk) REFERENCES pro_account (pro_pk) ON DELETE CASCADE
);

select *
from favorite_pro;

delete chat_room;

select *
from chat_room;

alter table chat_room
    add (
        chat_complete number(1) default 0
               );

select sessiontimezone, dbtimezone from dual;

select * from community_post_like;

create table review
(
    review_pk number(5) primary key,
    review_complete number(1) default 0,
    review_client number,
    review_pro number,
    review_category varchar2(100 char),
    review_title varchar2(100 char),
    review_txt clob,
    review_star number(2,1) default 0,
    CONSTRAINT fk_review_client FOREIGN KEY (review_client) REFERENCES user_account(user_pk) ON DELETE CASCADE,
    CONSTRAINT fk_review_pro FOREIGN KEY (review_pro) REFERENCES pro_account(pro_pk) ON DELETE CASCADE
);

select * from review;
delete review;
delete request;
delete response;
delete chat_room;
create sequence review_seq;

select * from request;



alter table review
    add (
        review_date DATE DEFAULT sysdate,
        review_file varchar2 (200 char) default 'defaultCommuImg.png'
        );