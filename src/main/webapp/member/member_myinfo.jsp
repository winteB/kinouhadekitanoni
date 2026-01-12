<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.MemberDto" %>
<%
	MemberDto dto = (MemberDto)request.getAttribute("dto");

	// DTO가 null인 경우(비정상 접근/세션 만료 등)
	if(dto == null) {
		session.invalidate();
%>
	<script>
		alert("로그인이 필요하거나 정보가 없습니다.");
		location.href="Member";
	</script>
<%
		return;
	}
	
	// null 방지 처리 (화면에 "null"이라고 뜨는 것 방지)
	String m1 = dto.getMobile_1();
	if(m1 == null) m1 = "";
	
	String m2 = dto.getMobile_2();
	if(m2 == null) m2 = "";
	
	String m3 = dto.getMobile_3();
	if(m3 == null) m3 = "";

	String e1 = dto.getEmail_1();
	if(e1 == null) e1 = "";
	
	String e2 = dto.getEmail_2();
	if(e2 == null) e2 = "";
	
	// [수정 포인트] 날짜가 null일 경우 빈 문자열 처리
	String regDate = dto.getReg_date();
	if(regDate == null) regDate = "";
	
	// [추가 포인트] 수정일 추가 (수정일이 없으면 '-'로 표시)
	String updateDate = dto.getUpdate_date();
	if(updateDate == null) updateDate = "-";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    <script>
    	// 수정하기 버튼 클릭 시
    	function goUpdate(){
    		var form = document.mem;
    		
    		// 유효성 검사
    		if(form.t_password.value == ""){
    			alert("비밀번호를 입력해주세요.");
    			form.t_password.focus();
    			return;
    		}
    		if(form.t_password.value != form.t_password_confirm.value){
    			alert("비밀번호 확인이 일치하지 않습니다.");
    			form.t_password_confirm.focus();
    			return;
    		}
    		
    		if(confirm("정말 수정하시겠습니까?")){
    			form.t_gubun.value = "update";
    			form.method = "post";
    			form.action = "Member";
    			form.submit();
    		}
    	}
    	
    	// 탈퇴하기 버튼 클릭 시
    	function goDelete(){
    		if(confirm("정말 탈퇴하시겠습니까? 탈퇴 시 모든 정보가 삭제됩니다.")){
    			var form = document.mem;
    			form.t_gubun.value = "delete";
    			form.method = "post";
    			form.action = "Member";
    			form.submit();
    		}
    	}
    	
    	// 이메일 도메인 선택 변경 시
    	function checkEmail(){
    		var form = document.mem;
    		if(form.t_email_2.value != 'direct'){
    			// 필요시 구현 (직접입력 모드 아닐 때 처리)
    		}
    	}
    </script>
</head>
<body>

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

                <h1 class="page-title">MEMBER MYINFO</h1>

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
                                <!-- ID는 수정 불가(readonly) -->
                                <input type="text" name="t_id" value="<%=dto.getId() %>" readonly style="background-color:#eee;">
                            </td>
                        </tr>

                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="t_name" value="<%=dto.getName()%>"></td>
                        </tr>

                        <tr>
                            <th>비밀번호</th>
                            <!-- 비밀번호는 보안상 보여주지 않고 새로 입력받도록 비워둡니다 -->
                            <td><input type="password" name="t_password"></td>
                        </tr>
                         <tr>
                            <th>비밀번호 확인</th>
                            <td><input type="password" name="t_password_confirm"></td>
                        </tr>
                        
                        <tr>
                            <th>나이</th>
                            <td><input type="text" name="t_age" value="<%=dto.getAge()%>"></td>
                        </tr>

                        <tr>
                            <th>주소</th>
                            <td><input type="text" name="t_address" class="w-100" value="<%=dto.getAddress()%>"></td>
                        </tr>

                        <tr>
                            <th>연락처</th>
                            <td class="phone-row">
                                <input type="text" name="t_mobile_1" value="<%=m1%>" size="3"> -
                                <input type="text" name="t_mobile_2" value="<%=m2%>" size="4"> -
                                <input type="text" name="t_mobile_3" value="<%=m3%>" size="4">
                            </td>
                        </tr>

                        <tr>
                            <th>이메일</th>
                            <td class="email-row">
                                <input type="text" name="t_email_1" value="<%=e1%>">
                                @
                                <select name="t_email_2" onchange="checkEmail()">
                                    <option value="naver.com" <%if(e2.equals("naver.com")) out.print("selected");%>>naver.com</option>
                                    <option value="gmail.com" <%if(e2.equals("gmail.com")) out.print("selected");%>>gmail.com</option>
                                    <option value="daum.net" <%if(e2.equals("daum.net")) out.print("selected");%>>daum.net</option>
                                    <option value="hanmail.net" <%if(e2.equals("hanmail.net")) out.print("selected");%>>hanmail.net</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>성별</th>
                            <td>
                                <label><input type="radio" name="t_gender" value="M" <%if(dto.getGender().equals("M")) out.print("checked");%>> 남</label>
                                <label><input type="radio" name="t_gender" value="F" <%if(dto.getGender().equals("F")) out.print("checked");%>> 여</label>
                            </td>
                        </tr>
                        
                        <tr>
                            <th>가입일</th>
                            <td>
                                <!-- 수정 불가, border 없앰 -->
                                <input type="text" value="<%=regDate%>" readonly style="border:none; background:transparent;">
                            </td>
                        </tr>
                        
                        <!-- [추가] 최근 수정일 표시 -->
                        <tr>
                            <th>최근 수정일</th>
                            <td>
                                <input type="text" value="<%=updateDate%>" readonly style="border:none; background:transparent;">
                            </td>
                        </tr>
                        
                        </tbody>
                    </table>

                    <div class="form-buttons">
                        <button type="button" onclick="goUpdate()" class="btn-primary">UPDATE</button>
                        <button type="button" onclick="goDelete()" class="btn-secondary">DELETE</button>
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