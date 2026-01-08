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
        <aside class="sidebar">
            <nav class="menu-nav">
                <a href="javascript:goDesh()" class="menu-item">
                    <i class="fa-solid fa-chart-pie"></i> <span>대쉬 보드</span>
                </a>
                <a href="javascript:goUser()" class="menu-item">
                    <i class="fa-solid fa-chart-line"></i> <span>회원 관리 </span>
                </a>
                <a href="javascript:goSell()" class="menu-item">
                    <i class="fa-regular fa-credit-card"></i> <span>매출 통계</span>
                </a>
                <a href="javascript:goReservation()" class="menu-item active">
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
            <div class="content-wrapper">
                <!-- 집어넣기 -->
                 <div class="project-list-block">
    
    <div class="list-top-bar">
        <div class="tab-container">
            <button class="tab-btn active">종합</button>
            <button class="tab-btn">캠핑</button>
            <button class="tab-btn">낚시</button>
        </div>

    </div>

    <div class="cards-stack">
        
        <div class="p-card">
            <div class="p-left">
                <div class="p-icon color-purple">
                    <i class="fa-brands fa-figma"></i>
                </div>
                <div class="p-info">
                    <div class="p-title">글램핑 G-11</div>
                    <div class="p-meta">
                        <span class="date"><i class="fa-regular fa-calendar"></i> 2025-01-01~2025-01-02</span>
                    </div>
                </div>
            </div>
            <div class="p-middle">
                <div class="data-label">결재 여부</div>
                <div class="data-row">
                    <div class="data-col">
                        <span class="lbl">결재완료</span>
                        <span class="val">Y</span>
                    </div>
                    <div class="data-col">
                        <span class="lbl">미결재</span>
                        <span class="val">N</span>
                    </div>
                </div>
            </div>

            <div class="p-right">
                <div class="data-label">예약자  </div>
                <div class="avatar-group">
                	<span class="val">IDDDDD</span>
                </div>
            </div>
        </div>


        </div>

    </div>
</div>
</FORM>
              

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