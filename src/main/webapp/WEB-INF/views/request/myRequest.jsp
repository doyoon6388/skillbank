<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <c:choose>
                <c:when test="${r.request_type == 1}">
                    <h1>원룸/소형 이사</h1>
                </c:when>
                <c:when test="${r.request_type == 2}">
                    <h1>청소</h1>
                </c:when>
                <c:when test="${r.request_type == 3}">
                    <h1>폐기물</h1>
                </c:when>
            </c:choose>
            <div class="btn1">
                <a href="#">견적 그만 받기</a>
                <a href="#">요청사항 추가</a>
            </div>
            <div class="btn2">
                <a href="#">내 요청 보기</a>
            </div>
        </div>
    </c:forEach>
</div>



<div id="for-div2" style="display: none">
<h1>데레시시시</h1>
</div>

</body>
</html>