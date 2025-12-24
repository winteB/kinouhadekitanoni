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
        <div id="b_right" class="qna-list faq-list">

            <h2 class="n_title">자주 묻는 질문 (FAQ)</h2>
            <p class="qna-desc">
                캠핑 · 낚시 예약과 관련된 자주 묻는 질문을 모았습니다.
            </p>

            <!-- FAQ 리스트 -->
            <table class="boardList">
                <colgroup>
                    <col width="10%">
                    <col width="65%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>질문</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>6</td>
                        <td class="t_left">
                            <a href="#">캠핑장 예약은 어떻게 진행하나요?</a>
                        </td>
                        <td>2025-01-05</td>
                        <td>512</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td class="t_left">
                            <a href="#">낚시 구역은 현장에서 변경할 수 있나요?</a>
                        </td>
                        <td>2025-01-03</td>
                        <td>284</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="t_left">
                            <a href="#">비 오는 날에도 캠핑 이용이 가능한가요?</a>
                        </td>
                        <td>2024-12-30</td>
                        <td>198</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="t_left">
                            <a href="#">예약 취소 및 환불 규정이 궁금합니다</a>
                        </td>
                        <td>2024-12-28</td>
                        <td>402</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="t_left">
                            <a href="#">반려동물과 함께 캠핑이 가능한가요?</a>
                        </td>
                        <td>2024-12-22</td>
                        <td>167</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="t_left">
                            <a href="#">낚시 장비는 대여할 수 있나요?</a>
                        </td>
                        <td>2024-12-20</td>
                        <td>231</td>
                    </tr>
                </tbody>
            </table>

            <!-- 하단 -->
            <div class="paging qna-bottom">
                <div class="page-center">
                    <a class="active">1</a>
                    <a>2</a>
                </div>
                <a href="#" class="write">문의하기</a>
            </div>

        </div>
    </div>

    <footer>
        <%@ include file="../common_footer.jsp" %>
    </footer>
</div>

</body>
</html>
