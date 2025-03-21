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
        <h3>プロに聞く</h3>
    </div>
</div>

<div class="pro-post-list">
    <c:forEach var="i" items="${communityPost}">
        <div class="pro-post-card" onclick="location.href='/community/detail?postId=${i.commu_post_id}'">
            <div class="pro-post-header">
                <div class="pro-post-author">
                    投稿者 ${i.commu_user_id}
                </div>
                <div class="pro-post-date">
                    <fmt:formatDate value="${i.commu_date}" pattern="yyyy/MM/dd HH:mm"/>
                </div>
            </div>
            <div class="pro-post-title">
                [${i.commu_title}]
            </div>
            <div class="pro-post-content">
                    ${i.commu_content}
            </div>
            <div class="client-post-wrapper">
                <img src="/file/${i.commu_image}" alt="" style="width: 100px; height: 100px;">
            </div>
<%--            <div class="community-like-number">いいね: ${i.commu_like}</div>--%>
            <div class="community-like-number">
                いいね:
                <c:choose>
                    <c:when test="${i.commu_like > 0}">
                        <span class="like-count">${i.commu_like}個</span>
                    </c:when>
                    <c:otherwise>
                        <span class="like-count">0個</span>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </c:forEach>
</div>

<div class="community-paging">
    <c:if test="${currentPage > 1}">
        <a href="?page=1"><<</a>
        <a href="?page=${currentPage - 1}"><</a>
    </c:if>

    <c:forEach var="p" begin="${startPage}" end="${totalPage}">
        <a href="?page=${p}" class="${p == currentPage ? 'active' : ''}">${p}</a>
    </c:forEach>

    <c:if test="${currentPage < totalPage}">
        <a href="?page=${currentPage + 1}">></a>
        <a href="?page=${totalPage}">>></a>
    </c:if>
</div>
<div style="display: none">
    <input type="text" value="${currentPage}" name="currentPage">
    <input type="text" value="${start}" name="start">
    <input type="text" value="${end}" name="end">
    <input type="text" value="${totalPage}" name="totalPage">
</div>

<script src="/resources/js/community/community.js"></script>

</body>
</html>