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

                <h2 class="detail-title">FAQ 상세보기</h2>

                <table class="detail-table">
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>

                        <tr>
                            <th>질문</th>
                            <td class="faq-question">
                                캠핑장 예약은 어떻게 진행하나요?
                            </td>
                        </tr>

                        <tr>
                            <th>등록일</th>
                            <td>2025-01-10</td>
                        </tr>

                        <tr>
                            <th>조회수</th>
                            <td>512</td>
                        </tr>

                        <tr>
                            <th>답변</th>
                            <td class="faq-answer">
                                <p>
                                    캠핑장 예약은 홈페이지 상단의 <strong>[예약하기]</strong> 메뉴를 통해
                                    진행하실 수 있습니다.
                                </p>
                                <p>
                                    원하시는 날짜와 캠핑 구역을 선택한 후 결제를 완료하시면
                                    예약이 확정됩니다.
                                </p>
                                <p>
                                    예약 완료 후에는 마이페이지에서 예약 내역을 확인하실 수 있습니다.
                                </p>
                            </td>
                        </tr>

                    </tbody>
                </table>

                <!-- 버튼 영역 -->
                <div class="detail-btn-group">
                    <a href="faq_list.jsp" class="btn">목록</a>
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
