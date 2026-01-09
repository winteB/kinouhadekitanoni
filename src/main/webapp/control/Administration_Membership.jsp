<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 회원 관리 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>niwacan Admin - Membership</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/control/Administration.css"> 
    <link rel="stylesheet" href="Administration.css">
</head>
<script>

	function goSearch(){
		search.t_gubun.value="user";
		search.method="post";
		search.action="Control";
		search.submit();
	}
    
	function goListPage(pageNumber){
		search.t_nowPage.value=pageNumber;
		search.t_gubun.value="user";
		search.method="post";
		search.action="Control";
		search.submit();
	}
	
	function goCheckAll(){
		var arrayGubun = Object.prototype.toString.call(search.memcheck);
		var tf = search.checkAll.checked;
		if(arrayGubun=="[object RadioNodeList]"){//배열일 때
			var len = search.memcheck.length;
				for(var k=0; k<len; k++){
					search.memcheck[k].checked=tf;
				}
// 			alert(len);
		} else {//배열이 아닐 때
			search.memcheck.checked = tf;
		}
	}
	
	function goDeleteAll(){
		var arrayGubun = Object.prototype.toString.call(search.memcheck);
// 		alert(arrayGubun);checkAll
// 		[object RadioNodeList] 배열일떄
// 		[object HTMLInputElement] 배열이 아닐때
		var going = false;
		if(arrayGubun=="[object RadioNodeList]"){//배열일 때
			var len = search.memcheck.length;
			for(var k=0; k<len; k++){
				var tf = search.memcheck[k].checked;
				if(tf){
					going=tf;
				}
			}
		} else {//배열이 아닐 때
			var tf = search.memcheck.checked;
			if(tf){
				going=tf;
			}
		}
		
		if(going) {
			alert("정말 회원 데이터를 삭제하시겠습니까?");
			search.t_gubun.value = "memberDeleteAll";
			search.method = "post";
			search.action = "Control";
// 			search.submit();
		} else{
			alert("하나 이상 체크해야합니다.");
			return;
		}



// 		alert(tf);
	} 
</script>
<body class="admin-page">
    
    <header class="main-header" id="mainHeader">
        
        <nav class="main-nav">
            <%@include file = "cover2.jsp"%>
        </nav>
    </header>
    <FORM name="controller">
        <input type="hidden" name="t_gubun">
    </FORM>
    <div class="dashboard-container">
       <aside class="sidebar">
        <nav class="main-nav">
            <%@include file = "control_side_menu.jsp"%>
        </nav>

            <div class="logout-area">
                <a href="#" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> <span>Log Out</span>
                </a>
            </div>
        </aside>

        <main class="main-content">
     <form name="search">
        <input type="hidden" name="t_gubun">
        <input type="hidden" name="t_nowPage">
            <div class="content-wrapper">
                
                <div class="page-top-bar">
                    <div class="title-area">
                        <h2>Members</h2>
                        <span class="count-badge"><i class="fa-solid fa-pen"></i> ${totalCount} 명</span>
                    </div>
                </div>

                <div class="toolbar-row">
    
    <div class="left-tools">
        <button class="btn-primary"><i class="fa-solid fa-plus"></i> Add</button>
    </div>
	
    <div class="right-tools">
        <select name="t_select" class="filter-select">
            <option <c:if test="${select eq 'all' }">selected</c:if> value="all">전체회원</option>
            <option <c:if test="${select eq 'now' }">selected</c:if> value="now">현재회원</option>
            <option <c:if test="${select eq 'exit' }">selected</c:if> value="exit">탈퇴회원</option>
        </select>
		
		<select name="t_colum" class="filter-select">
            <option <c:if test="${colum eq 'id' }">selected</c:if> value="id">ID</option>
            <option <c:if test="${colum eq 'name' }">selected</c:if> value="name">이름</option>
            <option <c:if test="${colum eq 'email_1' }">selected</c:if> value="email_1">이메일</option>
        </select>
        
        <div class="search-box">
            <input name="t_search" type="text" value="${search }" placeholder="Search" 
            onkeydown="if(event.key==='Enter'){event.preventDefault(); goSearch();}">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
    </div>
	
</div>

                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th width="5%"><input type="checkbox" name="checkAll" onclick="goCheckAll()"></th>
                                <th width="15%">이름</th>
                                <th width="15%">ID</th>
                                <th width="20%">전화 번호</th>
                                <th width="25%">이메일</th>
                                <th width="10%">성별</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${mlist }" var="dto">
                            <tr>
                                <td><input type="checkbox" name="memcheck" value="${dto.getId() }"></td>
                                <td>${dto.getId() }</td>
                                <td>${dto.getName() }</td>
                                <td>${dto.getMobile_1() }-${dto.getMobile_2() }-${dto.getMobile_3() }</td>
                                <td>${dto.getEmail_1() }@${dto.getEmail_2() }</td>
                                <td>
                                	<span class="badge-list">
                                	<c:if test="${dto.getGender() eq 'M'}">남성</c:if>
                                	<c:if test="${dto.getGender() eq 'F'}">여성</c:if>
                                	</span>
                                </td>
                               
                                <td class="actions">
                                    <button class="btn-icon" onclick ="goYoyakuList('${dto.getId() }')";><i class="fa-solid fa-calendar-check"></i></button>
                                    <button class="btn-icon" onclick ="goDeleteMember('${dto.getId() }')";><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                        	<tr>
                        		<td colspan='7' class="actions" style='text-align: right'>
                                    <button class="btn-icon" onclick="goDeleteAll()"><i class="fa-solid fa-trash"> &ensp; 선택 삭제</i></button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="pagination">
                    <button class="page-nav" onclick="goListPage('1')"><i class="fa-solid fa-chevron-left"> </i>Previous</button>
                    <div class="page-numbers">
                    	${pageDisplay }
<!--                         <span onclick="goListPage('1')">1</span> -->
<!--                         <span class="active">2</span> -->
<!--                         <span>3</span> -->
<!--                         <span>4</span> -->
<!--                         <span class="dots">...</span> -->
<!--                         <span>126</span> -->
                    </div>
                    <button class="page-nav" onclick="goListPage('1')">Next <i class="fa-solid fa-chevron-right"></i></button>
                </div>

            </div>
            
		</form>
        </main>
    </div>
    
    <script>
        // 스크롤 시 헤더 디자인 변경
        const mainContent = document.querySelector('.main-content');
        const mainHeader = document.getElementById('mainHeader');

        mainContent.addEventListener('scroll', () => {
            if (mainContent.scrollTop > 50) {
                mainHeader.classList.add('scrolled');
            } else {
                mainHeader.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>