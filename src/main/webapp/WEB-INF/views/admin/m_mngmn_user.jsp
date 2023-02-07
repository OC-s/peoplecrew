<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <title>
    PeopleCrew
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../resources/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../resources/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../resources/assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  
</head>

<body class="g-sidenav-show   bg-gray-100">
  <div class="min-height-300 bg-primary position-absolute w-100"></div>
    <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand " href="/" style="margin-right: 0; text-align: center;">
        <img src="https://i.ibb.co/1dzdtP6/logo.png" alt="main_logo">
      </a>
    </div>
    <hr class="horizontal dark mt-0">
   
   <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
  <!-- 좌측 사이드바 -->
    <ul class="navbar-nav" data-widget="treeview" role="menu" data-accordion="false">

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#a-nav" data-bs-toggle="collapse" href="#">
         <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
         </div>
         <span>인사관리</span>
        </a>
        <ul id="a-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="personnel_info/mypage?mno=${dto.mno }">
              <i class="bi bi-circle"></i>
              <span>마이페이지</span>
            </a>
          </li>
          <li>
            <a href="personnel_info/cs">
              <i class="bi bi-circle"></i>
              <span>문의사항</span>
            </a>
          </li>
          <li>
            <a href="personnel_info/stafflist">
              <i class="bi bi-circle"></i>
              <span>직원 현황</span>
            </a>
          </li>
          <li>
             <a href="personnel_info/organization2">
              <i class="bi bi-circle"></i>
              <span>조직도</span>
            </a>
          </li>
        </ul>
      </li><!-- End 인사정보 Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#b-nav" data-bs-toggle="collapse" href="#">
         <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
         </div>
         <span>업무관리</span>
        </a>
        <ul id="b-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/calendar/list">
              <i class="bi bi-circle"></i>
              <span>캘린더</span>
            </a>
          </li>
          <li>
            <a href="/calendar/mycalendar">
              <i class="bi bi-circle"></i>
              <span>나의 업무</span>
            </a>
          </li>
        </ul>
      </li><!-- End 업무관리 Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#c-nav" data-bs-toggle="collapse" href="#">
         <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
         </div>
         <span>근태관리</span>
        </a>
        <ul id="c-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/attendance?mno=${dto.mno }">
              <i class="bi bi-circle"></i>
              <span>근태관리</span>
            </a>
          </li>
          <li>
             <a href="/vacation">
              <i class="bi bi-circle"></i>
              <span>휴가관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End 근태관리 Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#d-nav" data-bs-toggle="collapse" href="#">
         <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
         </div>
         <span>전자결재</span>
        </a>
        <ul id="d-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/apvHome"> 
            <i class="bi bi-circle"></i> 
            <span>전자결재홈</span>
            </a>
          </li>
          <li>
             <a href="/apvWrite?form=연차신청서"> 
             <i class="bi bi-circle"></i> 
             <span>기안작성</span>
			</a>
          </li>
          <li>
             <a href="/personalFile?apvP=전체문서">
             <i class="bi bi-circle"></i> 
             <span>개인문서함</span>
			</a>
          </li>
          <li>
             <a href="/apvProgress">
             <i class="bi bi-circle"></i> 
             <span>결재처리함</span>
			</a>
          </li>
          <li>
             <a href="/oldFile">
             <i class="bi bi-circle"></i> 
             <span>오래된문서함</span>
			</a>
          </li>
        </ul>
      </li><!-- End 근태관리 Nav -->
      
      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#e-nav" data-bs-toggle="collapse" href="#">
         <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
         </div>
         <span>게시판</span>
        </a>
        <ul id="e-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="/board/list">
              <i class="bi bi-circle"></i>
              <span>공지사항</span>
            </a>
          </li>
        </ul>
      </li><!-- End 게시판 Nav -->
      
      <li class="nav-item">
        <a class="nav-link" data-bs-target="#f-nav" data-bs-toggle="collapse" href="#">
          <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
             <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
          </div>
         <span>인사관리 (관리자)</span>
        </a>
        <ul id="f-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
          <li>
            <a href="/admin/sign" >
              <i class="bi bi-circle"></i>
              <span>사원정보등록</span>
            </a>
          </li>
          <li>
            <a href="/admin/admin2" >
              <i class="bi bi-circle"></i>
              <span>사원조회</span>
            </a>
          </li>
          <li>
            <a href="/admin/admin3" >
              <i class="bi bi-circle"></i>
              <span>급여관리</span>
            </a>
          </li>
          <li>
            <a href="/admin/page" >
              <i class="bi bi-circle"></i>
              <span>근태관리</span>
            </a>
          </li>
        </ul>
      </li><!-- End 인사관리자 Nav -->
      
    </ul>
  	</aside><!-- End Sidebar-->
  
  <main class="main-content position-relative border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="javascript:;">Pages</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">PeopleCrew</li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">사원조회</h6>
        </nav>
       
       <!-- 로그인 헤더  -->
		<%@ include file="../include/header.jsp" %>
		       
      </div>
    </nav>
    <!-- End Navbar -->
    
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <span style="font-size: 18px; font-weight: bolder;">사원정보</span>
              <form action="/search3" method="get" name="search-form" id="sform">
              <div class="input-group " style="width: 20%; float: right;">
	              <span class="input-group-text text-body">
              	  <a href="#" onclick="document.getElementById('sform').submit();"><i class="fas fa-search" aria-hidden="true"></i></a>
              	  </span>
	              <input type="text" class="form-control" name="keyword" id="keyword" value="" placeholder="검색어를 입력해주세요.">
           	  </div>
              </form>
              
            </div>
           
			<br>
			
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0" id="membertable">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-6">사원번호</th>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-2">이름</th>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-4">입사일</th>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-4">전화번호</th>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-4">직급</th>
                      <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ps-4">부서</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  <c:forEach var="dto" items="${list }">
                    <tr>
                      <td class="ps-6">
                        <span class="text-secondary text-s font-weight-bolder">${dto.mno }</span> <!--사번-->
                      </td>
                      <td class="ps-2">
                        <span class="text-secondary text-s font-weight-bolder">${dto.mname }</span> <!--이름-->
                      </td>
                      <td class="ps-4">
                        <span class="text-secondary text-s font-weight-bolder">${dto.mdate }</span> <!--입사일-->
                      </td>
                      <td class="ps-4">
                        <span class="text-secondary text-s font-weight-bolder">${dto.mphone }</span> <!--전화번호-->
                      </td>
                      <td class="ps-4">
                        <span class="text-secondary text-s font-weight-bolder">${dto.mrank }</span> <!--직급-->
                      </td>
                      <td class="ps-4">
                        <span class="text-secondary text-s font-weight-bolder">${dto.oname }</span> <!--부서-->
                      </td>
                    </tr>
                  </c:forEach>
                  
	                  	<tr>
							<td colspan="8">
								<nav aria-label="Page navigation example">
								  <ul class="pagination justify-content-center" style="margin-bottom: 0; margin-top: 10px;" >
								 	
							 	<c:choose>
								  	<c:when test="${map.isPre }">
								  		<c:choose>
								  			<c:when test="${empty keyword}">
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${map.currentPage-5 }">이전</a></li>
								  			</c:when>
								  			<c:otherwise>
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${map.currentPage-5 }">이전</a></li>
								  			</c:otherwise>
								  		</c:choose>
								  	</c:when>
							 	</c:choose>
								  	
								  	<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
								  		<c:choose>
								  			<c:when test="${empty keyword}">
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${i}">${i }</a></li>
								  			</c:when>
								  			<c:otherwise>
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${i}">${i }</a></li>
								  			</c:otherwise>
								  		</c:choose> 
								  	</c:forEach>
								  	
								<c:choose>
								    <c:when test="${map.isNext }">
								    	<c:choose>
								  			<c:when test="${empty keyword}">
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${map.currentPage+5 }">다음</a></li>
								  			</c:when>
								  			<c:otherwise>
											    <li class="page-item"><a class="page-link" href="search3?keyword=${keyword}&cp=${map.currentPage+5 }">다음</a></li>
								  			</c:otherwise>
								  		</c:choose>
								    </c:when>
							    </c:choose>
								    
								  </ul>
								</nav>
							</td>
						</tr>
					
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
     
    <!-- 푸터  -->
    <%@ include file="../include/footer.jsp" %>
     
     </div>
  </main>
   <!-- End main  -->  
   
  
  <!--   Core JS Files   -->
  <script src="../resources/assets/js/core/popper.min.js"></script>
  <script src="../resources/assets/js/core/bootstrap.min.js"></script>
  <script src="../resources/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../resources/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="../resources/assets/js/plugins/chartjs.min.js"></script>
  
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../resources/assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>