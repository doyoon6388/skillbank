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
    <div>
        <h3>助け合い</h3>
    </div>
</div>

<div class="client-post-list">
    <c:forEach var="i" items="${communityPost}">
        <div class="client-post-card">
            <div class="client-post-header">
                <div class="client-post-author">
                    投稿者 ${i.commu_user_id}
                </div>
                <div class="client-post-date">
                    <fmt:formatDate value="${i.commu_date}" pattern="MM/dd - HH:mm"/>
                </div>
            </div>
            <div class="client-post-title">
                [${i.commu_title}]
            </div>
            <div class="client-post-content">
                    ${i.commu_content}
            </div>
            <div class="client-post-wrapper">
                <img src="/file/${i.commu_image}" alt="" style="width: 100px; height: 100px;">
            </div>
        </div>
    </c:forEach>
</div>

<div class="community-paging">
    <c:if test="${currentPage > 1}">
        <a href="?page=1"><<</a>
        <a href="?page=${currentPage - 1}"><</a>
    </c:if>

    <c:forEach var="p" begin="1" end="${totalPage}">
        <a href="?page=${p}" class="${p == currentPage ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${currentPage < totalPage}">
        <a href="?page=${currentPage + 1}">></a>
        <a href="?page=${totalPage}">>></a>
    </c:if>
</div>


</body>
</html>