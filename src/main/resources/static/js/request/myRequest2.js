

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
                        data.request1, data.request2, data.request3, data.request4,
                        data.request5, data.request6, data.request7, data.request8,
                        data.request9, data.request10, data.request11, data.request12,
                        data.request13, data.request14
                    ].filter(value => value !== null && value !== undefined && value !== '');

                    let requestTypeText = '';
                    if (data.request_type == 1) requestTypeText = '원룸/소형 이사';
                    else if (data.request_type == 2) requestTypeText = '청소';
                    else if (data.request_type == 3) requestTypeText = '폐기물';

                    document.querySelector('.modalContainer1').innerHTML = `
                    <h1>${requestTypeText}</h1>
                    <br>
                    <h1> 요청 상세 </h1>
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
                        `<h1>견적</h1>`,
                        `<strong>견적 내용:</strong> ${data.r_comment || '정보 없음'}`,
                        `<strong>예상금액:</strong> ${data.r_price ? '총' + data.r_price + '원' : '정보 없음'}`,
                        `<br>`,
                        data.pro_profile_img ? `<img src="${data.pro_profile_img}" alt="프로필 이미지" style="width:100px;height:100px;border-radius:50%;">` : '',
                        `<strong>이름:</strong> ${data.pro_name || '정보 없음'}`,
                        `<strong>카테고리:</strong> ${data.pro_category || '정보 없음'}`,
                        `<strong>주소:</strong> ${data.pro_address || '정보 없음'}`,
                        `<strong>설명:</strong> ${data.pro_description || '정보 없음'}`,
                        `<strong>전화번호:</strong> ${data.pro_phone || '정보 없음'}`

                    ].filter(value => value !== '').join('<br>');

                    // 모달 내용 업데이트
                    document.querySelector('#modalContainer2').innerHTML = `
                
                    <h1>견적 상세</h1>
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