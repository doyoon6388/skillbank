<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
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
    // WebSocket 연결
    const socket = new SockJS('/ws');
    const stompClient = Stomp.over(socket);

    stompClient.connect({}, function () {
        console.log("WebSocket 연결 성공");
        stompClient.subscribe('/topic/messages', function (message) {
            showMessage(JSON.parse(message.body));
        });
    });

    // 메시지 전송 함수
    function sendMessage() {
        const message = {
            sender: "고객1",  // 로그인 기능 추가되면 실제 사용자 정보로 변경
            content: document.getElementById("message").value,
            timestamp: new Date().toISOString()
        };
        stompClient.send("/app/chat", {}, JSON.stringify(message));
        document.getElementById("message").value = ""; // 입력창 초기화
    }

    // 채팅 메시지를 화면에 표시하는 함수
    function showMessage(message) {
        const chatBox = document.getElementById("chatBox");
        chatBox.innerHTML += `<p><strong>${message.sender}:</strong> ${message.content}</p>`;
        chatBox.scrollTop = chatBox.scrollHeight; // 스크롤 자동 이동
    }
</script>
</body>
</html>