<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div id="b_right" class="qna-view">

            <h2 class="n_title">Q & A 상세보기</h2>

            <!-- 질문 영역 -->
            <div class="qna-form">

                <div class="form-row">
                    <label>제목</label>
                    <input type="text" value="${dto.title}" readonly>
                </div>

                <div class="form-row">
                    <label>내용</label>
                    <textarea readonly>${dto.content}</textarea>
                </div>

                <div class="form-row">
                    <label>작성자</label>
                    <input type="text" value="${dto.reg_id}" readonly>
                </div>

                <div class="form-row">
                    <label>작성일</label>
                    <input type="text" value="${dto.reg_date}" readonly>
                </div>

            </div>

            <hr>

            <h3>답변</h3>

            <c:choose>
                <c:when test="${not empty dto.answer}">
                    <form method="post" action="Qna">
                        <input type="hidden" name="t_gubun" value="answer_update">
                        <input type="hidden" name="no" value="${dto.no}">

                        <div class="form-row">
                            <label>답변 내용</label>
                            <textarea name="answer">${dto.answer}</textarea>
                        </div>

                        <div class="form-row">
                            <label>답변자</label>
                            <input type="text" value="${dto.answer_id}" readonly>
                        </div>

                        <div class="form-row">
                            <label>답변일</label>
                            <input type="text" value="${dto.answer_date}" readonly>
                        </div>

                        <div class="detail-btn-group">
                            <button type="submit" class="btn">답변 수정</button>
                            <a href="Qna?t_gubun=answer_delete&no=${dto.no}" class="btn">답변 삭제</a>
                        </div>
                    </form>
                </c:when>
                
                <c:otherwise>
                    <form method="post" action="Qna">
                        <input type="hidden" name="t_gubun" value="answer_save">
                        <input type="hidden" name="no" value="${dto.no}">

                        <div class="form-row">
                            <label>답변 내용</label>
                            <textarea name="answer" placeholder="답변을 입력하세요"></textarea>
                        </div>

                        <div class="detail-btn-group">
                            <button type="submit" class="btn">답변 등록</button>
                        </div>
                    </form>
                </c:otherwise>

            </c:choose>

            <!-- 하단 버튼 -->
            <div class="detail-btn-group">
                <a href="Qna" class="btn">목록</a>
            </div>

        </div>
        <!-- 본문 끝 -->
    </div>

    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
