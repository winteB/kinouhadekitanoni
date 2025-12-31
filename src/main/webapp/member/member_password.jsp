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
            <%@ include file="member_side_menu.jsp" %>
        </aside>

        <!-- 메인 영역 -->
        <main class="main-content">
            <div class="container member-join-page">

                <h1 class="page-title">MEMBER NEW PASSWORD</h1>

                <form name="mem" class="join-form">
                    <input type="hidden" name="t_gubun">

                    <table class="join-table">
                        <colgroup>
                            <col style="width: 180px">
                            <col>
                        </colgroup>
                        <tbody>

                        <tr>
                            <th>현재 비밀번호</th>
                            <td class="id-row">
                                <input type="password" name="t_now_password">
                            </td>
                        </tr>

                        <tr>
                            <th>수정 비밀번호</th>
                            <td><input type="password" name="t_new_password"></td>
                        </tr>
                        
                        <tr>
                            <th>수정 비밀번호 확인</th>
                            <td><input type="password" name="t_new_password_confirm"></td>
                        </tr>

                        </tbody>
                    </table>

                    <div class="form-buttons">
                       <button type="button" onclick="goLogin()" class="btn-login-right">변경</button>
                    </div>



                </form>

            </div>
        </main>
    </div>
</div>

<footer>
    <%@ include file="../common_footer.jsp" %>
</footer>

</body>
</html>