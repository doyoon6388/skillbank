<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/request/request.css">
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .mainRequestWrapper {
            display: flex; /* 가로 정렬 */
            gap: 30px; /* 요소 간 간격 */
            justify-content: center; /* 가운데 정렬 */
            align-items: center; /* 세로 정렬 */
        }

        .mainRequestWrapper div {
            text-align: center; /* 텍스트 중앙 정렬 */
            cursor: pointer; /* 클릭 가능하도록 설정 */
        }

        .mainRequestWrapper img {
            width: 200px; /* 정사각형 크기 */
            height: 200px;
            object-fit: cover; /* 품질 유지 및 크롭 */
            border-radius: 10px; /* 모서리를 둥글게 */
        }

        .mainRequestWrapper spna {
            display: block; /* 아래로 정렬 */
            margin-top: 10px; /* 이미지와 텍스트 간격 */
            font-size: 16px;
            font-weight: bold;
        }
    </style>
</head>
<body>


    <h1> 견적요청</h1>

    <div class="mainRequestWrapper">
        <div onclick="location.href='/move'"><img src="https://static.cdn.soomgo.com/upload/service/11bd8485-cc6a-416e-b186-692a39b4e9a1.png?h=302&w=452&webp=1"><spna>원룸/소형이사</spna> </div>
        <div onclick="location.href='/clean'"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTmn4pRBo-5sX2ve2Or-5X7FKC56Cc4A7O9w&s"><spna>에어컨 청소</spna> </div>
        <div><img src="https://static.cdn.soomgo.com/upload/service/9248d94a-60a6-4935-9322-750841c988df.png?h=302&w=452&webp=1"><spna>폐기물 처리</spna> </div>
    </div>


</body>
</html>