<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>견적 요청</title>
    <script>
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
    </script>
    <link rel="stylesheet" href="resources/css/request/myRequest.css">
</head>
<body>
<%--
<input name="r_user_id" value="${sessionScope.user.user_pk}" hidden="hidden">
--%>
<div class="btn-container">
    <button id="for-btn">견적 받는중</button>
    <button id="for-btn2">받은 견적</button>
</div>

<div id="for-div">
    <c:forEach items="${request}" var="r">
        <div class="container1">
            <span>${r.request10}</span>
            <h1>${r.request_type}</h1>
            <div class="btn1">
                <a href="/request-delete?pk=${r.request_no}">견적 그만 받기</a>
                <a href="#">요청사항 추가</a>
            </div>
            <div class="btn2">
                <button class="myRequestOpenModalBtn" value="${r.request_no}">내 요청 보기</button>
            </div>
        </div>
    </c:forEach>
</div>


<div id="for-div2" style="display: none">
    <div class="receiveRequestWrapper">
        <c:forEach items="${request}" var="r">
            <div class="receiveRequestContainer">
                <div class="receiveHeader">
                    <h1 class="receiveTitle">${r.request_type}</h1>
                    <span class="receiveDate">
                    <fmt:formatDate value="${r.r_date}" pattern="yy.MM.dd"/>
                </span>
                </div>
                <div class="progress-bar">
                    <div class="progress" style="width: 30%;"></div>
                </div>
                <div class="status">
                    <span class="step">견적요청</span>
                    <span class="step">상담진행</span>
                        <%--<span class="step">${r.status}</span>--%>
                </div>
                    <%--<div class="receiveMessage">${r.message}</div>--%>
                <div class="receiveBtn">
                    <button>자세히 보기</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div id="modal-overlay" onclick="closeModal()"></div>
<div id="modal">
    <div class="modalContainer">
    </div>
</div>
<script>
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
            <h1>\${data.request_type == 1 ? '원룸/소형 이사' :
            data.request_type == 2 ? '청소' :
            data.request_type == 3 ? '폐기물' : ''}</h1>
            <br>
            <h1> 요청상세 </h1>
            어떤 서비스를 원하시나요?
            <div>\${data.request1}</div>
            고수님과 함께 짐을 옮길 수 있나요? (포장이사 제외)
            <div>\${data.request2}</div>
            <div>이사 종류를 선택해주세요.</div>
            <div> \${data.request3}</div>
            이사 예정일을 선택해주세요.
            <div> \${data.request4}</div>
            이사를 원하는 시간대를 선택해주세요
            <div>\${data.request5}</div>
            옮길 대형 가전을 선택해주세요.
            <div>\${data.request6}</div>
            옮길 소형 가전을 선택해주세요.
            <div>\${data.request7}</div>
            옮길 가구를 선택해주세요.
            <div>\${data.request8}</div>
            잔 짐의 양을 선택해주세요.(의류,식기,책 등의 생활 짐)
            <div>\${data.request9}</div>
            출발지를 선택해주세요.
            <div>\${data.request10}</div>
            출발지 층수를 선택해주세요.
            <div>\${data.request11}</div>
            도착지를 선택해주세요.
            <div>\${data.request12}</div>
            도착지 층수를 선택해주세요.
            <div>\${data.request13}</div>
            해당 사항을 선택해주세요.
            <div>\${data.request14}</div>

            <button class="close-btn" onclick="closeModal()">닫기</button>`;

                }).catch(function (error) {
                    console.error('에러 발생:', error);
                });
            }) // click event 끝
        })
    } // onload 끝

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
</script>
</body>
</html>