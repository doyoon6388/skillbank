<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/findpro/findpro.css">
    <meta charset="UTF-8">
    <title>Title</title>

</head>
<body>
<div id="findpro-search-container">
    <h1>プロを探す</h1>
    <div class="findpro-filter-wrapper">
        <div class="findpro-filter-left">
            <select id="service-main-category" name="pro-category">
                <option value="category_all" selected>すべてのサービス</option>
                <option value="원룸/소형 이사">引っ越し全般</option>
                <option value="청소">クリーニング全般</option>
                <option value="폐기물 처리">폐기물 처리</option>
            </select>
        </div>

    <!-- ✅ 오른쪽: 필터, 검색창, 지도 버튼, 고수 리스트를 함께 정렬 -->
    <div class="findpro-filter-right">
        <div class="findpro-filter-options">
            <select id="service-filtering" name="service-filtering">
                <option value="review" selected> 口コミが多い順</option>
                <option value="favorite">찜 수</option>
            </select>
        </div>
    </div> <!-- ✅ filter-right 끝 -->
</div> <!-- ✅ filter-wrapper 끝 -->
</div> <!-- ✅ search-container 끝 -->

<div class="findpro-pros" id="pro-list-container"></div>

</body>
<script src="/resources/js/findpro/findpro.js"></script>
</html>