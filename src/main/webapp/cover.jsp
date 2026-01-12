<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>昨日はできたのに</title>
    <link rel="stylesheet" href="css/css.css">
	<script type="text/javascript">
	function goPage(servlet,gubun){
		if(gubun!=null){
			work.t_gubun.value=gubun;
		}
		work.method="post";
		work.action=servlet;
		work.submit();
	}
	</script>
</head>
<body class="intro">
    <form name = "work">
	<input type="hidden" name="t_gubun">
	</form>
	<header class="main-header" id="mainHeader">
        <div class="brand-wrapper">
            <div class="brand-wrapper">
				<a href="javascript:goPage('Index')">
				    <img src="images/F5.png" alt="company 로고" class="brand-logo" />
	            </a>
			</div>
            <svg class="brand-logo-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                <circle cx="50" cy="50" r="48" fill="#00ffcc" stroke="#1a1a1a" stroke-width="4"/>
                <path d="M50 20 L80 80 L20 80 Z" fill="#e6ff00" stroke="#1a1a1a" stroke-width="3" stroke-linejoin="round"/>
                <text x="50" y="72" font-family="Outfit, sans-serif" font-weight="900" font-size="36" text-anchor="middle" fill="#1a1a1a">nc</text>
            </svg>
        </div>
        <nav class="main-nav">
            <a href="javascript:goPage('Show','list')" class="nav-item">시설안내</a>
            <a href="javascript:goPage('YoyakuCamping','main')" class="nav-item">예약하기</a>
            <a href="javascript:goPage('Review','list')" class="nav-item">후기/포토</a>
            <a href="javascript:goPage('Notice','list')" class="nav-item">공지사항</a>
            <c:if test="${empty sessionId }">
            	<a href="javascript:goPage('Member','login')" class="nav-item">Login</a>
	            <a href="javascript:goPage('Member','join')" class="nav-item">Join</a>
            </c:if>
            <c:if test="${not empty sessionId }">
	            <a href="javascript:goPage('Member','myinfo')" class="nav-item">내 정보</a>
				<a href="javascript:goPage('Member','memberLogout')" class="nav-item">Logout</a>
      		</c:if>
      		<c:if test="${sessionLevel eq 'top'}">
            	<a href="javascript:goPage('Control')" class="nav-item">관리자</a>
        	</c:if>
        </nav>
    </header>
    <header id="main-header">
        <div id="logo-box">
            <span>LOGO</span> 
        </div>
    </header>
    <section class="intro-top">
        <div class="top-content">
            <div class="brand-subtitle">The Hybrid Holiday</div>
            <h1 class="brand-title">F5&nbsp;&nbsp;</h1>
        </div>
    </section>

    <section class="intro-bottom">
        <div class="split-section camp-section" onclick="javascript:goPage('YoyakuCamping','main')">
            <svg class="section-icon" viewBox="0 0 100 100">
                <path d="M50 10 Q 70 50 90 60 Q 90 90 50 90 Q 10 90 10 60 Q 30 50 50 10 Z" fill="#fff" stroke="#1a1a1a" stroke-width="4"/>
                <path d="M50 30 Q 60 55 70 65 Q 70 80 50 80 Q 30 80 30 65 Q 40 55 50 30 Z" fill="#ffcc00" stroke="#1a1a1a" stroke-width="3"/>
            </svg>
            <h2 class="section-title">CAMP</h2>
            <a href="javascript:goPage('YoyakuCamping','main')" class="enter-pill">입장하기</a>
        </div>
        <div class="split-section fish-section" onclick="goPage('YoyakuFishing','main')">
            <svg class="section-icon" viewBox="0 0 100 100">
                <path d="M10 50 Q 30 20 70 20 L 90 50 L 70 80 Q 30 80 10 50 Z" fill="#fff" stroke="#1a1a1a" stroke-width="4"/>
                <circle cx="70" cy="40" r="5" fill="#1a1a1a"/>
                <path d="M60 50 L 50 50" stroke="#1a1a1a" stroke-width="3"/>
                <path d="M90 50 L 100 30 M 90 50 L 100 70" stroke="#1a1a1a" stroke-width="4" fill="none"/>
            </svg>
            <h2 class="section-title">FISH</h2>
            <a href="javascript:goPage('YoyakuFishing','main')" class="enter-pill">입장하기</a>
        </div>
    </section>

</body>
</html>