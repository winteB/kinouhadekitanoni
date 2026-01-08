<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>

    <!-- [핵심] 게시판 전용 스타일을 직접 적용 (파일 로드 문제 해결) -->
    <style>
        /* 기존 레이아웃 충돌 방지 및 재설정 */
        .layout {
            display: flex !important;
            align-items: flex-start;
            justify-content: center;
            gap: 30px;
            max-width: 1200px;
            margin: 40px auto 80px !important;
            padding: 0 20px;
            width: 100%;
        }

        /* 사이드 메뉴 고정 */
        .side-menu {
            width: 220px;
            flex-shrink: 0;
            position: sticky;
            top: 100px;
        }

        /* [중요] 오른쪽 게시판 영역 스타일 강제 적용 (!important) */
        #b_right {
            flex-grow: 1;
            width: auto !important; /* 기존 고정 너비 해제 */
            float: none !important; /* 기존 float 해제 */
            background: #fff;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            min-height: 600px;
            margin: 0 !important; /* 불필요한 마진 제거 */
        }

        /* 제목 스타일 */
        .n_title {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 20px;
            color: #1a1a1a;
            border-bottom: 2px solid #1a1a1a;
            padding-bottom: 15px;
        }

        /* 게시글 수 및 상단 정보 */
        .record_group {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 15px;
            font-size: 14px;
            color: #666;
        }
        .record_group span {
            font-weight: 800;
            color: #ea5532;
            margin-left: 4px;
        }

        /* 검색 박스 */
        .select_box {
            display: flex;
            gap: 8px;
            justify-content: flex-end;
            margin-bottom: 20px;
        }
        .sel_box {
            height: 40px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0 10px;
        }
        .sel_text {
            height: 40px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 0 15px;
            width: 200px;
        }
        .sel_button {
            height: 40px;
            background: #0f172a;
            color: #fff;
            border: none;
            padding: 0 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
        }

        /* 테이블 디자인 */
        .boardList {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }
        .boardList thead th {
            background: #f8fafc;
            color: #334155;
            font-weight: 700;
            padding: 16px 10px;
            border-top: 1px solid #0f172a;
            border-bottom: 1px solid #e2e8f0;
            font-size: 14px;
        }
        .boardList tbody td {
            padding: 16px 10px;
            border-bottom: 1px solid #f1f5f9;
            text-align: center;
            font-size: 14px;
            color: #475569;
        }
        .boardList td.t_left {
            text-align: left;
            padding-left: 15px;
        }
        .boardList td.t_left a {
            color: #1e293b;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .boardList td.t_left a:hover {
            color: #ea5532;
            text-decoration: underline;
        }
        .boardList tr:hover td {
            background-color: #f8fafc;
        }
        .boardList td img {
            width: 14px;
            vertical-align: middle;
            opacity: 0.6;
        }

        /* 페이징 */
        .paging {
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            margin-top: 40px;
            gap: 5px;
        }
        .paging a {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            min-width: 32px;
            height: 32px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 13px;
            color: #64748b;
            text-decoration: none;
        }
        .paging a:hover {
            background-color: #f1f5f9;
        }
        .paging a.active {
            background-color: #0f172a;
            color: #fff;
            border-color: #0f172a;
        }
        .paging .write {
            position: static;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            background: #0f172a;
            color: #fff;
            padding: 8px 20px;
            border-radius: 6px;
            font-weight: 600;
            border: none;
        }

        /* 모바일 반응형 */
        @media (max-width: 768px) {
            .layout { flex-direction: column; }
            .side-menu { width: 100%; position: static; margin-bottom: 20px; }
            #b_right { padding: 20px; }
            .paging .write { position: static; transform: none; display: block; width: 100%; text-align: center; margin-top: 15px; }
            .select_box { flex-wrap: wrap; }
            .sel_text { width: 100%; }
        }
        * ============================= */
/* QNA LIST */
/* ============================= */
.qna-desc {
	font-size: 14px;
	color: #666;
	margin-bottom: 20px;
}

.qna-list .boardList td, .qna-list .boardList th {
	text-align: center;
}

.qna-list .boardList .t_left {
	text-align: left;
}

/* 상태 뱃지 */
.status {
	display: inline-block;
	padding: 6px 12px;
	border-radius: 999px;
	font-size: 12px;
	font-weight: 700;
}

.status.done {
	background: #dcfce7;
	color: #166534;
}

.status.wait {
	background: #fef3c7;
	color: #92400e;
}

/* 하단 영역 */
.qna-bottom {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.qna-bottom .page-center a {
	padding: 8px 14px;
	border-radius: 8px;
	border: 1px solid #ddd;
	font-size: 13px;
}

.qna-bottom .page-center a.active {
	background: #0f172a;
	color: #fff;
	border-color: #0f172a;
}
/* QNA 조회수 */
.qna-list .boardList td:nth-child(5) {
	color: #475569;
	font-weight: 600;
}
    </style>
</head>
<body>

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>
	
    <!-- flex 레이아웃 적용 -->
    <div class="layout">
        <!-- 사이드바 -->
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <!-- 오른쪽 게시판 영역 -->
        <div id="b_right">
            <p class="n_title">Q & A</p>
            
            <form name="noti" action="notice_list" method="get">
                <input type="hidden" name="t_nowPage" >
                
                <div class="record_group">
                    <p><i class="fa-solid fa-bell"></i> 질문 합계<span> ${totalCount } </span>건</p>
                </div>

                <div class="select_box">
                    <select name="t_select" class="sel_box">
                        <option value="title" <c:if test="${select eq 'title' }">selected</c:if>>제목</option>
                        <option value="content" <c:if test="${select eq 'content' }">selected</c:if>>내용</option>
                    </select>
                    <input type="text" name="t_search" value="${search }" class="sel_text" placeholder="검색어를 입력하세요">
                    <button type="button" onclick="goSearch()" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
                </div>
            </form>      
         
            <table class="boardList">
                <colgroup>
                    <col width="8%">
                    <col width="*">
                    <col width="8%">
                    <col width="12%">
                    <col width="15%">
                    <col width="8%">
                </colgroup>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="sort" value="${order}"></c:set>
                    <c:forEach items="${list}" var="dto">
                        <tr>
                            <td>
                                ${sort}
                                <c:set var="sort" value="${sort - 1}"></c:set>
                            </td>
                            <td class="t_left">
                                <a href="javascript:goView('${dto.getNo()}')">${dto.getTitle() }</a>
                            </td>
                            <td>${dto.getReg_name() }</td>
                            <td>${dto.getReg_date() }</td>
                            <td>${dto.getHit() }</td>
                            <td><span class="status done">답변완료</span></td>
                        </tr>
                    </c:forEach>
                    
                    <!-- 데이터 없을 때 예시 -->
                    <c:if test="${empty list}">
                        <tr>
                            <td>3</td>
                            <td class="t_left"><a href="#">사이트 이용 안내 공지사항입니다.</a></td>
                            <td>-</td>
                            <td>관리자</td>
                            <td>2025-01-01</td>
                            <td>12</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td class="t_left"><a href="#">겨울 시즌 휴무 일정 안내</a></td>
                            <td><img src="${pageContext.request.contextPath}/images/clip.png" alt="file"></td>
                            <td>관리자</td>
                            <td>2024-12-20</td>
                            <td>34</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td class="t_left"><a href="#">서비스 오픈 이벤트 당첨자 발표</a></td>
                            <td>-</td>
                            <td>관리자</td>
                            <td>2024-12-01</td>
                            <td>102</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            
            <div class="paging">
                ${pageDisplay}
                
                <c:if test="${empty pageDisplay}">
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">&gt;</a>
                </c:if>

                <c:if test="${sessionLevel ne 'top' }">
                    <a href="javascript:goPage('Notice','write')" class="write">글쓰기</a>
                </c:if>
            </div>
        </div>
    </div>   
</div>

<footer>
    <%@ include file="../common_footer.jsp" %>
</footer>
</body>
</html>