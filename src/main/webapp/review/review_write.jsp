<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <script>
    	// 별점 클릭 시 hidden input에 값 설정 및 UI 변경
    	function setRating(score) {
    		const stars = document.querySelectorAll('.star-rating span');
    		const ratingInput = document.reviewForm.t_rating;
    		
    		ratingInput.value = score;
    		
    		stars.forEach((star, index) => {
    			if(index < score) {
    				star.style.color = "#FFD700"; // 노란색
    				star.innerHTML = "★";
    			} else {
    				star.style.color = "#ccc"; // 회색
    				star.innerHTML = "☆";
    			}
    		});
    	}
    	
    	function goSave() {
    		const form = document.reviewForm;
    		if(form.t_target_id.value == "") {
    			alert("리뷰 대상을 선택해주세요.");
    			form.t_target_id.focus();
    			return;
    		}
    		if(form.t_title.value == "") {
    			alert("제목을 입력해주세요.");
    			form.t_title.focus();
    			return;
    		}
    		if(form.t_content.value == "") {
    			alert("내용을 입력해주세요.");
    			form.t_content.focus();
    			return;
    		}
    		
    		form.submit();
    	}
    </script>
    <style>
    	.star-rating { cursor: pointer; font-size: 24px; }
    </style>
</head>
<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>
        
        <main class="main-content">
            <div class="review-write-wrapper">
        
		    <h2 class="review-title">리뷰 작성</h2>
		    <p class="review-desc">
		        이용하신 경험을 솔직하게 남겨주세요 😊
		    </p>
		
		    <!-- 
		    	[중요] 파일 업로드 시 action에 파라미터를 직접 명시해야 함
		    -->
		    <form name="reviewForm" action="Review?t_gubun=save" method="post" enctype="multipart/form-data">
		    	<input type="hidden" name="t_rating" value="5"> <!-- 기본 별점 5점 -->
		
			    <div class="review-card">
			
			        <!-- 리뷰 대상 (Select Box) -->
			        <div class="form-row">
			            <label>리뷰 대상</label>
			            <select name="t_target_id" class="input-field" style="width: 100%; padding: 10px;">
			            	<option value="">카테고리 선택</option>
			            	<option value="오토캠핑">오토캠핑</option>
			            	<option value="좌대낚시">좌대낚시</option>
			            	<option value="카라반">카라반</option>
			            	<option value="글램핑">글램핑</option>
			            </select>
			        </div>
			        
			        <!-- 제목 -->
			        <div class="form-row">
			            <label>제목</label>
			            <input type="text" name="t_title" placeholder="제목을 입력해주세요" style="width: 100%; padding: 10px;">
			        </div>
			
			        <!-- 별점 -->
			        <div class="form-row">
			            <label>평점</label>
			            <div class="star-rating">
			                <span onclick="setRating(1)">★</span>
			                <span onclick="setRating(2)">★</span>
			                <span onclick="setRating(3)">★</span>
			                <span onclick="setRating(4)">★</span>
			                <span onclick="setRating(5)" style="color:#FFD700">★</span>
			            </div>
			        </div>
			
			        <!-- 리뷰 내용 -->
			        <div class="form-row">
			            <label>리뷰 내용</label>
			            <textarea name="t_content" placeholder="어떤 점이 좋았나요? 아쉬운 점은 없었나요?" style="width: 100%; height: 150px; padding: 10px;"></textarea>
			        </div>
			
			        <!-- 사진 업로드 -->
			        <div class="form-row">
			            <label>사진 첨부 (선택)</label>
			            <input type="file" name="t_attach">
			            <p class="help-text">사진을 올리면 다른 사용자에게 도움이 됩니다.</p>
			        </div>
			
			    </div>
			
			    <!-- 버튼 -->
			    <div class="review-btn-group">
			        <button type="button" class="btn-cancel" onclick="location.href='Review?t_gubun=list'">취소</button>
			        <button type="button" class="btn-submit" onclick="goSave()">리뷰 등록</button>
			    </div>
		    </form>
		
		</div>
        </main>
    </div>
</div>

<footer>
    <%@ include file="../common_footer.jsp" %>
</footer>

</body>
</html>