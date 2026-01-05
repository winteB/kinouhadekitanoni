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
<script type="text/javascript">
function goUpdate(){
	if(checkEmpty(noti.t_title, "제목 입력!")) return;
	if(checkEmpty(noti.t_content, "내용 입력!")) return;
		
	// 1.확장자 검사
	var fileName = noti.t_attach.value;
	if(fileName != ""){ //  C:\fakepath\img_1.png
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
		if(extension != "pdf" && extension != "hwp" && extension != "jpg"){
			alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF, jpg 파일만 가능!");
			return;
		}		
	}
	
	// 2.첨부 용량 체크	
	var file = noti.t_attach;
	var fileMaxSize  = 10; // 첨부 최대 용량 설정(10메가라는 뜻)
	if(file.value !=""){
		// 사이즈체크
		var maxSize  = 1024 * 1024 * fileMaxSize;
		var fileSize = 0;
		// 브라우저 확인
		var browser=navigator.appName;
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer"){
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}else {
		// 익스플로러가 아닐경우
			fileSize = file.files[0].size;
		}

		if(fileSize > maxSize){
			alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
			return;
		}	
	}
	noti.method = "post";
	noti.action = "Notice?t_gubun=update";
	noti.submit();
	
}
</script>
<form name="noti" enctype="multipart/form-data">
			<input type="hidden" name="t_no" value="${dto.getNo() }" >
        <!-- 메인 콘텐츠 -->
        <main class="main-content">
            <div class="container">

                <h2 class="detail-title">공지사항 글쓰기 수정</h2>

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
                            <td colspan="4" class="content-row">
                            	<input type="text" name="t_title" value="${dto.getTitle()}">
                            	<select name="t_important">
									<option value="0" <c:if test="${dto.getImportant() eq '0'}">selected</c:if> >중요도</option>
									<option value="1" <c:if test="${dto.getImportant() eq '1'}">selected</c:if> >1</option>
									<option value="2" <c:if test="${dto.getImportant() eq '2'}">selected</c:if> >2</option>
									<option value="3" <c:if test="${dto.getImportant() eq '3'}">selected</c:if> >3</option>
									<option value="4" <c:if test="${dto.getImportant() eq '4'}">selected</c:if> >4</option>
									<option value="5" <c:if test="${dto.getImportant() eq '5'}">selected</c:if> >5</option>
							</select>
                            </td>
                        </tr>

                        <tr>
							<th>Content</th>
							<td colspan="4" ><textarea name="t_content" class="textArea_H250">${dto.getContent() }</textarea></td>
						</tr>
                        <tr>
                        	<th>첨부파일</th>
                            <td colspan="4" class="image-row">
                            	<c:if test="${not empty dto.getAttach()}">
                            		<img src="images/clip.png"> ${dto.getAttach() }
									&nbsp;&nbsp;&nbsp; 삭제 <input type="checkbox" name="t_delete_checkbox" value="${dto.getAttach()}" class="checkbox">
                            	</c:if>
                            	<input type="hidden" name="t_ori_attach" value="${dto.getAttach()}" >
								<input type="file" name="t_attach" class="input600">
                            </td>
                        </tr>
                        
                         <tr>
                            <th>작성자</th>
                            <td>${dto.getReg_name()}</td>
                            <th>작성일</th>
                            <td>${dto.getReg_date()}</td>
                        </tr>
                        
                    </tbody>
                </table>
                </form>

                <!-- 버튼 영역 -->
                <div class="detail-btn-group">
                    <a href="javascript:history.back()" class="btn">이전</a>
                    <a href="javascript:goUpdate()" class="btn">저장</a>
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