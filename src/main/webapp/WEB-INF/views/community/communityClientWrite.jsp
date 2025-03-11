<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新規登録フォーム</title>
    <link rel="stylesheet" href="/resources/css/community/community.css"></link>
</head>
<body>
<div class="container">
    <form action="/community/write" method="post" enctype="multipart/form-data">
        <div class="select-and-post-btn">
            <select name="commu_post_category" id="">
                <option value="" disabled selected>選んでください</option>
                <option value="together">一緒に</option>
                <option value="askpro">プロに聞く</option>
            </select>
            <button type="submit" class="client-post-btn">投稿</button>
        </div>
        <input type="file" name="file">

        <label for="title">タイトル</label>
        <input type="text" id="title" name="commu_title" placeholder="タイトルを入力">
        <label for="content">内容</label>
        <textarea id="content" name="commu_content" placeholder="内容を入力" raws="5"></textarea>

        <input type="hidden" name="commu_user_id" value="${sessionScope.user.user_pk}">

    </form>
</div>
</body>
</html>