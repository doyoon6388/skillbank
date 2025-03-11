package com.skillbank.main.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MypageMapper {

    @Update("update user_account set user_profile_img = #{user_profile_img} where user_pk = #{user_pk}")
    void updateUserProfile(String user_profile_img, int user_pk);

    @Update("update pro_account set pro_profile_img = #{pro_profile_img} where pro_pk = #{pro_pk}")
    void updateProProfile(String pro_profile_img, int pro_pk);

}
