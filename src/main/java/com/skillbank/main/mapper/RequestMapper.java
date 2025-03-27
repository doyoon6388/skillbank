package com.skillbank.main.mapper;

import com.skillbank.main.vo.*;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RequestMapper {
    @Insert("insert into request values (request_no_seq.nextval, #{r_user_id}, #{request_type}, sysdate, #{request1}, #{request2}, #{request3}, #{request4}, #{request5}, #{request6}, #{request7}, #{request8}, #{request9}, #{request10}, #{request11}, #{request12}, #{request13}, #{request14}, #{r_pro_pk}, 0)" )
    int requestReg(ReqeustVO reqeustVO);

    @Select("SELECT distinct r.*, res.r_request_no FROM request r FULL OUTER JOIN response res ON r.request_no = res.r_request_no WHERE r.r_user_id = #{r_user_id)} order by r.r_pro_pk desc")
    List<ReqeustVO> requestList(int id);

    //    @Select("select * from request where r_user_id = #{id}")
    @Select("select * from request where request_no = #{pk}")
    ReqeustVO getDetail(int pk);

    @Delete("delete request where request_no = #{pk}")
    int requestDelete(int pk);

    @Select("SELECT r.*, u.user_profile_img, u.user_nickname FROM request r JOIN user_account u ON r.r_user_id = u.user_pk WHERE r.request_type = #{pro_category} AND r.request_no NOT IN (SELECT r_request_no FROM response WHERE r_pro_pk = #{pro_pk}) order by r.r_pro_pk desc")
    List<ProRequestVO> proRequest(ProAccountVO proAccountVO);

    @Insert("insert into response values (r_no_seq.nextval, #{r_price_type},#{r_price} ,#{r_comment}, #{r_request_no}, #{r_pro_pk})")
    int requestSend(RequestSendVO requestSendVO);

    @Select("select r.*, u.user_profile_img, u.user_nickname from request r join user_account u on r.r_user_id = u.user_pk where r.request_no = #{request_no}")
    ProRequestVO proRequestDetail(int no);


    @Select("SELECT r.* , p.* FROM pro_account p FULL OUTER JOIN response r ON  p.pro_pk = r.r_pro_pk WHERE r.r_request_no = #{no} ")

/*
    @Select("SELECT r.*, p.pro_category FROM response r JOIN pro_account p ON r.r_pro_pk = p.pro_pk ")
*/
    List<ProResponseVO> proResponse(int no);

    @Select("SELECT r.* , p.* FROM pro_account p FULL OUTER JOIN response r ON  p.pro_pk = r.r_pro_pk WHERE r.r_no = #{no} ")
    ProResponseVO proResponseDetail(int no);
}
