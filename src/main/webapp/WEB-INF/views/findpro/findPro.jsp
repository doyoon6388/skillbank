<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>プロを探す</title>
    <link rel="stylesheet" href="/resources/css/findpro/findpro.css"/>
</head>
<body>

<h1>プロサーチ</h1>

<!-- ✅ 검색 및 필터 영역 -->
<section id="findpro-search-container">

    <div class="findpro-filter-wrapper">
        <!-- ✅ 왼쪽: 카테고리 필터 -->
        <div class="findpro-filter-left">
            <label for="service-main-category" class="visually-hidden">カテゴリー</label>
            <select id="service-main-category" name="pro-category">
                <option value="category_all" selected>すべてのサービス</option>
                <option value="원룸/소형 이사">引っ越し全般</option>
                <option value="청소">クリーニング全般</option>
                <option value="폐기물 처리">廃棄物処理</option>
            </select>
        </div>

        <!-- ✅ 오른쪽: 정렬 옵션 -->
        <div class="findpro-filter-right">
            <div class="findpro-filter-options">
                <label for="service-filtering" class="visually-hidden">並び替え</label>
                <select id="service-filtering" name="service-filtering">
                    <option value="review" selected>口コミが多い順</option>
                    <option value="favorite">찜 수順</option>
                </select>
            </div>
        </div>
    </div>
</section>

<!-- ✅ 프로 목록이 출력될 영역 -->
<section class="findpro-pros" id="pro-list-container">
    <%-- JS에서 동적으로 .findpro-item들을 렌더링 --%>
</section>

<script src="/resources/js/findpro/findpro.js"></script>
</body>
</html>