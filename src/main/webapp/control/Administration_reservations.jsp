<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 예약 관리 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>F5 - 예약관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/control/Administration.css"> 
	<script type="text/javascript">
		function checkPay(pay){
			search.t_pay.value=pay;
			goSearch();
		}
		function checkKind(kind){
			search.t_kind.value=kind;
			goSearch();
		}
		
		function goSearch(){
			search.t_gubun.value="reservation";
			search.method="post";
			search.action="Control";
			search.submit();
		}
		
		function goDeleteAll(){
			if(confirm("미결제 상태로 24시간 이상 경과한 예약을 전부 삭제합니다.")){
				search.t_gubun.value="notPayedDelete";
				search.method="post";
				search.action="Control";
				search.submit();
			}
		}
		
		function goListPage(pageNumber){
			search.t_nowPage.value=pageNumber;
			search.t_gubun.value="reservation";
			search.method="post";
			search.action="Control";
			search.submit();
		}
		
		function goCancle(no){
			search.t_yno.value=no;
			search.t_gubun.value="reservationCancle";
			search.method="post";
			search.action="Control";
			search.submit();
		}
		
		function goComplt(no){
			search.t_yno.value=no;
			search.t_gubun.value="reservationComplt";
			search.method="post";
			search.action="Control";
			search.submit();
		}
	
	
	
	
	</script>

	
</head>
    <FORM name="controller">
        <input type="hidden" name="t_gubun">
    </FORM>

<body class="admin-page">
    
    <header class="main-header" id="mainHeader">    
        <nav class="main-nav">
            <%@include file = "cover2.jsp"%>
        </nav>
    </header>

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
	<c:if test="${not empty msg}">
		<script>alert('${msg}');</script>
	</c:if>
        <main class="main-content">
        <FORM name="search">
        <input type="hidden" name="t_gubun">
        <input type="hidden" name="t_nowPage">
        <input type="hidden" name="t_yno">
        <input type="hidden" name="t_pay" value="${pay }">
        <input type="hidden" name="t_kind"value="${kind }">

            <div class="content-wrapper">
                <!-- 집어넣기 -->
                 <div class="project-list-block">
    
    <div class="list-top-bar">
        <div class="tab-container">
            <button onclick="checkPay('all')" class="tab-btn <c:if test="${pay eq 'all' }">active</c:if>"  >전체</button>
            <button onclick="checkPay('Y')" class="tab-btn <c:if test="${pay eq 'Y' }">active</c:if>"  >결제됨</button>
            <button onclick="checkPay('N')" class="tab-btn <c:if test="${pay eq 'N' }">active</c:if>"  >미결제</button>
        </div>
        <div class="tab-container">
            <button onclick="checkKind('all')" class="tab-btn <c:if test="${kind eq 'all' }">active</c:if>" >종합</button>
            <button onclick="checkKind('ca')" class="tab-btn <c:if test="${kind eq 'ca' }">active</c:if>" >캠핑</button>
            <button onclick="checkKind('fi')" class="tab-btn <c:if test="${kind eq 'fi' }">active</c:if>" >낚시</button>
        </div>
        
        <div class="right-tools">
        <select name="t_select" class="filter-select">
            <option <c:if test="${select eq 'NO' }">selected</c:if> value="NO">예약번호</option>
            <option <c:if test="${select eq 'USER_ID' }">selected</c:if> value="USER_ID">회원ID</option>
            <option <c:if test="${select eq 'name' }">selected</c:if> value="name">예약자명</option>
        </select>
        
        <div class="search-box">
            <input name="t_search" type="text" value="${search }" placeholder="Search" 
            onkeydown="if(event.key==='Enter'){event.preventDefault(); goSearch();}">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
    </div>
    </div>
    
    <div class="cards-stack_upper">
    	<div class="date-cell_left">
    		총 예약수 ${totalCount } 건
    	</div>
    	<div class="date-cell">
    		입실일&nbsp;&nbsp;:&nbsp;&nbsp;
	     	<input type="date" class="sel_text" name="t_order_start" value="${orderStart }"> 
			~
			<input type="date" class="sel_text" name="t_order_end" value="${orderEnd }"> 
     	</div>  
        
    </div>

    <div class="cards-stack">
    	
        
        <c:forEach items="${ylist }" var="dto">
	        <div class="p-card">
	            <div class="p-left">
	           		<c:choose>
						<c:when test="${dto.getCam_type() eq '글램핑' }">
							<div class="p-icon color-purple">
			                    <i class="fa-solid fa-house"></i>
			                </div>
						</c:when>
						<c:when test="${dto.getCam_type() eq '오토캠핑' }">
							<div class="p-icon color-green">
			                    <i class="fa-solid fa-campground"></i>
			                </div>
						</c:when>
						<c:when test="${dto.getCam_type() eq '카라반' }">
							<div class="p-icon color-orange">
			                    <i class="fa-solid fa-caravan"></i>
			                </div>
						</c:when>
						<c:otherwise>
							<div class="p-icon color-blue">
			                    <i class="fa-solid fa-fish"></i>
			                </div>
						</c:otherwise>
					</c:choose>
	                
	                <div class="p-info">
						<c:choose>
							<c:when test="${dto.getKind() eq 'fi' }">
								<div class="p-title">${dto.getRiver() } ${dto.getFish_name() }</div>
			                    <div class="p-meta">
			                        <span class="date">${dto.getNo() } </span>
			                        <span class="date"><i class="fa-regular fa-calendar"></i> ${dto.getStart_date() } ~ ${dto.getEnd_date() }</span>
			                    </div>
							</c:when>
							<c:otherwise>
								<div class="p-title">${dto.getCam_type() } ${dto.getCam_name() }</div>
			                    <div class="p-meta">
			                        <span class="date">${dto.getNo() } </span>
			                        <span class="date"><i class="fa-regular fa-calendar"></i> ${dto.getStart_date() } ~ ${dto.getEnd_date() }</span>
			                    </div>
							</c:otherwise>
						</c:choose>
	                    
	                </div>
	            </div>
	            <div class="p-middle">
	                <div class="data-label">예약자  </div>
	                <div class="avatar-group">
	                	<span class="val">${dto.getUser_id() }</span>
	                	<span class="val">${dto.getUsername() }</span>
	                </div>
	            </div>
				
				
				<c:choose>
					<c:when test="${dto.getPaymant() eq 'Y' }">
						<div class="p-right">
			                <div class="data-label">결재 여부</div>
			                <div class="data-row">
			                    <div class="data-col">
			                        <span class="don">결재완료</span>
			                    </div>
			                </div>
			            </div>
			            <div class="p-right2">
			            	<button type="button" onclick="goCancle('${dto.getNo()}')"> 예약 취소 </button>
			            </div>
					</c:when>
					<c:otherwise>
			            <div class="p-right">
			                <div class="data-label">결재 여부</div>
			                <div class="data-row">
			                    <div class="data-col">
			                        <span class="non">미결재</span>
			                    </div>
			                </div>
			            </div>
			            <div class="p-right2">
			            	<button type="button"  onclick="goComplt('${dto.getNo()}')"> 결제확인 </button>
			            	<button type="button"  onclick="goCancle('${dto.getNo()}')"> 예약취소 </button>
			            </div>				
					</c:otherwise>
				</c:choose>
	            
	        </div>
        </c:forEach>
        
        
        
        	<button type="button" class="btn-icon" onclick="goDeleteAll()" style="text-align: right;"><i class="fa-solid fa-trash"> &ensp; 미결제 예약 일괄 삭제</i></button>	
        </div>

    </div>
                <div class="pagination">
                    <button class="page-nav" onclick="goListPage('${(nowpage-1) lt 1 ? 1 : (nowpage-1)}')"><i class="fa-solid fa-chevron-left"> </i>Previous</button>
                    <div class="page-numbers">
                    	${pageDisplay }
                    </div>
                    <button class="page-nav" onclick="goListPage('${(nowpage+1) lt total_page ? (nowpage+1) : total_page}')">Next <i class="fa-solid fa-chevron-right"></i></button>
                </div>
</div>
</FORM>
              

            </div>
        </main>
    </div>

    <script>
        // 스크롤 시 헤더 디자인 변경 스크립트 (기존 유지)
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