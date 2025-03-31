<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<c:forEach items="${reviews}" var="i">
    <div class="complete-review" style="cursor: pointer" onclick="location.href='/review/${i.review_pk}'">
            <div>제목 : ${i.review_title}</div>
        <div>내용 : ${i.review_txt}</div>
<%--        <div>${i.review_date}</div>--%>
    </div>
    <hr>
</c:forEach>
</body>
</html>