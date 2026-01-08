<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
	
	<script type="text/javascript">
		function goWrite() {
			location.href = "Review?t_gubun=write";
		}
	</script>
</head>
<body class="main-page">
 <div class="wrapper">
        <%@ include file = "../common_header_body.jsp" %>
	<div class="layout">
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <main class="main-content">
        <div class="container">
   		<div class="product-section-wrapper list-page-wrapper">
        
        <section class="list-header-section">
            <div class="page-title-box">
                <h1 class="page-title">REVIEW <span class="highlight-tape">LIST</span></h1>
                <p class="page-desc">niwacan 이용 고객님들의 소중한 후기입니다.</p>
            </div>

            <!-- 카테고리 필터 영역 -->
            <div class="category-filter">
                <button class="filter-btn ${empty param.t_search ? 'active' : ''}" 
                        onclick="location.href='Review?t_gubun=list'">ALL</button>
                <button class="filter-btn ${param.t_search eq '좌대낚시' ? 'active' : ''}" 
                        onclick="location.href='Review?t_gubun=list&t_search=좌대낚시'">낚시</button>
                <button class="filter-btn ${param.t_search eq '글램핑' ? 'active' : ''}" 
                        onclick="location.href='Review?t_gubun=list&t_search=글램핑'">글램핑</button>
                <button class="filter-btn ${param.t_search eq '오토캠핑' ? 'active' : ''}" 
                        onclick="location.href='Review?t_gubun=list&t_search=오토캠핑'">오토캠핑</button>
                <button class="filter-btn ${param.t_search eq '카라반' ? 'active' : ''}" 
                        onclick="location.href='Review?t_gubun=list&t_search=카라반'">카라반</button>
            </div>
        </section>

        <!-- 리스트 그리드 시작 -->
        <div class="product-grid list-grid">
        	
        	<c:if test="${empty t_list}">
        		<div style="width:100%; text-align:center; grid-column: 1 / -1; padding: 50px; color:#666;">
        			등록된 리뷰가 없습니다.
        		</div>
        	</c:if>

			<c:forEach items="${t_list}" var="dto">
	            <a href="Review?t_gubun=view&t_no=${dto.no}" class="product-card">
	                <div class="card-img-box">
	                	<c:choose>
	                		<c:when test="${not empty dto.attach and dto.attach ne 'null' and dto.attach ne ''}">
	                			<!-- 이미지가 있을 때 -->
	                			<img src="${pageContext.request.contextPath}/attach/review/${dto.attach}" 
	                			     alt="review image" 
	                			     style="width: 100%; height: 100%; object-fit: cover; display: block;">
	                		</c:when>
	                		<c:otherwise>
	                    		<!-- 
	                    			[수정] 이미지가 없을 때: 깔끔한 빈 박스 + 아이콘 
	                    			배경색(#f8f9fa)과 카메라 아이콘으로 심플하게 표현했습니다.
	                    		-->
	                    		<div style="width:100%; height:100%; background:#f8f9fa; display:flex; align-items:center; justify-content:center;">
	                    			<i class="fa-solid fa-camera" style="font-size:40px; color:#e1e1e1;"></i>
	                    		</div>
	                		</c:otherwise>
	                	</c:choose>
	                    <span class="card-badge badge-mint">${dto.target_id}</span>
	                </div>
	                
	                <!-- 제목 -->
	                <p class="item-title">${dto.title}</p>
	                
	                <div class="item-info">
		                <p class="item-price">${dto.user_id}</p>
		                <p class="item-rating" style="color:#FFD700; margin:0;">
		                	<c:forEach begin="1" end="${dto.rating}">★</c:forEach>
		                </p>
	                </div>
	                
	                <!-- 날짜 -->
	                <p class="item-date">${dto.reg_date}</p>
	            </a>
            </c:forEach>
            
        </div>
        

        <div class="pagination-area">
            <a href="#" class="page-btn prev"><i class="fa-solid fa-chevron-left"></i></a>
            <a href="#" class="page-btn active">1</a>
            <span class="page-dots">...</span>
            <a href="#" class="page-btn next"><i class="fa-solid fa-chevron-right"></i></a>
        </div>
                        
       <div class="detail-btn-group">
            <a href="javascript:goWrite()" class="btn">리뷰 작성</a>
        </div>
    </div>
    </div>
    </main>
    </div>
	</div>
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>
</body>
</html>