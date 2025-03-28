<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>채팅방</title>
    <link rel="stylesheet" href="/resources/css/chat/room.css"/>
</head>
<body class="${isPro ? 'pro-theme' : 'user-theme'}">

<h1>チャットルーム</h1>

<div class="chat-room-wrapper ${isPro ? 'pro-theme' : 'user-theme'}">
    <!-- 상단 정보 -->
    <div class="chat-header">
        <div class="chat-participants" id="chat-partner-info">

        </div>
    </div>

    <!-- 본문: 채팅 + 정보 -->
    <div class="chat-body">

        <!-- 프로필 및 거래정보 -->
        <c:if test="${chatRoom.chat_complete == 0}">
            <div id="chat-information-container" class="chat-info">
                <div id="chat-information-content"></div>
            </div>
        </c:if>

        <!-- 채팅창 -->
        <div class="chat-main">
            <div id="chatContainer" class="chat-container">
                <c:forEach items="${chatLog}" var="chat">
                    <c:choose>
                        <c:when test="${sessionScope.user.user_nickname eq chat.sender}">
                            <div class="message sent ${isPro ? 'pro-bubble' : 'user-bubble'}">
                                <p>${chat.message}</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="message received ${isPro ? 'user-bubble' : 'pro-bubble'}">
                                <p>${chat.message}</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <!-- 입력창 -->
            <div class="chat-input-box">
                <input type="text" id="message" placeholder="メッセージを入力してください"/>
                <button id="sendButton">送信</button>
            </div>
        </div>

    </div>
</div>

<input id="hiddenFrom" value="${chatRoom.chat_user_id}" hidden/>
<input id="hiddenTo" value="${chatRoom.chat_pro_id}" hidden/>
<input id="from" value="${sessionScope.user.user_nickname}" hidden/>
<input id="to" value="${chatRoom.chat_pro_name}" hidden/>
<input id="chatReqNum" value="${chatRoom.chat_req_no}" hidden/>

<script>
    let isPro = ${isPro};
    if (isPro) {
        document.documentElement.classList.add("pro");
    } else {
        document.documentElement.classList.add("user");
    }
</script>
<script src="/resources/js/chatRoom.js"></script>
</body>
</html>