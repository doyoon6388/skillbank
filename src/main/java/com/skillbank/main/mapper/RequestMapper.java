package com.skillbank.main.mapper;

import com.skillbank.main.vo.ProRequestVO;
import com.skillbank.main.vo.ReqeustVO;
import com.skillbank.main.vo.RequestSendVO;
import com.skillbank.main.vo.UserAccountVO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RequestMapper {
    @Insert("insert into request values (request_no_seq.nextval, #{r_user_id}, #{request_type}, sysdate, #{request1}, #{request2}, #{request3}, #{request4}, #{request5}, #{request6}, #{request7}, #{request8}, #{request9}, #{request10}, #{request11}, #{request12}, #{request13}, #{request14})" )
    int requestReg(ReqeustVO reqeustVO);

    @Select("select r.*, u.user_nickname from request r, user_account u where r.R_USER_ID = u.USER_PK and r_user_id=#{r_user_id}")
    List<ReqeustVO> requestList(int id);

    @Select("select * from request where request_no = #{pk}")
    ReqeustVO getDetail(int pk);

    @Delete("delete request where request_no = #{pk}")
    int requestDelete(int pk);

    @Select("select r.request_no , r.request_type, u.user_profile_img, u.user_nickname, r.request1, r.request2,r.request3 ,r.request4, r.request5, r.request6, r.request7, r.request8, r.request9, r.request10, r.request11, r.request12, r.request13, r.request14 from request r join user_account u on r.r_user_id = u.user_pk")
    List<ProRequestVO> proRequest();

    @Insert("insert into response values (r_no_seq.nextval, #{r_price_type},#{r_price} ,#{r_comment}, #{r_file}, #{r_request_no}, #{r_user_id})")
    int requestSend(RequestSendVO requestSendVO);

    @Select("select r.request_no , r.request_type, u.user_profile_img, u.user_nickname, r.request1, r.request2,r.request3 ,r.request4, r.request5, r.request6, r.request7, r.request8, r.request9, r.request10, r.request11, r.request12, r.request13, r.request14 from request r join user_account u on r.r_user_id = u.user_pk where r.request_no = #{request_no}")
    ProRequestVO proRequestDetail(int no);
}
