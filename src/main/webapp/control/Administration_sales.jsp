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
		sales.t_gubun.value = gubun;
		sales.method = "post";
		sales.action = "/kinouhadekitanoni/Control"; 
		sales.submit();
	}

</script>

 
		<header class="main-header" id="mainHeader">
		    
		    <div class="brand-wrapper">
		         <%@include file = "cover2.jsp"%>
		    </div>
		    
		    <nav class="main-nav">
		        </nav>
		    
		</header>
		<body class="admin-page">
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
                                                <div class="input-group"><span class="input-box placeholder"><span class="day-name">예약 입실</span><span class="date-num">${fn:substring(dto.getStartdate(), 5, 10)}</span></span>
                                       			<span class="input-box placeholder"><span class="day-name">예약 퇴실</span><span class="date-num">${fn:substring(dto.getEnddate(), 5, 10)}</span></span></div>
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
        </form>
			<div class="toggle-pill">
			    <button type="button" 
			            <c:if test="${r_gubun eq 'yca' or empty r_gubun}">class="active"</c:if> 
			            onclick="javascript:goGraphCampFish('yca')">캠핑년간</button>
			            
			    <button type="button" 
			            <c:if test="${r_gubun eq 'yfi'}">class="active"</c:if> 
			            onclick="javascript:goGraphCampFish('yfi')">낚시년간</button>
			            
			    <button type="button" 
			            <c:if test="${r_gubun eq 'mca'}">class="active"</c:if> 
			            onclick="javascript:goGraphCampFish('mca')">캠핑주간</button>
			            
			    <button type="button" 
			            <c:if test="${r_gubun eq 'mfi'}">class="active"</c:if> 
			            onclick="javascript:goGraphCampFish('mfi')">낚시주간</button>
			</div>
        
    </div>
    <div class="chart-container">
        <div class="y-axis"><span>100%</span><span>75%</span><span>50%</span><span>25%</span><span>0%</span></div>
        
<div class="bars-wrapper">

    <c:if test="${not empty graphArray}">
    
        <c:forEach items="${graphArray}" var="money" varStatus="st">
            
            <c:set var="maxGoal" value="0" />
              <c:forEach items="${graphArray}" var="m">
                  <c:if test="${m > maxGoal}">
                      <c:set var="maxGoal" value="${m}" />
                  </c:if>
              </c:forEach>
              
              <c:if test="${maxGoal == 0}"><c:set var="maxGoal" value="100000"/></c:if>
            
            <c:set var="height" value="0" />
            <c:if test="${money > 0}">
                <c:set var="height" value="${(money / maxGoal) * 100}" />
            </c:if>

            <c:if test="${height > 100}"><c:set var="height" value="100"/></c:if>

            <div class="bar-col">
                <fmt:formatNumber value="${money}" type="number" var="formattedMoney" />
                
                <div class="bar yellow" 
                     style="height: ${height}%;" 
                     title="${formattedMoney}원">
                </div>
                
                <div class="month-label">
                    <c:choose>
                        <c:when test="${r_gubun eq 'yca' or r_gubun eq 'yfi' or empty r_gubun}">
                            ${st.count}월
                        </c:when>
                        
                        <c:when test="${r_gubun eq 'mca' or r_gubun eq 'mfi' or empty r_gubun}">
                             <c:choose>
                                <c:when test="${st.index == 0}">월</c:when>
                                <c:when test="${st.index == 1}">화</c:when>
                                <c:when test="${st.index == 2}">수</c:when>
                                <c:when test="${st.index == 3}">목</c:when>
                                <c:when test="${st.index == 4}">금</c:when>
                                <c:when test="${st.index == 5}">토</c:when>
                                <c:otherwise>일</c:otherwise>
                             </c:choose>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </c:if>
    
    <c:if test="${empty graphArray}">
        <div style="width:100%; text-align:center; padding-top:50px; color:#999;">
            데이터가 없습니다.
        </div>
    </c:if>

</div>
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