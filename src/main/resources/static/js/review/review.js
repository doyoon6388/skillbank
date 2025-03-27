// review-star-rating 영역과 rating hidden input 선택
const starRatingContainer = document.getElementById('starRating');
const ratingValue = document.getElementById('ratingValue');
const reviewStars = starRatingContainer.querySelectorAll('.review-star');

// 별 이미지를 업데이트하는 함수 (클릭 또는 마우스 오버에 따른 효과)
function updateReviewStars(rating) {
    reviewStars.forEach(star => {
        const starValue = parseInt(star.getAttribute('data-value'));
        const img = star.querySelector('img');
        if (starValue <= rating) {
            img.src = '/resources/icons/findPro/filled_star.png';
        } else {
            img.src = '/resources/icons/findPro/empty_star.png';
        }
    });
}

// 각 별에 마우스 오버 및 클릭 이벤트 추가
reviewStars.forEach(star => {
    // 마우스 오버 시 해당 별까지 채워진 이미지 표시
    star.addEventListener('mouseover', () => {
        const value = parseInt(star.getAttribute('data-value'));
        updateReviewStars(value);
    });

    // 클릭 시 선택한 별점 저장 및 업데이트
    star.addEventListener('click', () => {
        const value = parseInt(star.getAttribute('data-value'));
        ratingValue.value = value;
        updateReviewStars(value);
    });
});

// 마우스가 영역을 벗어나면 현재 선택된 별점으로 복원
starRatingContainer.addEventListener('mouseout', () => {
    updateReviewStars(parseInt(ratingValue.value));
});