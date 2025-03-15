function toggleFavorite() {
    // 예시: pro_pk와 user_pk를 서버에 전달하여 찜 토글 처리

    // 요청 전에 값 확인
    const pro_pk = document.getElementById('proDetail-pro-pk').value;
    const user_pk = document.getElementById('current-user-pk').value;
    console.log("toggleFavorite 요청:", { pro_pk, user_pk });
    fetch('/findpro/favorite', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({pro_pk, user_pk})
    })
        .then(response => {
            console.log("서버 응답 상태 : ", response.status);
            return response.json();
        })
        .then(data => {
            console.log("서버 응답 데이터 : ", data)
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