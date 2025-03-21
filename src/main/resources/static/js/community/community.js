window.onload = () => {

    const commentBtn = document.querySelector("#community-comment-btn");
    if (commentBtn) {
        commentBtn.addEventListener('click', () => {
            let communityCommentVO = {
                comment_post_id: document.querySelector('#comment-page-post-id').value,
                user_nickname: document.querySelector('#comment-page-user-nickname').value,
                user_id: document.querySelector('#comment-page-user-id').value,
                comment_content: document.querySelector('#comment-page-comment-content').value
            };

            console.log(communityCommentVO);
            fetch('/community/comment', {
                method: 'post',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(communityCommentVO) // JSON 형식으로 변환
            }).then(response => response.json()) // 응답을 JSON으로 변환
                .then(data => {
                    // loginCheck
                    if (data.loginRequired) {
                        window.location.href = '/login';
                        return;
                    }
                    console.log("서버 응답:", data);

                    if (data.commentListResponse.length > 0) { // 정상적으로 댓글 목록이 반환된 경우
                        let commentList = document.querySelector(".community-comment-list"); // 댓글이 들어갈 영역 선택
                        commentList.innerHTML = ""; // 기존 목록 초기화

                        data.commentListResponse.forEach(comment => {
                            let commentItem = document.createElement("div");
                            commentItem.classList.add("community-comment");
                            commentItem.innerHTML = `
                    <p class="community-comment-author">${comment.user_nickname}</p>
                    <p class="community-comment-content">${comment.comment_content}</p>
                    <p class="community-comment-date">${formatDate(comment.comment_date)}</p>
                `;
                            commentList.appendChild(commentItem);
                        });

                        // 입력창 초기화
                        document.querySelector("#comment-page-comment-content").value = "";
                    }
                })
                .catch(error => console.error("오류 발생:", error));
        });
    }

    // 날짜 포맷 함수 (JSP fmt:formatDate 대체)
    function formatDate(dateString) {
        let date = new Date(dateString);
        return date.toLocaleString("ja-JP", {
            year: "numeric", month: "2-digit", day: "2-digit",
            hour: "2-digit", minute: "2-digit"
        });
    }

    // いいね
    document.querySelector(".community-like").addEventListener("click", () => {
        const post_id = document.getElementById('community-like-id').value;
        const user_id = document.getElementById('current-user-pk').value;
        console.log(post_id, user_id);
        fetch('/community/like', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({post_id, user_id})
        }).then(response => response.json())
            .then(data => {
                if (data.loginRequired) {
                    window.location.href = '/login';
                    return;
                }
                // 서버 응답 예시: { favorited: true, favoriteCount: 10 }
                const likeIcon = document.getElementById('like-icon');
                const likeCount = document.getElementById('like-count');
                if (data.favorited) {
                    likeIcon.src = "/icons/profile/community/filled_heart.png";
                } else {
                    likeIcon.src = "/icons/profile/community/empty_heart.png";
                }
                likeCount.textContent = data.likeCount;

            })
            .catch(err => console.error("찜하기 처리 에러:", err));
    })



} // ready 함수 끝


// community.js

window.addEventListener("load", function () {
    // 「community-date」クラスを持つ要素を全て取得
    const dateElements = document.querySelectorAll(".community-date");

    dateElements.forEach(el => {
        // data-date 属性から文字列を取得
        let dateString = el.getAttribute("data-date");
        console.log("dateString:", dateString); // デバッグ

        // 取得した文字列を timeAgo 関数で加工して表示
        if (dateString) {
            el.textContent = timeAgo(dateString);
        }
    });

    // 선택메뉴 활성화
    const tabs = document.querySelector(".community-client-tab").children;
    const pathname = window.location.pathname;
    const segments = pathname.split('/').filter(segment => segment !== '');
    const lastSegment = segments[segments.length - 1];
    Array.from(tabs).forEach((tab) => {
        console.log(tab.dataset.category)
        if (lastSegment == tab.dataset.category) {
            tab.classList.add("active")
        }
    });

});
    // 선택메뉴 활성화
    const tabs = document.querySelector(".community-pro-tab").children;
    const pathname = window.location.pathname;
    const segments = pathname.split('/').filter(segment => segment !== '');
    const lastSegment = segments[segments.length - 1];
    Array.from(tabs).forEach((tab) => {
        console.log(tab.dataset.category)
        if (lastSegment == tab.dataset.category) {
            tab.classList.add("active")
        }
    });


/**
 * timeAgo関数: 日付文字列を「○○前」の形式に変換
 */
function timeAgo(dateString) {
    let date = new Date(dateString);
    let now = new Date();
    let diff = now - date; // ミリ秒差

    let seconds = Math.floor(diff / 1000);
    let minutes = Math.floor(seconds / 60);
    let hours = Math.floor(minutes / 60);
    let days = Math.floor(hours / 24);
    let weeks = Math.floor(days / 7);
    let months = Math.floor(days / 30);
    let years = Math.floor(days / 365);

    if (years > 0) {
        return years + "年前";
    } else if (months > 0) {
        return months + "ヶ月前";
    } else if (weeks > 0) {
        return weeks + "週間前";
    } else if (days > 0) {
        return days + "日前";
    } else if (hours > 0) {
        return hours + "時間前";
    } else if (minutes > 0) {
        return minutes + "分前";
    } else {
        return "今";
    }
}


// ハンバーガーメニュー
