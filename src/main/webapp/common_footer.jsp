<%@ page pageEncoding="UTF-8"%>
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