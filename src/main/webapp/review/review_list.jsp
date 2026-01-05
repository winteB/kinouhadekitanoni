<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	
	<!-- [추가] 긴 제목을 깔끔하게 처리하기 위한 스타일 -->
	<style>
		.item-title {
			/* 제목이 길어지면 말줄임표(...) 처리 */
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
			display: block;
			width: 100%;
			padding: 0 5px; /* 양옆 여백 살짝 */
			box-sizing: border-box;
		}
	</style>
	
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
        <!-- ⭐ 사이드바 -->
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <!-- ⭐ 메인 콘텐츠 -->
        <main class="main-content">
        <div class="container">
   		<div class="product-section-wrapper list-page-wrapper">
        
        <section class="list-header-section">
            <div class="page-title-box">
                <h1 class="page-title">REVIEW <span class="highlight-tape">LIST</span></h1>
                <p class="page-desc">niwacan 이용 고객님들의 소중한 후기입니다.</p>
            </div>

            <div class="category-filter">
                <button class="filter-btn active" onclick="location.href='Review'">ALL</button>
                <button class="filter-btn">낚시</button>
                <button class="filter-btn">글램핑</button>
                <button class="filter-btn">오토캠핑</button>
                <button class="filter-btn">카라반</button>
            </div>
        </section>

        <!-- 리스트 그리드 시작 -->
        <div class="product-grid list-grid">
        
        	<!-- 게시물이 없을 경우 -->
        	<c:if test="${empty t_list}">
        		<div style="width:100%; text-align:center; grid-column: 1 / -1; padding: 50px;">
        			등록된 리뷰가 없습니다.
        		</div>
        	</c:if>

			<!-- 게시물 반복 출력 -->
			<c:forEach items="${t_list}" var="dto">
	            <a href="Review?t_gubun=view&t_no=${dto.no}" class="product-card">
	                <div class="card-img-box">
	                	<c:choose>
	                		<c:when test="${not empty dto.attach}">
	                			<img src="${pageContext.request.contextPath}/file_room/${dto.attach}" alt="review image" style="width:100%; height:100%; object-fit:cover;">
	                		</c:when>
	                		<c:otherwise>
	                    		<img src="images/default_review.png" alt="no image">
	                		</c:otherwise>
	                	</c:choose>
	                    <span class="card-badge badge-mint">${dto.target_id}</span>
	                </div>
	                
	                <!-- 제목 부분 (CSS 적용됨) -->
	                <p class="item-title">${dto.title}</p>
	                
	                <div style="display:flex; justify-content:space-between; padding:0 10px;">
		                <p class="item-price" style="font-size:14px; color:#666;">${dto.user_id}</p>
		                <p class="item-rating" style="color:#FFD700;">
		                	<c:forEach begin="1" end="${dto.rating}">★</c:forEach>
		                </p>
	                </div>
	                <p style="text-align:right; font-size:12px; color:#999; padding-right:10px;">${dto.reg_date}</p>
	            </a>
            </c:forEach>
            
        </div>
        <!-- 리스트 그리드 끝 -->

        <div class="pagination-area">
            <a href="#" class="page-btn prev"><i class="fa-solid fa-chevron-left"></i></a>
            <a href="#" class="page-btn active">1</a>
            <span class="page-dots">...</span>
            <a href="#" class="page-btn next"><i class="fa-solid fa-chevron-right"></i></a>
        </div>
                        
       <div class="detail-btn-group">
     		 
                <a href="Review?t_gubun=write" class="btn">리뷰 작성</a>
            
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