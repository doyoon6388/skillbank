<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>견적 요청</title>

    <link rel="stylesheet" href="resources/css/request/myRequest.css">
</head>
<body>
<%--
<input name="r_user_id" value="${sessionScope.user.user_pk}" hidden="hidden">
--%>


    <c:forEach items="${proRequest}" var="p">
        <div class="container1">
<div>
    <div ><img src="/file/${p.user_profile_img}" alt=""></div>

           <h1>${p.request_type}</h1>
                <span>${p.user_nickname} </span>
</div>
        <div class="receive2">
            <span>${p.request10}</span>
            <span>${p.request4}</span>

            </div>

        </div>
    </c:forEach>
</div>






</body>
</html>