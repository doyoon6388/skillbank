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
        <h3>プロのアピール</h3>
    </div>
</div>

<div class="appeal-post-list">
    <c:forEach var="post" items="${communityPost}">
        <div class="appeal-post-card" onclick="location.href='/community/detail?postId=${post.commu_post_id}'">
            <div class="appeal-post-header">
                <div class="appeal-post-author">
                    投稿者: ${post.commu_user_id}
                </div>
                <div class="appeal-post-date">
                    <fmt:formatDate value="${post.commu_date}" pattern="MM/dd - HH:mm"/>
                </div>
            </div>
            <div class="appeal-post-title">
                [${post.commu_title}]
            </div>
            <div class="appeal-post-content">
                    ${post.commu_content}
            </div>
            <div class="appeal-post-wrapper">
                <img src="/file/${post.commu_image}" alt="画像" style="width: 100px; height: 100px;">
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