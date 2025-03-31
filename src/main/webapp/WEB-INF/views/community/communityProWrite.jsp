<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新規登録フォーム</title>
    <link rel="stylesheet" href="/resources/css/community/communityClientWrite.css">
</head>
<body>

<div class="community-write-container">
    <h1>投稿ページ</h1>
    <form action="/community/write" method="post" enctype="multipart/form-data" class="community-write-form">

        <!-- 카테고리 -->
        <div class="community-input-box">
            <label for="category">カテゴリー</label>
            <select name="commu_post_category" id="category" required class="community-select">
                <option value="" disabled selected>カテゴリーを選んでください</option>
                <option value="together">一緒に</option>
                <option value="appeal">プロのアピール</option>
            </select>
        </div>

        <!-- 파일 업로드 -->
        <div class="community-input-box">
            <label for="file">画像アップロード</label>
            <input type="file" id="file" name="file" class="community-file">
        </div>

        <!-- 제목 -->
        <div class="community-input-box">
            <label for="title">タイトル</label>
            <input type="text" id="title" name="commu_title" placeholder="タイトルを入力" required>
        </div>

        <!-- 내용 -->
        <div class="community-input-box">
            <label for="content">内容</label>
            <textarea id="content" name="commu_content" placeholder="内容を入力" rows="6" required></textarea>
        </div>

        <!-- 숨겨진 유저 ID -->
        <input type="hidden" name="commu_user_id" value="${sessionScope.user.user_pk}">

        <!-- ✅ 버튼 영역 (투고 + 되돌아가기) -->
        <div class="community-submit-box">
            <button type="button" class="community-history-back" onclick="history.back()">戻る</button>
            <button type="submit" class="community-submit-btn">投稿</button>
        </div>
    </form>
</div>

<script src="/resources/js/community/community.js"></script>
</body>
</html>