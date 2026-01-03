<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <a href="javascript:goPage('Qna','qna_view')" class="nav-item">뷰</a>
            <a href="javascript:goPage('Qna','qna_write')" class="nav-item">라이트</a>
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
      		<c:if test="${sessionId eq 'top'}">
            	<a href="javascript:goPage('Control','main')" class="nav-item">관리자</a>
        	</c:if>
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