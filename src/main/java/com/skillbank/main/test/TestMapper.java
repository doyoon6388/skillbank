package com.skillbank.main.test;

import com.skillbank.main.vo.ReqeustVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import java.util.List;

@Mapper
public interface TestMapper {

    // 요청서 조회 (user nickname까지 뽑아옴)
    @Select("select r.*, u.user_nickname from request r, user_account u where r.R_USER_ID = u.USER_PK order by r.r_date desc")
    List<ReqeustVO> selectAllRequest();

    // 채팅방 개설
    @Insert("insert into chat_room (chat_room_no,chat_user_id, chat_user_name, chat_pro_id, chat_pro_name,chat_req_no) values (chat_room_seq.nextval, #{chat_user_id},#{chat_user_name},#{chat_pro_id},#{chat_pro_name},${chat_req_no})")
    @SelectKey(statement = "SELECT chat_room_seq.currval FROM dual", keyProperty = "chat_room_no", before = false, resultType = Integer.class)
    int createChatRoom(ChatRoomVO chatRoomVO);

    // 동일 채팅방 중복여부
    @Select("select chat_room_no from chat_room where chat_user_id=#{chat_user_id} and chat_pro_id=#{chat_pro_id} and chat_req_no=#{chat_req_no}")
    Integer chkRoom(ChatRoomVO chatRoomVO);

    // 프로의 채팅 리스트
    @Select("select * from chat_room where chat_pro_id=#{no}")
    List<ChatRoomVO> chatList(int no);

    @Select("select * from chat_room where chat_room_no = #{no}")
    ChatRoomVO getChatRoomById(int no);
}
