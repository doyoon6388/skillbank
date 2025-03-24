package com.skillbank.main.mapper;

import com.skillbank.main.vo.ReviewVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ReviewMapper {

    @Insert("insert into review values(review_seq.nextval, 0, #{review_client}, #{review_pro}, null, null, null, 0)")
    int createReview(ReviewVO reviewVO);

    @Select("select * from review where review_client = #{review_client} and review_pro = #{review_pro}")
    ReviewVO getReview(ReviewVO reviewVO);
}
