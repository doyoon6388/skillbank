<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/profile.css"/>
    <script src="/resources/js/profile/profile.js"></script>
</head>
<body>
<div class="profile-container">
    <div class="profile-wrap">
        <div class="profile&toggle">
            <div class="toggle-container">
                <c:choose>
                    <c:when test="${sessionScope.user.user_hasPro == 0}">
                        <div>
                            <button onclick="location.href='/account/pro'">
                                프로 계정 생성
                            </button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <label class="toggle-switch">
                            <input type="checkbox"${checked} id="toggle-btn"
                                   onclick="toggleMode(${sessionScope.user.user_pk})"/>
                            <span class="slider"></span>
                        </label>
                    </c:otherwise>
                </c:choose>
            </div>
            <div hidden="hidden" id="user-text">
                ${sessionScope.user.user_name} 고객님
            </div>
        </div>
        <img id="profileImage1" src="/file/${sessionScope.user.user_profile_img}" alt="プロフィール画像"
             onclick="location.href='/mypage'"/>
    </div>
    <img class="chat-btn" src="/resources/icons/profile/chatUser.png" alt="채팅"
         onclick="location.href='/test/chat/list'"/>
</div>
<script>
    const username = "${sessionScope.user.user_name}";
</script>
</body>
</html>
