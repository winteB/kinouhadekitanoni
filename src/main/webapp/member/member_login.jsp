<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
</head>
<script type="text/javascript">
	function goPassword(){
		mem.t_password.focus();
	}
	function goLogin(){
		if(checkEmpty(mem.t_id,"ID 입력!")) return;
		if(checkEmpty(mem.t_password,"비밀번호 입력!")) return;
		
		mem.t_gubun.value="memberLogin";
		mem.action = "Member";
		mem.submit();
	}
</script>
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

                <h1 class="page-title">MEMBER LOGIN</h1>

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
                                <input type="text" name="t_id" oninput="setEmpty()" onkeydown="if(event.key==='Enter'){goPassword()}">
                            </td>
                        </tr>

                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="t_password" onkeydown="if(event.key==='Enter'){goLogin()}"></td>
                        </tr>

                        </tbody>
                    </table>

                    <div class="form-buttons">
                       <button type="button" onclick="goLogin()" class="btn-login-right">로그인</button>
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
