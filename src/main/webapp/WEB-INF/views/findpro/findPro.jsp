<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
        <link rel="stylesheet" href="/resources/css/findpro.css">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>


<div id="search-container">
    <form action="findPro.jsp" method="get">
        <div class="filter-wrapper">
            <!-- ✅ 왼쪽: 서비스 및 지역 필터링 -->
            <div class="filter-left">
                <label for="service-MainCategory">상세 서비스 선택:</label>
                <select id="service-MainCategory">
                    <option value="category_service" selected>서비스</option>
                    <option value="category_express">이사</option>
                    <option value="category_clean">청소</option>
                </select>

                <label for="service-express-SubCategory">이사 세부 카테고리 선택:</label>
                <select id="service-express-SubCategory" disabled>
                    <option value="express_sv_all">이사 전체</option>
                    <option value="express_sv_home">가정 이사</option>
                    <option value="express_sv_office">사무실 이사</option>
                    <option value="express_sv_oneroom">원룸 이사</option>
                    <option value="express_sv_van">용달/화물</option>
                </select>

                <label for="service-clean-SubCategory">청소 세부 카테고리 선택:</label>
                <select id="service-clean-SubCategory" disabled>
                    <option value="clean_sv_all">청소 전체</option>
                    <option value="clean_sv_home">입주/집 청소</option>
                    <option value="clean_sv_office">사무실/사업장 청소</option>
                    <option value="clean_sv_furniture">가전/가구 청소</option>
                    <option value="clean_sv_trash">철거/폐기</option>
                </select>
            </div>

            <!-- 중간 공간 추가 -->
            <div class="filter-gap"></div>

            <!-- ✅ 오른쪽: 필터, 검색창, 지도, 고수 리스트 -->
            <div id="search-results-container">
                <div class="filter-right">
                    <label for="service-filtering">서비스 필터링:</label>
                    <select id="service-filtering">
                        <option value="reviewfilter" selected>리뷰 많은순</option>
                        <option value="ratingfilter">평점순</option>
                        <option value="usagefilter">고용순</option>
                    </select>

                    <input type="search" id="findpro_search" placeholder="어떤 서비스가 필요하세요?">
                    <input type="button" id="findpro_map" value="지도">
                </div>

                <!-- ✅ 수평선 추가 -->
                <hr class="separator">

                <!-- ✅ 고수 리스트 -->
                <div id="service-provider-list">
                    <div class="service-provider">
                        <div class="service-provider-info">
                            <div class="name">한울 이사</div>
                            <div class="details">★ 4.7 (22) · 26회 고용 · 경력 30년</div>
                            <div class="description">이사 전문 브랜드 한울 이사</div>
                        </div>
                        <img src="images/moving1.jpg" alt="한울 이사">
                    </div>
                </div>
            </div> <!-- ✅ search-results-container 끝 -->
        </div> <!-- ✅ filter-wrapper 끝 -->
    </form>
</div> <!-- ✅ search-container 끝 -->

</body>
</html>