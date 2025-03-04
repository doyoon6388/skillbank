package com.skillbank.main.mapper;

import com.skillbank.main.vo.UserAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
        @Select("select * from user_account where user_email=#{user_email} and user_pw = #{user_pw}")
        UserAccountVO loginValid(UserAccountVO userAccountVO);
}
