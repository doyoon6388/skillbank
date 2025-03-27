package com.skillbank.main.mapper;

import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.UserAccountVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserMapper {

    // 로그인 검증 (기존 코드 유지)
    @Select("SELECT * FROM user_account WHERE user_email = #{user_email} AND user_pw = #{user_pw}")
    UserAccountVO loginValid(UserAccountVO userAccountVO);

    // ✅ 이메일 중복 체크
    @Select("SELECT count(*) FROM user_account WHERE user_email = #{user_email}")
    int getUserByEmail(String user_email);

    // ✅ 닉네임 중복 체크
    @Select("SELECT count(*) FROM user_account WHERE user_nickname = #{user_nickname}")
    int getUserByNickname(String user_nickname);

    @Insert("INSERT INTO user_account (user_pk, user_email, user_pw, user_name, user_nickname, user_hasPro, " +
            "user_gender, user_address, user_birth, user_phone, user_profile_img) " +
            "VALUES (user_account_seq.nextval, #{user_email}, #{user_pw}, #{user_name}, #{user_nickname}, #{user_hasPro}, " +
            "NULL, NULL, NULL, NULL, 'default.png')")
    void insertUser(UserAccountVO user);

    @Select("select count(*) from pro_account where pro_pk = #{user_pk}")
    int proCheck(UserAccountVO userAccountVO);

    @Insert("insert into pro_account values(#{pro_pk}, #{pro_category}, 'default.png', 490, 0, 0, #{pro_name}, '住所　編集', '紹介欄　編集', #{pro_phone})")
    void makeProAccount(ProAccountVO proAccountVO);

    @Update("update user_account set user_haspro = 1 where user_pk = #{pro_pk}")
    void makeHasProOne(ProAccountVO proAccountVO);

    @Select("select * from pro_account where pro_pk = #{pk}")
    ProAccountVO makeProSession(int pk);
}