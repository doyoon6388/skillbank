<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL関数を使うなら -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<div class="community-button2-container">
    <!-- 一番人気の投稿 -->
    <div class="top-posts">
        <h3>一番人気の投稿</h3>
        <c:if test="${not empty topPosts}">
            <div class="post-list">
                <c:forEach var="post" items="${topPosts}">
                    <div class="post-card">
                        <!-- タイトル -->
                        <div class="post-title">${post.commu_title}</div>

                        <!-- いいね数 -->
                        <div class="post-like">いいね数: ${post.commu_like}</div>

                        <!-- 投稿日時 -->
                        <div class="post-date">
                            投稿日:
                            <fmt:formatDate value="${post.commu_date}" pattern="yyyy/MM/dd"/>
                        </div>

                        <!-- 投稿画像(ある場合) -->
                        <c:if test="${not empty post.commu_image && post.commu_image != 'defaultCommuImg.png'}">
                            <img src="/file/${post.commu_image}" alt="投稿画像" style="max-width:100%;">
                        </c:if>

                        <!-- 本文のサマリ表示（長い場合は一部だけ） -->
                        <c:if test="${not empty post.commu_content}">
                            <div>
                                <c:out value="${fn:substring(post.commu_content, 0, 60)}"/>...
                            </div>
                        </c:if>

                        <!-- 詳細ページへのリンク -->
                        <a class="read-more" href="/community/detail?postId=${post.commu_post_id}">
                            続きを読む
                        </a>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <div>
            <h3>＜満足度高い＞最新投稿</h3>
        </div>
    </div>

</body>
</html>