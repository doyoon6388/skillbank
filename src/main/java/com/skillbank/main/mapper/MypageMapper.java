package com.skillbank.main.mapper;

import com.skillbank.main.vo.UserAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MypageMapper {

    @Update("update user_account set user_profile_img = #{user_profile_img} where user_pk = #{user_pk}")
    void updateClientProfile(String user_profile_img, int user_pk);

    @Update({
            "<script>",
            "UPDATE user_account",
            "<set>",
            "<if test='field == \"user_birth\"'> user_birth = #{value}</if>",
            "<if test='field != \"user_birth\"'> ${field} = #{value}</if>",
            "</set>",
            "WHERE user_pk = #{user_pk}",
            "</script>"
    })
    boolean updateUserInfo(@Param("user_pk") int user_pk, @Param("field") String field, @Param("value") Object value);


    @Update("update pro_account set pro_profile_img = #{pro_profile_img} where pro_pk = #{pro_pk}")
    void updateProProfile(String pro_profile_img, int pro_pk);

}
