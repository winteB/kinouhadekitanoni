<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../common_header_head.jsp" %>
    
    <!-- 스타일을 직접 적용하여 디자인 깨짐 방지 -->
    <style>
        /* 수정 페이지 전용 스타일 */
        .write-table {
            width: 100%;
            border-top: 2px solid #333;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 14px;
        }
        .write-table th {
            background: #f9f9f9;
            color: #333;
            padding: 15px 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            font-weight: 600;
        }
        .write-table td {
            padding: 15px 10px;
            border-bottom: 1px solid #ddd;
        }
        .input-field {
            width: 100%;
            height: 40px;
            padding: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            outline: none;
        }
        .input-field:focus {
            border-color: #333;
        }
        .textarea-field {
            width: 100%;
            height: 300px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            resize: vertical;
            outline: none;
            line-height: 1.6;
        }
        .textarea-field:focus {
            border-color: #333;
        }
        .select-field {
            height: 40px;
            padding: 0 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
        }
        .file-box {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            border: 1px dashed #ccc;
        }
        .current-file {
            margin-bottom: 10px;
            color: #333;
            font-weight: 500;
        }
        .file-notice {
            font-size: 13px; 
            color: #888; 
            margin-top: 8px;
        }
        .btn-group {
            margin-top: 40px;
            text-align: center;
        }
        .btn-group .btn {
            display: inline-block;
            padding: 12px 40px;
            margin: 0 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .btn-group .btn.save { 
            background: #333; 
            color: #fff; 
        }
        .btn-group .btn.save:hover {
            background: #555;
        }
        .btn-group .btn.cancel { 
            background: #fff; 
            border: 1px solid #ccc; 
            color: #333; 
        }
        .btn-group .btn.cancel:hover {
            background: #f1f1f1;
        }
    </style>
    
    <script type="text/javascript">
        function goUpdateSave() {
            var form = document.updateForm;
            
            if(form.t_title.value == "") {
                alert("제목을 입력해주세요.");
                form.t_title.focus();
                return;
            }
            if(form.t_target_id.value == "") {
                alert("리뷰 대상을 선택해주세요.");
                form.t_target_id.focus();
                return;
            }
            if(form.t_content.value == "") {
                alert("내용을 입력해주세요.");
                form.t_content.focus();
                return;
            }
            
            form.submit();
        }
    </script>
</head>
<body class="main-page">

<div class="wrapper">
    <%@ include file="../common_header_body.jsp" %>

    <div class="layout">
        <aside class="side-menu">
            <%@ include file="../common_side_menu.jsp" %>
        </aside>

        <main class="main-content">
            <div class="container">
                <h2 class="detail-title">게시글 수정</h2>

                <!-- ★★★ 중요 수정: action에 t_gubun=update_save를 직접 명시 ★★★ -->
                <!-- 이렇게 해야 파일 업로드(multipart) 상황에서도 gubun 값이 정상 전달됩니다 -->
                <form name="updateForm" action="Review?t_gubun=update_save" method="post" enctype="multipart/form-data">
                    
                    <input type="hidden" name="t_no" value="${t_dto.no}">
                    <!-- 기존 파일명을 유지하기 위해 hidden으로 전송 -->
                    <input type="hidden" name="t_old_attach" value="${t_dto.attach}">

                    <table class="write-table">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td>
                                    <input type="text" name="t_title" class="input-field" value="${t_dto.title}" placeholder="제목을 입력하세요">
                                </td>
                            </tr>
                            <tr>
                                <th>리뷰 대상</th>
                                <td>
                                    <select name="t_target_id" class="select-field" style="width: 200px;">
                                        <option value="오토캠핑" <c:if test="${t_dto.target_id eq '오토캠핑'}">selected</c:if>>오토캠핑</option>
                                        <option value="카라반" <c:if test="${t_dto.target_id eq '카라반'}">selected</c:if>>카라반</option>
                                        <option value="좌대낚시" <c:if test="${t_dto.target_id eq '좌대낚시'}">selected</c:if>>좌대낚시</option>
                                        <option value="글램핑" <c:if test="${t_dto.target_id eq '글램핑'}">selected</c:if>>글램핑</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>평점</th>
                                <td>
                                    <select name="t_rating" class="select-field" style="width:120px;">
                                        <c:forEach var="i" begin="1" end="5">
                                            <option value="${i}" <c:if test="${t_dto.rating eq i}">selected</c:if>>${i}점</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>
                                    <textarea name="t_content" class="textarea-field" placeholder="내용을 입력하세요">${t_dto.content}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>첨부파일</th>
                                <td>
                                    <div class="file-box">
                                        <c:if test="${not empty t_dto.attach}">
                                            <div class="current-file">
                                                현재 등록된 파일: <strong>${t_dto.attach}</strong>
                                            </div>
                                        </c:if>
                                        <input type="file" name="t_attach" class="file-input">
                                        <div class="file-notice">
                                            * 새로운 파일을 등록하면 기존 파일은 자동으로 삭제되고 변경됩니다.
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="btn-group">
                        <button type="button" onclick="goUpdateSave()" class="btn save">수정완료</button>
                        <a href="Review?t_gubun=view&t_no=${t_dto.no}" class="btn cancel">취소</a>
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