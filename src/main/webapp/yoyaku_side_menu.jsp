<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="side-nav">
    <h3 class="menu-title">예약</h3>
    <ul>	
        <li <c:if test="${sidemenu eq 'fishing' }">class="active"</c:if>><a href="javascript:goPage('YoyakuFishing','main')">낚시 예약</a></li>
        <li <c:if test="${sidemenu eq 'camping' }">class="active"</c:if>><a href="javascript:goPage('YoyakuCamping','main')">캠핑 예약</a></li>
        <li><a href="javascript:goPage('Member','myyoyaku')"> 내 예약 </a></li>
    </ul>
</nav>
