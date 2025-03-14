<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/findpro.css">
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="/resources/js/findpro/findpro.js"></script>
</head>
<body>
<div id="search-container">
    <div class="findpro-header"> プロを探す</div>
    <div class="filter-wrapper">
        <div class="filter-left">
            <select id="service-MainCategory" name="asd">
                <option value="category_all" selected>すべてのサービス</option>
                <option value="category_express">引っ越し全般</option>
                <option value="category_clean">クリーニング全般</option>
                <option value="category_express">폐기물 처리</option>
            </select>
        </div>

    <!-- ✅ 오른쪽: 필터, 검색창, 지도 버튼, 고수 리스트를 함께 정렬 -->
    <div class="filter-right">
        <div class="filter-options">
            <select id="service-filtering" name="">
                <option value="review" selected> 口コミが多い順</option>
                <option value="favorite">찜 수</option>
            </select>
        </div>
    </div> <!-- ✅ filter-right 끝 -->
</div> <!-- ✅ filter-wrapper 끝 -->
</div> <!-- ✅ search-container 끝 -->
<%--<div>
    <button onclick="location.href='/findprotomap'" type="button" id="findpro_map">
        またはマップ!
    </button>
</div>--%>
</body>
</html>