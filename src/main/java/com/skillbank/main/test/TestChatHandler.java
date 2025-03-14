package com.skillbank.main.test;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@Log4j2
public class TestChatHandler extends TextWebSocketHandler {

    @Autowired
    private MongoTemplate mongoTemplate;

    // 채팅방 ID별로 세션을 관리하는 Map (채팅방 ID -> List<WebSocketSession>)
    private static Map<String, List<WebSocketSession>> chatRooms = new ConcurrentHashMap<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        log.info("payload : " + payload);

        // 채팅 메시지에서 채팅방 ID, 발신자, 수신자 정보를 추출
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(payload);
        String chatRoomId = jsonNode.get("roomId").asText();
        String senderId = jsonNode.get("from").asText();  // 보낸 사람
        String receiverId = jsonNode.get("to").asText();  // 받는 사람
        String msg = jsonNode.get("message").asText();  // 메시지 내용

        // 메시지 저장하기 (MongoDB에 저장)
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRoomId(chatRoomId);
        chatMessage.setSender(senderId);
        chatMessage.setReceiver(receiverId);
        chatMessage.setMessage(msg);
        chatMessage.setTimestamp(new Date());  // 메시지 보내진 시간

        // MongoDB에 저장
        mongoTemplate.save(chatMessage);
        log.info("mongo 넘어감?");
        if (chatRooms.containsKey(chatRoomId)) {
            List<WebSocketSession> sessions = chatRooms.get(chatRoomId);

            // 채팅방에 있는 세션들에 대해 메시지 전달
            if (sessions != null) {
                for (WebSocketSession sess : sessions) {
                    // 메시지 전송 (자기 자신에게 보내지 않도록)
                    if (!sess.getId().equals(session.getId())) {
                        sess.sendMessage(message);
                    }
                }
            }
        }
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // URL에서 채팅방 ID 추출
        String chatRoomId = getChatRoomIdFromSession(session);

        // 채팅방이 존재하지 않으면 새로운 채팅방을 생성
        chatRooms.putIfAbsent(chatRoomId, new ArrayList<>());

        // 채팅방에 세션 추가 (최대 2명)
        List<WebSocketSession> sessions = chatRooms.get(chatRoomId);
        if (sessions != null && sessions.size() < 2) {
            sessions.add(session);
            log.info("채팅방 {} 에 {}번째 사용자 접속: {}", chatRoomId, sessions.size(), session);
        }

        // 두 명의 사용자가 모두 접속하면 채팅을 시작할 수 있도록 알림을 추가할 수 있습니다.
        if (sessions != null && sessions.size() == 2) {
            log.info("채팅방 {}에 1:1 채팅 시작 가능: {}와 {}", chatRoomId, sessions.get(0), sessions.get(1));
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // URL에서 채팅방 ID 추출
        String chatRoomId = getChatRoomIdFromSession(session);

        // 채팅방에서 세션 제거
        List<WebSocketSession> sessions = chatRooms.get(chatRoomId);
        if (sessions != null) {
            sessions.remove(session);

            // 만약 채팅방에 세션이 없으면 채팅방을 삭제
            if (sessions.isEmpty()) {
                chatRooms.remove(chatRoomId);
            }
        }
        log.info("채팅방 {} 에서 클라이언트 접속 해제: {}", chatRoomId, session);
    }

    // URL에서 채팅방 ID 추출
    private String getChatRoomIdFromSession(WebSocketSession session) {
        String query = session.getUri().getQuery();
        return query != null && query.startsWith("roomId=") ? query.substring(7) : "default";
    }

    // 메시지에서 채팅방 ID 추출
    private String getChatRoomIdFromMessage(String message) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(message);
            return jsonNode.get("roomId").asText();
        } catch (Exception e) {
            return "default";
        }
    }
}
