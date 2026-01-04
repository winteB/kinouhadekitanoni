<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	
	<!-- CSS 파일 링크 -->
	<link rel="stylesheet" type="text/css" href="../css/yoyaku_fishing_detail.css">
	<script type="text/javascript">
		function goPay(){
			yoyaku.t_gubun.value="pay"
			yoyaku.method="post";
			yoyaku.action="YoyakuFishing";
			yoyaku.submit();
		}
		function changeCheckout(){
			yoyaku.t_gubun.value="detail"
			yoyaku.method="post";
			yoyaku.action="YoyakuFishing";
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
	        			<h2>예약 상세 정보 입력</h2>
	        			<p style="color:#64748b;">선택하신 일정과 위치를 확인하고 예약자 정보를 입력해주세요.</p>
	        		</div>

					<form name="yoyaku">
						<input type="hidden" name="t_gubun" value="confirm">
						<input type="hidden" name="t_kind" value="fi">
						
						<div class="detail-card">
							<!-- 1. 일정 및 위치 정보 -->
							<h3 style="margin-bottom:1rem; font-size:1.1rem; border-left:4px solid #2563eb; padding-left:10px;">일정 및 위치</h3>
							
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
									<input type="date" class="form-input" id="checkOutDate" name="r_checkout_date" min="${selected_date }" value="${checkout_date }" min="${selected_date }" onchange="changeCheckout()">
								</div>
							</div>

							<!-- 위치 정보 (그 아래 배치) -->
							<div class="info-grid">
								<div class="form-group">
									<label>선택한 위치 (Site)</label>
									<input type="text" class="form-input" name="r_river" value="${river }" readonly>
								</div>
								<div class="form-group">
									<label>좌대 사이즈</label>
									<select name="r_spot" class="form-input" onchange="changeCheckout()">
										<c:forEach var="fi" items="${flist }">
											<option value="${fi.getNo() }"  
												<c:if test="${selected_area eq fi.getNo() }">selected</c:if>>
												<c:if test="${fi.getSize() eq 'S' }">소형</c:if>
												<c:if test="${fi.getSize() eq 'L' }">대형</c:if>
											</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<!-- 2. 예약자 및 요금 정보 -->
							<h3 style="margin-top:1.5rem; margin-bottom:1rem; font-size:1.1rem; border-left:4px solid #2563eb; padding-left:10px;">예약자 정보</h3>
							<div class="form-group">
								<label>예약자 성명</label>
								<input type="text" class="form-input" name="r_name" value="${sessionName }" readonly>
							</div>
							
							<div class="info-grid">
								<div class="form-group">
									<label for="peopleCount">인원수 (명)</label>
									<input type="number" id="peopleCount" name="r_party" class="form-input" min="1" max="10" placeholder="인원수를 입력하세요" required>
								</div>
							</div>
							<p style="font-size:0.85rem; color:#ef4444; margin-top:-10px;">
								* 4명 이하: 기본형 (150,000원) / 5명 이상: 대형 (250,000원) 권장
							</p>							
							<!-- 가격 정보 추가 -->
							<div class="form-group">
								<label>총 결제 예정 금액 (Price)</label>
								<input type="hidden" name="r_price" value="${price}">
								<input type="text" id="totalPrice" class="form-input" value="<fmt:formatNumber value='${price }' pattern='#,### 원'/>" readonly style="text-align:right; font-weight:bold; color:#16a34a;">
							</div>
							

						</div>

						<!-- 3. 이용 및 운영 안내 (새로 추가된 섹션) -->
						<div class="operation-box">
							<div class="operation-title">
								<svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
								운영 및 이용 시간 안내
							</div>
							<ul class="operation-list">
								<li><b>입실 시간:</b> 14:00 부터</li>
								<li><b>퇴실 시간:</b> 익일 11:00 까지</li>
								<li><b>배 운영 시간:</b> 08:00 ~ 18:00 (기상 상황에 따라 변동 가능)</li>
								<li>좌대 진입 및 철수 시 선착장에서 배를 타고 이동합니다.</li>
							</ul>
						</div>

						<!-- 4. 주의사항 -->
						<div class="notice-box">
							<div class="notice-title">
								<svg width="20" height="20" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
								이용 시 필수 주의사항
							</div>
							<ul class="notice-list">
								<li>지정된 인원을 초과할 경우 현장에서 추가 요금이 발생할 수 있습니다.</li>
								<li>음주 후 낚시는 매우 위험하오니 자제 부탁드립니다.</li>
								<li>개인 화기 사용은 지정된 장소에서만 가능합니다.</li>
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