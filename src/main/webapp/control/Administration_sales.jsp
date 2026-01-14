<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



    
    <!-- 매출 관리 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan Admin - List View</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/control/Administration.css"> 
</head>
<script type="text/javascript">
	function goGraphCampFish(gubun) {
		sales.t_gubun.value=gubun;
		sales.method="post";
		sales.action="/kinouhadekitanoni/Control";
		sales.submit();
	}
	f
</script>
<body class="admin-page">
 
        <input type="hidden" name="gubun">
       <header class="main-header" id="mainHeader">
        
        <nav class="main-nav">
            <%@include file = "cover2.jsp"%>
        </nav>
    </header>

    <div class="dashboard-container">
       <%@include file = "control_side_menu.jsp"%>

        <main class="main-content">
            
                

                <div class="content-section dashboard-section">
                                <div class="project-header">
                                    <div class="header-top">
                                        <div class="title-group">
                                            <div class="logo-box"><i class="fa-solid fa-layer-group"></i></div>
            								<h1>매출 통계</h1>
                                        </div>
                                       
                                        	
                                        
                                    </div>
                                    <div class="metrics-row">
                                        <div class="metric-item">
                                            <span class="label">캠핑 월간 매출</span>
                                            <div class="value"><fmt:formatNumber value="${campMonth}" currencySymbol="###,###"/>원</div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">낚시 월간 매출</span>
                                            <div class="value"><fmt:formatNumber value="${fishMonth}" currencySymbol="###,###"/>원</div>
                                            <div class="progress-container">
                                            </div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">캠핑 년간 매출</span>
                                            <div class="value"><fmt:formatNumber value="${campYear}" currencySymbol="###,###"/>원</div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">낚씨 년간 매출</span>
                                            <div class="value"><fmt:formatNumber value="${fishYear}" currencySymbol="###,###"/>원</div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="content-split-row">
                                    <div class="card time-card">
                                        <div class="card-header"><h3>최근 매출</h3></div>
                                        <div class="time-list">
                                            <div class="week-header"><span>Week 5</span><span class="total-h">8h 30m</span></div>
                                            <c:forEach items="${list}" var="dto" end="6">
                                            <div class="time-row">
                                                <div class="date-col"><span class="day-name">날짜</span><span class="date-num">${dto.getPaydate()}</span></div>
                                                <div class="input-group"><span class="input-box placeholder"><span class="date-num">${fn:substring(dto.getStartdate(), 11, 16)}</span></span><span class="input-box placeholder"><span class="date-num">${fn:substring(dto.getEnddate(), 11, 16)}</span></span></div>
                                                <div class="total-col"><span class="label-mini">Total</span><span class="time-val"><fmt:formatNumber value="${dto.getPrice()}" currencySymbol="###,###"/>원</span></div>
                                            </div>
                                           </c:forEach>
                                        </div>
                                    </div>
									
    <div class="card graph-card">
    <div class="card-header flex-between">
        <h3>매출 그래프</h3>
        
        <form name="sales">
        	<input type="hidden" name="t_gubun">
        
        <div class="toggle-pill">
			<button type="submit" onclick="javascript:goGraphCampFish('yca')" name="t_gubun" value="yca">캠핑년간</button>
			<button type="submit" onclick="javascript:goGraphCampFish('yfi')" name="t_gubun" value="yfi">낚시년간</button>
			<button type="submit" onclick="javascript:goGraphCampFish('wca')" name="t_gubun" value="wca">캠핑주간</button>
			<button type="submit" onclick="javascript:goGraphCampFish('wfi')" name="t_gubun" value="wfi">낚시주간</button>
        </div>
        </form>
    </div>
    <div class="chart-container">
        <div class="y-axis"><span>40</span><span>30</span><span>20</span><span>10</span></div>
        
		<div class="bars-wrapper">

		  <!-- 주간 -->
		  <c:if test="${r_gubun eq 'wca' || r_gubun eq 'wfi'}">
		    <c:set var="labels" value="월,화,수,목,금,토,일" />
		    <c:forEach items="${graphPercent}" var="p" varStatus="s">
		      <div class="bar-col">
		        <div class="bar yellow"
		             style="height:${p}%;"
		             title="${graphArray[s.index]}원"></div>
		        <div class="month-label">
		          <c:choose>
		            <c:when test="${s.index==0}">월</c:when>
		            <c:when test="${s.index==1}">화</c:when>
		            <c:when test="${s.index==2}">수</c:when>
		            <c:when test="${s.index==3}">목</c:when>
		            <c:when test="${s.index==4}">금</c:when>
		            <c:when test="${s.index==5}">토</c:when>
		            <c:otherwise>일</c:otherwise>
		          </c:choose>
		        </div>
		      </div>
		    </c:forEach>
		  </c:if>
		
		  <!-- 년간 -->
		  <c:if test="${r_gubun eq 'yca' || r_gubun eq 'yfi' || empty r_gubun}">
		    <c:forEach items="${graphPercent}" var="p" varStatus="s">
		      <div class="bar-col">
		        <div class="bar yellow"
		             style="height:${p}%;"
		             title="${graphArray[s.index]}원"></div>
		        <div class="month-label">${s.index + 1}월</div>
		      </div>
		    </c:forEach>
		  </c:if>
		
		</div>
    </div>
</div>


                                
                        </div>
                    </main>
                </div>
    <script>
        // 스크롤 시 헤더 디자인 변경 스크립트 (기존 유지)
        const mainContent = document.querySelector('.main-content');
        const mainHeader = document.getElementById('mainHeader');

        mainContent.addEventListener('scroll', () => {
            if (mainContent.scrollTop > 50) {
                mainHeader.classList.add('scrolled');
            } else {
                mainHeader.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>