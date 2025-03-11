window.onload = () => {

    document.querySelector('#changeButton').addEventListener('click', () => {
        document.getElementById('fileInput').click();
    })

    document.querySelector('#mypage-profile-img-change-btn').addEventListener('click', () => {
        document.querySelector('.mypage-profile-change-modal').style.display = "block";
    })
    document.querySelector(".mypage-profile-change-modal-close").addEventListener('click', () => {
        document.querySelector('.mypage-profile-change-modal').style.display = "none";
    })

}

// 파일이 선택되면 미리보기 이미지를 업데이트하고 제출 버튼을 표시합니다.
function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            // 선택된 파일의 데이터를 미리보기 이미지로 설정
            document.getElementById('profilePreview').src = e.target.result;
            // 파일 선택 후 제출 버튼을 표시하고 변경하기 버튼은 숨김 처리
            document.getElementById('submitButton').style.display = 'inline-block';
            document.getElementById('changeButton').style.display = 'none';
        }
        reader.readAsDataURL(file);
    }
}
