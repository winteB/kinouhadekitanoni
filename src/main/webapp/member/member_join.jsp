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

                <h1 class="page-title">MEMBER JOIN</h1>

                <form name="mem" class="join-form">
                    <input type="hidden" name="t_gubun">

                    <table class="join-table">
                        <colgroup>
                            <col style="width: 180px">
                            <col>
                        </colgroup>
                        <tbody>

                        <tr>
                            <th>ID</th>
                            <td class="id-row">
                                <input type="text" name="t_id" oninput="setEmpty()">
                                <button type="button" onclick="checkId()">중복확인</button>
                                <input type="text" name="t_id_result" disabled class="id-result">
                            </td>
                        </tr>

                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="t_name"></td>
                        </tr>

                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="t_password"></td>
                        </tr>

                        <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" name="t_password_confirm"></td>
                        </tr>
                        
                        <tr>
                            <th>나이</th>
                            <td><input type="text" name="t_age"></td>
                        </tr>

                        <tr>
                            <th>주소</th>
                            <td><input type="text" name="t_address" class="w-100"></td>
                        </tr>

                        <tr>
                            <th>연락처</th>
                            <td class="phone-row">
                                <input type="text" name="t_mobile_1" value="010"> -
                                <input type="text" name="t_mobile_2"> -
                                <input type="text" name="t_mobile_3">
                            </td>
                        </tr>

                        <tr>
                            <th>이메일</th>
                            <td class="email-row">
                                <input type="text" name="t_email_1">
                                @
                                <select name="t_email_2">
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.net">daum.net</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>성별</th>
                            <td>
                                <label><input type="radio" name="t_gender" value="M"> 남</label>
                                <label><input type="radio" name="t_gender" value="F"> 여</label>
                            </td>
                        </tr>

                        </tbody>
                    </table>

                    <div class="form-buttons">
                        <button type="button" onclick="goJoin()" class="btn-primary">JOIN</button>
                        <button type="button" onclick="goReset()" class="btn-secondary">RESET</button>
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
