<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		        <!-- 메인 콘텐츠 -->
		        <main class="main-content">
		            <div class="review-write-wrapper">
		
		    <h2 class="review-title">리뷰 작성</h2>
		    <p class="review-desc">
		        이용하신 경험을 솔직하게 남겨주세요 😊
		    </p>
		
		    <div class="review-card">
		
		        <!-- 리뷰 대상 -->
		        <div class="form-row">
		            <label>리뷰 대상</label>
		            <input type="text" placeholder="상품명 또는 장소명">
		        </div>
		
		        <!-- 별점 -->
		        <div class="form-row">
		            <label>평점</label>
		            <div class="star-rating">
		                ★★★★★
		            </div>
		        </div>
		
		        <!-- 리뷰 내용 -->
		        <div class="form-row">
		            <label>리뷰 내용</label>
		            <textarea placeholder="어떤 점이 좋았나요? 아쉬운 점은 없었나요?"></textarea>
		        </div>
		
		        <!-- 사진 업로드 -->
		        <div class="form-row">
		            <label>사진 첨부 (선택)</label>
		            <input type="file">
		            <p class="help-text">사진을 올리면 다른 사용자에게 도움이 됩니다.</p>
		        </div>
		
		    </div>
		
		    <!-- 버튼 -->
		    <div class="review-btn-group">
		        <button class="btn-cancel">취소</button>
		        <button class="btn-submit">리뷰 등록</button>
		    </div>
		
		</div>
        </main>
    </div>
</div>

<footer>
    <%@ include file="../common_footer.jsp" %>
</footer>

</body>
</html>
