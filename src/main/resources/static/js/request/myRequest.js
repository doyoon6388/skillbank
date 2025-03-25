document.addEventListener("DOMContentLoaded", function () {
    let btn1 = document.getElementById("for-btn");
    let btn2 = document.getElementById("for-btn2");

    // 페이지 로드 시 기본 활성화 버튼 설정 (견적 받는중)
    btn1.classList.add("active");


    btn1.addEventListener("click", function () {
        btn1.classList.add("active");
        btn2.classList.remove("active");
        document.getElementById("for-div").style.display = "block";
        document.getElementById("for-div2").style.display = "none";
    });

    btn2.addEventListener("click", function () {
        btn2.classList.add("active");
        btn1.classList.remove("active");
        document.getElementById("for-div").style.display = "none";
        document.getElementById("for-div2").style.display = "block";
    });
});

// 모달 열기
function openModal() {
    document.getElementById("modal").style.display = "block";
    document.getElementById("modal-overlay").style.display = "block";
}

// 모달 닫기
function closeModal() {
    document.getElementById("modal").style.display = "none";
    document.getElementById("modal-overlay").style.display = "none";
}

function submitVote() {
    const form = document.getElementById("voteForm");
    form.submit();
}

window.onload = () => {

    document.querySelectorAll('.myRequestOpenModalBtn').forEach(button => {
        button.addEventListener('click', () => {
            let pk = button.value;
            // console.log(pk);
            openModal()
            fetch("/my-request-detail?pk=" + encodeURIComponent(pk), {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            }) // fetch 끝
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error('서버 요청 실패');
                    }
                    return response.json(); // JSON 데이터로 변환
                }).then(data => {
                // null 또는 undefined인 데이터는 표시하지 않음
                const requestDetails = [
                    data.request1, data.request2, data.request3, data.request4,
                    data.request5, data.request6, data.request7, data.request8,
                    data.request9, data.request10, data.request11, data.request12,
                    data.request13, data.request14
                ].filter(value => value !== null && value !== undefined && value !== ''); // 빈 문자열도 제외

                // request_type 변환
                let requestTypeText = '';
                if (data.request_type == 1) requestTypeText = '원룸/소형 이사';
                else if (data.request_type == 2) requestTypeText = '청소';
                else if (data.request_type == 3) requestTypeText = '폐기물';

                // 모달에 데이터 표시
                document.querySelector('.modalContainer').innerHTML = `
                    <h1>${requestTypeText}</h1>
                    <br>
                    <h1> 요청 상세 </h1>
                    ${requestDetails.map(detail => `<div>${detail}</div>`).join('')}
                    <button class="close-btn" onclick="closeModal()">닫기</button>
                `;
            })
                .catch(error => {
                    console.error('에러 발생:', error);
                });
        });
    });
};

document.addEventListener("DOMContentLoaded", function (){

      let deleteBtns = document.querySelectorAll(".requestDelete");
     deleteBtns.forEach(function (deleteBtn){

            deleteBtn.addEventListener("click", function (){
             let requestNo = deleteBtn.getAttribute("data-request-no");

                let ok = confirm('정말 삭제하시겠습니까?');
            if (ok){
                location.href=`/request-delete?pk=${requestNo}`;
            }

            });


});
});



