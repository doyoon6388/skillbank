package com.skillbank.main.mapper;

import com.skillbank.main.vo.ReviewVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface ReviewMapper {

    @Insert("insert into review values(review_seq.nextval, 0, #{review_client}, #{review_pro}, null, null, null, 0)")
    int createReview(ReviewVO reviewVO);

    @Select("select * from review where review_client = #{review_client} and review_pro = #{review_pro}")
    ReviewVO getReview(ReviewVO reviewVO);

    @Update("update request set r_complete = 1 where request_no = #{chatReqNo}")
    void completeRequest(int chatReqNo);

    @Update("update chat_room set chat_complete = 1 where chat_req_no = #{chatReqNo}")
    void completeChat(int chatReqNo);

    @Select("select * from review where review_client = #{user_pk} and review_complete = 0")
    List<ReviewVO> incompleteReviewList(int user_pk);

    @Select("select * from review where review_client = #{user_pk} and review_complete = 1")
    List<ReviewVO> completeReviewList(int user_pk);

    @Select("select * from review where review_pk = #{reviewPk}")
    ReviewVO getReviewByPk(int reviewPk);

    @Update("update review set review_title = #{review_title}, review_complete = #{review_complete}, review_txt = #{review_txt}, review_star = #{review_star}, review_category = #{review_category}, review_file = #{review_file}, review_date = sysdate WHERE review_pk = #{review_pk}")
    int updateReview(ReviewVO reviewVO);
}
