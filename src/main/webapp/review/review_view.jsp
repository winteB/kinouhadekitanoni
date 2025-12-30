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
            <div class="container">

                <h2 class="detail-title">게시글 상세보기</h2>

                <table class="detail-table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tbody>
                    	<tr style="display:none;">
						    <th>NO</th>
						    <td class="id-row" colspan="3">
						        <input type="hidden" name="t_no">
						    </td>
						</tr>
                    
                    	<tr style="display:none;">
						    <th>ID</th>
						    <td class="id-row" colspan="3">
						        <input type="hidden" name="t_id">
						    </td>
						</tr>
                    
                        <tr>
                            <th>제목</th>
                            <td></td>
                            <th>리뷰대상(상품,장소)</th>
                            <td></td>
                        </tr>

                        <tr>
                            <th>작성자</th>
                            <td></td>
                            <th>평점</th>
                            <td></td>
                        </tr>

                        <tr>
                            <th>조회수</th>
                            <td></td>
                            <th>댓글수</th>
                            <td></td>
                        </tr>

                        <tr>
                        	<th>첨부파일</th>
                            <td colspan="4" class="image-row">
                                <img src="" class="detail-image">
                                <p>이미지입니다</p>
                            </td>
                        </tr>

                        <tr>
                        	<th>내용</th>
                            <td colspan="4" class="content-row"></td>
                        </tr>
                        
                         <tr>
                            <th>작성일</th>
                            <td></td>
                            <th>수정일</th>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 댓글 영역 -->
				<div class="comment-section">
				
				    <h3 class="comment-title">
				        💬 댓글 <span class="comment-count">(2)</span>
				    </h3>
				
				    <!-- 댓글 작성 -->
				    <div class="comment-write">
				        <textarea placeholder="댓글을 입력하세요"></textarea>
				        <button>등록</button>
				    </div>
				
				    <!-- 댓글 리스트 -->
				    <div class="comment-list">
				
				        <div class="comment-card">
				            <div class="comment-header">
				                <span class="user">user01</span>
				                <span class="date">2025-01-15</span>
				            </div>
				            <div class="comment-body">
				                정말 좋은 리뷰네요!
				            </div>
				            <div class="comment-actions">
				                <a href="#">수정</a>
				                <a href="#">삭제</a>
				            </div>
				        </div>
				
				        <div class="comment-card">
				            <div class="comment-header">
				                <span class="user">admin</span>
				                <span class="date">2025-01-14</span>
				            </div>
				            <div class="comment-body">
				                방문해주셔서 감사합니다 😊
				            </div>
				        </div>
				
				    </div>
				</div>
                

                <!-- 버튼 영역 -->
                <div class="detail-btn-group">
                    <a href="BoardList" class="btn">목록</a>
                    <a href="BoardUpdate?t_no=${dto.no}" class="btn">수정</a>
                    <a href="BoardDelete?t_no=${dto.no}" class="btn danger">삭제</a>
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
