package com.skillbank.main.test;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
@Log4j2
public class TestChatHandler extends TextWebSocketHandler {
    // 채팅방 ID별로 세션을 관리하는 Map (채팅방 ID -> WebSocketSession)
    private static Map<String, WebSocketSession[]> chatRooms = new ConcurrentHashMap<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        log.info("payload : " + payload);

        // 채팅 메시지에서 채팅방 ID와 발신자 정보를 추출
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(payload);
        String chatRoomId = jsonNode.get("roomId").asText();

        if (chatRooms.containsKey(chatRoomId)) {
            // 채팅방에 있는 세션들에 대해 메시지 전달
            for (WebSocketSession sess : chatRooms.get(chatRoomId)) {
                // 메시지 전송 (자기 자신에게 보내지 않도록)
                if (!sess.getId().equals(session.getId())) {
                    sess.sendMessage(message);
                }
            }
        }
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // URL에서 채팅방 ID 추출
        String chatRoomId = getChatRoomIdFromSession(session);

        // 채팅방이 존재하지 않으면 새로운 채팅방을 생성
        chatRooms.putIfAbsent(chatRoomId, new WebSocketSession[2]);

        // 채팅방에 세션 추가 (최대 2명)
        WebSocketSession[] sessions = chatRooms.get(chatRoomId);
        for (int i = 0; i < sessions.length; i++) {
            if (sessions[i] == null) {
                sessions[i] = session;
                log.info("채팅방 {} 에 {}번째 사용자 접속: {}", chatRoomId, i + 1, session);
                break;
            }
        }

        // 두 명의 사용자가 모두 접속하면 채팅을 시작할 수 있도록 알림을 추가할 수 있습니다.
        if (sessions[0] != null && sessions[1] != null) {
            log.info("채팅방 {}에 1:1 채팅 시작 가능: {}와 {}", chatRoomId, sessions[0], sessions[1]);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // URL에서 채팅방 ID 추출
        String chatRoomId = getChatRoomIdFromSession(session);

        // 채팅방에서 세션 제거
        WebSocketSession[] sessions = chatRooms.get(chatRoomId);
        if (sessions != null) {
            for (int i = 0; i < sessions.length; i++) {
                if (sessions[i] != null && sessions[i].getId().equals(session.getId())) {
                    sessions[i] = null;
                    break;
                }
            }

            // 만약 채팅방에 세션이 없으면 채팅방을 삭제
            if (sessions[0] == null && sessions[1] == null) {
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

