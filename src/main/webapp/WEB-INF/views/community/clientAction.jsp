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
<%--        <p>DEBUG: <c:out value="${i.commu_writer}"/></p>--%>
        <div class="client-post-card" onclick="location.href='/community/detail?postId=${i.commu_post_id}'">
            <div class="client-post-header">
                <div class="client-post-author">
                    投稿者 ${i.commu_user_id}
<%--                    <c:if test="${i.commu_writer == 0}">--%>
<%--                        <span class="pro-label">プロ</span>--%>
<%--                    </c:if>--%>
                </div>
                <div class="client-post-date">
                    <p class="community-date"
                       data-date="<fmt:formatDate value='${i.commu_date}' pattern='yyyy-MM-dd\'T\'HH:mm:ss'/>">
                    </p>
                </div>            </div>
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

<script src="/resources/js/community/community.js"></script>
</body>
</html>