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
                <a href="#" class="menu-item active">
                    <i class="fa-solid fa-chart-pie"></i> <span>Dashboard</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-solid fa-chart-line"></i> <span>Membership management</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-regular fa-credit-card"></i> <span>sales statistics</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-solid fa-box-open"></i> <span>Manage reservations</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-regular fa-user"></i> <span>Inquiry Management</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-solid fa-gear"></i> <span>Managing Bulletin</span>
                </a>
            </nav>

            <div class="logout-area">
                <a href="#" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> <span>Log Out</span>
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
                            <div class="card-info"><span class="label">Balance</span><h2 class="amount">$ 56,874</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        <div class="stat-card card-yellow">
                            <div class="card-top">
                                <div class="icon-circle"><i class="fa-solid fa-bag-shopping"></i></div>
                                <span class="badge-pill">+23%</span>
                            </div>
                            <div class="card-info"><span class="label">Sales</span><h2 class="amount">$ 24,575</h2></div>
                            <div class="wave-bg"></div>
                        </div>
                        <div class="stat-card card-dark">
                            <div class="upgrade-content">
                                <h3>Upgrade PRO</h3>
                                <button class="btn-glow">Go Pro</button>
                            </div>
                        </div>
                    </div>

                    <div class="chart-section">
                        <div class="section-header">
                            <h2>User In The Last Week</h2>
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

                    <div class="orders-section">
                        <div class="section-header"><h2>Last Orders</h2><a href="#" class="link-more">View All</a></div>
                        <div class="order-row">
                            <div class="user-info"><img src="https://i.pravatar.cc/150?img=12" alt=""><span>David Astee</span></div>
                            <span class="price">$1,456</span><span class="status st-red">Chargeback</span>
                        </div>
                        <div class="order-row">
                            <div class="user-info"><img src="https://i.pravatar.cc/150?img=5" alt=""><span>Maria Hulama</span></div>
                            <span class="price">$42,378</span><span class="status st-mint">Completed</span>
                        </div>
                    </div>
                </section>

                <aside class="right-panel">
                    <div class="widget donut-widget">
                        <h3>Monthly Profits</h3>
                        <div class="donut-visual">
                             <div class="inner-circle"><span class="total-val">$76k</span></div>
                        </div>
                        <div class="legend-box">
                            <div class="legend"><span class="dot mint"></span>Giveaway</div>
                            <div class="legend"><span class="dot yellow"></span>Affiliate</div>
                            <div class="legend"><span class="dot gray"></span>Offline</div>
                        </div>
                    </div>
                    
                    <div class="widget recent-sales-widget">
                        <h3>Recent Sales</h3>
                        <ul class="sales-list-vertical">
                            <li><img src="https://i.pravatar.cc/150?img=33" alt=""><div class="text"><strong>Steven</strong><span>2m ago</span></div><div class="money">+$52</div></li>
                            <li><img src="https://i.pravatar.cc/150?img=47" alt=""><div class="text"><strong>Jordan</strong><span>5m ago</span></div><div class="money">+$83</div></li>
                            <li><img src="https://i.pravatar.cc/150?img=9" alt=""><div class="text"><strong>Anna</strong><span>15m ago</span></div><div class="money">+$2,351</div></li>
                        </ul>
                    </div>
                </aside>
            </div>
        </main>
    </div>

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