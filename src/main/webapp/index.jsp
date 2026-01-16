<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>昨日はできたのに</title>
    <link rel="stylesheet" href="css/css.css"/>
</head>
<script type="text/javascript">
	function goPage(servlet,gubun){
		if(gubun!=null){
			work.t_gubun.value=gubun;
		}
		work.method="post";
		work.action=servlet;
		work.submit();
	}
</script>
<body class="main-page">
	<form name = "work">
		<input type="hidden" name="t_gubun">
	</form>
	<header class="main-header" id="mainHeader">
        <div class="brand-wrapper">
        	<a href="javascript:goPage('Index')">
			    <img src="images/F5.png" alt="company 로고" class="brand-logo" />
            </a>
        </div>
        <nav class="main-nav">
<!--             <a href="javascript:goPage('Faq','faq_view')" class="nav-item">뷰</a> -->
<!--             <a href="javascript:goPage('Faq','faq_write')" class="nav-item">라이트</a> -->
            <a href="javascript:goPage('Show','list')" class="nav-item">시설안내</a>
            <a href="javascript:goPage('YoyakuCamping','main')" class="nav-item">예약하기</a>
            <a href="javascript:goPage('Review','list')" class="nav-item">후기/포토</a>
            <a href="javascript:goPage('Notice','list')" class="nav-item">공지사항</a>
            <c:if test="${empty sessionId }">
            	<a href="javascript:goPage('Member','login')" class="nav-item">Login</a>
	            <a href="javascript:goPage('Member','join')" class="nav-item">Join</a>
            </c:if>
            <c:if test="${not empty sessionId }">
	            <a href="javascript:goPage('Member','myinfo')" class="nav-item">내 정보</a>
				<a href="javascript:goPage('Member','memberLogout')" class="nav-item">Logout</a>
      		</c:if>
      		<c:if test="${sessionLevel eq 'top'}">
            	<a href="javascript:goPage('Control')" class="nav-item">관리자</a>
        	</c:if>
        </nav>
    </header>

    <section class="hero-section">
        <div class="floating-button-layer">
            <a href="javascript:goPage('YoyakuCamping','main')" class="btn-titan btn-camp">예약 바로가기 캠프</a>
            <a href="javascript:goPage('YoyakuFishing','main')" class="btn-titan btn-fish">예약 바로가기 낚시</a>
        </div>
    </section>

    <section class="hot-section">
        <div class="hot-section-header">
            <span class="hot-title-badge">최신 이용 후기</span>
            <span class="hot-flame-label">
                <span class="flame-icon">🔥</span>NEW!
            </span>
        </div>
        <div class="hot-grid-container">
            <a href="Review?t_gubun=view&t_no=${review_map.get('글램핑').no}" class="hot-card">
                <div class="card-thumb-box">
                    <img src="attach/review/${review_map.get('글램핑').attach }">
                    <span class="category-label">글램핑</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">${review_map.get('글램핑').title }</h3>
                </div>
            </a>
            <a href="Review?t_gubun=view&t_no=${review_map.get('좌대낚시').no}" class="hot-card">
                <div class="card-thumb-box">
                    <img src="attach/review/${review_map.get('좌대낚시').attach }" alt="post">
                    <span class="category-label">낚시</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">${review_map.get('좌대낚시').title }</h3>
                </div>
            </a>
            <a href="Review?t_gubun=view&t_no=${review_map.get('오토캠핑').no}" class="hot-card">
                <div class="card-thumb-box">
                    <img src="attach/review/${review_map.get('오토캠핑').attach }" alt="raised bed">
                    <span class="category-label">오토캠핑</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">${review_map.get('오토캠핑').title }</h3>
                </div>
            </a>
            <a href="Review?t_gubun=view&t_no=${review_map.get('카라반').no}" class="hot-card">
                <div class="card-thumb-box">
                    <img src="attach/review/${review_map.get('카라반').attach }" alt="niwacan brand">
                    <span class="category-label">카라반</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">${review_map.get('카라반').title }</h3>
                </div>
            </a>
        </div>
    </section>

    <div class="tag-section-wrapper">
        
        <div class="tag-header">
            <h2 class="section-title">/ 컨텐츠 별 리뷰 /</h2>
            <span class="section-label-box">실제 이용 후기를 확인해보세요</span>
        </div>
			<span class="deco-line"></span>
       
        <div class="tag-container">
            <a href="Review?t_gubun=list&t_search=글램핑" class="tag-pill"><span class="tag-icon-circle">#</span>글램핑</a>
            <a href="Review?t_gubun=list&t_search=카라반" class="tag-pill"><span class="tag-icon-circle">#</span>카라반</a>
            <a href="Review?t_gubun=list&t_search=오토캠핑" class="tag-pill"><span class="tag-icon-circle">#</span>오토캠핑</a>
            <a href="Review?t_gubun=list&t_search=낚시" class="tag-pill"><span class="tag-icon-circle">#</span>낚시</a>
        </div>
        
    </div>
    <div class="tag-section-wrapper">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust2_mb.webp" class="illust-obj illust-left" alt="skater">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust1_mb.webp" class="illust-obj illust-right" alt="biker" style="opacity:0;">
        
            <span class="deco-line"></span>
        <div class="tag-header">
            <h2 class="section-title">/ 이용 안내 /</h2>
            <span class="section-label-box">설비 소개와 이용 규칙</span>
        </div>
			<span class="deco-line"></span>
       
        <div class="tag-container">
            <a href="Show" class="tag-pill"><span class="tag-icon-circle">#</span>시설 안내</a>
            <a href="Notice" class="tag-pill"><span class="tag-icon-circle">#</span>공지사항</a>
            <a href="Qna" class="tag-pill"><span class="tag-icon-circle">#</span>Q&A</a>
        </div>
    </div>

    

      <!-- =================================================================
       [수정된 푸터 영역]
       ================================================================= -->
    <footer>
        <button class="btn-top" onclick="window.scrollTo({top:0, behavior:'smooth'});">↑</button>
        
        <div class="footer-content">
            <!-- 1. 브랜드 영역 -->
            <div class="footer-brand">
                <div class="footer-logo">F5</div> <!-- 로고 이미지로 대체 가능 -->
                <p class="footer-slogan"><br>
                    도심을 떠나 자연 속에서 찾는<br>
                    가장 완벽한 새로고침, F5 캠핑장입니다.
                </p>
            </div>

            <!-- 2. 링크 그룹 영역 (한글화 완료) -->
            <div class="footer-links-group">
                <div class="link-column">
                    <div class="col-title">SERVICE</div>
                    <a href="javascript:goPage('Show','list')" class="footer-link-item">시설 안내</a>
                    <a href="javascript:goPage('YoyakuCamping','main')" class="footer-link-item">실시간 예약</a>
                    <a href="javascript:goPage('Review','list')" class="footer-link-item">이용 후기</a>
                </div>
                <div class="link-column">
                    <div class="col-title">SUPPORT</div>
                    <a href="javascript:goPage('Notice','list')" class="footer-link-item">공지사항</a>
                    <a href="#" class="footer-link-item">자주 묻는 질문</a>
                    <a href="#" class="footer-link-item">1:1 문의하기</a>
                    <a href="#" class="footer-link-item">오시는 길</a>
                </div>
                <div class="link-column">
                    <div class="col-title">POLICY</div>
                    <a href="#" class="footer-link-item">이용약관</a>
                    <a href="#" class="footer-link-item" style="font-weight: 600; color: #ddd;">개인정보처리방침</a>
                    <a href="#" class="footer-link-item">이메일무단수집거부</a>
                </div>
            </div>
	
			<style>
			    .footer-contact-sns {
			        margin-top: 20px;
			    }
			    .footer-contact-sns .social-links {
			        margin-top: 15px;
			    }
			    .social-icon-btn {
			        margin-right: 10px;
			    }
			</style>
            <!-- 3. 연락처 및 SNS -->
            <div class="footer-contact-sns">
                <div class="col-title" style="margin-bottom: 5px;">CUSTOMER CENTER</div>
                <span class="cs-number">010-1234-5678</span><br>
                <span class="cs-time">운영시간: 09:00 ~ 18:00</span>
                
                 
                <div class="social-links">
                    <a href="https://www.instagram.com/wnstnals2007" class="social-icon-btn" title="Instagram">
                        <!-- Instagram Icon -->
                        <svg xmlns="" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>
                    </a>
                    <a href="https://www.youtube.com/@soni12-ss/playlists" class="social-icon-btn" title="Youtube">
                        <!-- Youtube Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22.54 6.42a2.78 2.78 0 0 0-1.94-2C18.88 4 12 4 12 4s-6.88 0-8.6.46a2.78 2.78 0 0 0-1.94 2A29 29 0 0 0 1 11.75a29 29 0 0 0 .46 5.33A2.78 2.78 0 0 0 3.4 19c1.72.46 8.6.46 8.6.46s6.88 0 8.6-.46a2.78 2.78 0 0 0 1.94-2 29 29 0 0 0 .46-5.25 29 29 0 0 0-.46-5.33z"></path><polygon points="9.75 15.02 15.5 11.75 9.75 8.48 9.75 15.02"></polygon></svg>
                    </a>
                    <a href="#" class="social-icon-btn" title="Blog">
                        <!-- Blog (Book) Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>
                    </a>
                </div>
            </div>
        </div>

        <!-- 4. 하단 사업자 정보 (한국 표준) -->
        <div class="footer-bottom">
            <div class="company-info">
                <p>
                    <span>상호명: F5 캠핑장</span>
                    <span>대표자: 홍길동</span>
                    <span>사업자등록번호: 123-45-67890</span>
                    <span>통신판매업신고: 2026-서울강남-0000</span>
                </p>
                <p>
                    <span>주소: 서울특별시 강남구 테헤란로 123, F5타워 1층</span>
                    <span>이메일: help@f5camping.com</span>
                </p>
            </div>
            <div class="copyright">
                COPYRIGHT © 2026 F5 CAMPING. ALL RIGHTS RESERVED.
            </div>
        </div>
    </footer>

    <script>
        const header = document.getElementById('mainHeader');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>
