<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
</head>

<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <!-- 사이드바 -->
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <!-- 본문 -->
        <div id="b_right" class="qna-view qna-write">

            <h2 class="n_title">Q & A 글쓰기</h2>

            <!-- 작성 폼 -->
            <div class="qna-form">
            
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

                <!-- 제목 -->
                <div class="form-row">
                    <label>제목</label>
                    <input type="text" placeholder="제목을 입력하세요">
                </div>

                <!-- 작성자 -->
                <div class="form-row">
                    <label>작성자</label>
                    <input type="text" value="hong" readonly>
                </div>

                <!-- 내용 -->
                <div class="form-row">
                    <label>내용</label>
                    <textarea placeholder="질문 내용을 입력하세요"></textarea>
                </div>

            </div>

            <!-- 버튼 -->
            <div class="qna-btns">
                <a href="#" class="btn">취소</a>
                <a href="#" class="btn primary">등록</a>
            </div>

        </div>
    </div>

    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
