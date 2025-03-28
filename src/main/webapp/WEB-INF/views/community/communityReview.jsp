<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="community-button2-container">
    <h3>レビュー</h3>
</div>

<div class="client-post-list">
    <c:forEach var="i" items="${review}">
        <%--        <p>DEBUG: <c:out value="${i.commu_writer}"/></p>--%>
        <div class="client-post-card" onclick="location.href='/review/${i.review_pk}'">
            <div class="client-post-header">
                <div class="client-post-author">
                    投稿者 ${i.review_client}
                </div>
                <div class="client-post-date">
                    <p class="community-date"
                       data-date="<fmt:formatDate value='${i.review_date}' pattern='yyyy-MM-dd\'T\'HH:mm:ss'/>">
                    </p>
                </div>
            </div>
            <div class="client-post-title">
                [${i.review_title}]
            </div>
            <div class="client-post-content">
                    ${i.review_txt}
            </div>
            <div class="client-post-wrapper">
                <img src="/file/${i.review_file}" alt="" style="width: 100px; height: 100px;">
            </div>
            <div class="community-like-number">
                スコア: <span class="like-count">${i.review_star}</span>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>