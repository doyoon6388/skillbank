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

<div class="community-button2-container">
    <div>
        <h3>プロに聞く</h3>
    </div>
</div>

<c:forEach var="i" items="${communityPost}">
    ${i.commu_user_id} / ${i.commu_title} / ${i.commu_content}
    <hr>
</c:forEach>

</body>
</html>