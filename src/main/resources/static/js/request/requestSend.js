document.addEventListener("DOMContentLoaded", function() {


    let request =  document.getElementById('sendR');

        request.addEventListener('click',()=>{

            const r_request_no = document.querySelector("#r_request_no").value;
            const r_pro_pk = document.querySelector("#r_pro_pk").value;
            const r_price_type = document.querySelector("input[name='r_price_type']:checked").value;
            const r_comment = document.querySelector("#r_comment").value;
            const r_price = document.querySelector("#r_price").value;

            fetch('/request-send',{
                method: "post",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    r_request_no: r_request_no,

                    r_pro_pk: r_pro_pk,
                    r_price_type: r_price_type,
                    r_comment: r_comment,
                    r_price: r_price
                })
            }).then(() => {
                const requestNo = request.dataset.requestNo;  // 견적서 ID 가져오기
                const user = request.dataset.user;  // 견적서 ID 가져오기
                const userName = request.dataset.userNickname;
                const pro = request.dataset.pro;  // 견적서 ID 가져오기
                const proName = request.dataset.proName;
                const cloneReqHTML = request.parentElement.cloneNode(true).outerHTML;
                console.log(request.dataset)
                makeChatroom(requestNo, user, userName, pro, proName, cloneReqHTML);
                })
        })
}); // 레디 함수 끝

function makeChatroom(requestNo, user, userName, pro, proName, cloneReqHTML){
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

