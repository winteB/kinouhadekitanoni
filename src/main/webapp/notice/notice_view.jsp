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
	function goView(no){
		view.t_gubun.value = "view";
		view.t_no.value = no;
		view.method = "post";
		view.action = "Notice";
		view.submit();
	}
	function goUpdateForm(){
		view.t_gubun.value = "updateForm";
		view.method = "post";
		view.action = "Notice";
		view.t_gubun.value = "updateForm";
	}
	function goDelete(){
		if(confirm("정말 삭제하시겠습니까?")){
			view.t_gubun.value = "delete";
			view.method = "post";
			view.action = "Notice";
			view.submit();
	}
</script>
<form name="view">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_no" value="${dto.getNo()}">
	<input type="hidden" name="t_attach" value="${dto.getAttach()}">
</form>
        <!-- 메인 콘텐츠 -->
        <main class="main-content">
            <div class="container">

                <h2 class="detail-title">공지사항</h2>

                <table class="detail-table">
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td <c:if test="${sessionLevel ne 'top'}">  colspan="3" </c:if> info-label>${dto.getTitle()}</td>
                            <c:if test="${sessionLevel eq 'top'}">
                            	&nbsp;&nbsp;
                            	<th>중요도</th>
                            	<td>${dto.getImportant()}</td>
                            </c:if>
                            
                            <th>조회수</th>
                            <td info-label>${dto.getHit()}
                            
                            </td>
                        </tr>
                        <tr>
                           <th>내용</th>
                            <td colspan="5" class="content-row">
                            	<textarea class="content-row textarea_H250" readonly>${dto.getContent()}</textarea>
                            </td>
                        </tr>
                        <tr>
                        	<th>첨부파일</th>
                            <td colspan="5" class="image-row">
                            	<c:if test="${not empty dto.getAttach()}">
                            		<a href="FileDownServlet?t_fileDir=notice&t_fileName=${dto.getAttach()}">${dto.getAttach()}</a>
                            	</c:if>
                            </td>
                        </tr>
                        
                         <tr>
                            <th>작성자</th>
                            <td colspan="1">${dto.getReg_id()}</td>
                            <th>작성일</th>
                            <td colspan="1">${dto.getReg_date()}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="preNext">
			<c:if test="${not empty preDto}">
				<a href="javascript:goView('${preDto.getNo()}')">
					<p class="pre"><span><i class="fa-solid fa-circle-arrow-left"></i> 이전글</span> 
						<span class="preNextTitle">
							<c:choose>
								<c:when test="${fn:length(preDto.getTitle()) > 20}">
									${fn:substring(preDto.getTitle(),0,20)}...
								</c:when>
								<c:otherwise>
									${preDto.getTitle()}
								</c:otherwise>
							</c:choose>						
						</span>
					</p>
				</a>
			</c:if>	
			<c:if test="${not empty nextDto}">
				<a href="javascript:goView('${nextDto.getNo()}')">
					<p class="next"><span>다음글 <i class="fa-solid fa-circle-right"></i></span>
						<span class="preNextTitle">
							<c:choose>
								<c:when test="${fn:length(nextDto.getTitle()) > 20}">
									${fn:substring(nextDto.getTitle(),0,20)}...
								</c:when>
								<c:otherwise>
									${nextDto.getTitle()}
								</c:otherwise>
							</c:choose>
						</span>
					</p>
				</a>
			</c:if>		
			</div>

                <!-- 버튼 영역 -->
                <div class="detail-btn-group">
                    <a href="Notice" class="btn">목록</a>
                    <c:if test="${sessionLevel eq 'top'}">
                    	<a href="javascript:goUpdateForm()" class="btn">수정</a>
                    	<a href="javascript:goDelete()" class="btn danger">삭제</a>
                	</c:if>
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