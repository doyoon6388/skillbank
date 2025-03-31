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

<div class="receiveWrapper">
    <c:forEach items="${proRequest}" var="p">
        <div onclick="location.href='/request-send?no=${p.request_no}&userId=${p.r_user_id}'" class="receiveContainer"
             style="display:
             <c:choose>
             <c:when test="${p.r_pro_pk != 0 && p.r_pro_pk != sessionScope.proSession.pro_pk}">
                     none
             </c:when>
             <c:otherwise>
                     block
             </c:otherwise>
             </c:choose>;"
        >
            <div class="receiveItem">
                <div><img src="/file/${p.user_profile_img}" alt=""></div>

                <h1 id="receiveTitle">${p.request_type}</h1>
                <span id="">${p.user_nickname} </span>
                <c:if test="${p.r_pro_pk == sessionScope.proSession.pro_pk}">
                    <span class="badge">指定依頼</span>
                </c:if>
            </div>
            <div class="receiveItem2">
                <span>${p.request10}</span>
                <span>${p.request4}</span>

            </div>

        </div>
    </c:forEach>
</div>

</body>
</html>