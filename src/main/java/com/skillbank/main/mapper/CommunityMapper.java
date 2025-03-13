package com.skillbank.main.mapper;

import com.skillbank.main.vo.CommunityPostVO;
import org.apache.ibatis.annotations.*;
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

    @Delete("delete from community_post where commu_post_id = #{postId}")
    void communityDeletePost(int postId);

//    いいね
//    @Select("select count(*) from community_post_like where post_id = #{postId} and commu_user_id = #{userId}")
//    int countLikePost(@Param("postId") int postId, @Param("userId") int userId);
//
//    @Insert("INSERT INTO community_post_like (post_id, user_id) VALUES (#{postId}, #{userId})")
//    void insertPostLike(@Param("postId") int postId, @Param("userId") int userId);
//    @Delete("DELETE FROM community_post_like WHERE post_id = #{postId} AND user_id = #{userId}")
//    void deletePostLike(@Param("postId") int postId, @Param("userId") int userId);
//
//    @Update("UPDATE community_post SET commu_like = commu_like + 1 WHERE commu_post_id = #{postId}")
//    void incrementPostLike(@Param("postId") int postId);
//
//    @Update("UPDATE community_post SET commu_like = commu_like - 1 WHERE commu_post_id = #{postId}")
//    void decrementPostLike(@Param("postId") int postId);

}