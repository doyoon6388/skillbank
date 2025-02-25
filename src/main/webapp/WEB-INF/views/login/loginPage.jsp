<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<h2>로그인</h2>
<form action="/login" method="post">
    <label>Username: </label>
    <input type="text" name="username" required/><br/>
    <label>Password: </label>
    <input type="password" name="password" required/><br/>
    <input type="submit" value="로그인"/>
</form>
<c:if test="${not empty error}">
    <div style="color:red;">${error}</div>
</c:if>
</body>
</html>