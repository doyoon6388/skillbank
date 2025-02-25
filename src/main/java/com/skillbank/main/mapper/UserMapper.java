package com.skillbank.main.mapper;

import com.skillbank.main.vo.UserTestVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
        @Select("select * from user_test_db where username = #{username} and password = #{password}")
        UserTestVO loginValid(UserTestVO userTestVO);
}
