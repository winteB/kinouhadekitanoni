<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	
	<!-- CSS 파일 링크 (캠핑용 CSS로 변경) -->
	<link rel="stylesheet" type="text/css" href="../css/yoyaku_camping_detail.css">
	<script src="https://js.tosspayments.com/v1"></script>
	<script type="text/javascript">
		function goPay(){
			yoyaku.t_gubun.value="pay"
			yoyaku.method="post";
			yoyaku.action="YoyakuCamping";
			yoyaku.submit();
		}
		function changeCheckout(){
			yoyaku.t_gubun.value="detail"
			yoyaku.method="post";
			yoyaku.action="YoyakuCamping";
			yoyaku.submit();
		}

		// 폼 제출 전 유효성 검사
		function validateForm() {
			const count = document.getElementById('peopleCount').value;
			const agree = document.getElementById('agreeCheck').checked;
			const checkOut = document.getElementById('checkOutDate').value;

			if (!checkOut) {
				alert("퇴실일을 선택해주세요.");
				return false;
			}

			if (!count || count < 1) {
				alert("올바른 인원수를 입력해주세요.");
				return false;
			}
			
			if (!agree) {
				alert("주의사항에 동의해주셔야 예약이 가능합니다.");
				return false;
			}

			return true;
		}
	</script>
</head>
<body>
    <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
        
		<div class="layout">
			<aside class="side-menu">
	            <%@ include file="../yoyaku_side_menu.jsp" %>
	        </aside>
	        
	        <main class="main-content">
	        	<div class="detail-container">
	        		
	        		<div class="detail-header">
	        			<h2>캠핑 예약 상세 정보 입력</h2>
	        			<p style="color:#64748b;">선택하신 사이트와 일정을 확인하고 예약자 정보를 입력해주세요.</p>
	        		</div>

					<!-- action을 YoyakuCamping으로 변경 -->
					<form name="yoyaku">
						<input type="hidden" name="t_gubun" value="confirm">
						
						<div class="detail-card">
							<div class="map-container">
								<div class="map-placeholder">
									<img src="images/예약캠핑.png" alt="캠핑장 배치도" style="display:block; margin:0 auto;">
								</div>
							</div>
							<!-- 1. 일정 및 위치 정보 -->
							<h3 style="margin-bottom:1rem; font-size:1.1rem; border-left:4px solid #16a34a; padding-up:15px; padding-left:10px;">일정 및 위치</h3>
							
							<!-- 입실일 / 퇴실일 한 줄 배치 -->
							<div class="info-grid">
								<div class="form-group">
									<label>입실일 (Check-in)</label>
									<!-- 이전 페이지에서 받은 날짜 (수정 불가) -->
									<input type="text" class="form-input" id="checkInDate" name="r_checkin_date" value="${selected_date }" readonly>
								</div>
								<div class="form-group">
									<label>퇴실일 (Check-out)</label>
									<!-- 퇴실일은 선택 가능하도록 date 타입 사용 -->
									<input type="date" class="form-input" id="checkOutDate" name="r_checkout_date" value="${checkout_date }" min="${selected_date }" onchange="changeCheckout()">
								</div>
							</div>

							<!-- 위치 정보 (그 아래 배치) -->
							<div class="info-grid">
								<div class="form-group">
									<label for="campingType">캠핑 종류 (Type)</label>
									<input type="text" name="r_site" class="form-input" value="${selected_area }" readonly>
								</div>
								
								<div class="form-group">
									<label>선택한 구역 (Campsite)</label>
									<!-- 입력칸 대신 선택박스로 변경 -->
									<select name="r_spot" class="form-input">
										<c:forEach var="cmp" items="${clist }">
											<option value="${cmp.getNo() }">${cmp.getName() }</option>
										</c:forEach>
									</select>
									
								</div>
							</div>

							<!-- 2. 예약자 및 요금 정보 -->
							<h3 style="margin-top:1.5rem; margin-bottom:1rem; font-size:1.1rem; border-left:4px solid #16a34a; padding-left:10px;">예약자 정보</h3>
							
							<div class="info-grid">
								<div class="form-group">
									<label>예약자 성명</label>
									<!-- 너비를 50%로 줄임 -->
									<input type="text" class="form-input" name="r_name" value="${sessionName }">
								</div>
								<div class="form-group">
									<label for="peopleCount">인원수 (명)</label>
									<input type="number" id="peopleCount" name="r_party" class="form-input" min="1" max="10" placeholder="인원수를 입력하세요" required>
								</div>
							</div>
							
							<div class="info-grid">
							<!-- 가격 정보 추가 (단순 표시용) -->
							<div class="form-group">
								<label>총 결제 예정 금액 (Price)</label>
								<input type="hidden" name="r_price" value="${price}">
								<input type="text" id="totalPrice" class="form-input" value="<fmt:formatNumber value='${price }' pattern='#,### 원'/>" readonly style="text-align:right; font-weight:bold; color:#16a34a;">
							</div>
						</div>

						<!-- 3. 이용 및 운영 안내 (캠핑 내용으로 수정) -->
						<div class="operation-box">
							<div class="operation-title">
								<svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
								운영 및 이용 시간 안내
							</div>
							<ul class="operation-list">
								<li><b>입실 시간:</b> 14:00 부터 (얼리 체크인 불가)</li>
								<li><b>퇴실 시간:</b> 익일 11:00 까지</li>
								<li><b>매너 타임:</b> 22:00 ~ 07:00 (정숙 시간 준수)</li>
								<li>차량은 지정된 구역에 주차 후 사이트로 이동해 주십시오.</li>
							</ul>
						</div>

						<!-- 4. 주의사항 (캠핑 내용으로 수정) -->
						<div class="notice-box">
							<div class="notice-title">
								<svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
								캠핑장 이용 시 필수 주의사항
							</div>
							<ul class="notice-list">
								<li>지정된 인원을 초과할 경우 현장에서 추가 요금이 발생하거나 입실이 거부될 수 있습니다.</li>
								<li>화로대 사용 시 반드시 받침대를 사용해야 하며, 데크 위 직화는 금지됩니다.</li>
								<li>고전력 제품(전기히터, 그릴 등 600W 이상) 사용을 금지합니다.</li>
								<li>예약 취소는 이용일 3일 전까지만 100% 환불 가능합니다.</li>
							</ul>
							<div style="margin-top:1rem;">
								<input type="checkbox" id="agreeCheck" required>
								<label for="agreeCheck" style="font-size:0.9rem; font-weight:600;">위 안내사항 및 주의사항을 모두 확인하였으며 이에 동의합니다.</label>
							</div>
						</div>

						<!-- 하단 버튼 -->
						<div class="btn-area">
							<button type="button" class="btn-cancel" onclick="history.back()">취소</button>
							<button type="button" class="btn-confirm" onclick="goPay()" style="background-color: #16a34a;">결제하기</button>
						</div>
						</div>
					</form>
	        	</div>
	        </main>
		</div>
    </div>
    
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>


</body>
</html>