<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="javascript:goPage('Show')" class="nav-item">시설안내</a>
            <a href="javascript:goPage('YoyakuCamping','main')" class="nav-item">예약하기</a>
            <a href="javascript:goPage('Review','list')" class="nav-item">후기/포토</a>
            <a href="javascript:goPage('Notice','list')" class="nav-item">공지사항</a>
            <a href="javascript:goPage('Member','login')" class="nav-item">Login</a>
            <a href="javascript:goPage('Member','join')" class="nav-item">Join</a>
            <a href="javascript:goPage('Member','myinfo')" class="nav-item">내 정보</a>
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
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="images/글램핑_인덱스.png">
                    <span class="category-label">글램핑</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">제목</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="images/fish_review.png" alt="post">
                    <span class="category-label">낚시</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">제목</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="images/오토캠핑_인덱스.png" alt="raised bed">
                    <span class="category-label">오토캠핑</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">제목</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="images/카라반_인덱스.png" alt="niwacan brand">
                    <span class="category-label">카라반</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">제목</h3>
                </div>
            </a>
        </div>
    </section>

    <div class="tag-section-wrapper">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust2_mb.webp" class="illust-obj illust-left" alt="skater">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust1_mb.webp" class="illust-obj illust-right" alt="biker" style="opacity:0;"> 
        
        
            <span class="deco-line"></span>
        <div class="tag-header">
            <h2 class="section-title">/ 주요 키워드 리뷰 /</h2>
            <span class="section-label-box">실제 이용 후기를 확인해보세요</span>
        </div>
			<span class="deco-line"></span>
       
        <div class="tag-container">
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>바베큐</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>낚시</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>영화</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>밤하늘</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>월척</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>뒷정리</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>2박 3일</a>
        </div>
    </div>

    

    <footer>
        <button class="btn-top" onclick="window.scrollTo({top:0, behavior:'smooth'});">↑</button>
        <div class="footer-content">
            <div class="footer-logo">n<br><span>c</span></div>
            <div class="footer-links-group">
                <div class="link-column">
                    <div class="col-title">アイデアをさがす</div>
                    <a href="#" class="footer-link-item"><span class="arrow-icon">→</span>商品をさがす</a>
                </div>
                <div class="link-column">
                    <div class="col-title">ヘルプ</div>
                    <a href="#" class="footer-link-item">ご利用ガイド</a>
                    <a href="#" class="footer-link-item">よくある質問</a>
                    <a href="#" class="footer-link-item">お問い合わせ</a>
                </div>
                <div class="link-column">
                    <div class="col-title">インフォメーション</div>
                    <a href="#" class="footer-link-item">おしらせ</a>
                    <a href="#" class="footer-link-item">niwacanとは</a>
                </div>
                <div class="link-column">
                    <div class="col-title">&nbsp;</div> 
                    <a href="#" class="footer-link-item">採用情報</a>
                    <a href="#" class="footer-link-item">利用規約</a>
                    <a href="#" class="footer-link-item">特定商取引法表示</a>
                    <a href="#" class="footer-link-item">運営会社</a>
                </div>
            </div>
            <div class="footer-follow">
                <div class="col-title" style="margin-bottom:20px;">FOLLOW</div>
                <a href="#" class="social-link"><div class="social-icon icon-insta"></div> Instagram</a>
                <a href="#" class="social-link"><div class="social-icon icon-pint"></div> Pinterest</a>
            </div>
        </div>
        <div class="footer-bottom"><span>© 2025 niwacan</span></div>
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
