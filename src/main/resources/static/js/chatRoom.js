window.onload = () => {
    scrollToBottom();
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

    window.scrollTo(0, document.body.scrollHeight);

    loadClientProInfo();
    // 페이지 로드 시 기본적으로 클라이언트 정보 영역을 보이도록 설정
    document.getElementById('clientContent').style.display = 'block';
    document.getElementById('proContent').style.display = 'none';

    // 기본 탭(클라이언트 정보 탭)에 active 클래스 추가
    const tabs = document.querySelectorAll('#tabs button');
    tabs.forEach(tab => tab.classList.remove('active')); // 혹시 모를 active 제거
    document.getElementById('clientTab').classList.add('active');

    // 모든 탭에 클릭 이벤트 등록
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // 모든 탭에서 active 클래스를 제거
            tabs.forEach(t => t.classList.remove('active'));
            // 클릭한 탭에 active 클래스 추가
            this.classList.add('active');

            // 탭에 따른 콘텐츠 표시 전환
            if (this.id === 'clientTab') {
                document.getElementById('clientContent').style.display = 'block';
                document.getElementById('proContent').style.display = 'none';
            } else if (this.id === 'proTab') {
                document.getElementById('clientContent').style.display = 'none';
                document.getElementById('proContent').style.display = 'block';
            }
        });
    });
}; // 레디 함수 끝

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
    scrollToBottom();
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
    scrollToBottom();
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

function scrollToBottom() {
    const chatContainer = document.getElementById('chatContainer');
    chatContainer.scrollTop = chatContainer.scrollHeight;
}

function loadClientProInfo(){

    const fromValue = document.getElementById('hiddenFrom').value;
    const toValue = document.getElementById('hiddenTo').value;


    fetch('/test/chat/client-info',{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ user_pk: fromValue })
    })
        .then(response => response.json())
        .then(clientData => {
            console.log(clientData);
            document.getElementById('clientContent').innerHTML = generateClientHtml(clientData);
        })
        .catch(error => console.error('클라이언트 정보 로드 실패:', error));

    fetch('/test/chat/pro-info',{
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ pro_pk: toValue })
    })
        .then(response => response.json())
        .then(proData => {
            console.log(proData);
            document.getElementById('proContent').innerHTML = generateProHtml(proData);
        })
        .catch(error => console.error('프로 정보 로드 실패:', error));
}

function generateClientHtml(data) {
    return `
        <h3>클라이언트 정보</h3>
        <p>이름: ${data.user_nickname}</p>
        <p>이메일: ${data.user_email}</p>
        <p>기타 정보: ${data.user_phone}</p>
    `;
}

function generateProHtml(data) {
    return `
        <h3>프로 정보</h3>
        <p>이름: ${data.pro_name}</p>
        <p>전문 분야: ${data.pro_category}</p>
        <p>전화번호: ${data.pro_phone}</p>
        <p>주소: ${data.pro_address}</p>
    `;
}