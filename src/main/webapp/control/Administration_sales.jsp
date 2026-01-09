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

<body class="admin-page">
    <FORM name="controller">
        <input type="hidden" name="gubun">
       <header class="main-header" id="mainHeader">
        
        <nav class="main-nav">
            <%@include file = "cover2.jsp"%>
        </nav>
    </header>

    <div class="dashboard-container">
       <%@include file = "control_side_menu.jsp"%>

        <main class="main-content">
            
                <!-- 집어넣기 -->
                

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
                                            <div class="value">${campMonth}원</div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">낚시 월간 매출</span>
                                            <div class="value">${fishMonth}원</div>
                                            <div class="progress-container">
                                            </div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">캠핑 년간 매출</span>
                                            <div class="value">${campYear}원</div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">낚씨 년간 매출</span>
                                            <div class="value">${fishYear}원</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="content-split-row">
                                    <div class="card time-card">
                                        <div class="card-header"><h3>최근 매출</h3></div>
                                        <div class="time-list">
                                            <div class="week-header"><span>Week 5</span><span class="total-h">8h 30m</span></div>
                                            
                                            <div class="time-row">
                                                <div class="date-col"><span class="day-name">날짜</span><span class="date-num">7월 23일</span></div>
                                                <div class="input-group"><span class="input-box placeholder">12:00</span><span class="input-box placeholder">15:00</span></div>
                                                <div class="total-col"><span class="label-mini">Total</span><span class="time-val">300,000원</span></div>
                                            </div>
                                            <div class="time-row active">
                                                <div class="date-col"><span class="day-name">Wed</span><span class="date-num">July 24</span></div>
                                                <div class="input-group"><span class="input-box">12:00</span><span class="input-box">14:30</span></div>
                                                <div class="check-opt"><i class="fa-solid fa-check"></i> Applied</div>
                                            </div>
                                        </div>
                                    </div>
									
    <div class="card graph-card">
    <div class="card-header flex-between">
        <h3>매출 그래프</h3>
        <div class="toggle-pill">
            <button class="active">캠핑년간</button>
            <button>낚시년간</button>
            <button>캠핑월간</button>
            <button>낚시월간</button>
        </div>
    </div>
    <div class="chart-container">
        <div class="y-axis"><span>40</span><span>30</span><span>20</span><span>10</span></div>
        
        <div class="bars-wrapper">
            <div class="grid-line top-line"></div>
            <div class="grid-line mid-line"></div>

            <div class="bar-col">
                <div class="bar yellow" style="height: 40%;"></div>
                <div class="month-label">월</div>
            </div>
            <div class="bar-col">
                <div class="bar yellow-light" style="height: 60%;"></div>
                <div class="month-label">화</div>
            </div>
            <div class="bar-col">
                <div class="bar yellow" style="height: 30%;"></div>
                <div class="month-label">수</div>
            </div>
            <div class="bar-col">
                <div class="bar orange" style="height: 80%;"></div>
                <div class="month-label">목</div>
            </div>
            <div class="bar-col">
                <div class="bar black" style="height: 50%;"></div>
                <div class="month-label">금</div>
            </div>
            <div class="bar-col">
                <div class="bar orange" style="height: 70%;"></div>
                <div class="month-label">토</div>
            </div>
            <div class="bar-col">
                <div class="bar yellow" style="height: 90%;"></div>
                <div class="month-label">일</div>
            </div>
        </div>
    </div>
</div>


                                
                        </div>
                    </main>
                </div>
                </FORM>
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