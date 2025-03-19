document.addEventListener("DOMContentLoaded", function () {
    initMap();

    document.querySelector(".findpro-favorite-btn").addEventListener('click', () => {


        const pro_pk = document.getElementById('proDetail-pro-pk').value;
        const user_pk = document.getElementById('current-user-pk').value;
        fetch('/findpro/favorite', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({pro_pk, user_pk})
        })
            .then(response => response.json())
            .then(data => {
                if (data.loginRequired) {
                    window.location.href = '/login';
                    return;
                }

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
    })

}); // ready 함수 끝


// Google Maps API의 콜백으로 호출됨
function initMap() {
    // proAddress는 JSP에서 숨겨진 p 태그로 전달됨
    let address = document.getElementById('proAddress').textContent;

    let geocoder = new google.maps.Geocoder();

    // 주소를 위도/경도로 변환
    geocoder.geocode({'address': address}, function (results, status) {
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

function openModal() {
    if (loginCheck()) {
        document.getElementById("findModal").style.display = "block";

        // data-pro-category 속성에서 값 가져오기
        var category = document.getElementById("proD").getAttribute("data-pro-category");

        console.log("Category:", category); // 디버깅용

        if (category === "청소") {
            loadStep(1);
        } else if (category === "원룸/소형 이사") {
            loadStep2(1);
        }
    }
}

function closeModal() {
    document.getElementById("findModal").style.display = "none";
    location.reload();
}

function loginCheck() {
    if (!isLoggedIn) {
        window.location.href = '/login'
        return false;
    } else {
        return true;
    }
}