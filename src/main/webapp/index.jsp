<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan - Lifestyle & Garden (Integrated)</title>
    <link rel="stylesheet" href="css/css.css"/>
</head>
<script type="text/javascript">
	function goPage(servlet,gubun){
		work.t_gubun.value=gubun;
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
            <div class="brand-text">niwacan</div>
            <svg class="brand-logo-svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                <circle cx="50" cy="50" r="48" fill="#00ffcc" stroke="#1a1a1a" stroke-width="4"/>
                <path d="M50 20 L80 80 L20 80 Z" fill="#e6ff00" stroke="#1a1a1a" stroke-width="3" stroke-linejoin="round"/>
                <text x="50" y="72" font-family="Outfit, sans-serif" font-weight="900" font-size="36" text-anchor="middle" fill="#1a1a1a">nc</text>
            </svg>
        </div>
        <nav class="main-nav">
            <a href="javascript:goPage('show')" class="nav-item">시설안내</a>
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
            <span class="hot-title-badge">よく読まれている記事 (인기글)</span>
            <span class="hot-flame-label">
                <span class="flame-icon">🔥</span>HOT! <span class="flame-icon">🔥</span>HOT! <span class="flame-icon">🔥</span>HOT!
            </span>
        </div>
        <div class="hot-grid-container">
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="https://niwacan.jp/wp-content/uploads/2025/04/AdobeStock_1470761120-のコピー.webp" alt="fence">
                    <span class="category-label">お役立ち情報</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">目隠しフェンスの種類と選び方<br>(가림막 펜스의 종류와 선택법)</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="https://niwacan.jp/wp-content/uploads/2025/08/ポスト写真.webp" alt="post">
                    <span class="category-label">お役立ち情報</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">ポストの種類と選び方<br>(우편함의 종류와 선택법)</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="https://niwacan.jp/wp-content/uploads/2025/10/0930-2224.webp" alt="raised bed">
                    <span class="category-label">施工方法</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">「レイズドベッド」組み立て方法<br>(레이즈드 베드 조립 방법)</h3>
                </div>
            </a>
            <a href="#" class="hot-card">
                <div class="card-thumb-box">
                    <img src="https://niwacan.jp/wp-content/uploads/2025/05/131A1120.webp" alt="niwacan brand">
                    <span class="category-label">庭でできること</span>
                </div>
                <div class="card-text-chunk">
                    <h3 class="card-title">niwacan (にわきゃん) ーソト遊びをもっと日常にー<br>(niwacan -소토아소비를 일상으로-)</h3>
                </div>
            </a>
        </div>
    </section>

    <div class="tag-section-wrapper">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust2_mb.webp" class="illust-obj illust-left" alt="skater">
        <img src="https://niwacan.jp/wp-content/uploads/2025/04/nc_top_gallery_illust1_mb.webp" class="illust-obj illust-right" alt="biker" style="opacity:0;"> 
        
        <div class="tag-header">
            <span class="deco-line"></span>
            <h2 class="section-title">NIWA DE CAN</h2>
            <span class="section-label-box">庭でできること一覧 (정원 활동 목록)</span>
            <span class="deco-line"></span>
        </div>

        <div class="tag-container">
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>ベランダを楽しむ</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>便利にする</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>デザインする</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>コーディネートする</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>こどもとあそぶ</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>ペットとあそぶ</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>キャンプする</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>作る</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>育てる</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>あそぶ</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>くつろぐ</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>寝る</a>
            <a href="#" class="tag-pill"><span class="tag-icon-circle">#</span>たべる</a>
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