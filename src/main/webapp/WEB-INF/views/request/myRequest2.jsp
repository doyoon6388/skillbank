<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>견적 요청</title>

    <link rel="stylesheet" href="resources/css/request/myRequest.css">
    <script src="/resources/js/request/myRequest2.js"></script>
</head>
<body>
<%--
<input name="r_user_id" value="${sessionScope.user.user_pk}" hidden="hidden">
--%>

<div class="container1">
    <div class="myRquestDate"><span>要請日</span>
        <div>${request.request4}</div>
    </div>
    <span>${request.request10}</span>
    <h1>${request.request_type}</h1>

    <div class="btn2">
        <button class="myRequestOpenModalBtn" value="${request.request_no}">自分の依頼を見る</button>
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
                <span>総額 ${p.r_price}円</span>
            </div>

            <!-- 버튼 -->
            <div class="proActions">
                <button class="myRequestOpenModalBtn2" value="${p.r_no}">見積書を見る</button>
            </div>
        </div>
    </c:forEach>
</div>

<div class="modalContainer1"
     style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 6px rgba(0,0,0,0.1);">
</div>

<!-- 응답 상세 모달 -->
<div class="modalContainer2" id="modalContainer2"
     style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 6px rgba(0,0,0,0.1);">
</div>

</body>
</html>