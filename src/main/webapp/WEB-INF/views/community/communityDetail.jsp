<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/community/community.css"></link>
</head>
<body>

<div class="post-detail">
    <div class="post-header">
        <div class="post-author">投稿者: ${communityPost.commu_user_id}</div>
        <div class="post-date">
            <fmt:formatDate value="${communityPost.commu_date}" pattern="yyyy/MM/dd HH:mm"/>
        </div>
    </div>
    <div class="post-title">
        ${communityPost.commu_title}
    </div>
    <div class="post-wrapper">
        <c:if test="${not empty communityPost.commu_image}">
            <img src="/file/${communityPost.commu_image}" alt="画像" width="300px" height="300px"/>
        </c:if>
    </div>
    <div class="post-content" style="min-height:300px; white-space: pre-wrap;">${communityPost.commu_content}</div>

    <form action="/community/delete" method="post">
        <input type="hidden" name="postId" value="${communityPost.commu_post_id}"/>
        <button>削除</button>
    </form>

</body>
</html>