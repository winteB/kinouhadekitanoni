<%@ page pageEncoding="UTF-8"%>

<body class="intro">
    <form name = "work">
	<input type="hidden" name="t_gubun">
	</form>
	<header class="main-header" id="mainHeader">
            <div class="brand-wrapper">
                <img src="${pageContext.request.contextPath}/images/F5.png" alt="company 로고" class="brand-logo-img" />

                <svg class="brand-logo-svg" ...>
                ...
                </svg>
            </div>
        <nav class="main-nav">
            <a href="javascript:goPage('Show','list')" class="nav-item">시설안내</a>
            <a href="javascript:goPage('YoyakuCamping','main')" class="nav-item">예약하기</a>
            <a href="javascript:goPage('Review','list')" class="nav-item">후기/포토</a>
            <a href="javascript:goPage('Notice','list')" class="nav-item">공지사항</a>
            <a href="javascript:goPage('Member','login')" class="nav-item">Login</a>
            <a href="javascript:goPage('Member','join')" class="nav-item">Join</a>
            <a href="javascript:goPage('Member','myinfo')" class="nav-item">내 정보</a>
        </nav>
    </header>
    <header id="main-header">
        <div id="logo-box">
            <span>LOGO</span> 
        </div>
    </header>
    <section class="intro-top">
        <div class="top-content">
            <div class="brand-subtitle">The Hybrid Life</div>
            <h1 class="brand-title">NIWACAN</h1>
        </div>
    </section>

    <section class="intro-bottom">
        <div class="split-section camp-section" onclick="javascript:goPage('YoyakuCamping','main')">
            <svg class="section-icon" viewBox="0 0 100 100">
                <path d="M50 10 Q 70 50 90 60 Q 90 90 50 90 Q 10 90 10 60 Q 30 50 50 10 Z" fill="#fff" stroke="#1a1a1a" stroke-width="4"/>
                <path d="M50 30 Q 60 55 70 65 Q 70 80 50 80 Q 30 80 30 65 Q 40 55 50 30 Z" fill="#ffcc00" stroke="#1a1a1a" stroke-width="3"/>
            </svg>
        </div>
        <div class="split-section fish-section" onclick="goPage('YoyakuFishing','main')"">
            <svg class="section-icon" viewBox="0 0 100 100">
                <path d="M10 50 Q 30 20 70 20 L 90 50 L 70 80 Q 30 80 10 50 Z" fill="#fff" stroke="#1a1a1a" stroke-width="4"/>
                <circle cx="70" cy="40" r="5" fill="#1a1a1a"/>
                <path d="M60 50 L 50 50" stroke="#1a1a1a" stroke-width="3"/>
                <path d="M90 50 L 100 30 M 90 50 L 100 70" stroke="#1a1a1a" stroke-width="4" fill="none"/>
            </svg>
        </div>
    </section>

</body>
