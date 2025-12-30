<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 예약 관리 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan Admin - List View</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="Administration.css"> 
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
                <a href="#" class="menu-item">
                    <i class="fa-solid fa-chart-pie"></i> <span>Dashboard</span>
                </a>
                <a href="#" class="menu-item active">
                    <i class="fa-solid fa-chart-line"></i> <span>Membership management</span>
                </a>
                <a href="#" class="menu-item">
                    <i class="fa-regular fa-credit-card"></i> <span>Sales statistics</span>
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
            <div class="content-wrapper">
                <!-- 집어넣기 -->
                 <div class="project-list-block">
    
    <div class="list-top-bar">
        <div class="tab-container">
            <button class="tab-btn active">종합</button>
            <button class="tab-btn">캠핑</button>
            <button class="tab-btn">낚시</button>
        </div>

        <div class="filter-container">
            <button class="btn-icon-only"><i class="fa-solid fa-filter"></i></button>
            <div class="dropdown-trigger">
                <span>종합</span>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </div>

    <div class="cards-stack">
        
        <div class="p-card">
            <div class="p-left">
                <div class="p-icon color-purple">
                    <i class="fa-brands fa-figma"></i>
                </div>
                <div class="p-info">
                    <div class="p-title">캠핑 10-1 지역</div>
                    <div class="p-meta">
                        <span class="date"><i class="fa-regular fa-calendar"></i> Created Sep 12, 2023</span>
                        <span class="badge medium"><i class="dot"></i> Medium</span>
                    </div>
                </div>
            </div>

            <div class="p-middle">
                <div class="data-label">예약 데이터</div>
                <div class="data-row">
                    <div class="data-col">
                        <span class="lbl">All tasks</span>
                        <span class="val">34</span>
                    </div>
                    <div class="data-col">
                        <span class="lbl">Active tasks</span>
                        <span class="val">13</span>
                    </div>
                </div>
            </div>

            <div class="p-right">
                <div class="data-label">예약자  </div>
                <div class="avatar-group">
                    <img src="https://i.pravatar.cc/150?img=33" alt="">
                    <img src="https://i.pravatar.cc/150?img=47" alt="">
                    <div class="avatar-more">+2</div>
                </div>
            </div>
        </div>

        <div class="p-card">
            <div class="p-left">
                <div class="p-icon color-yellow">
                    <i class="fa-solid fa-utensils"></i>
                </div>
                <div class="p-info">
                    <div class="p-title">Food Delivery Service</div>
                    <div class="p-meta">
                        <span class="date"><i class="fa-regular fa-calendar"></i> Created Sep 14, 2023</span>
                        <span class="badge medium"><i class="dot"></i> Medium</span>
                    </div>
                </div>
            </div>

            <div class="p-middle">
                <div class="data-label">Project Data</div>
                <div class="data-row">
                    <div class="data-col">
                        <span class="lbl">All tasks</span>
                        <span class="val">50</span>
                    </div>
                    <div class="data-col">
                        <span class="lbl">Active tasks</span>
                        <span class="val">24</span>
                    </div>
                </div>
            </div>

            <div class="p-right">
                <div class="data-label">Assignees</div>
                <div class="avatar-group">
                    <img src="https://i.pravatar.cc/150?img=12" alt="">
                    <img src="https://i.pravatar.cc/150?img=5" alt="">
                    <img src="https://i.pravatar.cc/150?img=9" alt="">
                </div>
            </div>
        </div>

        <div class="p-card">
            <div class="p-left">
                <div class="p-icon color-blue">
                    <i class="fa-solid fa-layer-group"></i>
                </div>
                <div class="p-info">
                    <div class="p-title">Internal Project</div>
                    <div class="p-meta">
                        <span class="date"><i class="fa-regular fa-calendar"></i> Created Sep 20, 2023</span>
                        <span class="badge low"><i class="dot"></i> Low</span>
                    </div>
                </div>
            </div>

            <div class="p-middle">
                <div class="data-label">Project Data</div>
                <div class="data-row">
                    <div class="data-col">
                        <span class="lbl">All tasks</span>
                        <span class="val">25</span>
                    </div>
                    <div class="data-col">
                        <span class="lbl">Active tasks</span>
                        <span class="val">20</span>
                    </div>
                </div>
            </div>

            <div class="p-right">
                <div class="data-label">Assignees</div>
                <div class="avatar-group">
                    <img src="https://i.pravatar.cc/150?img=60" alt="">
                    <img src="https://i.pravatar.cc/150?img=3" alt="">
                    <div class="avatar-more check"><i class="fa-solid fa-check"></i></div>
                </div>
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