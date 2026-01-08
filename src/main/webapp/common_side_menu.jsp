<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 요청된 URL을 가져옵니다. 
	String uri = request.getRequestURI();
	String qStr = request.getQueryString(); 
	if(qStr == null) qStr = "";
%>

<nav class="side-nav">
    <h3 class="menu-title">메뉴</h3>
    <ul>
        
        <li class="<%= uri.contains("Show") || uri.contains("show") ? "active" : "" %>">
        	<a href="javascript:goPage('Show','list')">시설안내</a>
        </li>
        
        
        <li class="<%= uri.contains("Notice") || uri.contains("notice") ? "active" : "" %>">
        	<a href="javascript:goPage('Notice','list')">공지사항</a>
        </li>
        
        
        <li class="<%= uri.contains("Review") || uri.contains("review") ? "active" : "" %>">
        	<a href="javascript:goPage('Review','list')">후기/포토</a>
        </li>
        
        
        <li class="<%= (uri.contains("Qna") || uri.contains("qna")) && qStr.contains("faq") ? "active" : "" %>">
        	<a href="javascript:goPage('Qna','faq_list')">FAQ</a>
        </li>
        
       
        <li class="<%= (uri.contains("Qna") || uri.contains("qna")) && qStr.contains("qna") ? "active" : "" %>">
        	<a href="javascript:goPage('Qna','qna_list')">Q & A</a>
        </li>
        
    </ul>
</nav>