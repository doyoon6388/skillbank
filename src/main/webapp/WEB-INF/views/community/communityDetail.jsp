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

<div class="post-detail" id="post-detail">
    <c:choose>
        <%--        編集モードの場合--%>
        <c:when test="${param.mode eq 'edit'}">
            <h2 class="update-heading" id="update-heading">投稿編集</h2>
            <form class="update-form" id="update-form" action="/community/update" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="commu_post_id" value="${communityPost.commu_post_id}" id="update-post-id">
                <input type="hidden" name="commu_image" value="${communityPost.commu_image}" id="existing-image">

                <label for="commu_title" class="update-label">タイトル</label>
                <input type="text" id="commu_title" name="commu_title" value="${communityPost.commu_title}"
                       class="update-input">

                <label for="commu_content" class="update-label">内容</label>
                <textarea id="commu_content" name="commu_content" rows="5"
                          class="update-textarea">${communityPost.commu_content}</textarea>

                <label for="file" class="update-label">画像</label>
                <input type="file" id="file" name="file" class="update-file-input">

                <div class="update-button-group" id="update-button-group">
                    <button type="submit" class="community-update-btn" id="update-btn">更新</button>
                    <button type="button" class="cancel-btn" id="cancel-btn"
                            onclick="location.replace('/community/detail?postId=${communityPost.commu_post_id}')">
                        キャンセル
                    </button>
                </div>
            </form>
        </c:when>

        <%--        通常表示モードの場合--%>
        <c:otherwise>
            <div class="post-header" id="post-header">
                <div class="post-author" id="post-author">投稿者: ${communityPost.commu_user_id}</div>
                <div class="post-date" id="post-date">
                    <fmt:formatDate value="${communityPost.commu_date}" pattern="yyyy/MM/dd HH:mm"/>
                </div>
            </div>
            <div class="post-title" id="post-title">${communityPost.commu_title}</div>
            <div class="post-wrapper" id="post-wrapper">
                <c:if test="${not empty communityPost.commu_image}">
                    <img src="/file/${communityPost.commu_image}" alt="画像" width="300px" height="300px"
                         class="post-image" id="post-image"/>
                </c:if>
            </div>
            <div class="post-content" id="post-content" style="min-height:300px; white-space: pre-wrap;">${communityPost.commu_content}</div>
            <div class="community-btn-container" id="community-btn-container">
                <button class="community-history-back" id="history-back" type="button" onclick="history.back()">戻る
                </button>
                <form class="delete-form" id="delete-form" action="/community/delete" method="post"
                      style="display:inline;">
                    <input type="hidden" name="postId" value="${communityPost.commu_post_id}" id="delete-post-id"/>
                    <button class="community-delete-btn" id="delete-btn" type="submit">削除</button>
                </form>
                <form class="edit-link-form" id="edit-link-form" action="/community/detail" method="get"
                      style="display:inline;">
                    <input type="hidden" name="postId" value="${communityPost.commu_post_id}" id="edit-post-id"/>
                    <input type="hidden" name="mode" value="edit" id="edit-mode"/>
                    <button type="button" class="community-update-btn" id="edit-btn"
                            onclick="location.replace('/community/detail?postId=${communityPost.commu_post_id}&mode=edit')">修正</button>
                </form>
            </div>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
