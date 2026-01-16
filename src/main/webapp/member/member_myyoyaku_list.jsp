<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	<style>
		/* 리스트 테이블 스타일 */
		.yoyaku-table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 20px;
			box-shadow: 0 1px 3px rgba(0,0,0,0.1);
		}
		.yoyaku-table th, .yoyaku-table td {
			padding: 12px 10px;
			text-align: center;
			border-bottom: 1px solid #e2e8f0;
			color: #334155;
		}
		.yoyaku-table th {
			background-color: #f8fafc;
			color: #475569;
			font-weight: 700;
			font-size: 0.95rem;
		}
		.yoyaku-table tr:hover {
			background-color: #f1f5f9;
		}
		
		/* 상태 뱃지 */
		.badge {
			padding: 4px 8px;
			border-radius: 4px;
			font-size: 0.8rem;
			font-weight: 600;
			display: inline-block;
			min-width: 50px;
		}
		.badge-fi { background-color: #dbeafe; color: #1e40af; } /* 낚시 파란색 */
		.badge-ca { background-color: #dcfce7; color: #166534; } /* 캠핑 초록색 */
		
		.empty-msg {
			text-align: center;
			padding: 60px 0;
			color: #64748b;
		}
		
		.main-title {
			font-size: 1.5rem;
			font-weight: bold;
			color: #1e293b;
			margin-bottom: 10px;
			border-bottom: 2px solid #e2e8f0;
			padding-bottom: 15px;
		}
		
		.detail-info {
			font-size: 0.85rem;
			color: #64748b;
			margin-top: 4px;
		}
		
		/* [추가] 상세페이지 링크 스타일 */
		.view-link {
			color: #2563eb;
			text-decoration: none;
			font-weight: 600;
			cursor: pointer;
		}
		.view-link:hover {
			text-decoration: underline;
			color: #1d4ed8;
		}
	</style>
	<script>
		/* [추가] 상세 페이지 이동 함수 */
		function goView(no){
			// Member 서블릿으로 t_gubun=myyoyakuView 와 예약번호(t_no)를 전송
			location.href = "Member?t_gubun=myyoyakuView&t_no=" + no;
		}
	</script>
</head>
<body>
    <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
        
		<div class="layout">
			<aside class="side-menu">
				<c:set var="sidemenu" value="myyoyaku" scope="request"/>
	            <%@ include file="../yoyaku_side_menu.jsp" %>
	        </aside>
	        
	        <main class="main-content">
	        	<div class="container" style="padding: 2rem;">
	        		<h2 class="main-title">내 예약 목록</h2>
	        		<p style="color:#64748b; margin-bottom: 20px;">
	        			고객님의 예약 내역을 확인하실 수 있습니다. (총 ${listCount}건)
	        		</p>
	        		
	        		<c:if test="${empty yoyakuList}">
	        			<div class="empty-msg">
	        				<p style="font-size:1.1rem; margin-bottom:15px;">예약된 내역이 없습니다.</p>
	        				<div>
		        				<a href="javascript:goPage('YoyakuFishing','main')" style="color:#2563eb; text-decoration:underline; margin-right:15px; font-weight:bold;">🎣 낚시 예약하러 가기</a>
		        				<a href="javascript:goPage('YoyakuCamping','main')" style="color:#16a34a; text-decoration:underline; font-weight:bold;">🏕️ 캠핑 예약하러 가기</a>
	        				</div>
	        			</div>
	        		</c:if>
	        		
	        		<c:if test="${not empty yoyakuList}">
		        		<table class="yoyaku-table">
		        			<thead>
		        				<tr>
		        					<th width="10%">구분</th>
		        					<th width="15%">예약번호</th>
		        					<th width="20%">이용일자</th>
		        					<th width="25%">장소/상세</th>
		        					<th width="10%">인원</th>
		        					<th width="10%">결제금액</th>
		        					<th width="10%">상태</th>
		        				</tr>
		        			</thead>
		        			<tbody>
		        				<c:forEach var="dto" items="${yoyakuList}">
			        				<tr>
			        					<td>
			        						<c:choose>
			        							<c:when test="${dto.kind eq 'fi'}"><span class="badge badge-fi">낚시</span></c:when>
			        							<c:when test="${dto.kind eq 'ca'}"><span class="badge badge-ca">캠핑</span></c:when>
			        							<c:otherwise><span class="badge">${dto.kind}</span></c:otherwise>
			        						</c:choose>
			        					</td>
			        					
			        					<!-- [수정] 예약번호 클릭 시 goView 함수 호출 -->
			        					<td>
			        						<a href="javascript:goView('${dto.no}')" class="view-link" title="상세보기">
			        							${dto.no}
			        						</a>
			        					</td>
			        					
			        					<td>
			        						<div style="font-weight:600;">${dto.start_date}</div>
			        						<div style="font-size:0.8rem; color:#94a3b8;">~ ${dto.end_date}</div>
			        					</td>
			        					<td style="text-align:left; padding-left:20px;">
			        						<c:if test="${dto.kind eq 'fi'}">
			        							<div style="font-weight:bold;">${dto.fish_name}</div>
			        							<div class="detail-info">
			        								${dto.river} / 
			        								<c:if test="${dto.fish_size eq 'S'}">소형</c:if>
			        								<c:if test="${dto.fish_size eq 'L'}">대형</c:if>
			        							</div>
			        						</c:if>
			        						<c:if test="${dto.kind eq 'ca'}">
			        							<div style="font-weight:bold;">${dto.cam_name}</div>
			        							<div class="detail-info">
			        								${dto.river}구역 (${dto.cam_type})
			        							</div>
			        						</c:if>
			        					</td>
			        					<td>${dto.party}명</td>
			        					<td style="font-weight:bold; color:#1e293b;">
			        						<fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
			        					</td>
			        					<td>
			        						<c:if test="${dto.paymant eq 'Y'}">
			        							<span style="color:#16a34a; font-weight:bold;">완료</span>
			        						</c:if>
			        						<c:if test="${dto.paymant ne 'Y'}">
			        							<span style="color:#ef4444; font-weight:bold;">미결제</span>
			        						</c:if>
			        					</td>
			        				</tr>
		        				</c:forEach>
		        			</tbody>
		        		</table>
	        		</c:if>
	        	</div>
	        </main>
		</div>
    </div>
    
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>
</body>
</html>