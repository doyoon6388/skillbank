
    var stompClient = null;
    var username = prompt("이름을 입력하세요:");




function connect() {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log("Connected: " + frame);

        // 서버에서 메시지를 받아 처리
        stompClient.subscribe('/topic/public', function (message) {
            showMessage(JSON.parse(message.body));
        });

        stompClient.send("/app/chat.addUser", {}, JSON.stringify({ sender: username, type: "JOIN" }));
    });
}

function sendMessage() {
    var messageContent = document.getElementById("message").value;
    if (messageContent && stompClient) {
        var chatMessage = { sender: username, content: messageContent, type: "CHAT" };
        stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
        document.getElementById("message").value = "";
    }
}

function showMessage(message) {
    var messageArea = document.getElementById("messageArea");
    var messageElement = document.createElement("li");
    messageElement.textContent = message.sender + ": " + message.content;
    messageArea.appendChild(messageElement);
}
    connect();

