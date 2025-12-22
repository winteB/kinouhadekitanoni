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
                        <tr>
                            <th>제목</th>
                            <td colspan="3"></td>
                        </tr>

                        <tr>
                            <th>작성자</th>
                            <td></td>
                            <th>작성일</th>
                            <td></td>
                        </tr>

                        <tr>
                            <th>조회수</th>
                            <td colspan="3"></td>
                        </tr>

                        <tr>
                            <td colspan="4" class="image-row">
                                <img src="" class="detail-image">
                                <p>이미지입니다</p>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4" class="content-row">
                                
                            </td>
                        </tr>
                    </tbody>
                </table>

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
