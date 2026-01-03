<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	<script type="text/javascript" src="common/fishing-map.js"></script>
		
	<script type="text/javascript">
		function goDetail(){
			yoyaku.method="post";
			yoyaku.action="YoyakuFishing";
			yoyaku.submit();
		}
	</script>
</head>
<body>
    <form name="yoyaku">    	
        <input type="hidden" name="t_gubun" value="detail">
        <input type="hidden" name="selected_area" id="selected-site-type" value="">
    	<input type="hidden" name="selected_date" id="selectedDate" value="">
    </form>
    <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
        
		<div class="layout">
		<aside class="side-menu">
            <%@ include file="../yoyaku_side_menu.jsp" %>
        </aside>
        <main class="main-content">
        	<div class="container">
            <div class="grid-layout">
                <section class="section-calendar">
                    <div class="section-header">
                        <h2>날짜 선택</h2>
                        <p>원하시는 체크인 날짜를 선택해주세요.</p>
                    </div>
                    

                    <div class="calendar-card">
                        <div class="calendar-nav">
                            <span class="calendar-title"></span>
                            <div class="nav-btns">
                                <button>&lt;</button>
                                <button>&gt;</button>
                            </div>
                        </div>
                        <div class="calendar-grid">
                            <div class="day-label red">일</div>
                            <div class="day-label">월</div>
                            <div class="day-label">화</div>
                            <div class="day-label">수</div>
                            <div class="day-label">목</div>
                            <div class="day-label">금</div>
                            <div class="day-label">토</div>
                        </div>
                    </div>
                </section>

                <section class="section-map">
                    <div class="section-header">
                        <h2>구역 배치도</h2>
                        <p>낚시 구역을를 확인하세요.</p>
                    </div>
                   <div class="map-container">
					   <div class="map-placeholder">
					        <img
					            id="fishing-image"
					            src="images/예약좌대.png"
					            usemap="#fishing-map"
					            alt="낚시터 배치도"
					        >
					
					        <!-- 하이라이트 -->
					        <div id="fiA" class="area-highlight"></div>
					        <div id="fiB" class="area-highlight"></div>
					    </div>
					    <map name="fishing-map">
					        <area
					            data-area-id="fiA"
					            shape="rect"
					            coords="22,118,998,285"
					            href="#"
					            alt="얕은 곳"
					        >
					        <area
					            data-area-id="fiB"
					            shape="rect"
					            coords="23,304,998,506"
					            href="#"
					            alt="깊은 곳"
					        >
					    </map>
					</div>
                </section>
            </div>
        

        <div class="non-floating-bar">
            <div class="bar-info">
                <div class="info-group">
                    <label>CHECK-IN</label>
                    <span class="value">선택안함</span>
                </div>
                <div class="divider"></div>
                <div class="info-group site-info">
                    <label>SELECTED SITE</label>
                    <span class="value">선택안함</span>
                </div>
            </div>
            <button class="reserve-btn" id="btnReserve" disabled onclick="goPage('YoyakuFishing','detail')">예약하기</button>
        </div>
        </div>
        </main>
    </div>
    </div>
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>
    

<script>
document.addEventListener("DOMContentLoaded", () => {
	const today = new Date();
	today.setHours(0, 0, 0, 0); // 시간 제거 (날짜 비교용)

    let currentDate = new Date(); // 초기값: 오늘
    
    // 1. 필요한 요소들을 먼저 선택합니다.
    const inputBox = document.getElementById('selectedDate');
    const checkInValue = document.querySelector('.non-floating-bar .info-group:first-child .value');
    const title = document.querySelector('.calendar-title');
    const grid = document.querySelector('.calendar-grid');
    const prevBtn = document.querySelector('.nav-btns button:first-child');
    const nextBtn = document.querySelector('.nav-btns button:last-child');


    // 2. 달력을 그리는 함수 정의
    function renderCalendar(date) {
    	// 연도와 월을 숫자로 명확히 추출
        const year = date.getFullYear(); // 年(とし)
        const month = date.getMonth();   // 月(つき)

        // 2. 만약 연도가 NaN(숫자가 아님)이면 강제로 오늘 연도 할당
        const displayYear = isNaN(year) ? new Date().getFullYear() : year;
        const displayMonth = isNaN(month) ? new Date().getMonth() + 1 : month + 1;

        // 요일 헤더 초기화
        grid.innerHTML = `
            <div class="day-label red">일</div>
            <div class="day-label">월</div>
            <div class="day-label">화</div>
            <div class="day-label">수</div>
            <div class="day-label">목</div>
            <div class="day-label">금</div>
            <div class="day-label">토</div>
        `;
        
        // 3. 텍스트 업데이트
        title.textContent = displayYear + "년 " + displayMonth + "월";

       // title.textContent = `${displayYear}년 ${displayMonth}월`;


        const firstDay = new Date(year, month, 1).getDay();
        const lastDate = new Date(year, month + 1, 0).getDate();

        // 1일 앞의 빈 공간 채우기
        for (let i = 0; i < firstDay; i++) {
            grid.innerHTML += `<div class="date empty"></div>`;
        }

        // 실제 날짜 채우기
        for (let d = 1; d <= lastDate; d++) {
            const isSunday = ((firstDay + d - 1) % 7 === 0);
            const dateDiv = document.createElement('div');

            const cellDate = new Date(year, month, d);
            cellDate.setHours(0, 0, 0, 0);

            dateDiv.className = `date ${isSunday ? 'red' : ''}`;
            dateDiv.textContent = d;

            // ✅ 오늘 이전 날짜면 비활성화
            if (cellDate < today) {
                dateDiv.classList.add('disabled');
            }

            grid.appendChild(dateDiv);
        }

    }

    // 3. 이전/다음 달 버튼 이벤트
    prevBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() - 1);
        renderCalendar(currentDate);
    });

    nextBtn.addEventListener('click', () => {
        currentDate.setMonth(currentDate.getMonth() + 1);
        renderCalendar(currentDate);
    });

    // 4. 날짜 클릭 이벤트 (이벤트 위임 - 한 번만 작성!)
    grid.addEventListener('click', (e) => {
        const cell = e.target.closest('.date');
        
        // 유효한 날짜 셀을 클릭했을 때만 실행
        if (
			    cell &&
			    !cell.classList.contains('empty') &&
			    !cell.classList.contains('day-label') &&
			    !cell.classList.contains('disabled')
			) {

            // 기존 선택된 스타일 제거
            document.querySelectorAll('.calendar-grid .date.selected')
                    .forEach(el => el.classList.remove('selected'));
            
            // 현재 클릭한 셀에 선택 스타일 추가
            cell.classList.add('selected');

      	   // 연 / 월 / 일 계산
            const year = currentDate.getFullYear();
            const month = String(currentDate.getMonth() + 1).padStart(2, '0');
            const day = String(cell.textContent.trim()).padStart(2, '0');

            // 최종 포맷: YYYY/MM/DD
            const resultValue = year + "-" + month + "-" + day;

            // 값 적용
            inputBox.value = resultValue;           // input
            checkInValue.textContent = resultValue; // 하단 바
            checkInValue.style.color = "#0f172a";

            updateReserveButton(); // ✅ 추가
        }
    });

    // 5. 페이지 로드 시 첫 달력 출력
    renderCalendar(currentDate);

}); // <--- DOMContentLoaded가 여기서 닫혀야 합니다!

function updateReserveButton() {
    const checkInText = document.querySelector(
        '.non-floating-bar .info-group:first-child .value'
    ).textContent.trim();

    const siteText = document.querySelector(
        '.non-floating-bar .info-group:last-child .value'
    ).textContent.trim();

    const btn = document.getElementById('btnReserve');

    if (checkInText !== '선택안함' && siteText !== '선택안함') {
        btn.disabled = false;
    } else {
        btn.disabled = true;
    }
}
</script>

</body>
</html>
