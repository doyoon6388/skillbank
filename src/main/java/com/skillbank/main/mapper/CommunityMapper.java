package com.skillbank.main.mapper;

import com.skillbank.main.vo.CommunityPostVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CommunityMapper {

    @Select("select * from community_post where commu_post_category = 'together'")
    List<CommunityPostVO> getAllTogePost();

    @Select("select * from community_post where commu_post_category = 'askpro'")
    List<CommunityPostVO> getAllAskproPost();

    @Insert("insert into community_post values(community_post_seq.nextval, #{commu_post_category},#{commu_user_id},#{commu_title}, sysdate, #{commu_content},null)")
    int createPost(CommunityPostVO communityPostVO);
}
