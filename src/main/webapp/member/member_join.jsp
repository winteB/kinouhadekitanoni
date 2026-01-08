<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
	<script type="text/javascript">
		function goJoin(){
			if(checkEmpty(mem.t_id,"ID를 입력하세요")) return;
			if(mem.t_id.value.length <=3 || mem.t_id.value.length > 10){
				alert("ID는 3자리 이상 10자리 이내 입니다.");
				mem.t_id.focus();
				return;
			}
			if(mem.t_id_result.value==""){
				alert("ID 중복검사가 필요합니다.");
				mem.t_id.focus();
				return;
			}
			else if(mem.t_id_result.value=="사용 불가"){
				alert("중복되는 ID가 있어요.");
				mem.t_id.focus();
				return;
			}
			if(checkEmpty(mem.t_name,"이름을 입력하세요")) return;
			if(checkEmpty(mem.t_password,"비밀번호를 입력하세요")) return;
			if(checkEmpty(mem.t_password_confirm,"비밀번호 확인을 입력하세요")) return;
			if(mem.t_password.value != mem.t_password_confirm.value){
				alert("비밀번호가 같지 않습니다.");
				mem.t_password_confirm.focus();
				return;
			}
			if(checkEmpty(mem.t_address,"주소를 입력하세요")) return;
			if(checkEmpty(mem.t_mobile_1,"전화번호를 입력하세요")) return;
			if(checkEmpty(mem.t_mobile_2,"전화번호를 입력하세요")) return;
			if(checkEmpty(mem.t_mobile_3,"전화번호를 입력하세요")) return;
			if(checkEmpty(mem.t_email_1,"이메일을 입력하세요")) return;
			if(checkEmpty(mem.t_email_2,"이메일을 선택하세요")) return;
			
	
			if(checkEmpty(mem.t_gender,"성별을 선택하세요")) return;
			
			mem.t_gubun.value="save";
			mem.method="post";
			mem.action="Member";
			mem.submit();
			
		}
		function checkId(){
			if(checkEmpty(mem.t_id,"아이디 입력해")) return;
			var id = mem.t_id.value;
			$.ajax({
				type :"POST",
				url : "MemberCheckId",
				data: "t_id="+id,
				dataType : "text",
				error : function(){
					alert('통신 실패');
				},
				success : function(data){
					alert(data);
					mem.t_id_result.value=data
				}//여기의 data = url 페이지에서 화며넹 '출력'한 데이터
			});
		}
		function setEmpty(){
			mem.t_id_result.value="";
		}
	</script>
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
                            <td><input type="text" name="t_age" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');"></td>
                        </tr>

                        <tr>
                            <th>주소</th>
                            <td><input type="text" name="t_address" class="w-100"></td>
                        </tr>

                        <tr>
                            <th>연락처</th>
                            <td class="phone-row">
                                <input type="text" name="t_mobile_1" value="010" maxlength="3" oninput="this.value = this.value.replace(/[^0-9]/g, '');"> -
                                <input type="text" name="t_mobile_2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');"> -
                                <input type="text" name="t_mobile_3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
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
