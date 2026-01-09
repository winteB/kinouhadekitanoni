<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="side-nav">
    <h3 class="menu-title">메뉴</h3>
    <ul>
    	<c:if test="${empty sessionId }">
	    	<li <c:if test="${sidemenu_active eq 'login' }"> class="active" </c:if>>
	    		<a href="javascript:goPage('Member','login')">로그인</a></li>
	        <li <c:if test="${sidemenu_active eq 'join' }"> class="active" </c:if>>
	        	<a href="javascript:goPage('Member','join')">회원가입</a></li>
        </c:if>
        <c:if test="${not empty sessionId }">
	        <li <c:if test="${sidemenu_active eq 'myinfo' }"> class="active" </c:if>>
	        	<a href="javascript:goPage('Member','myinfo')">내 정보</a></li>
	        <li <c:if test="${sidemenu_active eq 'myyoyaku' }"> class="active" </c:if>>
	        	<a href="javascript:goPage('Member','myyoyaku')">내 예약</a></li>
	        <li <c:if test="${sidemenu_active eq 'password' }"> class="active" </c:if>>
	        	<a href="javascript:goPage('Member','password')">비밀번호 변경</a></li>
    	</c:if>
    </ul>
</nav>