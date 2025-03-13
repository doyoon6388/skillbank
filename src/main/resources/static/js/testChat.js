document.querySelectorAll(".req button").forEach((req) => {
    req.addEventListener("click", () => {
        const requestNo = req.dataset.requestNo;  // 견적서 ID 가져오기
        const user = req.dataset.user;  // 견적서 ID 가져오기
        const userName = req.dataset.userNickname;
        const pro = req.dataset.pro;  // 견적서 ID 가져오기
        const proName = req.dataset.proName;
        const cloneReqHTML = req.parentElement.cloneNode(true).outerHTML;
        makeChatroom(requestNo, user, userName, pro, proName, cloneReqHTML);
    });
});

function makeChatroom(requestNo, user, userName, pro, proName, cloneReqHTML) {
    fetch("/test/chat/open", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            chat_req_no: requestNo,
            chat_user_id: user,
            chat_user_name: userName,
            chat_pro_id: pro,
            chat_pro_name: proName,
            cloneReqHTML: cloneReqHTML
        })
    })
        .then(response => response.json())
        .then(data => {
            // 서버에서 응답을 받으면 채팅방 개설 성공 여부 등을 처리
            console.log(data.roomNo);
            console.log(data.success);
            if (data.success == 1) {
                alert("채팅방이 개설되었습니다.");
            } else {
                alert("존재하는 채팅을 불러옵니다.");
            }
            sessionStorage.setItem("cloneReqHTML", cloneReqHTML);
            window.location.href = `/test/chat/room/${data.roomNo}`;
        })
        .catch(error => {
            console.error("Error:", error);
            alert("오류가 발생했습니다.");
        });
}

document.querySelector("#chat-list").addEventListener("click", (e) => {
    location.href = `/test/chat/list`;

});

