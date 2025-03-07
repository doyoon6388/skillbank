package com.skillbank.main.mapper;

import com.skillbank.main.vo.UserAccountVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

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
            "NULL, NULL, NULL, NULL, NULL)")
    void insertUser(UserAccountVO user);
}