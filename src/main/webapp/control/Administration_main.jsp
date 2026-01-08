<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/control/Administration.css"> 
    <link rel="stylesheet" href="admin_style.css">
</head>

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
    <FORM name="controller">
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
                                <span class="badge-pill">+17%</span>
                            </div>
                            <div class="card-info"><span class="label">캠핑 매출</span><h2 class="amount">56,000원</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        <div class="stat-card card-yellow">
                            <div class="card-top">
                                <div class="icon-circle"><i class="fa-solid fa-bag-shopping"></i></div>
                                <span class="badge-pill">+23%</span>
                            </div>
                            <div class="card-info"><span class="label">낚시 매출</span><h2 class="amount">24,000원</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        
                    </div>

                    <div class="chart-section">
                        <div class="section-header">
                            <h2>매출 추이</h2>
                            <span class="big-percent">+ 3,2%</span>
                        </div>
                        <div class="bar-chart-visual">
                             <div class="y-axis"><span>40K</span><span>30K</span><span>20K</span><span>10K</span><span>0</span></div>
                             <div class="bars-container">
                                <div class="bar-col"><div class="bar" style="height: 40%;"></div><span class="day">Mon</span></div>
                                <div class="bar-col active"><div class="tooltip">$33k</div><div class="bar" style="height: 85%;"></div><span class="day">Tue</span></div>
                                <div class="bar-col active"><div class="bar" style="height: 70%;"></div><span class="day">Wed</span></div>
                                <div class="bar-col"><div class="bar" style="height: 50%;"></div><span class="day">Thu</span></div>
                                <div class="bar-col"><div class="bar" style="height: 35%;"></div><span class="day">Fri</span></div>
                                <div class="bar-col"><div class="bar" style="height: 80%;"></div><span class="day">Sat</span></div>
                                <div class="bar-col"><div class="bar" style="height: 60%;"></div><span class="day">Sun</span></div>
                             </div>
                        </div>
                    </div>

                   
                </section>

                <aside class="right-panel">
                    <div class="widget donut-widget">
                        <h3>총매출</h3>
                        <div class="donut-visual">
                             <div class="inner-circle"><span class="total-val">$76k</span></div>
                        </div>
                        
                    </div>
                    
                    <div class="widget recent-sales-widget">
                        <h3>최근판매</h3>
                        <ul class="sales-list-vertical">
                            <li><img src="https://i.pravatar.cc/150?img=33" alt=""><div class="text"><strong>Steven</strong><span>2m ago</span></div><div class="money">+$52</div></li>
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