<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
	
	<!-- [추가] 페이징 버튼 디자인 CSS -->
	<style>
		/* 페이징 컨테이너 */
		.pagination-area {
			display: flex;
			justify-content: center;
			align-items: center;
			margin-top: 50px;
			margin-bottom: 30px;
			gap: 8px; /* 버튼 사이 간격 */
		}

		/* 기본 버튼 스타일 (CommonUtil에서 생성되는 <a> 태그 타겟팅) */
		.pagination-area a {
			display: inline-flex;
			justify-content: center;
			align-items: center;
			min-width: 36px;
			height: 36px;
			padding: 0 5px;
			border: 1px solid #e2e8f0;
			background-color: #fff;
			color: #64748b;
			text-decoration: none;
			border-radius: 6px; /* 둥근 모서리 */
			font-size: 14px;
			font-weight: 500;
			transition: all 0.2s ease;
			box-shadow: 0 1px 2px rgba(0,0,0,0.05);
		}

		/* 마우스 오버 시 */
		.pagination-area a:hover {
			border-color: #cbd5e1;
			background-color: #f8fafc;
			color: #0f172a;
			transform: translateY(-1px); /* 살짝 위로 뜨는 효과 */
		}

		/* 현재 페이지 (Active) 스타일 */
		.pagination-area a.active {
			background-color: #1a1a1a; /* 브랜드 컬러 (검정) */
			border-color: #1a1a1a;
			color: #fff;
			cursor: default;
			pointer-events: none; /* 클릭 방지 */
			font-weight: 700;
		}
		
		/* 화살표 아이콘 크기 조정 */
		.pagination-area a i {
			font-size: 12px;
		}
	</style>
	
	<script type="text/javascript">
		function goWrite() {
			location.href = "Review?t_gubun=write";
		}
		
		function goListPage(page){
			var search = "${t_search}";
			location.href = "Review?t_gubun=list&t_search=" + search + "&t_nowPage=" + page;
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
	                			<img src="${pageContext.request.contextPath}/attach/review/${dto.attach}" 
	                			     alt="review image" 
	                			     style="width: 100%; height: 100%; object-fit: cover; display: block;">
	                		</c:when>
	                		<c:otherwise>
	                    		<div style="width:100%; height:100%; background:#f8f9fa; display:flex; align-items:center; justify-content:center;">
	                    			<i class="fa-solid fa-camera" style="font-size:40px; color:#e1e1e1;"></i>
	                    		</div>
	                		</c:otherwise>
	                	</c:choose>
	                    <span class="card-badge badge-mint">${dto.target_id}</span>
	                </div>
	                
	                <p class="item-title">${dto.title}</p>
	                
	                <div class="item-info">
		                <p class="item-price">${dto.user_id}</p>
		                <p class="item-rating" style="color:#FFD700; margin:0;">
		                	<c:forEach begin="1" end="${dto.rating}">★</c:forEach>
		                </p>
	                </div>
	                
	                <p class="item-date">${dto.reg_date}</p>
	            </a>
            </c:forEach>
            
        </div>
        
		<!-- 페이징 영역 -->
        <div class="pagination-area">
        	${t_paging}
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