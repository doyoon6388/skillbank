window.onload = () => {
    scrollToBottom();
    const from = document.querySelector("#from").value;
    const to = document.querySelector("#to").value;
    window.myNickname = from; // 전역에서 내 닉네임 참조할 수 있게

    document.getElementById("message").addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
            const message = document.getElementById("message").value;
            sendMessage(message, from, to);
            document.getElementById("message").value = "";
        }
    });

    document.getElementById("sendButton").addEventListener("click", function () {
        const message = document.getElementById("message").value;
        sendMessage(message, from, to);
        document.getElementById("message").value = "";
    });

    if (isPro) {
        loadClientInfo();
    } else {
        loadProInfo();
    }
};

const roomId = window.location.pathname.split("/").pop();
const socket = new WebSocket(`ws://localhost/ws/test/chat?roomId=${roomId}`);

socket.onopen = () => {
    console.log(`채팅방 ${roomId}에 접속`);
};

socket.onmessage = (event) => {
    const messageData = JSON.parse(event.data);
    const messageContainer = document.createElement("div");
    const messageContent = document.createElement("p");
    messageContent.innerText = messageData.message;

    const isSender = messageData.sender === window.myNickname;

    messageContainer.classList.add("message");
    messageContainer.classList.add(isSender ? "sent" : "received");
    messageContainer.classList.add(
        isSender
            ? isPro ? "pro-bubble" : "user-bubble"
            : isPro ? "user-bubble" : "pro-bubble"
    );

    messageContainer.appendChild(messageContent);
    document.getElementById("chatContainer").appendChild(messageContainer);
    scrollToBottom();
};

socket.onclose = () => {
    console.log(`채팅방 ${roomId}에서 연결 종료`);
};

function sendMessage(message, from, to) {
    const messageContainer = document.createElement("div");
    messageContainer.classList.add("message", "sent");
    messageContainer.classList.add(isPro ? "pro-bubble" : "user-bubble");

    const messageContent = document.createElement("p");
    messageContent.innerText = message;
    messageContainer.appendChild(messageContent);

    document.getElementById("chatContainer").appendChild(messageContainer);
    scrollToBottom();

    const messageData = {
        roomId: roomId,
        from: from,
        to: to,
        message: message,
    };
    socket.send(JSON.stringify(messageData));
}

function scrollToBottom() {
    const chatContainer = document.getElementById("chatContainer");
    chatContainer.scrollTop = chatContainer.scrollHeight;
}

function loadClientInfo() {
    const fromValue = document.getElementById("hiddenFrom").value;
    fetch("/test/chat/client-info", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ user_pk: fromValue }),
    })
        .then((res) => res.json())
        .then((data) => {
            document.getElementById("chat-information-content").innerHTML = generateClientHtml(data);
        })
        .catch((err) => console.error("클라이언트 정보 로드 실패:", err));
}

function loadProInfo() {
    const toValue = document.getElementById("hiddenTo").value;
    fetch("/test/chat/pro-info", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ pro_pk: toValue }),
    })
        .then((res) => res.json())
        .then((data) => {
            document.getElementById("chat-information-content").innerHTML = generateProHtml(data);
            bindDealButtonListeners();
        })
        .catch((err) => console.error("프로 정보 로드 실패:", err));
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
    let review_client = document.getElementById("hiddenFrom").value;
    let review_pro = document.getElementById("hiddenTo").value;
    const chatReqNo = document.getElementById("chatReqNum").value;

    return `
        <h3>프로 정보</h3>
        <p>이름: ${data.pro_name}</p>
        <p>전문 분야: ${data.pro_category}</p>
        <p>전화번호: ${data.pro_phone}</p>
        <p>주소: ${data.pro_address}</p>
        <div class="deal-button-container">
            <form id="review-form" action="/review" method="post">
                <input type="hidden" name="review_client" value="${review_client}">
                <input type="hidden" name="review_pro" value="${review_pro}">
                <input type="hidden" name="chatReqNo" value="${chatReqNo}">
                <div class="flex-box">
                    <button id="deal-complete-btn" type="button">거래 성사</button>
                    <button id="deal-cancel-btn" type="button">거래 취소</button>
                </div>
            </form>
        </div>
    `;
}

function bindDealButtonListeners() {
    const dealBtn = document.getElementById("deal-complete-btn");
    if (!dealBtn) return;

    dealBtn.addEventListener("click", () => {
        if (confirm("거래를 성사하시겠습니까?")) {
            if (confirm("고수님을 위해 리뷰를 작성해주세요!")) {
                document.getElementById("review-form").submit();
            } else {
                const review_client = document.querySelector('input[name="review_client"]').value;
                const review_pro = document.querySelector('input[name="review_pro"]').value;
                window.location.href = `/noReview?review_client=${review_client}&review_pro=${review_pro}`;
            }
        }
    });
}