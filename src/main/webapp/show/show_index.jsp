<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	<!-- 시설 소개 전용 CSS 연결 -->
	<link rel="stylesheet" type="text/css" href="../css/show_index.css">
</head>
<body>
    <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
        
		<div class="layout">
			<!-- 사이드 메뉴: 시설소개용 사이드 메뉴 파일이 있다면 변경, 없다면 기존것 사용 -->
			<aside class="side-menu">
	            <%@ include file="../common_side_menu.jsp" %>
	        </aside>
	        
	        <main class="main-content">
	        	<div class="show-container">
	        		
	        		<div class="page-header">
	        			<h2>시설 안내</h2>
	        			<p>최고의 조황을 자랑하는 수상 좌대와 자연 속 힐링 고급 캠핑장을 소개합니다.</p>
	        		</div>

	        		<!-- 탭 버튼 -->
	        		<div class="tab-menu">
	        			<button class="tab-btn active" onclick="openTab('fishing')">수상 좌대</button>
	        			<button class="tab-btn" onclick="openTab('camping')">캠핑장</button>
	        		</div>

	        		<!-- TAB 1: 수상 좌대 내용 -->
	        		<div id="fishing" class="tab-content active">
	        			<div class="facility-section">
	        				<h3 class="section-title">프리미엄 수상 좌대</h3>
	        				
	        				<!-- 좌대 소개 카드 1 -->
	        				<div class="facility-card">
	        					<!-- 이미지 영역: 실제 이미지 경로로 변경 필요 -->
	        					<div class="card-img" style="background-image: url('images/smallfish.png'); background-color:#cbd5e1;"></div>
	        					<div class="card-info">
	        						<h3>일반형 좌대 (Standard)</h3>
	        						<p class="card-desc">
	        							4인 가족이나 연인, 친구와 함께 낚시를 즐기기에 최적화된 공간입니다. 
	        							흔들림 없는 편안함과 쾌적한 실내 환경을 제공합니다.
	        						</p>
	        						<div class="facility-options">
	        							<div class="option-item"><span class="check-icon">✓</span> 적정 인원 2~4인</div>
	        							<div class="option-item"><span class="check-icon">✓</span> TV / 에어컨</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 전자레인지 / 냉장고</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 침구류 / 화장실</div>
	        						</div>
	        					</div>
	        				</div>

	        				<!-- 좌대 소개 카드 2 -->
	        				<div class="facility-card">
	        					<div class="card-img" style="background-image: url('images/largefish.png'); background-color:#94a3b8;"></div>
	        					<div class="card-info">
	        						<h3>대형 좌대 (Large)</h3>
	        						<p class="card-desc">
	        							단체 모임이나 대가족을 위한 넓은 공간을 자랑합니다. 
	        							독립된 바비큐 공간과 넓은 낚시 데크가 특징입니다.
	        						</p>
	        						<div class="facility-options">
	        							<div class="option-item"><span class="check-icon">✓</span> 적정 인원 5~10인</div>
	        							<div class="option-item"><span class="check-icon">✓</span> TV / 에어컨</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 전자레인지 / 냉장고</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 독립 바비큐장</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 침구류 / 화장실</div>
	        						</div>
	        					</div>
	        				</div>
	        			</div>
	        		</div>

	        		<!-- TAB 2: 캠핑장 내용 -->
	        		<div id="camping" class="tab-content">
	        			
	        			<!-- 1. 오토 캠핑 -->
	        			<div class="facility-section">
	        				<h3 class="section-title">오토 캠핑장 (Auto Camping)</h3>
	        				<div class="facility-card">
	        					<div class="card-img" style="background-image: url('images/autocamp.png'); background-color:#d1d5db;"></div>
	        					<div class="card-info">
	        						<h3>자연과 함께하는 오토캠핑</h3>
	        						<p class="card-desc">
	        							넓은 파쇄석 사이트와 전기 시설이 완비되어 있습니다. 
	        							차량을 텐트 바로 옆에 주차하여 편리하게 이용하실 수 있습니다.
	        						</p>
	        						<div class="facility-options">
	        							<div class="option-item"><span class="check-icon">✓</span> 파쇄석 사이트 (8m x 8m)</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 전기 사용 가능</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 공용 샤워장/개수대</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 공용 화장실 </div>
	        						</div>
	        					</div>
	        				</div>
	        			</div>

	        			<!-- 2. 카라반 -->
	        			<div class="facility-section">
	        				<h3 class="section-title">럭셔리 카라반 (Caravan)</h3>
	        				<div class="facility-card">
	        					<div class="card-img" style="background-image: url('images/karaban.png'); background-color:#9ca3af;"></div>
	        					<div class="card-info">
	        						<h3>감성 가득한 카라반 여행</h3>
	        						<p class="card-desc">
	        							모든 편의시설이 갖춰진 카라반에서 낭만적인 밤을 보내세요. 
	        							별도의 장비 없이 몸만 오셔도 편안한 캠핑이 가능합니다.
	        						</p>
	        						<div class="facility-options">
	        							<div class="option-item"><span class="check-icon">✓</span> 4인용 럭셔리 카라반</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 개별 화장실/샤워실</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 바베큐 / 냉난방 완비</div>
	        						</div>
	        					</div>
	        				</div>
	        			</div>

	        			<!-- 3. 글램핑 -->
	        			<div class="facility-section">
	        				<h3 class="section-title">프리미엄 글램핑 (Glamping)</h3>
	        				<div class="facility-card">
	        					<div class="card-img" style="background-image: url('images/glamping.png'); background-color:#6b7280;"></div>
	        					<div class="card-info">
	        						<h3>호텔 같은 편안함, 글램핑</h3>
	        						<p class="card-desc">
	        							텐트의 낭만과 호텔의 안락함을 동시에 느낄 수 있습니다. 
	        							침대, 소파, 주방시설 등 최고급 인테리어로 꾸며져 있습니다.
	        						</p>
	        						<div class="facility-options">
	        							<div class="option-item"><span class="check-icon">✓</span> 퀸사이즈 침대 2개</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 호텔식 침구류</div>
	        							<div class="option-item"><span class="check-icon">✓</span> 전용 데크 & 바비큐</div>
	        						</div>
	        					</div>
	        				</div>
	        			</div>

	        		</div> <!-- End Camping Tab -->

	        	</div>
	        </main>
		</div>
    </div>
    
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>

	<script>
		function openTab(tabName) {
			// 1. 모든 탭 콘텐츠 숨기기
			const contents = document.getElementsByClassName("tab-content");
			for (let i = 0; i < contents.length; i++) {
				contents[i].classList.remove("active");
			}

			// 2. 모든 탭 버튼 비활성화 스타일
			const buttons = document.getElementsByClassName("tab-btn");
			for (let i = 0; i < buttons.length; i++) {
				buttons[i].classList.remove("active");
			}

			// 3. 선택한 탭 콘텐츠 보이기
			document.getElementById(tabName).classList.add("active");

			// 4. 클릭한 버튼 활성화 스타일 (event.currentTarget 사용)
			event.currentTarget.classList.add("active");
		}
	</script>
</body>
</html>