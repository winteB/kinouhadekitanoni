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

            <h2 class="n_title">Q & A 수정</h2>
            
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

            <!-- 정보 -->
            <div class="qna-info">
                <span>작성자: hong</span>
                <span>2025-01-01</span>
                <span>조회수 123</span>
            </div>

            <!-- 수정 폼 -->
            <div class="qna-form">

                <!-- 제목 -->
                <div class="form-row">
                    <label>제목</label>
                    <input type="text" value="캠핑장 예약은 어떻게 하나요?">
                </div>

                <!-- 내용 -->
                <div class="form-row">
                    <label>내용</label>
                    <textarea>
캠핑장 예약 방법이 궁금합니다.
예약 페이지에서 날짜 선택 후 진행하면 되나요?
                    </textarea>
                </div>

            </div>

            <!-- 관리자 답변 (읽기 전용) -->
            <div class="qna-answer">
                <h4>관리자 답변</h4>
                <p>
                    네, 예약 페이지에서 날짜와 구역을 선택하신 후
                    결제까지 완료하시면 예약이 확정됩니다.
                </p>
            </div>

            <!-- 버튼 -->
            <div class="qna-btns">
                <a href="#" class="btn">이전</a>
                <a href="#" class="btn primary">수정완료</a>
            </div>

        </div>
    </div>

    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
