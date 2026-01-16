<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	<style>
		.view-container {
			max-width: 800px;
			margin: 0 auto;
			padding: 2rem;
			background-color: #fff;
			border-radius: 8px;
			box-shadow: 0 1px 3px rgba(0,0,0,0.1);
		}
		
		.view-header {
			border-bottom: 2px solid #e2e8f0;
			padding-bottom: 1rem;
			margin-bottom: 2rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}
		
		.view-title {
			font-size: 1.5rem;
			font-weight: bold;
			color: #1e293b;
		}

		.info-section {
			margin-bottom: 2rem;
		}
		
		.section-title {
			font-size: 1.1rem;
			font-weight: 600;
			color: #334155;
			margin-bottom: 1rem;
			border-left: 4px solid;
			padding-left: 10px;
		}
		
		.title-fi { border-color: #2563eb; }
		.title-ca { border-color: #16a34a; }
		
		.info-table {
			width: 100%;
			border-collapse: collapse;
			border-top: 2px solid #333;
		}
		
		.info-table th {
			background-color: #f8fafc;
			width: 150px;
			padding: 15px;
			text-align: left;
			font-weight: 600;
			color: #475569;
			border-bottom: 1px solid #e2e8f0;
		}
		
		.info-table td {
			padding: 15px;
			border-bottom: 1px solid #e2e8f0;
			color: #1e293b;
		}
		
		.price-text {
			font-size: 1.2rem;
			font-weight: bold;
			color: #16a34a;
		}
		
		.btn-wrap {
			text-align: center;
			margin-top: 3rem;
		}
		
		.btn-list {
			background-color: #64748b;
			color: white;
			padding: 10px 25px;
			border-radius: 4px;
			text-decoration: none;
			font-weight: 500;
			transition: background 0.3s;
		}
		.btn-list:hover { background-color: #475569; }
		.btn-list2 {
			background-color: #006c88;
			color: white;
			padding: 10px 25px;
			border-radius: 4px;
			text-decoration: none;
			font-weight: 500;
			transition: background 0.3s;
		}
		.btn-list2:hover { background-color: #25ff34; }
		.btn-list3 {
			background-color: #006c88;
			color: white;
			padding: 10px 25px;
			border-radius: 4px;
			text-decoration: none;
			font-weight: 500;
			transition: background 0.3s;
		}
		.btn-list3:hover { background-color: #d44b4b; }

		
		/* 상태값 스타일 */
		.status-y { color: #16a34a; font-weight: bold; }
		.status-n { color: #ef4444; font-weight: bold; }
	</style>
	<script>
		function goList(){
			location.href="Member?t_gubun=myyoyaku";
		}
		function goCancle(){
			data.t_gubun.value="cancle"
			data.method="post";
			data.action="Paymant";
			data.submit();
		}
		function goPayAgain(){
			data.t_gubun.value="payAgain"
			data.method="post";
			data.action="Paymant";
			data.submit();
		}
		
	</script>
</head>
<body>
    <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
        
		<div class="layout">
			<aside class="side-menu">
				<!-- 사이드 메뉴 활성화 -->
				<c:set var="sidemenu" value="myyoyaku" scope="request"/>
	            <%@ include file="../yoyaku_side_menu.jsp" %>
	        </aside>
	        
	        <form name="data">
	        	<input type="hidden" name="orderNo" value="${dto.no}">
	        	<input type="hidden" name="orderName" value="${dto.kind eq 'fi' ? '좌대 예약' : dto.cam_type.concat(' 예약')}">
	        	<input type="hidden" name="customerName" value="${sessionName}">
	        	<input type="hidden" name="price" value="${dto.price}">
	        	<input type="hidden" name="t_gubun">
	        </form>
	        
	        <main class="main-content">
	        	<div class="view-container">
	        		
	        		<div class="view-header">
	        			<div class="view-title">예약 상세 정보</div>
	        			<span style="font-size:0.9rem; color:#64748b;">
	        				예약일: <c:if test="${not empty dto.pay_date}">${dto.pay_date}</c:if>
	        				<c:if test="${empty dto.pay_date}">-</c:if>
	        			</span>
	        		</div>

					<!-- 1. 기본 예약 정보 -->
	        		<div class="info-section">
	        			<div class="section-title ${dto.kind eq 'fi' ? 'title-fi' : 'title-ca'}">
	        				예약 정보 확인
	        			</div>
	        			<table class="info-table">
	        				<tr>
	        					<th>예약 번호</th>
	        					<td>${dto.no}</td>
	        					<th>예약 종류</th>
	        					<td>
	        						<c:if test="${dto.kind eq 'fi'}">낚시 예약</c:if>
	        						<c:if test="${dto.kind eq 'ca'}">캠핑 예약</c:if>
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>입실일(Start)</th>
	        					<td>${dto.start_date}</td>
	        					<th>퇴실일(End)</th>
	        					<td>${dto.end_date}</td>
	        				</tr>
	        				<tr>
	        					<th>장소/위치</th>
	        					<td colspan="3">
	        						<c:if test="${dto.kind eq 'fi'}">
	        							<strong>[${dto.fish_name}]</strong> ${dto.river} / 
	        							<c:if test="${dto.fish_size eq 'S'}">소형</c:if>
	        							<c:if test="${dto.fish_size eq 'L'}">대형</c:if>
	        						</c:if>
	        						<c:if test="${dto.kind eq 'ca'}">
	        							<strong>[${dto.cam_name}]</strong> ${dto.river}구역 (${dto.cam_type}) / Site No.${dto.spot}
	        						</c:if>
	        					</td>
	        				</tr>
	        			</table>
	        		</div>

					<!-- 2. 예약자 및 결제 정보 -->
	        		<div class="info-section">
	        			<div class="section-title ${dto.kind eq 'fi' ? 'title-fi' : 'title-ca'}">
	        				결제 및 이용자 정보
	        			</div>
	        			<table class="info-table">
	        				<tr>
	        					<th>예약자 성명</th>
	        					<td>${dto.username}</td>
	        					<th>이용 인원</th>
	        					<td>${dto.party}명</td>
	        				</tr>
	        				<tr>
	        					<th>결제 금액</th>
	        					<td>
	        						<span class="price-text">
	        							<fmt:formatNumber value="${dto.price}" pattern="#,###"/>
	        						</span> 원
	        					</td>
	        					<th>결제 상태</th>
	        					<td>
	        						<c:if test="${dto.paymant eq 'Y'}">
	        							<span class="status-y">결제 완료</span>
	        						</c:if>
	        						<c:if test="${dto.paymant ne 'Y'}">
	        							<span class="status-n">미결제</span>
	        						</c:if>
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>결제 일자</th>
	        					<td colspan="3">
	        						<c:if test="${dto.paymant eq 'Y'}">
	        							${dto.pay_date}
	        						</c:if>
	        						<c:if test="${dto.paymant ne 'Y'}">
	        							-
	        						</c:if>
	        					</td>
	        				</tr>
	        			</table>
	        		</div>
	        		
	        		<!-- 버튼 영역 -->
	        		<div class="btn-wrap">
	        			<c:if test="${dto.paymant ne 'Y'}">
		        			<a href="javascript:goPayAgain()" class="btn-list2">결제하기</a>
		        			<a href="javascript:goCancle()" class="btn-list3">취소하기</a>
	        			</c:if>
	        			<a href="javascript:goList()" class="btn-list">목록으로</a>
	        		</div>

	        	</div>
	        </main>
		</div>
    </div>
    
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>
</body>
</html>