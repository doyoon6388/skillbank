// ========================
// ✅ 모달 열기
// ========================
function openModal() {
    if (loginCheck()) {
        document.getElementById("findModal").style.display = "block";
        const category = document.getElementById("proD").getAttribute("data-pro-category");

        if (category === "청소") {
            loadCleaningStep(1);
        } else if (category === "원룸/소형 이사") {
            loadMovingStep(1);
        }
    }
}

// ========================
// ✅ 모달 닫기
// ========================
function closeModal() {
    document.getElementById("findModal").style.display = "none";
    location.reload();
}

// ========================
// ✅ 로그인 체크
// ========================
function loginCheck() {
    if (!isLoggedIn) {
        window.location.href = '/login';
        return false;
    }
    return true;
}

// ========================
// ✅ 프로그래스 바 갱신
// ========================
function updateProgressBar(step, total) {
    const progress = (step / total) * 100;
    document.getElementById("progress-bar").style.width = progress + "%";
}

function loadCleaningStep(step) {
    updateProgressBar(step, 6);

    switch (step) {
        case 1:
            renderContent(1, `
                <h2>どのタイプのエアコンをクリーニングしたいですか？</h2>
                <div class="items air">
                    ${renderCheckboxImage("壁掛け", "https://mstatic1.e-himart.co.kr/contents/goods/00/21/40/21/92/0021402192__EARB-0101FAWSD__M_640_640.jpg")}
                    ${renderCheckboxImage("窓用", "https://db.kookje.co.kr/news2000/photo/2021/0804/L20210804.99099001109i1.jpg")}
                    ${renderCheckboxImage("天井埋込型", "https://www.jeet.co.kr/goods_img/110/Limg/20180808_154354.jpg")}
                    ${renderCheckboxImage("天井吊り型", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYdBTDKvjbTLf7xUPbugA0Xh1s3sZLvLHjQA&s")}
                    ${renderCheckboxImage("床置き", "https://m.leesoo.co.kr/web/product/big/202211/43b6d9609baf1f702eb7f86c281059d7.jpg")}
                </div>
                <button onClick="loadCleaningStep(2)">다음</button>
            `);
            break;
        case 2:
            const selected = Array.from(document.querySelectorAll("input[name='request1']:checked"));
            const values = selected.map(el => el.value);
            document.getElementById("request1").value = values.join(", ");
            renderContent(1, `<h2>エアコンの種類</h2><p>${values.join(', ')}</p>`);
            renderContent(2, `
                <h2>エアコンの数量を選択してください</h2>
                <div class="items">
                    ${renderRadio("request2", "1台")}
                    ${renderRadio("request2", "2台")}
                    ${renderRadio("request2", "3台")}
                    ${renderRadio("request2", "4台")}
                    ${renderRadio("request2", "5台以上")}
                    <button onclick="loadCleaningStep(3)">다음</button>
                </div>
            `);
            break;
        case 3:
            const selected2 = document.querySelector("input[name='request2']:checked");
            if (selected2) {
                document.getElementById("request2").value = selected2.value;
                renderContent(2, `<h2>エアコンの個数</h2><p>${selected2.value}</p>`);
                renderContent(3, `
                    <h2>エアコンは何年前に製造されたものですか？</h2>
                    <div class="items">
                        ${renderRadio("request3", "5年以下")}
                        ${renderRadio("request3", "6-10年")}
                        ${renderRadio("request3", "11-15年")}
                        ${renderRadio("request3", "16年以上")}
                        ${renderRadio("request3", "分からない")}
                        <button onclick="loadCleaningStep(4)">다음</button>
                    </div>
                `);
            }
            break;
        case 4:
            const selected3 = document.querySelector("input[name='request3']:checked");
            if (selected3) {
                document.getElementById("request3").value = selected3.value;
                renderContent(3, `<h2>エアコン製造年度</h2><p>${selected3.value}</p>`);
                renderContent(4, `
                    <h2>エアコンのオプション業務も依頼しますか？</h2>
                    <div class="items air">
                        ${renderCheckboxImage("抗菌加工・抗菌コート", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0fRT3qLzRoh0mQcp_WMj1pmyLEI-pmET2Xw&s")}
                        ${renderCheckboxImage("室外機の洗浄", "https://d2tzd06cwmvahj.cloudfront.net/wp-content/uploads/2023/03/15142635/shitsugaiki-00-min.jpg")}
                        ${renderCheckboxImage("ドレンホースの洗浄", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5k3I2Q5N9oLTby_ytIdYSEM-GlTg9wCCBlA&s")}
                        ${renderCheckboxImage("防虫キャップの取り付け", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8zUjOab8ePMmEhgWeA5CIngT_S5qQ9ZKjVA&s")}
                    </div>
                    <button onclick="loadCleaningStep(5)">다음</button>
                `);
            }
            break;
        case 5:
            const selected5 = Array.from(document.querySelectorAll("input[name='request5']:checked"));
            const values5 = selected5.map(el => el.value);
            document.getElementById("request5").value = values5.join(", ");
            renderContent(4, `<h2>エアコンのオプション業務</h2><p>${values5.join(', ')}</p>`);
            renderContent(5, `
                <h2>ご希望の日付を入力してください</h2>
                <input type="date" id="date-input">
                <button onclick="loadCleaningStep(6)">다음</button>
            `);
            document.getElementById("date-input").addEventListener("change", (e) => {
                dateval = e.target.value;
            });
            break;
        case 6:
            if (dateval) {
                document.getElementById("request4").value = dateval;
            }
            renderContent(5, `<h2>選択した日付</h2><p>${dateval}</p>`);
            renderContent(6, `
                <h1>지금 무료 견적 받아보세요.</h1>
                <div><button>견적 요청하기</button></div>
            `);
            break;
        default:
            break;
    }
}

function renderCheckboxImage(value, imageUrl) {
    return `
        <div class="checkbox-image-wrapper">
            <label>
                <img src="${imageUrl}" alt="${value}" />
                <div class="checkbox-label">
                    <input type="checkbox" name="request1" value="${value}" />
                    <span>${value}</span>
                </div>
            </label>
        </div>
    `;
}

function renderRadio(name, value) {
    return `<input type="radio" name="${name}" value="${value}"> ${value}<br>`;
}

function renderContent(step, html) {
    const container = document.getElementById(`content-${step}`);
    if (container) container.innerHTML = html;
}

// ------------------------- 초기 실행 -------------------------
document.addEventListener("DOMContentLoaded", function () {
    initMap();
    attachFavoriteButtonHandler();
});

// ------------------------- 찜하기 -------------------------
function attachFavoriteButtonHandler() {
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
                const favoriteIcon = document.getElementById('favorite-icon');
                const favoriteCount = document.getElementById('favorite-count');
                favoriteIcon.src = data.favorited
                    ? "/resources/icons/findPro/filled_star.png"
                    : "/resources/icons/findPro/empty_star.png";
                favoriteCount.textContent = data.favoriteCount;
            })
            .catch(err => console.error("찜하기 처리 에러:", err));
    });
}

// ------------------------- 지도 -------------------------
function initMap() {
    let address = document.getElementById('proAddress').textContent;
    let geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': address}, function (results, status) {
        if (status === 'OK') {
            let map = new google.maps.Map(document.getElementById('findpro-map'), {
                zoom: 15,
                center: results[0].geometry.location
            });
            new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        } else {
            console.error('Geocode 실패: ' + status);
            alert('주소를 지도에 표시할 수 없습니다. (Error: ' + status + ')');
        }
    });
}

// ------------------------- 견적 요청 제출 -------------------------
function submitEstimate() {
    document.querySelector("form").submit();
}

// ✅ 이사 견적 흐름
function loadMovingStep(step) {
    updateProgressBar(step, 15);

    switch (step) {
        case 1:
            renderContent(1, `
                <h2>이사 종류를 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request1", "일반이사")}
                    ${renderRadio("request1", "반포장이사")}
                    ${renderRadio("request1", "포장이사")}
                    <button onclick="loadMovingStep(2)">다음</button>
                </div>
            `);
            break;
        case 2:
            const selected1 = document.querySelector("input[name='request1']:checked");
            if (!selected1) return alert("이사 종류를 선택해주세요.");
            document.getElementById("request1").value = selected1.value;
            renderContent(1, `<h2>이사 종류</h2><p>${selected1.value}</p>`);

            renderContent(2, `
                <h2>짐 운반 가능 여부</h2>
                <div class="items">
                    ${renderRadio("request2", "가능")}
                    ${renderRadio("request2", "불가능")}
                    <button onclick="loadMovingStep(3)">다음</button>
                </div>
            `);
            break;
        case 3:
            const selected2 = document.querySelector("input[name='request2']:checked");
            if (!selected2) return alert("짐 운반 여부를 선택해주세요.");
            document.getElementById("request2").value = selected2.value;
            renderContent(2, `<h2>짐 운반 여부</h2><p>${selected2.value}</p>`);

            renderContent(3, `
                <h2>이사 규모를 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request3", "원룸")}
                    ${renderRadio("request3", "투룸")}
                    <label>
                        <input type="radio" name="request3" value="기타" id="etcCheck"> 기타
                    </label>
                    <textarea id="etcInput" placeholder="직접 입력" style="display:none;"></textarea>
                    <button onclick="loadMovingStep(4)">다음</button>
                </div>
            `);

            document.getElementById("etcCheck").addEventListener("change", function () {
                const textarea = document.getElementById("etcInput");
                textarea.style.display = this.checked ? "block" : "none";
            });
            break;

        case 4:
            const etcChecked = document.getElementById("etcCheck")?.checked;
            const etcInput = document.getElementById("etcInput");
            let value = "";

            if (etcChecked) {
                if (!etcInput.value.trim()) return alert("기타 항목을 입력해주세요.");
                value = etcInput.value.trim();
            } else {
                const selected = document.querySelector("input[name='request3']:checked");
                if (!selected) return alert("이사 규모를 선택해주세요.");
                value = selected.value;
            }

            document.getElementById("request3").value = value;
            renderContent(3, `<h2>이사 규모</h2><p>${value}</p>`);

            renderContent(4, `
                <h2>이사 예정일을 선택해주세요.</h2>
                <input type="date" id="date-input">
                <button onclick="loadMovingStep(5)">다음</button>
            `);

            document.getElementById("date-input").addEventListener("change", (e) => {
                dateval = e.target.value;
            });
            break;

        case 5:
            if (!dateval) return alert("날짜를 선택해주세요.");
            document.getElementById("request4").value = dateval;
            renderContent(4, `<h2>이사 날짜</h2><p>${dateval}</p>`);

            renderContent(5, `
                <h2>이사 시간대를 선택해주세요.</h2>
                <div class="items">
                    ${["오전 9시이전", "오전 9시~12시", "오후 12시~3시", "오후 3시~6시", "오후 9시 이후"]
                .map(time => renderRadio("request5", time)).join('')}
                    <button onclick="loadMovingStep(6)">다음</button>
                </div>
            `);
            break;

        case 6:
            const selectedTime = document.querySelector("input[name='request5']:checked");
            if (!selectedTime) return alert("시간대를 선택해주세요.");
            document.getElementById("request5").value = selectedTime.value;
            renderContent(5, `<h2>이사 시간</h2><p>${selectedTime.value}</p>`);

            // 👉 6단계 UI를 렌더링 + "다음" 버튼 포함
            renderContent(6, `
            <h2>옮길 대형 가전을 선택해주세요.</h2>
            <div class="items">
                ${renderCheckbox("request6", "냉장고")}
                ${renderCheckbox("request6", "세탁기")}
                ${renderCheckbox("request6", "TV")}
                ${renderCheckbox("request6", "에어컨")}
                <button onclick="loadMovingStep(7)">다음</button>
            </div>
            `);
            break;

        case 7:
            const selected6 = Array.from(document.querySelectorAll("input[name='request6']:checked"));
            if (selected6.length === 0) return alert("대형 가전을 선택해주세요.");
            document.getElementById("request6").value = selected6.map(el => el.value).join(", ");
            renderContent(6, `<h2>대형 가전</h2><p>${selected6.map(el => el.value).join(', ')}</p>`);

            renderContent(7, `
                <h2>옮길 소형 가전을 선택해주세요.</h2>
                <div class="items">
                    ${renderCheckbox("request7", "전자레인지")}
                    ${renderCheckbox("request7", "공기청정기")}
                    ${renderCheckbox("request7", "가스레인지")}
                    ${renderCheckbox("request7", "청소기")}
                    ${renderCheckbox("request7", "없음")}
                    <button onclick="loadMovingStep(8)">다음</button>
                </div>
            `);
            break;

        case 8:
            const selected7 = Array.from(document.querySelectorAll("input[name='request7']:checked"));
            if (selected7.length === 0) return alert("소형 가전을 선택해주세요.");
            document.getElementById("request7").value = selected7.map(el => el.value).join(", ");
            renderContent(7, `<h2>소형 가전</h2><p>${selected7.map(el => el.value).join(', ')}</p>`);

            renderContent(8, `
                <h2>옮길 가구를 선택해주세요.</h2>
                <div class="items">
                    ${renderCheckbox("request8", "책상")}
                    ${renderCheckbox("request8", "침대")}
                    ${renderCheckbox("request8", "소파")}
                    ${renderCheckbox("request8", "의자")}
                    ${renderCheckbox("request8", "옷장")}
                    ${renderCheckbox("request8", "없음")}
                    <button onclick="loadMovingStep(9)">다음</button>
                </div>
            `);
            break;

        case 9:
            const selected8 = Array.from(document.querySelectorAll("input[name='request8']:checked"));
            if (selected8.length === 0) return alert("가구를 선택해주세요.");
            document.getElementById("request8").value = selected8.map(el => el.value).join(", ");
            renderContent(8, `<h2>가구</h2><p>${selected8.map(el => el.value).join(', ')}</p>`);

            renderContent(9, `
                <h2>잔짐의 양을 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request9", "없음")}
                    ${renderRadio("request9", "박스 1~5개")}
                    ${renderRadio("request9", "박스 6~10개")}
                    ${renderRadio("request9", "박스 11~15개")}
                    ${renderRadio("request9", "박스 16개 이상")}
                    <button onclick="loadMovingStep(10)">다음</button>
                </div>
            `);
            break;

        case 10:
            const selected9 = document.querySelector("input[name='request9']:checked");
            if (!selected9) return alert("잔짐 양을 선택해주세요.");
            document.getElementById("request9").value = selected9.value;
            renderContent(9, `<h2>잔짐</h2><p>${selected9.value}</p>`);

            renderContent(10, `
                <h2>출발지 지역을 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request10", "서울")}
                    ${renderRadio("request10", "경기")}
                    ${renderRadio("request10", "인천")}
                    ${renderRadio("request10", "지방")}
                    <button onclick="loadMovingStep(11)">다음</button>
                </div>
            `);
            break;

        case 11:
            const selected10 = document.querySelector("input[name='request10']:checked");
            if (!selected10) return alert("출발지 지역을 선택해주세요.");
            document.getElementById("request10").value = selected10.value;
            renderContent(10, `<h2>출발지</h2><p>${selected10.value}</p>`);

            renderContent(11, `
                <h2>출발지 층수를 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request11", "1층")}
                    ${renderRadio("request11", "2층")}
                    ${renderRadio("request11", "3층")}
                    ${renderRadio("request11", "4층")}
                    ${renderRadio("request11", "5층 이상")}
                    <button onclick="loadMovingStep(12)">다음</button>
                </div>
            `);
            break;

        case 12:
            const selected11 = document.querySelector("input[name='request11']:checked");
            if (!selected11) return alert("출발지 층수를 선택해주세요.");
            document.getElementById("request11").value = selected11.value;
            renderContent(11, `<h2>출발지 층수</h2><p>${selected11.value}</p>`);

            renderContent(12, `
                <h2>도착지 지역을 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request12", "서울")}
                    ${renderRadio("request12", "경기")}
                    ${renderRadio("request12", "인천")}
                    ${renderRadio("request12", "지방")}
                    <button onclick="loadMovingStep(13)">다음</button>
                </div>
            `);
            break;

        case 13:
            const selected12 = document.querySelector("input[name='request12']:checked");
            if (!selected12) return alert("도착지 지역을 선택해주세요.");
            document.getElementById("request12").value = selected12.value;
            renderContent(12, `<h2>도착지</h2><p>${selected12.value}</p>`);

            renderContent(13, `
                <h2>도착지 층수를 선택해주세요.</h2>
                <div class="items">
                    ${renderRadio("request13", "1층")}
                    ${renderRadio("request13", "2층")}
                    ${renderRadio("request13", "3층")}
                    ${renderRadio("request13", "4층")}
                    ${renderRadio("request13", "5층 이상")}
                    <button onclick="loadMovingStep(14)">다음</button>
                </div>
            `);
            break;

        case 14:
            const selected13 = document.querySelector("input[name='request13']:checked");
            if (!selected13) return alert("도착지 층수를 선택해주세요.");
            document.getElementById("request13").value = selected13.value;
            renderContent(13, `<h2>도착지 층수</h2><p>${selected13.value}</p>`);

            renderContent(14, `
                <h2>해당 사항을 선택해주세요.</h2>
                <div class="items">
                    ${renderCheckbox("request14", "반려동물 있음")}
                    ${renderCheckbox("request14", "엘리베이터 없음")}
                    ${renderCheckbox("request14", "주차 불편")}
                    ${renderCheckbox("request14", "계단만 있음")}
                    <button onclick="loadMovingStep(15)">다음</button>
                </div>
            `);
            break;

        case 15:
            const selected14 = Array.from(document.querySelectorAll("input[name='request14']:checked"));
            if (selected14.length === 0) return alert("해당사항을 선택해주세요.");
            document.getElementById("request14").value = selected14.map(el => el.value).join(", ");
            renderContent(14, `<h2>해당 사항</h2><p>${selected14.map(el => el.value).join(', ')}</p>`);

            renderContent(15, `
                <h1>지금 무료 견적 받아보세요.</h1>
                <div><button onclick="submitEstimate()">견적 요청하기</button></div>
            `);
            break;
    }
}