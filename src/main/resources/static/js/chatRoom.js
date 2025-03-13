// WebSocket 연결 생성
const roomId = window.location.pathname.split("/").pop();
const socket = new WebSocket(`ws://localhost/ws/test/chat?roomId=${roomId}`);

socket.onopen = () => {
    console.log(`채팅방 ${roomId}에 접속`);
};

socket.onmessage = (event) => {
    const messageData = JSON.parse(event.data);  // 메시지 데이터 파싱

    const messageContainer = document.createElement('div');
    messageContainer.classList.add('message');

    // 받은 메시지라면 왼쪽에, 보낸 메시지라면 오른쪽에 표시
    if (messageData.sender === 'me') {
        messageContainer.classList.add('sent'); // 'me'인 경우 오른쪽
    } else {
        messageContainer.classList.add('received'); // 상대방의 메시지
    }

    const messageContent = document.createElement('p');
    messageContent.innerText = messageData.message; // 메시지 내용 추가
    messageContainer.appendChild(messageContent);

    // 메시지를 채팅 화면에 추가
    document.getElementById('chatContainer').appendChild(messageContainer);
};

socket.onclose = () => {
    console.log(`채팅방 ${roomId}에서 연결 종료`);
};

function sendMessage(message,from,to) {
    // 자기 자신의 메시지를 화면에 먼저 표시
    const messageContainer = document.createElement('div');
    messageContainer.classList.add('message', 'sent');

    // 발신자 구분
    const isSender = true; // 여기서 'true'는 '나'라는 의미, 'false'는 '상대방'

    if (isSender) {
        messageContainer.classList.add('sent');  // 나의 메시지 스타일
    } else {
        messageContainer.classList.add('received');  // 상대방의 메시지 스타일
    }

    const messageContent = document.createElement('p');
    messageContent.innerText = message;  // 보낸 메시지 내용
    messageContainer.appendChild(messageContent);

    // 채팅 화면에 추가
    document.getElementById('chatContainer').appendChild(messageContainer);

    // 서버로 메시지 전송
    const messageData = {
        roomId: roomId,
        from: from,       // 보낸 사람의 ID
        to: to,     // 받은 사람의 ID
        message: message,
    };

    // WebSocket을 통해 메시지 전송
    socket.send(JSON.stringify(messageData));
}


window.onload = function() {
    const cloneReqHTML = sessionStorage.getItem("cloneReqHTML");
    if (cloneReqHTML) {
        document.querySelector("#reqForm").innerHTML = cloneReqHTML;
    }
    const from = document.querySelector("#from").value;
    const to = document.querySelector("#to").value;
    console.log(from);
    console.log(to)
    // 엔터키 눌렀을 때 메시지 보내기
    document.getElementById("message").addEventListener("keydown", function(event) {
        if (event.key === "Enter") {
            const message = document.getElementById("message").value;  // 입력된 메시지 가져오기
            sendMessage(message,from,to);  // 수정된 sendMessage 함수 호출
            document.getElementById("message").value = '';  // 메시지 입력란 비우기
        }
    });
    // 버튼 클릭 시 메시지 전송
    document.getElementById("sendButton").addEventListener("click", function() {
        const message = document.getElementById("message").value;  // 입력된 메시지 가져오기
        sendMessage(message,from,to);  // 수정된 sendMessage 함수 호출
        document.getElementById("message").value = '';  // 메시지 입력란 비우기
    });
};

