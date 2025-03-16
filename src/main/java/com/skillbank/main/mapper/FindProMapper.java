package com.skillbank.main.mapper;

import com.skillbank.main.vo.FavoriteProVO;
import com.skillbank.main.vo.ProAccountVO;
import org.apache.ibatis.annotations.*;

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

    @Select("SELECT * FROM favorite_pro WHERE user_pk = #{user_pk} AND pro_pk = #{pro_pk}")
    FavoriteProVO selectFavorite(int user_pk, int pro_pk);
    @Delete("DELETE FROM favorite_pro WHERE user_pk = #{user_pk} AND pro_pk = #{pro_pk}")
    void deleteFavorite(int user_pk, int pro_pk);

    @Insert("INSERT INTO favorite_pro (user_pk, pro_pk, created_at) VALUES (#{user_pk}, #{pro_pk}, sysdate)")
    void insertFavorite(FavoriteProVO favoriteProVO);

    @Select("SELECT COUNT(*) FROM favorite_pro WHERE pro_pk = #{pro_pk}")
    int countFavorites(int pro_pk);

    @Update("UPDATE pro_account SET pro_favorite = pro_favorite + 1 WHERE pro_pk = #{pro_pk}")
    void incrementFavorite(int pro_pk);
    @Update("UPDATE pro_account SET pro_favorite = pro_favorite - 1 WHERE pro_pk = #{pro_pk}")
    void decrementFavorite(int pro_pk);

}
