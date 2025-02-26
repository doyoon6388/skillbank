<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <%--
        <script defer src="<%= request.getContextPath() %>/resources/js/chat.js"></script>
    --%>
</head>
<body>
<h2>실시간 채팅</h2>
<div id="chat">
    <ul id="messageArea"></ul>  <!-- 메시지 출력 영역 -->
    <input type="text" id="message" placeholder="메시지를 입력하세요"/>
    <button onclick="sendMessage()">보내기</button>
</div>

<script>
    let stompClient = null;

    function connect() {
        let socket = new SockJS('/ws');  // WebSocket 연결
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);

            // 서버에서 메시지를 받을 때 실행
            stompClient.subscribe('/topic/public', function (message) {
                showMessage(JSON.parse(message.body));
            });
        });
    }

    // 메시지를 서버로 전송
    function sendMessage() {
        let messageContent = document.getElementById("message").value;
        if (messageContent && stompClient) {
            let chatMessage = {
                sender: "사용자",  // 실제 프로젝트에서는 로그인된 사용자 이름을 사용
                content: messageContent,
                timestamp: new Date().toLocaleTimeString()
            };
            stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
            document.getElementById("message").value = "";
        }
    }

    // 메시지를 화면에 표시
    function showMessage(message) {
        let messageArea = document.getElementById("messageArea");
        let messageElement = document.createElement("li");
        messageElement.textContent = `[${message.timestamp}] ${message.sender}: ${message.content}`;
        messageArea.appendChild(messageElement);
    }

    connect();

</script>
</body>

</html>
