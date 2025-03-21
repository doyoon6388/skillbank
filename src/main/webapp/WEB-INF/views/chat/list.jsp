<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>채팅 목록</title>
    <link rel="stylesheet" href="/resources/css/chat/list.css"/>
</head>
<body>
<div class="chat-wrapper">
<%--    <h1 class="chat-title">チャット</h1>--%>

    <c:choose>
        <c:when test="${empty chatRooms}">
            <div class="chat-empty">현재 채팅방이 없습니다.</div>
        </c:when>
        <c:otherwise>
            <div class="chat-list">
                <c:forEach var="chatRoom" items="${chatRooms}">
                    <div class="chat-room" data-room-no="${chatRoom.chat_room_no}">
                        <div class="chat-info">
                            <span class="chat-label">채팅방 번호:</span>
                            <span class="chat-value">#${chatRoom.chat_room_no}</span>
                        </div>
                        <div class="chat-info">
                            <span class="chat-label">Pro:</span>
                            <span class="chat-value">${chatRoom.chat_pro_name} (${chatRoom.chat_pro_id})</span>
                        </div>
                        <div class="chat-info">
                            <span class="chat-label">Client:</span>
                            <span class="chat-value">${chatRoom.chat_user_name} (${chatRoom.chat_user_id})</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".chat-room").forEach(room => {
            room.addEventListener("click", function () {
                let chatRoomNo = this.dataset.roomNo;
                window.location.href = "/test/chat/room/" + chatRoomNo;
            });
        });
    });
</script>
</body>
</html>