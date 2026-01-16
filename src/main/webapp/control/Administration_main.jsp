<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/control/Administration.css"> 
    <link rel="stylesheet" href="admin_style.css">
</head>
    <title>niwacan Admin Dashboard</title>
<body class="admin-page">
    
    <header class="main-header" id="mainHeader">
        <div class="brand-wrapper">
             <%@include file = "cover2.jsp"%>
        </div>
        
        <nav class="main-nav">
            <a href="#" class="nav-item">CONCEPT</a>
            <a href="#" class="nav-item">PRODUCTS</a>
            <a href="#" class="nav-item">GALLERY</a>
            
            <div class="admin-tools">
                 <i class="fa-solid fa-magnifying-glass"></i>
                 <i class="fa-solid fa-bell"></i>
                 <img src="https://i.pravatar.cc/150?img=11" class="header-profile-img" alt="User">
            </div>
        </nav>
    </header>
    <FORM name="work">
        <input type="hidden" name="t_gubun">
    <div class="dashboard-container">
        <aside class="sidebar">
        <nav class="main-nav">
            <%@include file = "control_side_menu.jsp"%>
        </nav>

            <div class="logout-area">
                <a href="#" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> 
                    <span>Log Out</span>
                </a>
            </div>
        </aside>

        <main class="main-content">
            <div class="dashboard-grid">
                <section class="center-panel">
                    
                    <div class="cards-row">
                        <div class="stat-card card-mint">
                            <div class="card-top">
                                <div class="icon-circle"><i class="fa-solid fa-wallet"></i></div>
                            </div>
                            <div class="card-info"><span class="label">캠핑 매출</span><h2 class="amount"><fmt:formatNumber value="${campYear}" currencySymbol="###,###"/>원</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        <div class="stat-card card-yellow">
                            <div class="card-top">
                                <div class="icon-circle"><i class="fa-solid fa-bag-shopping"></i></div>
                            </div>
                            <div class="card-info"><span class="label">낚시 매출</span><h2 class="amount"><fmt:formatNumber value="${fishYear}" currencySymbol="###,###"/>원</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        
                    </div>

					<div class="chart-section">
					    <div class="section-header">
					        <h2>매출 추이 (Weekly)</h2>
					    </div>
					    <div class="bar-chart-visual">
					         
					         <div class="bars-container">
					            
					            <c:choose>
					                <c:when test="${not empty graphArray}">
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
					
					                        <div class="bar-col active">
					                            
					                            <fmt:formatNumber value="${money}" type="number" var="fmtMoney"/>
					                            <div class="tooltip">${fmtMoney}</div>
					                            
					                            <div class="bar" style="height: ${height}%;"></div>
					                            
					                            <span class="day">
					                                <c:choose>
					                                    <c:when test="${st.index == 0}">Mon</c:when>
					                                    <c:when test="${st.index == 1}">Tue</c:when>
					                                    <c:when test="${st.index == 2}">Wed</c:when>
					                                    <c:when test="${st.index == 3}">Thu</c:when>
					                                    <c:when test="${st.index == 4}">Fri</c:when>
					                                    <c:when test="${st.index == 5}">Sat</c:when>
					                                    <c:when test="${st.index == 6}">Sun</c:when>
					                                </c:choose>
					                            </span>
					                        </div>
					                    </c:forEach>
					                </c:when>
					                
					                <c:otherwise>
					                    <div style="width:100%; text-align:center; padding-top:50px; color:#999;">
					                        No Data
					                    </div>
					                </c:otherwise>
					            </c:choose>
					         </div>
					    </div>
					</div>
                    
                    
                    
				<section>
                    <c:set var="val1" value="${empty campYear ? 0 : campYear}" />
					<c:set var="val2" value="${empty fishYear ? 0 : fishYear}" />
					
					<c:set var="total" value="${val1 + val2}" />
                    
                    <c:choose>
                        <c:when test="${total >= 1000}">
                            <c:set var="displayValue" value="${total * 0.001}" />
                            <c:set var="unit" value="k" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="displayValue" value="${total}" />
                            <c:set var="unit" value="" />
                        </c:otherwise>
                    </c:choose>
                </section>
                   
                </section>
                <aside class="right-panel">
                    <div class="widget donut-widget">
                        <h3>총매출</h3>
                        <div class="donut-visual">
                             <div class="inner-circle">
	                             <span class="total-val"><fmt:formatNumber value="${displayValue}" currencySymbol="###,###"/>${unit}₩</span>
                             </div>
                        </div>
                        
                    </div>
                    
                    <div class="widget recent-sales-widget">
                        <h3>최근판매</h3>
                        <ul class="sales-list-vertical">
							<c:forEach items="${list}" var="dto" end="4">
                                  <div class="time-row">
                                       <div class="date-col"><span class="day-name">결재일</span><span class="date-num">${fn:substring(dto.getPaydate(), 0, 10)}</span></div>
                                       <div class="input-group"><span class="input-box placeholder"><span class="day-name">유저 ID</span><br><span class="date-num">${dto.getUserid()}</span></span>
                                       </div>
                                       <div class="total-col"><span class="label-mini">Total</span><span class="time-val"><fmt:formatNumber value="${dto.getPrice()}" currencySymbol="###,###"/>원</span></div>
                                  </div>
                            </c:forEach>
                            
                        </ul>
                    </div>
                </aside>
            </div>
        </main>
    </div>
    </FORM>
    <script>
        // 스크롤 시 헤더 디자인 변경 (메인 콘텐츠 내부 스크롤 감지)
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