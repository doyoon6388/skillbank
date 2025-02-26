<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<script src="/resources/js/main/index.js"></script>

<body>
<div style="display: flex; justify-content: space-between">
    <div style="display: flex; width: 500px; justify-content: space-evenly">
        <div>견적요청</div>
        <div>고수찾기</div>
        <div onclick="location.href='/community'">커뮤니티</div>
    </div>
    <div>
        <jsp:include page="${loginCheck}"></jsp:include>
    </div>
</div>
<hr>
<jsp:include page="${page}"></jsp:include>
</body>
</html>