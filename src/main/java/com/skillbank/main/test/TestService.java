package com.skillbank.main.test;

import com.skillbank.main.vo.ProAccountVO;
import com.skillbank.main.vo.ReqeustVO;
import com.skillbank.main.vo.UserAccountVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

@Service
public class TestService {

    private static final Logger log = LoggerFactory.getLogger(TestService.class);
    private TestMapper testMapper;

    @Autowired
    private MongoTemplate mongoTemplate;

    public List<ChatMessage> getChatMessagesByRoomId(Integer roomId) {
        // MongoDB에서 해당 roomId에 대한 채팅 내역을 조회
        System.out.println(roomId.toString());
        return mongoTemplate.find(
                query(where("roomId").is(roomId.toString())),
                ChatMessage.class
        );
    }
    public TestService(TestMapper testMapper) {
        this.testMapper = testMapper;
    }

    public List<ReqeustVO> selectAllRequest(){
        return testMapper.selectAllRequest();
    }

    public Integer chkRoom(ChatRoomVO chatRoomVO){
        return testMapper.chkRoom(chatRoomVO);
    }

    public Map<String, Object> createChatRoom(ChatRoomVO chatRoomVO) {
        Integer exist = chkRoom(chatRoomVO); // null or 1, 그 이상
        Map<String, Object> response = new HashMap<>();
        System.out.println("방 개설 전 pk 확인하기 " + exist);
        if (exist != null ) {
            response.put("success", 0); // 이미 존재
        } else{
            response.put("success", 1); // 등록 해야 함
            testMapper.createChatRoom(chatRoomVO);
            exist = chkRoom(chatRoomVO);
        }
            response.put("roomNo", exist);
            return response;
    }

    public List<ChatRoomVO> chatList(int no){
        return testMapper.chatList(no);
    }
    public List<ChatRoomVO> chatListPro(int no){
        return testMapper.chatListPro(no);
    }

    public ChatRoomVO getChatRoomById(int no) {
        return testMapper.getChatRoomById(no);
    }

    public UserAccountVO getClientInfo(UserAccountVO userAccountVO) {
        return testMapper.getClientInfo(userAccountVO);
    }

    public ProAccountVO getProInfo(ProAccountVO proAccountVO) {
        return testMapper.getProInfo(proAccountVO);
    }
}
