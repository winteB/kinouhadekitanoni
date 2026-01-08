<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
</head>
<script type="text/javascript">
	function goSave(){
		if(checkEmpty(qna.t_title, "제목 입력!")) return;
		if(checkEmpty(qna.t_content, "내용 입력!")) return;
		
		qna.method = "post";
		qna.action = "Qna?t_gubun=save";
		qna.submit();
		
	}
</script>
<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <!-- 사이드바 -->
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>
<form name="qna">
<input type="hidden" name="t_gubun">
        <!-- 본문 -->
        <div id="b_right" class="qna-view qna-write">

            <h2 class="n_title">Q & A 글쓰기</h2>

            <!-- 작성 폼 -->
            <div class="qna-form">
                <!-- 제목 -->
                <div class="form-row">
                    <label>제목</label>
                    <input type="text" name="t_title" placeholder="제목을 입력하세요">
                </div>

                <!-- 내용 -->
                <div class="form-row">
                    <label>내용</label>
                    <textarea name="t_content" placeholder="질문 내용을 입력하세요"></textarea>
                </div>
                <!-- 작성자 -->
                <div class="form-row">
                    <label>작성자</label>
                    <input type="text" value="${sessionName}">
                </div>
                <!-- 작성일 -->
                <div class="form-row">
                    <label>작성일</label>
                    <input type="text" value="${toDay}">
                </div>

            </div>

            <!-- 버튼 -->
            <div class="detail-btn-group">
                <a href="Qna" class="btn">목록</a>
                <a href="javascript:goSave()" class="btn">등록</a>
            </div>
        </div>
        </form>
    </div>
    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
