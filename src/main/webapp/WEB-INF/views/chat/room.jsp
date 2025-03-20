<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>채팅방</title>
    <link rel="stylesheet" href="/resources/js/room.css">
</head>
<body>
<h1>채팅방: ${chatRoom.chat_room_no}</h1>
<p>Client : <input id="from" value="${chatRoom.chat_user_name}" readonly></p>
<p>Pro : <input id="to" value="${chatRoom.chat_pro_name}" readonly></p>
<input id="hiddenFrom" value="${chatRoom.chat_user_id}" hidden>
<input id="hiddenTo" value="${chatRoom.chat_pro_id}" hidden>
<%--<div>
    <h3>채팅 견적서</h3>
    <div id="reqForm"></div>
</div>--%>
<div class="chat-wrapper">
    <div id="chatContainer">
        <c:forEach items="${chatLog}" var="chat">
            <c:choose>
                <c:when test="${chatRoom.chat_user_name eq chat.sender}">
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
    <div id="chat-information-container">
        <div id="tabs">
            <button id="clientTab">클라이언트 정보</button>
            <button id="proTab">프로 정보</button>
        </div>
        <div id="tabContent">
            <div id="clientContent" style="display: none;">
                클라이언트 정보 로딩 중...
            </div>
            <div id="proContent" style="display: none;">
                프로 정보 로딩 중...
            </div>
        </div>
    </div>
    <div class="deal-button-container">
        <div>
            <button id="deal-complete-btn">거래 성사</button>
        </div>
        <div>
            <button id="deal-cancel-btn">거래 취소</button>
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