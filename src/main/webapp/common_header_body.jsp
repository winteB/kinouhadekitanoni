<%@ page pageEncoding="UTF-8"%>
<form name = "work">
	<input type="hidden" name="t_gubun">
</form>
<header class="main-header" id="mainHeader">
        <div class="brand-wrapper">
        	<a href="javascript:goPage('Index')">
			    <img src="images/F5.png" alt="company 로고" class="brand-logo" />
            </a>
        </div>
        <nav class="main-nav">
            <a href="javascript:goPage('Show','list')" class="nav-item">시설안내</a>
            <a href="javascript:goPage('YoyakuCamping','main')" class="nav-item">예약하기</a>
            <a href="javascript:goPage('Review','list')" class="nav-item">후기/포토</a>
            <a href="javascript:goPage('Notice','list')" class="nav-item">공지사항</a>
            <a href="javascript:goPage('Member','login')" class="nav-item">Login</a>
            <a href="javascript:goPage('Member','join')" class="nav-item">Join</a>
            <a href="javascript:goPage('Member','myinfo')" class="nav-item">내 정보</a>
            <a href="javascript:goPage('Control','main')" class="nav-item">관리자</a>
        </nav>
    </header>
    <header id="main-header">
        <div id="logo-box">
            <span>LOGO</span> 
        </div>
    </header>

       <div style="height: 400px; background-color: blue;">
   	 <img src="images/F5 헤더.png" 
        	 alt="사진" 
     	    style="width: 100%; height: 100%; object-fit: cover;">
</div>