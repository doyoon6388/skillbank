package com.skillbank.main.mapper;

import com.skillbank.main.vo.ProAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface FindProMapper {

    @Select({
            "<script>",
            "SELECT * FROM pro_account",
            "<if test='category != null and category != \"category_all\"'>",
            "WHERE pro_category = #{category}",
            "</if>",
            "ORDER BY ",  // 끝에 공백 추가
            "<choose>",
            "<when test='sort == \"review\"'>pro_review</when>",
            "<when test='sort == \"favorite\"'>pro_favorite</when>",
            "<otherwise>pro_review</otherwise>",
            "</choose> ",
            "DESC",      // 앞에 공백 추가 또는 이전 문자열에 포함
            "</script>"
    })
      List<ProAccountVO> selectPros(@Param("category") String category, @Param("sort") String sort);

    @Select("select * from pro_account where pro_pk = #{pro_pk}")
    ProAccountVO getDetail(int pro_pk);
}
