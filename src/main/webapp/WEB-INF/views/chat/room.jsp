<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>채팅방</title>
    <link rel="stylesheet" href="/resources/css/chat/room.css">
</head>
<body>
<h1>채팅방: ${chatRoom.chat_room_no}</h1>
<p>나 : <input id="from" value="${sessionScope.user.user_nickname}" readonly></p>
<p>상대방 : <input id="to" value="${chatRoom.chat_pro_name}" readonly></p>
<div>
    <h3>채팅 견적서</h3>
    <div id="reqForm"></div>
</div>
<div class="chat-wrapper">
    <div id="chatContainer">
        <c:forEach items="${chatLog}" var="chat">
            <c:choose>
                <c:when test="${sessionScope.user.user_nickname eq chat.sender}">
                    <div class="message sent">
                        <p>${chat.message}</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="message received">
                        <p>${chat.message}</p>
                    </div>
                </c:otherwise>
            </c:choose>
            <!-- 받은 메시지 -->
        </c:forEach>
    </div>
    <div class="deal-button-container">
        <div>
            <button>거래 성사</button>
        </div>
        <div>
            <button>거래 취소</button>
        </div>
    </div>
</div>

<!-- 메시지 입력창 -->
<input type="text" id="message" placeholder="메시지를 입력하세요">
<button id="sendButton">보내기</button>
<!-- 채팅 메시지 표시 -->
<div id="chat-box"></div>
<script src="/resources/js/chatRoom.js"></script>
</body>
</html>