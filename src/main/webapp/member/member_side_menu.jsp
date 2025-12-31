<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="side-nav">
    <h3 class="menu-title">메뉴</h3>
    	<c:if test="${empty sessionId }">
	    	<li class="active"><a href="javascript:goPage('Member','login')">로그인</a></li>
	        <li><a href="javascript:goPage('Member','join')">회원가입</a></li>
        </c:if>
        <c:if test="${not empty sessionId }">
	        <li><a href="javascript:goPage('Member','myinfo')">내 정보</a></li>
	        <li><a href="javascript:goPage('Member','myyoyaku')">내 예약</a></li>
	        <li><a href="javascript:goPage('Member','password')">비밀번호 변경</a></li>
    	</c:if>
    </ul>
</nav>