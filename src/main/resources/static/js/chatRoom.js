window.onload = () => {
    scrollToBottom();
    const from = document.querySelector("#from").value;
    const to = document.querySelector("#to").value;
    window.myNickname = from;

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
        loadResponseInfo();
        loadClientInfo();
    } else {
        loadResponseInfoClient();
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

    messageContainer.classList.add("message", isSender ? "sent" : "received");
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
    messageContainer.classList.add("message", "sent", isPro ? "pro-bubble" : "user-bubble");

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

function loadResponseInfo() {
    const requestNumber = document.getElementById("chatReqNum").value;
    fetch("/test/chat/response-info", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({r_request_no: requestNumber}),
    })
        .then((res) => res.json())
        .then((data) => {
            document.getElementById("chat-information-content").innerHTML = generateResponseHtml(data);
        })
        .catch((err) => console.error("클라이언트 정보 로드 실패:", err));
}

function loadResponseInfoClient() {
    const requestNumber = document.getElementById("chatReqNum").value;
    fetch("/test/chat/response-info", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({r_request_no: requestNumber}),
    })
        .then((res) => res.json())
        .then((data) => {
            document.getElementById("chat-information-content").innerHTML = generateResponseHtmlClient(data);
            bindDealButtonListeners();
        })
        .catch((err) => console.error("클라이언트 정보 로드 실패:", err));
}

function loadClientInfo() {
    const fromValue = document.getElementById("hiddenFrom").value;
    fetch("/test/chat/client-info", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({user_pk: fromValue}),
    })
        .then((response) => response.json())
        .then((clientData) => {
            document.getElementById("chat-partner-info").innerHTML =
                generateClientHtml(clientData);
        })
        .catch((error) => console.error("클라이언트 정보 로드 실패:", error));
}

function loadProInfo() {
    const toValue = document.getElementById("hiddenTo").value;
    fetch("/test/chat/pro-info", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({pro_pk: toValue}),
    })
        .then((res) => res.json())
        .then((data) => {
            document.getElementById("chat-partner-info").innerHTML = generateProHtml(data);
        })
        .catch((err) => console.error("프로 정보 로드 실패:", err));
}

function generateResponseHtml(data) {
    return `
        <div class="response-info">
            <h3>見積書 情報</h3>
            <p>${data.r_price_type} : ${data.r_price} 円</p>
            <p>詳細情報: ${data.r_comment}</p>
        </div>
    `;
}

function generateResponseHtmlClient(data) {
    let review_client = document.getElementById("hiddenFrom").value;
    let review_pro = document.getElementById("hiddenTo").value;
    const chatReqNo = document.getElementById("chatReqNum").value;
    return `
        <div class="response-info-client">
            <h3>見積書 情報</h3>
            <p>${data.r_price_type} : ${data.r_price} 円</p>
            <p>詳細情報: ${data.r_comment}</p>
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
        </div>
    `;
}

function generateClientHtml(data) {
    return `
        <div class="partner-info client-info">
            <img src="/file/${data.user_profile_img}" alt="클라이언트 이미지">
            <div class="partner-info name">${data.user_nickname}</div>
        </div>
    `;
}

function generateProHtml(data) {
    return `
        <div class="partner-info pro-info">
            <img src="/file/${data.pro_profile_img}" alt="프로 이미지">
            <div class="partner-info name">${data.pro_name}</div>
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