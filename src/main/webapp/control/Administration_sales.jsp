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
<script>
    function goUser(){
        controller.gubun.value="user";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goSell(){
        controller.gubun.value="sell";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goReservation(){
        controller.gubun.value="reservation";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goDesh(){
        controller.gubun.value="desh";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
</script>
<body class="admin-page">
    <FORM name="controller">
        <input type="hidden" name="gubun">
    <header class="main-header" id="mainHeader">
        <div class="brand-wrapper">
            <div class="brand-text">niwacan</div>
            <svg class="brand-logo-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                <circle cx="50" cy="50" r="48" fill="#00ffcc" stroke="#1a1a1a" stroke-width="4"/>
                <path d="M50 20 L80 80 L20 80 Z" fill="#e6ff00" stroke="#1a1a1a" stroke-width="3" stroke-linejoin="round"/>
                <text x="50" y="72" font-family="Outfit, sans-serif" font-weight="900" font-size="36" text-anchor="middle" fill="#1a1a1a">nc</text>
            </svg>
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

    <div class="dashboard-container">
        <aside class="sidebar">
            <nav class="menu-nav">
                <a href="javascript:goDesh()" class="menu-item">
                    <i class="fa-solid fa-chart-pie"></i> <span>대쉬 보드</span>
                </a>
                <a href="javascript:goUser()" class="menu-item">
                    <i class="fa-solid fa-chart-line"></i> <span>회원 관리 </span>
                </a>
                <a href="javascript:goSell()" class="menu-item active">
                    <i class="fa-regular fa-credit-card"></i> <span>매출 통계</span>
                </a>
                <a href="javascript:goReservation()" class="menu-item">
                    <i class="fa-solid fa-box-open"></i> <span>예약 관리</span>
                </a>
            </nav>

            <div class="logout-area">
                <a href="#" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> <span>Log Out</span>
                </a>
            </div>
        </aside>

        <main class="main-content">
            
                <!-- 집어넣기 -->
                

                <div class="content-section dashboard-section">
                                <div class="project-header">
                                    <div class="header-top">
                                        <div class="title-group">
                                            <div class="logo-box"><i class="fa-solid fa-layer-group"></i></div>
                                            <h1>좌대 1-1</h1>
                                            <div class="tags">
                                                <span class="user-tag"><i class="fa-solid fa-circle user-dot"></i> 구별 태그</span>
                                                <span class="user-tag time-tag"><i class="fa-regular fa-clock"></i> 1시간 전</span>
                                            </div>
                                        </div>
                                        <div class="action-group">
                                            <button class="btn-white"><i class="fa-regular fa-pen-to-square"></i> Edit Project</button>
                                            <button class="btn-black"><i class="fa-solid fa-plus"></i> Actions</button>
                                        </div>
                                    </div>

                                    <div class="metrics-row">
                                        <div class="metric-item">
                                            <span class="label">년간 예약률</span>
                                            <div class="value">60.00</div>
                                            <div class="sub-info">
                                                <span class="muted">Billable</span> <span class="right">40.00</span><br>
                                                <span class="muted">Non-Billable</span> <span class="right">20.00</span>
                                            </div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">주간 예약률</span>
                                            <div class="value">16.00</div>
                                            <div class="progress-container">
                                                <div class="sub-info flex-between">
                                                    <span class="muted">Total Budget</span> <span class="muted">$0.00</span>
                                                </div>
                                                <div class="progress-bar-bg"><div class="progress-fill" style="width: 32%;"></div></div>
                                            </div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">년간 매출</span>
                                            <div class="value">$1,222.75</div>
                                            <div class="sub-info">
                                                <span class="muted">Time</span> <span class="right">$1,190.00</span><br>
                                                <span class="muted">Expenses</span> <span class="right">$32.75</span>
                                            </div>
                                        </div>
                                        <div class="metric-item">
                                            <span class="label">주간 매출</span>
                                            <div class="value">$3,432.75</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="content-split-row">
                                    <div class="card time-card">
                                        <div class="card-header"><h3>최근 매출</h3></div>
                                        <div class="time-list">
                                            <div class="week-header"><span>Week 5</span><span class="total-h">8h 30m</span></div>
                                            
                                            <div class="time-row">
                                                <div class="date-col"><span class="day-name">Mon</span><span class="date-num">July 24</span></div>
                                                <div class="input-group"><span class="input-box placeholder">From</span><span class="input-box placeholder">To</span></div>
                                                <div class="total-col"><span class="label-mini">Total</span><span class="time-val">0h 00m</span></div>
                                            </div>
                                            <div class="time-row">
                                                <div class="date-col"><span class="day-name">Tue</span><span class="date-num">July 24</span></div>
                                                <div class="input-group"><span class="input-box">15:00</span><span class="input-box">18:30</span></div>
                                                <div class="total-col"><span class="label-mini">Total</span><span class="time-val">2h 30m</span></div>
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
                                            <div class="toggle-pill"><button class="active">Project Progress</button><button>Hours Per Week</button></div>
                                        </div>
                                        <div class="chart-container">
                                            <div class="y-axis"><span>40</span><span>30</span><span>20</span><span>10</span></div>
                                            <div class="bars-wrapper">
                                                <div class="grid-line top-line"></div>
                                                <div class="grid-line mid-line"></div>
                                                <div class="bar-group">
                                                    <div class="bar-col"><div class="bar yellow" style="height: 75%;"></div></div>
                                                    <div class="bar-col"><div class="bar yellow-light" style="height: 50%;"></div></div>
                                                    <div class="bar-col"><div class="bar yellow-light" style="height: 70%;"></div></div>
                                                    <div class="month-label">June 2023</div>
                                                </div>
                                                <div class="bar-group">
                                                    <div class="bar-col"><div class="bar yellow-light" style="height: 85%;"></div></div>
                                                    <div class="bar-col"><div class="bar orange" style="height: 60%;"></div></div>
                                                    <div class="bar-col"><div class="bar black" style="height: 40%;"></div></div>
                                                    <div class="bar-col"><div class="bar orange" style="height: 78%;"></div></div>
                                                    <div class="month-label">July 2023</div>
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