<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
</head>

<script type="text/javascript">
function goAnswerSave(){
	if(checkEmpty(answerForm.answer,"답변 입력")) return;
	answerForm.method = "post";
	answerForm.action = "Qna";
	answerForm.submit();
}

function goAnswerUpdate(){
	if(checkEmpty(answerForm.answer,"답변 입력")) return;
	answerForm.t_gubun.value = "answer_update";
	answerForm.method = "post";
	answerForm.action = "Qna";
	answerForm.submit();
}

function goAnswerDelete(){
	if(confirm("답변을 삭제하시겠습니까?")){
		answerForm.t_gubun.value = "answer_delete";
		answerForm.method = "post";
		answerForm.action = "Qna";
		answerForm.submit();
	}
}

function goUpdateForm(){
	qnaForm.t_gubun.value = "update_form";
	qnaForm.method = "post";
	qnaForm.action = "Qna";
	qnaForm.submit();
}

function goDelete(){
	if(confirm("삭제하시겠습니까?")){
		qnaForm.t_gubun.value = "delete";
		qnaForm.method = "post";
		qnaForm.action = "Qna";
		qnaForm.submit();
	}
}
</script>

<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <div id="b_right" class="qna-view">

            <h2 class="n_title">Q & A 상세보기</h2>

            <div class="qna-form">
                <div class="form-row">
                    <label>제목</label>
                    <input type="text" value="${dto.getTitle()}" readonly>
                </div>

                <div class="form-row">
                    <label>내용</label>
                    <textarea readonly>${dto.getContent()}</textarea>
                </div>

                <div class="form-row">
                    <label>작성자</label>
                    <input type="text" value="${dto.getReg_id()}" readonly>
                </div>

                <div class="form-row">
                    <label>작성일</label>
                    <input type="text" value="${dto.getReg_date()}" readonly>
                </div>
            </div>

            <hr>

            <h3>답변</h3>

            <c:choose>
                <c:when test="${not empty dto.getAnswer()}">
                    <form name="answerForm">
                        <input type="hidden" name="t_gubun">
                        <input type="hidden" name="t_no" value="${dto.getNo()}">

                        <div class="form-row">
                            <label>답변 내용</label>
                            <textarea name="answer">${dto.getAnswer()}</textarea>
                        </div>

                        <div class="form-row">
                            <label>답변자</label>
                            <input type="text" value="${dto.getAnswer_id()}" readonly>
                        </div>

                        <div class="form-row">
                            <label>답변일</label>
                            <input type="text" value="${dto.getAnswer_date()}" readonly>
                        </div>

                        <div class="detail-btn-group">
                            <a href="javascript:goAnswerUpdate()" class="btn">답변 수정</a>
                            <a href="javascript:goAnswerDelete()" class="btn danger">답변 삭제</a>
                        </div>
                    </form>
                </c:when>

                <c:otherwise>
                    <form name="answerForm">
                        <input type="hidden" name="t_gubun" value="answer_save">
                        <input type="hidden" name="t_no" value="${dto.getNo()}">

                        <div class="form-row">
                            <label>답변 내용</label>
                            <textarea name="answer" placeholder="답변을 입력하세요"></textarea>
                        </div>

                        <div class="detail-btn-group">
                            <a href="javascript:goAnswerSave()" class="btn">답변 등록</a>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>

            <form name="qnaForm">
                <input type="hidden" name="t_gubun">
                <input type="hidden" name="t_no" value="${dto.getNo()}">

                <div class="detail-btn-group">
                    <a href="Qna" class="btn">목록</a>
                    <c:if test="${sessionLevel eq 'top'}">
                        <a href="javascript:goUpdateForm()" class="btn">수정</a>
                        <a href="javascript:goDelete()" class="btn danger">삭제</a>
                    </c:if>
                </div>
            </form>

        </div>
    </div>

    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
