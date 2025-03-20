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



        <div class="container1">
            <div class="myRquestDate"><span>요청일</span><div>${request.request4}</div></div>
            <span>${request.request10}</span>
            <h1>${request.request_type}</h1>

            <div class="btn2">
                <button class="myRequestOpenModalBtn" value="${request.request_no}">내 요청 보기</button>
            </div>
        </div>


<div class="proResponseContainer">
    <c:forEach items="${proResponse}" var="p">
        <div class="proCard">
            <!-- 프로필 이미지 -->
            <div class="proImgWrapper">
                <img src="/file/${p.pro_profile_img}" alt="프로필 이미지" class="proImg">
            </div>

            <!-- 전문가 정보 -->
            <div class="proInfo">
                <h3 class="proName">${p.pro_name}</h3>
                <div class="proReview">⭐ ${p.pro_review}</div>
                <div class="proAddress">${p.pro_address}</div>
            </div>

            <!-- 가격 정보 -->
            <div class="proPrice">
                <span>총 ${p.r_price}원</span>
            </div>

            <!-- 버튼 -->
            <div class="proActions">
                <button class="myRequestOpenModalBtn2" value="${request.request_no}"> 견적서 보기</button>
                <button class="btn chatBtn" >채팅하기</button>
            </div>
        </div>
    </c:forEach>
</div>





<div id="modal-overlay" onclick="closeModal()"></div>
<div id="modal">
    <div class="modalContainer">
    </div>
</div>

<div id="modal-overlay2" onclick="closeModal2()"></div>
<div id="modal2">
    <div class="modalContainer2">
    </div>
</div>
<script>


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

    function openModal2() {
        document.getElementById("modal2").style.display = "block";
        document.getElementById("modal-overlay2").style.display = "block";
    }

    // 모달 닫기
    function closeModal2() {
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