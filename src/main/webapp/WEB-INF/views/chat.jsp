<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>채팅</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
<h2>실시간 채팅</h2>
<div id="chatBox" style="border: 1px solid black; height: 300px; overflow-y: scroll;"></div>
<input type="text" id="message" placeholder="메시지를 입력하세요">
<button onclick="sendMessage()">전송</button>

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