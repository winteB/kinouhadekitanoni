<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <script type="text/javascript">
        function goUpdate() {
            location.href = "Review?t_gubun=update&t_no=${t_dto.no}";
        }
        function goDelete() {
            if(confirm('정말 게시글을 삭제하시겠습니까?')) {
                location.href = "Review?t_gubun=delete&t_no=${t_dto.no}";
            }
        }
        function goCommentSave() {
            var form = document.commentForm;
            if(form.t_comment_content.value == "") {
                alert("댓글 내용을 입력해주세요.");
                form.t_comment_content.focus();
                return;
            }
            form.submit();
        }
        function goCommentDelete(c_no) {
            if(confirm("댓글을 삭제하시겠습니까?")) {
                location.href = "Review?t_gubun=delete_comment&t_c_no=" + c_no + "&t_no=${t_dto.no}";
            }
        }
    </script>
</head>
<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <main class="main-content">
            <div class="container">
                
                <!-- 만약 이 빨간 글씨가 보이면 JSP가 정상적으로 연결된 것입니다 -->
                <!-- <h1 style="color:red; text-align:center;">★ VIEW PAGE CONNECTED ★</h1> -->

                <h2 class="detail-title">게시글 상세보기</h2>

                <!-- 게시글 상세 테이블 -->
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
                            <td class="id-row" colspan="3">${t_dto.no}</td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>${t_dto.title}</td>
                            <th>리뷰대상</th>
                            <td>${t_dto.target_id}</td>
                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td>${t_dto.user_id}</td>
                            <th>평점</th>
                            <td style="color: #FFD700;">
                                <c:forEach begin="1" end="${t_dto.rating}">★</c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th>조회수</th>
                            <td>${t_dto.hit}</td>
                            <th>작성일</th>
                            <td>${t_dto.reg_date}</td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3" class="image-row" style="text-align: center; padding: 20px;">
                                <c:if test="${not empty t_dto.attach}">
                                    <img src="file_room/${t_dto.attach}" class="detail-image" style="max-width: 100%; border-radius: 8px;">
                                </c:if>
                                <c:if test="${empty t_dto.attach}">
                                    <span style="color:#aaa;">첨부된 이미지가 없습니다.</span>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3" class="content-row" style="white-space: pre-wrap; height: 200px; vertical-align: top;">${t_dto.content}</td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 댓글 영역 -->
                <div class="comment-section">
                    <h3 class="comment-title">
                        💬 댓글 <span class="comment-count">(${fn:length(t_comment_list)})</span>
                    </h3>
                
                   
                        <form name="commentForm" action="Review" method="post">
                            <input type="hidden" name="t_gubun" value="save_comment">
                            <input type="hidden" name="t_no" value="${t_dto.no}">
                            
                            <div class="comment-write">
                                <textarea name="t_comment_content" placeholder="댓글을 입력하세요"></textarea>
                                <button type="button" onclick="goCommentSave()">등록</button>
                            </div>
                        </form>
                   
                   
                        <div class="comment-write">
                            <textarea placeholder="서로가 훈훈해지는 댓글 부탁드립니다."></textarea>
                        </div>
                   
                
                    <div class="comment-list">
                        <c:forEach items="${t_comment_list}" var="comm">
                            <div class="comment-card">
                                <div class="comment-header">
                                    <span class="user">${comm.user_id}</span>
                                    <span class="date">${comm.reg_date}</span>
                                </div>
                                <div class="comment-body">
                                    ${comm.content}
                                </div>
                                <c:if test="${session_id eq comm.user_id}">
                                    <div class="comment-actions">
                                        <a href="javascript:goCommentDelete('${comm.c_no}')">삭제</a>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                        <c:if test="${empty t_comment_list}">
                            <div style="padding: 20px; text-align:center; color:#999;">작성된 댓글이 없습니다.</div>
                        </c:if>
                    </div>
                </div>
                
                <div class="detail-btn-group">
                    <a href="Review?t_gubun=list" class="btn">목록</a>
                    <c:if test="${session_id eq t_dto.user_id}">
                        <a href="javascript:goUpdate()" class="btn">수정</a>
                        <a href="javascript:goDelete()" class="btn danger">삭제</a>
                    </c:if>
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