<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/mypage/review.css">
</head>
<body>
<div class="review-form-container">
    <form action="/mypage/updateReview" method="post" enctype="multipart/form-data">
        <div class="review-info">
            <input type="text" name="review_pro" class="review-hidden-input" value="${reviewVO.review_pro}"
                   hidden>
            <h1 class="review-title">カテゴリ</h1>
            <label class="review-radio">
                <input name="review_category" type="radio" value="원룸/소형 이사" checked> ワンルーム／小型引っ越し
            </label>
            <label class="review-radio">
                <input name="review_category" type="radio" value="청소"> クリーニング
            </label>
            <label class="review-radio">
                <input name="review_category" type="radio" value="폐기물"> 粗大ごみ回収
            </label>
            <input name="review_pk" value="${reviewVO.review_pk}" hidden>
            <br>
            <br>
            タイトル　： <input type="text" name="review_title" class="review-input" value="${reviewVO.review_title}"
                        placeholder="${reviewVO.review_title}"> <br>
            内容　：　<textarea name="review_txt" class="review-textarea" cols="30" rows="10">${reviewVO.review_txt}</textarea>
            <br>

            <!-- 파일 업로드 영역 -->
            <div class="review-file-upload">
                <label for="review_file">ファイル アップロード</label>
                <input type="file" id="review_file" name="files" accept="image/*" multiple>
            </div>

            <!-- rating -->
            <div class="review-star-rating" id="starRating">
      <span class="review-star" data-value="1">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="2">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="3">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="4">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
                <span class="review-star" data-value="5">
        <img src="/resources/icons/findPro/empty_star.png" alt="별점">
      </span>
            </div>
            <input type="hidden" name="review_star" id="ratingValue" value="0">

            <button type="submit" name="review_complete" value="1" class="review-submit-button">登録</button>
    </form>
</div>
<script src="/resources/js/review/review.js"></script>
</body>
</html>