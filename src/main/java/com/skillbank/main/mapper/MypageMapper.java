package com.skillbank.main.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MypageMapper {

    @Update("update user_account set user_profile_img = #{user_profile_img} where user_pk = #{user_pk}")
    void updateClientProfile(String user_profile_img, int user_pk);
}
