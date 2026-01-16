<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <aside class="sidebar">
<nav class="menu-nav">
        
        <a href="${pageContext.request.contextPath}/Control?t_gubun=desh" 
           class="menu-item <c:if test="${param.t_gubun eq 'desh' or empty param.t_gubun or param.t_gubun eq 'main'}">active</c:if>">
            <i class="fa-solid fa-chart-pie"></i> <span>대쉬 보드</span>
        </a>
        
        <a href="${pageContext.request.contextPath}/Control?t_gubun=user" 
           class="menu-item <c:if test="${param.t_gubun eq 'user'}">active</c:if>">
            <i class="fa-solid fa-chart-line"></i> <span>회원 관리</span>
        </a>

        <a href="${pageContext.request.contextPath}/Control?t_gubun=sell" 
           class="menu-item <c:if test="${param.t_gubun eq 'sell' or param.t_gubun eq 'yca' or param.t_gubun eq 'yfi' or param.t_gubun eq 'mca' or param.t_gubun eq 'mfi'}">active</c:if>">
            <i class="fa-regular fa-credit-card"></i> <span>매출 통계</span>
        </a>

        <a href="${pageContext.request.contextPath}/Control?t_gubun=reservation" 
           class="menu-item <c:if test="${param.t_gubun eq 'reservation'}">active</c:if>">
            <i class="fa-solid fa-box-open"></i> <span>예약 관리</span>
        </a>
        
    </nav>

            <div class="logout-area">
                <a href="javascript:goPage('Member','memberLogout')" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> <span>Log Out</span>
                </a>
            </div>
        </aside>