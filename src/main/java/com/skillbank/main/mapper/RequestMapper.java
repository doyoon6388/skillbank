package com.skillbank.main.mapper;

import com.skillbank.main.vo.ReqeustVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RequestMapper {
    @Insert("insert into request (request_no, r_user_id, request_type, request1, request2, request3, request4, request5, request6, request7) values (request_no_seq.nextval, #{r_user_id}, #{request_type}, #{request1}, #{request2}, #{request3}, #{request4}, #{request5}, #{request6}, #{request7})" )
    int requestReg(ReqeustVO reqeustVO);
}
