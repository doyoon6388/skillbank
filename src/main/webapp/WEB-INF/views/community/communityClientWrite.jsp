<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<form action="/community/write" method="post">
    <select name="commu_post_category" id="">
        <option value="" disabled selected>選んでください</option>
        <option value="together">一緒に</option>
        <option value="askpro">プロに聞く</option>
    </select>
    タイトル<input type="text" name="commu_title">
    <hr>
    内容<input type="text" name="commu_content">
    <hr>

    <button name="commu_user_id" value="${sessionScope.user.user_pk}">投稿</button>
</form>
</body>
</html>