<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file = "../common_header_head.jsp" %>
	<script type="text/javascript">
	
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
                <h1 class="page-title">ALL <span class="highlight-tape">PRODUCTS</span></h1>
                <p class="page-desc">niwacan의 모든 아웃도어 & 가드닝 컬렉션을 만나보세요.</p>
            </div>

            <div class="category-filter">
                <button class="filter-btn active">ALL</button>
                <button class="filter-btn">낚시</button>
                <button class="filter-btn">글램핑</button>
                <button class="filter-btn">오토캠핑</button>
                <button class="filter-btn">캠핑카</button>
            </div>
        </section>

        <div class="product-grid list-grid">
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="" alt="item">
                    <span class="card-badge badge-mint">BEST</span>
                </div>
                <p class="item-title">후기 제목</p>
                <p class="item-price">작성자</p>
            </a>
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="" alt="item">
                    <span class="card-badge badge-mint">RECOMMEND</span>
                </div>
                <p class="item-title">YOKA SPICE CRUSHER</p>
                <p class="item-price">4,180円</p>
            </a>
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="" alt="item">
                </div>
                <p class="item-title">LAWN CHAIR CLASSIC</p>
                <p class="item-price">15,180円</p>
            </a>
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="" alt="item">
                    <span class="card-badge badge-yellow">NEW</span>
                </div>
                <p class="item-title">プランターフェンス</p>
                <p class="item-price">24,640円</p>
            </a>
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="" alt="item">
                    <span class="card-badge badge-yellow">NEW</span>
                </div>
                <p class="item-title">レイズドベッド (Black)</p>
                <p class="item-price">10,670円</p>
            </a>
            <a href="#" class="product-card">
                <div class="card-img-box">
                    <img src="https://via.placeholder.com/300?text=BED+White" alt="item">
                </div>
                <p class="item-title">レイズドベッド (White)</p>
                <p class="item-price">10,670円</p>
            </a>
        </div>

        <div class="pagination-area">
            <a href="#" class="page-btn prev"><i class="fa-solid fa-chevron-left"></i></a>
            <a href="#" class="page-btn active">1</a>
            <a href="#" class="page-btn">2</a>
            <a href="#" class="page-btn">3</a>
            <span class="page-dots">...</span>
            <a href="#" class="page-btn">10</a>
            <a href="#" class="page-btn next"><i class="fa-solid fa-chevron-right"></i></a>
        </div>
                        
        <div class="detail-btn-group">
            <a href="javascript:goPage('Review','write')" class="btn">글쓰기</a>
            <a href="" class="btn">??</a>
        </div>
    </div>
    </div>
    </main>
    </div>
	</div>
    <footer>
    	<%@ include file= "../common_footer.jsp"%>
    </footer>

    <script>
        window.addEventListener('scroll', function() {
            const header = document.getElementById('mainHeader');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>