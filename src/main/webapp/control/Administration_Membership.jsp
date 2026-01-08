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
    function goUser(){
        controller.gubun.value="user";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goSell(){
        controller.gubun.value="sell";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goReservation(){
        controller.gubun.value="reservation";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
    function goDesh(){
        controller.gubun.value="desh";
        controller.method="post";
        controller.action = "/kinouhadekitanoni/Control";
        controller.submit();
    }
</script>
<body class="admin-page">
    
    <header class="main-header" id="mainHeader">
        
        <nav class="main-nav">
            <%@include file = "cover2.jsp"%>
        </nav>
    </header>
    <FORM name="controller">
        <input type="hidden" name="gubun">
    <div class="dashboard-container">
       <aside class="sidebar">
           <nav class="menu-nav">
                <a href="javascript:goDesh()" class="menu-item">
                    <i class="fa-solid fa-chart-pie"></i> <span>대쉬 보드</span>
                </a>
                <a href="javascript:goUser()" class="menu-item active">
                    <i class="fa-solid fa-chart-line"></i> <span>회원 관리 </span>
                </a>
                <a href="javascript:goSell()" class="menu-item">
                    <i class="fa-regular fa-credit-card"></i> <span>매출 통계</span>
                </a>
                <a href="javascript:goReservation()" class="menu-item">
                    <i class="fa-solid fa-box-open"></i> <span>예약 관리</span>
                </a>
            </nav>

            <div class="logout-area">
                <a href="#" class="menu-item logout-link">
                    <i class="fa-solid fa-arrow-right-from-bracket"></i> <span>Log Out</span>
                </a>
            </div>
        </aside>

        <main class="main-content">
            <div class="content-wrapper">
                
                <div class="page-top-bar">
                    <div class="title-area">
                        <h2>Contacts</h2>
                        <span class="count-badge"><i class="fa-solid fa-pen"></i> 20,003 contacts</span>
                    </div>
                    <div class="top-settings">
                        <button class="btn-settings">Settings <i class="fa-solid fa-chevron-down"></i></button>
                    </div>
                </div>

                <div class="toolbar-row">
                    <div class="left-tools">
                        <button class="btn-primary"><i class="fa-solid fa-plus"></i> Add</button>
                        <button class="btn-outline"><i class="fa-solid fa-upload"></i> Upload</button>
                        <button class="btn-outline"><i class="fa-solid fa-filter"></i> Filter</button>
                    </div>
                    <div class="search-box">
                        <input type="text" placeholder="Search">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </div>
                </div>

                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th width="5%"><input type="checkbox"></th>
                                <th width="15%">이름</th>
                                <th width="15%">닉네임</th>
                                <th width="20%">전화 번호</th>
                                <th width="25%">이메일</th>
                                <th width="5%">나이</th>
                                <th width="15%">태그</th>
                                <th></th> </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>Wan</td>
                                <td>Gengen</td>
                                <td>731-787-1344</td>
                                <td>arianna.tillman@hotmail.com</td>
                                <td><span class="badge-list">23</span></td>
                                <td>
                                    <div class="tags-group">
                                        <span class="tag blue">Development</span>
                                        <span class="tag gray">Marketing</span>
                                    </div>
                                </td>
                                <td class="actions">
                                    <button class="btn-icon"><i class="fa-solid fa-pen"></i></button>
                                    <button class="btn-icon"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>James</td>
                                <td>Harden</td>
                                <td>010-1234-5678</td>
                                <td>james.h@niwacan.com</td>
                                <td><span class="badge-list">11</span></td>
                                <td>
                                    <div class="tags-group">
                                        <span class="tag blue">Design</span>
                                    </div>
                                </td>
                                <td class="actions">
                                    <button class="btn-icon"><i class="fa-solid fa-pen"></i></button>
                                    <button class="btn-icon"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>Sarah</td>
                                <td>Connor</td>
                                <td>888-999-0000</td>
                                <td>s.connor@sky.net</td>
                                <td><span class="badge-list">5</span></td>
                                <td>
                                    <div class="tags-group">
                                        <span class="tag gray">Marketing</span>
                                    </div>
                                </td>
                                <td class="actions">
                                    <button class="btn-icon"><i class="fa-solid fa-pen"></i></button>
                                    <button class="btn-icon"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>Michael</td>
                                <td>Jordan</td>
                                <td>232-232-2323</td>
                                <td>mj@bulls.com</td>
                                <td><span class="badge-list">45</span></td>
                                <td>
                                    <div class="tags-group">
                                        <span class="tag blue">Development</span>
                                        <span class="tag gray">Sales</span>
                                    </div>
                                </td>
                                <td class="actions">
                                    <button class="btn-icon"><i class="fa-solid fa-pen"></i></button>
                                    <button class="btn-icon"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                             <tr>
                                <td><input type="checkbox"></td>
                                <td>Emily</td>
                                <td>Blunt</td>
                                <td>555-123-4567</td>
                                <td>emily.b@movie.com</td>
                                <td><span class="badge-list">8</span></td>
                                <td>
                                    <div class="tags-group">
                                        <span class="tag blue">Acting</span>
                                    </div>
                                </td>
                                <td class="actions">
                                    <button class="btn-icon"><i class="fa-solid fa-pen"></i></button>
                                    <button class="btn-icon"><i class="fa-solid fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <button class="page-nav"><i class="fa-solid fa-chevron-left"></i> Previous</button>
                    <div class="page-numbers">
                        <span>1</span>
                        <span class="active">2</span>
                        <span>3</span>
                        <span>4</span>
                        <span class="dots">...</span>
                        <span>126</span>
                    </div>
                    <button class="page-nav">Next <i class="fa-solid fa-chevron-right"></i></button>
                </div>

            </div>
        </main>
    </div>
    </FORM>
    
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