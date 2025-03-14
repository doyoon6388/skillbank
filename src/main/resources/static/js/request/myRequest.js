document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("for-btn").addEventListener("click", function () {
        document.getElementById("for-div").style.display = "block";
        document.getElementById("for-div2").style.display = "none";
    });

    document.getElementById("for-btn2").addEventListener("click", function () {
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
                }).then(function (data) {
                // 모달에 데이터 표시
                document.querySelector('.modalContainer').innerHTML = `
            <h1>${data.request_type == 1 ? '원룸/소형 이사' :
            data.request_type == 2 ? '청소' :
            data.request_type == 3 ? '폐기물' : ''}</h1>
            <br>
            <h1> 요청상세 </h1>
            어떤 서비스를 원하시나요?
            <div>${data.request1}</div>
            고수님과 함께 짐을 옮길 수 있나요? (포장이사 제외)
            <div>${data.request2}</div>
            <div>이사 종류를 선택해주세요.</div>
            <div>${data.request3}</div>
            이사 예정일을 선택해주세요.
            <div>${data.request4}</div>
            이사를 원하는 시간대를 선택해주세요
            <div>${data.request5}</div>
            옮길 대형 가전을 선택해주세요.
            <div>${data.request6}</div>
            옮길 소형 가전을 선택해주세요.
            <div>${data.request7}</div>
            옮길 가구를 선택해주세요.
            <div>${data.request8}</div>
            잔 짐의 양을 선택해주세요.(의류,식기,책 등의 생활 짐)
            <div>${data.request9}</div>
            <div>${data.request9}</div>
            출발지를 선택해주세요.
            <div>${data.request10}</div>
            출발지 층수를 선택해주세요.
            <div>${data.request11}</div>
            도착지를 선택해주세요.
            <div>${data.request12}</div>
            도착지 층수를 선택해주세요.
            <div>${data.request13}</div>
            해당 사항을 선택해주세요.
            <div>${data.request14}</div>

            <button class="close-btn" onclick="closeModal()">닫기</button>`;

            }).catch(function (error) {
                console.error('에러 발생:', error);
            });
        }) // click event 끝
    })
} // onload 끝

document.addEventListener("DOMContentLoaded", function (){

      let deleteBtns = document.querySelectorAll(".requestDelete");
     deleteBtns.forEach(function (deleteBtn){

            deleteBtn.addEventListener("click", function (){
             let requestNo = deleteBtn.getAttribute("data-request-no");

                let ok = confirm('정말 삭제하시겠습니까?');
            if (ok){
                location.href=`/request-delete?pk=${requestNo}` ;
            }

            });


});
});



