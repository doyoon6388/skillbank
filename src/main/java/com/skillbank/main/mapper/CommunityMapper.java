package com.skillbank.main.mapper;

import com.skillbank.main.vo.CommunityCommentVO;
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

    @Insert("insert into community_post values(community_post_seq.nextval, #{commu_post_category},#{commu_user_id},#{commu_title}, sysdate, #{commu_content}, #{commu_image}, default, default)")
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

    @Delete("delete from community_comment where comment_post_id = #{postId}")
    void deleteCommentsByPostId(int postId);

    @Update("update community_post set commu_title = #{commu_title}, commu_content = #{commu_content}, commu_image = #{commu_image} where commu_post_id = #{commu_post_id}")
    int communityUpdatePost(CommunityPostVO communityPostVO);

    //    コメント用
    @Insert("insert into community_comment values (community_comment_seq.nextval, #{comment_post_id}, #{user_id}, #{comment_content}, sysdate, #{user_nickname})")
    int insertComment(CommunityCommentVO comment);

    @Select("select * from community_comment where comment_post_id = #{postId} order by comment_date desc")
    List<CommunityCommentVO> getCommentsByPost(@Param("postId") int postId);

//  いいね


}