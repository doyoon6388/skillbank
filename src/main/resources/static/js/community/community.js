window.onload=()=> {

    document.querySelector("#community-comment-btn").addEventListener('click', () => {
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
                console.log("서버 응답:", data);

                if (data.length > 0) { // 정상적으로 댓글 목록이 반환된 경우
                    let commentList = document.querySelector(".community-comment-list"); // 댓글이 들어갈 영역 선택
                    commentList.innerHTML = ""; // 기존 목록 초기화

                    data.forEach(comment => {
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
// 날짜 포맷 함수 (JSP fmt:formatDate 대체)
    function formatDate(dateString) {
        let date = new Date(dateString);
        return date.toLocaleString("ja-JP", { year: "numeric", month: "2-digit", day: "2-digit",
            hour: "2-digit", minute: "2-digit" });
}
}

