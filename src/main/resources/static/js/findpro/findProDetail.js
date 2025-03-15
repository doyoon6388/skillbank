function toggleFavorite() {
    if (!isLoggedIn) {
        // 로그인 되어 있지 않으면 로그인 페이지로 이동
        window.location.href = '/login';
        return;
    }

    // 요청 전에 값 확인
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