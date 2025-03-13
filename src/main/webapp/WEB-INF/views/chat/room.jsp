<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>채팅방</title>
    <link rel="stylesheet" href="/resources/js/room.css">
</head>
<body>
<h1>채팅방: ${chatRoom.chat_room_no}</h1>
<p>나 : ${sessionScope.user.user_nickname}</p>
<p>상대방 : ${sessionScope.user.user_pk == chatRoom.chat_user_id ? chatRoom.chat_pro_name : chatRoom.chat_user_name}</p>
<p>나 : <input id="from" value="${sessionScope.user.user_nickname}" readonly></p>
<p>상대방 : <input id="to" value="${sessionScope.user.user_pk == chatRoom.chat_user_id ? chatRoom.chat_pro_name : chatRoom.chat_user_name}" readonly>
</p>
<div>
    <h3>채팅 견적서</h3>
    <div id="reqForm"></div>
</div>
<div id="chatContainer">
    <!-- 보낸 메시지 -->
    <div class="message sent">
        <p>나: 안녕하세요!</p>
    </div>

    <!-- 받은 메시지 -->
    <div class="message received">
        <p>상대방: 안녕하세요! 반갑습니다.</p>
    </div>
</div>


<!-- 메시지 입력창 -->
<input type="text" id="message" placeholder="메시지를 입력하세요">
<button id="sendButton">보내기</button>

<!-- 채팅 메시지 표시 -->
<div id="chat-box"></div>

<script src="/resources/js/chatRoom.js">

</script>
</body>
</html>