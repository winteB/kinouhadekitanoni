<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
</head>
<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>
	
    <div class="layout">
        <!-- 사이드바 -->
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

      
      <div id="b_right">
         <p class="n_title">
            NOTICE
         </p>
         <div class="record_group record_group_left">
            <p><i class="fa-solid fa-bell"></i> 총게시글<span> ${totalCount } </span>건</p>
         </div>
         <form name="noti">
         <input type="hidden" name="t_nowPage" >
         <p class="select_box select_box_right">
            <select name="t_select" class="sel_box">
               <option value="" selected >Title</option>
               <option value="title"<c:if test="${select eq 'title' }">selected</c:if>>Title</option>
               <option value="content" <c:if test="${select eq 'content' }">selected</c:if>>Content</option>
            </select>
            <input type="text" name="t_search" value="${search }" class="sel_text"><!-- name은 갈때 t_search, 올때 search로 온다 -->

            <button type="button"  onclick="goSearch()" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
         </p>
         </form>      
         
         <table class="boardList">
            <colgroup>
               <col width="5%">
               <col width="60%">
               <col width="5%">
               <col width="10%">
               <col width="14%">
               <col width="6%">
            </colgroup>
            <thead>
               <tr>
                  <th>No</th>
                  <th>Title</th>
                  <th>Attach</th>
                  <th>Reg Name</th>
                  <th>Reg Date</th>
                  <th>Hit</th>
               </tr>
            </thead>
            <tbody>
            
            <c:set var="sort" value="${order}"></c:set>
            <c:forEach items="${list}" var="dto">
               <tr>
                  <td>
                     ${sort}
                     <c:set var="sort" value="${sort - 1}"></c:set>
                  </td>
                  <td class="t_left"><a href="javascript:goView('${dto.getNo()}')">${dto.getTitle() }</a></td>
                  <td>
                     <c:if test="${not empty dto.getAttach()}">
                        <img src="images/clip.png">
                     </c:if>
                  </td>
                  <td>${dto.getReg_name() }</td>
                  <td>${dto.getReg_date() }</td>
                  <td>${dto.getHit() }</td>
               </tr>
            </c:forEach>
            
            <!-- 🔽 데이터 없을 때 임시 표시 -->
			<c:if test="${empty list}">
			   <tr>
			      <td>3</td>
			      <td class="t_left">사이트 이용 안내 공지사항</td>
			      <td>-</td>
			      <td>관리자</td>
			      <td>2025-01-01</td>
			      <td>12</td>
			   </tr>
			   <tr>
			      <td>2</td>
			      <td class="t_left">겨울 시즌 휴무 일정 안내</td>
			      <td>-</td>
			      <td>관리자</td>
			      <td>2024-12-20</td>
			      <td>34</td>
			   </tr>
			   <tr>
			      <td>1</td>
			      <td class="t_left">niwacan 오픈 공지</td>
			      <td>-</td>
			      <td>관리자</td>
			      <td>2024-12-01</td>
			      <td>102</td>
			   </tr>
			</c:if>
                  
            </tbody>
         </table>
         
         <div class="paging">
         <!--  
            <a href=""><i class="fa fa-angle-double-left"></i></a>
            <a href=""><i class="fa fa-angle-left"></i></a>
            <a href="" class="active">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href=""><i class="fa fa-angle-right"></i></a>
            <a href=""><i class="fa fa-angle-double-right"></i></a>
         -->   
            ${pageDisplay}
            <c:if test="${sessionLevel eq 'top' }">
               <a href="javascript:goWriteForm()" class="write">글쓰기</a>
            </c:if>
         </div>
      </div>
   </div>   
   </div>
   <footer>
    <%@ include file="../common_footer.jsp" %>
	</footer>