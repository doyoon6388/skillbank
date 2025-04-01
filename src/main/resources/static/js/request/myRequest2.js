

window.onload = () => {
    document.querySelectorAll('.myRequestOpenModalBtn').forEach(button => {
        button.addEventListener('click', () => {
            let pk = button.value;
            openModal('modalContainer1'); // 요청 모달 열기

            fetch("/my-request-detail?pk=" + encodeURIComponent(pk), {
                method: 'GET',
                headers: {'Content-Type': 'application/json'}
            })
                .then(response => {
                    if (!response.ok) throw new Error('서버 요청 실패');
                    return response.json();
                })
                .then(data => {
                    const requestDetails = [
                        data.request_type,
                        data.request1, data.request2, data.request3, data.request4,
                        data.request5, data.request6, data.request7, data.request8,
                        data.request9, data.request10, data.request11, data.request12,
                        data.request13, data.request14
                    ].filter(value => value !== null && value !== undefined && value !== '');


                    document.querySelector('.modalContainer1').innerHTML = `
                    
                    <br>
                    <h1> 依頼詳細 </h1>
                    ${requestDetails.map(detail => `<div>${detail}</div>`).join('')}
                    <button class="close-btn" onclick="closeModal('modalContainer1')">닫기</button>
                `;
                })
                .catch(error => console.error('에러 발생:', error));
        });
    });

    document.querySelectorAll('.myRequestOpenModalBtn2').forEach(button => {
        button.addEventListener('click', () => {
            let pk = button.value;
            openModal('modalContainer2'); // 모달 열기

            fetch("/my-response-detail?pk=" + encodeURIComponent(pk), {
                method: 'GET',
                headers: {'Content-Type': 'application/json'}
            })
                .then(response => {
                    if (!response.ok) throw new Error('서버 요청 실패');
                    return response.json();
                })
                .then(data => {
                    const responseDetails = [
                        `<h1>見積</h1>`,
                        `<strong>見積書内容:</strong> ${data.r_comment || '정보 없음'}`,
                        `<strong>予想金額:</strong> ${data.r_price ? '総額' + data.r_price + '円' : '정보 없음'}`,
                        `<br>`,
                        data.pro_profile_img ? `<img src="/file/${data.pro_profile_img}" alt="프로필 이미지" style="width:100px;height:100px;border-radius:50%;">` : '',
                        `<strong>プロ名:</strong> ${data.pro_name || '정보 없음'}`,
                        `<strong>カテゴリー:</strong> ${data.pro_category || '정보 없음'}`,
                        `<strong>アドレス:</strong> ${data.pro_address || '정보 없음'}`,
                        `<strong>自己紹介:</strong> ${data.pro_description || '정보 없음'}`,
                        `<strong>電話番号:</strong> ${data.pro_phone || '정보 없음'}`

                    ].filter(value => value !== '').join('<br>');

                    // 모달 내용 업데이트
                    document.querySelector('#modalContainer2').innerHTML = `
                
                    <h1>見積もり詳細</h1>
                    <br>
                    ${responseDetails}
                    <br>
                    <button class="close-btn" onclick="closeModal('modalContainer2')">닫기</button>
                </div>
            `;
                })
                .catch(error => console.error('에러 발생:', error));
        });
    });
}
// 특정 모달 열기
function openModal(modalId) {
    document.querySelector(`.${modalId}`).style.display = 'block';
}

// 특정 모달 닫기
function closeModal(modalId) {
    document.querySelector(`.${modalId}`).style.display = 'none';
}