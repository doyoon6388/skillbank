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

delete from user_test_db;



-- 테스트용 테이블 및 시퀀스 (필요한 경우)
CREATE TABLE user_test_db (
                              id NUMBER(5) PRIMARY KEY,
                              username VARCHAR2(50) NOT NULL,
                              password VARCHAR2(255) NOT NULL,
                              email VARCHAR2(100)
);

CREATE SEQUENCE user_test_db_seq;

INSERT INTO user_test_db
VALUES (user_test_db_seq.NEXTVAL, '11', '22', 'asd@asd.com');

SELECT * FROM user_test_db;

COMMIT;

delete
from community_image;
DROP TABLE community_image CASCADE CONSTRAINTS;
------------------------------
-- 1. 사용자 관련 테이블
------------------------------
CREATE TABLE user_account (
                              user_pk         NUMBER PRIMARY KEY,                          -- 유저 고유번호
                              user_email      VARCHAR2(100) NOT NULL UNIQUE,               -- 이메일 (유니크)
                              user_pw         VARCHAR2(100) NOT NULL,                      -- 비밀번호
                              user_gender     VARCHAR2(10),                                -- 성별 (선택 사항)
                              user_birth      DATE,                                        -- 생일 (선택 사항)
                              user_phone      VARCHAR2(20),                                -- 전화번호 (선택 사항)
                              user_profile_img VARCHAR2(200),                              -- 프로필사진 경로 또는 URL (선택 사항)
                              user_nickname   VARCHAR2(50)                                 -- 닉네임 (선택 사항)
);

------------------------------
-- 2. 리뷰 관련 테이블
------------------------------
-- 리뷰 정보를 담는 테이블
CREATE TABLE review_info (
                             review_no       NUMBER PRIMARY KEY,                          -- 리뷰 넘버 (PK)
                             service_no      NUMBER NOT NULL,                             -- 리뷰한 서비스 번호 (셀러 서비스 테이블 참조)
                             review_nickname VARCHAR2(50),                                -- 리뷰 작성자 닉네임
                             review_date     DATE DEFAULT SYSDATE,                        -- 리뷰 작성일자 (기본값 현재날짜)
                             review_title    VARCHAR2(200),                               -- 리뷰 제목
                             review_content  CLOB,                                        -- 리뷰 내용 (긴 텍스트)
                             review_star     NUMBER(2,1),                                 -- 별점 (예: 4.5)
                             CONSTRAINT fk_review_info_service FOREIGN KEY (service_no)
                                 REFERENCES seller_service_info(service_no)
);

-- 리뷰에 첨부된 이미지
CREATE TABLE review_image (
                              review_no   NUMBER,                                           -- 해당 리뷰 번호 (FK)
                              image_id    NUMBER,                                           -- 이미지 구분번호 (리뷰당 여러 이미지)
                              image       VARCHAR2(200),                                             -- 이미지 데이터 (또는 이미지 URL 등)
                              PRIMARY KEY (review_no, image_id),
                              CONSTRAINT fk_review_image_info FOREIGN KEY (review_no)
                                  REFERENCES review_info(review_no)
);

------------------------------
-- 3. 예약 관련 테이블
------------------------------
-- 예약 정보를 담는 테이블
CREATE TABLE reservation_info (
                                  reservation_no   NUMBER PRIMARY KEY,                        -- 예약 넘버 (PK)
                                  service_no       NUMBER NOT NULL,                           -- 예약한 서비스 번호 (셀러 서비스 테이블 참조)
                                  reserved_nickname VARCHAR2(50),                            -- 예약한 사용자의 닉네임
                                  reserved_id      VARCHAR2(50),                             -- 예약한 사용자의 아이디
                                  user_pk          NUMBER NOT NULL,                           -- 예약한 유저의 user_account 참조
                                  reservation_date DATE DEFAULT SYSDATE,                      -- 예약 일자
                                  CONSTRAINT fk_reservation_info_service FOREIGN KEY (service_no)
                                      REFERENCES seller_service_info(service_no),
                                  CONSTRAINT fk_reservation_info_user FOREIGN KEY (user_pk)
                                      REFERENCES user_account(user_pk)
);

-- 예약한 서비스의 사진 (한 예약에 여러 이미지가 있을 수 있으므로 복합 PK 사용)
CREATE TABLE reservation_image (
                                   reservation_no NUMBER,                                       -- 예약 번호 (FK)
                                   image_id       NUMBER,                                       -- 이미지 식별자
                                   image          VARCHAR2(200),                                         -- 이미지 데이터
                                   PRIMARY KEY (reservation_no, image_id),
                                   CONSTRAINT fk_reservation_image_info FOREIGN KEY (reservation_no)
                                       REFERENCES reservation_info(reservation_no)
);

------------------------------
-- 4. 커뮤니티 관련 테이블
------------------------------
-- 커뮤니티 정보를 카테고리와 게시글 정보를 한 테이블에 저장 (복합키 사용)
CREATE TABLE community_info (
                                category_no     NUMBER,                                     -- 커뮤니티 카테고리 번호
                                category_name   VARCHAR2(100),                              -- 카테고리 이름
                                post_no         NUMBER,                                     -- 게시글 번호
                                post_nickname   VARCHAR2(50),                               -- 게시글 작성자 닉네임
                                post_title      VARCHAR2(200),                              -- 게시글 제목
                                post_content    CLOB,                                       -- 게시글 내용
                                post_upload_date DATE DEFAULT SYSDATE,                     -- 업로드 일자
                                PRIMARY KEY (category_no, post_no)
);

-- 커뮤니티 게시글 이미지 (커뮤니티 글과 1:1 혹은 1:N 관계로 조정 가능)
CREATE TABLE community_image (
                                 category_no NUMBER,                                       -- 커뮤니티 카테고리 번호 (community_info와 일치)
                                 post_no     NUMBER,                                       -- 게시글 번호 (community_info와 일치)
                                 image       VARCHAR2(200),                                         -- 이미지 데이터
                                 PRIMARY KEY (category_no, post_no),
                                 CONSTRAINT fk_community_image_info FOREIGN KEY (category_no, post_no)
                                     REFERENCES community_info(category_no, post_no)
);

------------------------------
-- 5. 셀러 관련 테이블
------------------------------
-- 셀러 계정 정보
CREATE TABLE seller_account (
                                seller_pk              NUMBER PRIMARY KEY,                 -- 셀러 고유번호
                                seller_email           VARCHAR2(100) NOT NULL UNIQUE,       -- 이메일 (유니크)
                                seller_id              VARCHAR2(50) NOT NULL UNIQUE,        -- 로그인 아이디 (유니크)
                                seller_pw              VARCHAR2(100) NOT NULL,              -- 비밀번호
                                seller_gender          VARCHAR2(10),                        -- 성별
                                seller_birth           DATE,                                -- 생일
                                seller_phone           VARCHAR2(20),                        -- 전화번호
                                seller_profile_img     VARCHAR2(200),                       -- 프로필사진 경로 또는 URL
                                seller_nickname        VARCHAR2(50),                        -- 닉네임
                                seller_company_address VARCHAR2(200),                       -- 업체 주소
                                seller_company_phone   VARCHAR2(20),                        -- 업체 전화번호
                                seller_cash            NUMBER(12,2) DEFAULT 0               -- 보유 캐시
);

-- 셀러가 제공하는 서비스 정보
CREATE TABLE seller_service_info (
                                     service_no       NUMBER PRIMARY KEY,                       -- 서비스 고유번호 (PK)
                                     seller_pk        NUMBER NOT NULL,                          -- 셀러 계정 (FK)
                                     service_category VARCHAR2(50),                             -- 서비스 카테고리
                                     service_title    VARCHAR2(200),                            -- 서비스 제목
                                     service_content  CLOB,                                     -- 서비스 내용 텍스트
                                     service_QA       CLOB,                                     -- 서비스 관련 Q&A 내용
                                     CONSTRAINT fk_seller_service_info_seller FOREIGN KEY (seller_pk)
                                         REFERENCES seller_account(seller_pk)
);

-- 셀러 서비스에 첨부된 이미지
CREATE TABLE seller_service_image (
                                      service_no NUMBER PRIMARY KEY,                           -- 서비스 고유번호 (FK)
                                      image      VARCHAR2(200),                                         -- 이미지 데이터
                                      CONSTRAINT fk_seller_service_image_info FOREIGN KEY (service_no)
                                          REFERENCES seller_service_info(service_no)
);


------------------------------
-- 0. 테스트용 테이블 (user_test_db)
------------------------------
-- 기존 테스트용 테이블에, 이메일이 asd@asd.com이면 패스워드는 "asd"로 설정
INSERT INTO user_test_db
VALUES (user_test_db_seq.NEXTVAL, '11', 'asd', 'asd@asd.com');

------------------------------
-- 1. 사용자 관련 테이블 (user_account)
------------------------------
-- 이메일의 '@' 앞부분을 패스워드로 사용
INSERT INTO user_account
VALUES (1, 'taro@example.jp', 'taro', '男', TO_DATE('1980-01-01','YYYY-MM-DD'), '090-1111-2222', 'profile1.jpg', 'たろう');

INSERT INTO user_account
VALUES (2, 'hanako@example.jp', 'hanako', '女', TO_DATE('1990-05-10','YYYY-MM-DD'), '090-3333-4444', 'profile2.jpg', 'はなこ');

INSERT INTO user_account
VALUES (3, 'jiro@example.jp', 'jiro', '男', TO_DATE('1985-03-15','YYYY-MM-DD'), '090-5555-6666', 'profile3.jpg', 'じろう');

select * from user_account;
------------------------------
-- 5. 셀러 관련 테이블 (seller_account)
------------------------------
-- 셀러 이메일에서 '@' 앞부분을 패스워드로 사용
INSERT INTO seller_account
VALUES (1, 'seller1@example.jp', 'seller1', 'seller1', '男', TO_DATE('1975-06-20','YYYY-MM-DD'), '080-1111-2222', 'seller1.jpg', 'セラー太郎', '東京都中央区', '03-1234-5678', 10000.00);

INSERT INTO seller_account
VALUES (2, 'seller2@example.jp', 'seller2', 'seller2', '女', TO_DATE('1980-08-15','YYYY-MM-DD'), '080-3333-4444', 'seller2.jpg', 'セラー花子', '大阪市北区', '06-2345-6789', 20000.00);

INSERT INTO seller_account
VALUES (3, 'seller3@example.jp', 'seller3', 'seller3', '男', TO_DATE('1978-12-30','YYYY-MM-DD'), '080-5555-6666', 'seller3.jpg', 'セラー次郎', '名古屋市中区', '052-3456-7890', 15000.00);

------------------------------
-- 5. 셀러 서비스 테이블 (seller_service_info)
------------------------------
INSERT INTO seller_service_info
VALUES (1, 1, '美容', 'ヘアカットサービス', 'プロフェッショナルなカットを提供します。', '予約は電話で受け付けます。');

INSERT INTO seller_service_info
VALUES (2, 2, '健康', 'マッサージサービス', 'リラックスできるマッサージを提供します。', '事前予約が必要です。');

INSERT INTO seller_service_info
VALUES (3, 3, '料理', '寿司教室', '本格的な寿司の作り方を学べます。', '材料費は受講者負担です。');

------------------------------
-- 5. 셀러 서비스 이미지 테이블 (seller_service_image)
------------------------------
-- 2. 리뷰 관련 테이블 (review_info)
------------------------------
INSERT INTO review_info
VALUES (1, 1, 'たろう', SYSDATE, '素晴らしいカット', 'とても満足しています。', 4.5);

INSERT INTO review_info
VALUES (2, 2, 'はなこ', SYSDATE, 'リラックスできました', '癒されるマッサージでした。', 5.0);

INSERT INTO review_info
VALUES (3, 3, 'じろう', SYSDATE, '楽しい教室', '学びが多く、とても良かったです。', 4.0);

------------------------------
------------------------------
-- 3. 예약 관련 테이블 (reservation_info)
------------------------------
INSERT INTO reservation_info
VALUES (1, 1, 'たろう', 'たろう予約', 1, SYSDATE);

INSERT INTO reservation_info
VALUES (2, 2, 'はなこ', 'はなこ予約', 2, SYSDATE);

INSERT INTO reservation_info
VALUES (3, 3, 'じろう', 'じろう予約', 3, SYSDATE);

------------------------------
------------------------------
-- 4. 커뮤니티 관련 테이블 (community_info)
------------------------------
INSERT INTO community_info
VALUES (1, 'ニュース', 1, 'たろう', '最新ニュース', '今日は良い天気です。', SYSDATE);

INSERT INTO community_info
VALUES (2, '趣味', 1, 'はなこ', '趣味の紹介', '私の趣味は読書です。', SYSDATE);

INSERT INTO community_info
VALUES (3, '旅行', 1, 'じろう', '旅行記', '美しい景色を楽しみました。', SYSDATE);

-----------------------------
-----------------------------------------------------------
-- 1. 리뷰 이미지 테이블
ALTER TABLE review_image MODIFY (image VARCHAR2(200));

-- 2. 예약 이미지 테이블
ALTER TABLE reservation_image MODIFY (image VARCHAR2(200));

-- 3. 커뮤니티 이미지 테이블
ALTER TABLE community_image MODIFY (image VARCHAR2(200));

-- 4. 셀러 서비스 이미지 테이블
ALTER TABLE seller_service_image MODIFY (image VARCHAR2(200));



-- 1. review_image 테이블 (리뷰 이미지)
INSERT INTO review_image (review_no, image_id, image)
VALUES (1, 1, 'abc.jpg');

INSERT INTO review_image (review_no, image_id, image)
VALUES (1, 2, '123.jpg');

INSERT INTO review_image (review_no, image_id, image)
VALUES (1, 3, 'xyz.jpg');

--------------------------------------------------
-- 2. reservation_image 테이블 (예약 이미지)
INSERT INTO reservation_image (reservation_no, image_id, image)
VALUES (1, 1, 'abc.jpg');

INSERT INTO reservation_image (reservation_no, image_id, image)
VALUES (1, 2, '123.jpg');

INSERT INTO reservation_image (reservation_no, image_id, image)
VALUES (1, 3, 'xyz.jpg');

--------------------------------------------------
-- 3. community_image 테이블 (커뮤니티 이미지)
INSERT INTO community_image (category_no, post_no, image)
VALUES (1, 1, 'abc.jpg');

INSERT INTO community_image (category_no, post_no, image)
VALUES (2, 1, '123.jpg');

INSERT INTO community_image (category_no, post_no, image)
VALUES (3, 1, 'xyz.jpg');

--------------------------------------------------
-- 4. seller_service_image 테이블 (셀러 서비스 이미지)
INSERT INTO seller_service_image (service_no, image)
VALUES (1, 'abc.jpg');

INSERT INTO seller_service_image (service_no, image)
VALUES (2, '123.jpg');

INSERT INTO seller_service_image (service_no, image)
VALUES (3, 'xyz.jpg');


