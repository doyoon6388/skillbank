<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>チャット</title>
    <link rel="stylesheet" href="/resources/css/chat/list.css"/>
</head>
<body>

<h1>チャット</h1>

<c:choose>
    <c:when test="${empty chatRooms}">
        <div class="chat-empty">会話中のチャットが存在しません</div>
    </c:when>
    <c:otherwise>
        <div class="chat-wrapper">
            <c:forEach var="chatRoom" items="${chatRooms}">
                <div class="chat-room" data-room-no="${chatRoom.chat_room_no}">
                    <div class="chat-info">
                        <span class="chat-label">チャットNo. </span>
                        <span class="chat-value">#${chatRoom.chat_room_no}</span>
                    </div>
                    <div class="chat-info">
                        <span class="chat-label">プロ : </span>
                        <span class="chat-value">${chatRoom.chat_pro_name} (${chatRoom.chat_pro_id})</span>
                    </div>
                    <div class="chat-info">
                        <span class="chat-label">クライアント : </span>
                        <span class="chat-value">${chatRoom.chat_user_name} (${chatRoom.chat_user_id})</span>
                    </div>
                    <c:if test="${chatRoom.chat_complete == 1}">
                        <div class="chat-complete-label">
                            取引完了
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".chat-room").forEach((room) => {
            room.addEventListener("click", function () {
                let chatRoomNo = this.dataset.roomNo;
                window.location.href = "/test/chat/room/" + chatRoomNo;
            });
        });
    });
</script>
</body>
</html>
