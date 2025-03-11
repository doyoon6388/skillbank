package com.skillbank.main.mapper;

import com.skillbank.main.vo.CommunityPostVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
public interface CommunityMapper {

    @Select("select * from community_post where commu_post_category = 'together' order by commu_date desc")
    List<CommunityPostVO> getAllTogePost();

    @Select("select * from community_post where commu_post_category = 'askpro' order by commu_date desc")
    List<CommunityPostVO> getAllAskproPost();

    @Insert("insert into community_post values(community_post_seq.nextval, #{commu_post_category},#{commu_user_id},#{commu_title}, sysdate, #{commu_content}, #{commu_image})")
    int createPost(CommunityPostVO communityPostVO);

//    順番(実験)
    @Select("select count(*) from community_post where commu_post_category = #{category}")
    int getPostCount(@Param("category") String category);

    @Select("select * from ( select rownum as rn, a.* from ( select * from community_post where commu_post_category = #{category} order by commu_date desc ) a where rownum <= #{end} ) where rn >= #{start}")
    List<CommunityPostVO> getPostsByPage(@Param("category") String category, @Param("start") int start, @Param("end") int end);

    @Select("select * from community_post where commu_post_id = #{postId}")
    CommunityPostVO getPostById(int postId);
}