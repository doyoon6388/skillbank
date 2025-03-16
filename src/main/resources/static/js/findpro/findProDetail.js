document.addEventListener("DOMContentLoaded", function() {
    initMap();
}); // ready 함수 끝

function toggleFavorite() {
    loginCheck();
    const pro_pk = document.getElementById('proDetail-pro-pk').value;
    const user_pk = document.getElementById('current-user-pk').value;
    fetch('/findpro/favorite', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({pro_pk, user_pk})
    })
        .then(response => {
            return response.json();
        })
        .then(data => {
            // 서버 응답 예시: { favorited: true, favoriteCount: 10 }
            const favoriteIcon = document.getElementById('favorite-icon');
            const favoriteCount = document.getElementById('favorite-count');

            if (data.favorited) {
                favoriteIcon.src = "/resources/icons/findPro/filled_star.png";
            } else {
                favoriteIcon.src = "/resources/icons/findPro/empty_star.png";
            }
            favoriteCount.textContent = data.favoriteCount;
        })
        .catch(err => console.error("찜하기 처리 에러:", err));
}

// Google Maps API의 콜백으로 호출됨
function initMap() {
    // proAddress는 JSP에서 숨겨진 p 태그로 전달됨
    let address = document.getElementById('proAddress').textContent;

    let geocoder = new google.maps.Geocoder();

    // 주소를 위도/경도로 변환
    geocoder.geocode({ 'address': address }, function(results, status) {
        if (status === 'OK') {
            let mapOptions = {
                zoom: 15,
                center: results[0].geometry.location
            };
            // 지도 생성: id="map"인 div에 지도 표시
            let map = new google.maps.Map(document.getElementById('findpro-map'), mapOptions);

            // 주소 위치에 마커 표시
            let marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        } else {
            console.error('Geocode 실패: ' + status);
            alert('주소를 지도에 표시할 수 없습니다. (Error: ' + status + ')');
        }
    });
}

function loginCheck(){
    if (!isLoggedIn) {
        window.location.href = '/login';
    }
}