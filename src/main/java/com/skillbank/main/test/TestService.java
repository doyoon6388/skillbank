package com.skillbank.main.test;

import com.skillbank.main.vo.ReqeustVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TestService {

    private static final Logger log = LoggerFactory.getLogger(TestService.class);
    private TestMapper testMapper;

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
            response.put("success", 0); // 등록 x
        } else{
            response.put("success", 1); // 등록 o
            exist = testMapper.createChatRoom(chatRoomVO);
        }
            response.put("roomNo", exist);
            return response;
    }

    public List<ChatRoomVO> chatList(int no){
        return testMapper.chatList(no);
    }

    public ChatRoomVO getChatRoomById(int no) {
        return testMapper.getChatRoomById(no);
    }
}
