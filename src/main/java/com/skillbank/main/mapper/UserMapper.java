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

    // 회원가입 시 이메일 중복 체크 추가
    @Select("SELECT * FROM user_account WHERE user_email = #{user_email}")
    UserAccountVO getUserByEmail(String user_email);

    @Insert("INSERT INTO user_account (user_pk, user_email, user_pw, user_name, user_gender, user_address, user_birth, user_phone, user_profile_img, user_nickname, user_hasPro) " +
            "VALUES (user_account_seq.nextval, #{user_email}, #{user_pw}, #{user_name}, #{user_gender}, #{user_address}, #{user_birth}, #{user_phone}, #{user_profile_img}, #{user_nickname}, 0)")
    int insertUser(UserAccountVO user);
}