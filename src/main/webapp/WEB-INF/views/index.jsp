<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<title>PeopleCrew</title>
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="./assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
		<div class="sidenav-header">
			<i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html " target="_blank"> <img src="../assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo"> <span class="ms-1 font-weight-bold">PeopleCrew</span>
			</a>
		</div>
		<hr class="horizontal dark mt-0">

		<div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">

			<ul class="navbar-nav" data-widget="treeview" role="menu" data-accordion="false">
				<li class="nav-item dropdown"><a class="nav-link active collapsed" data-bs-target="#tables-nav6" data-bs-toggle="collapse" href="#">
						<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">게시판</span>
				</a>
					<ul id="tables-nav6" class="nav-content collapse " data-bs-parent="#sidebar-nav">
						<li><a href="/board/list"> <i class="bi bi-circle"></i> <span>공지사항</span>
						</a></li>
					</ul></li>


				<li class="nav-item dropdown"><a class="nav-link active collapsed" data-bs-target="#tables-nav2" data-bs-toggle="collapse" href="#">
						<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
							<i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
						</div> <span class="nav-link-text ms-1">업무관리</span>
				</a>

					<ul id="tables-nav2" class="nav-content collapse " data-bs-parent="#sidebar-nav">
						<li><a href="/calendar/list"> <i class="bi bi-circle"></i> <span>calendar</span>
						</a></li>
						<li><a href="#"> <i class="bi bi-circle"></i> <span>오늘의 일정</span>
						</a></li>
					</ul></li>
			</ul>

		</div>
	</aside>
	<main class="main-content position-relative border-radius-lg ">
<jsp:include page="navbar.jsp"></jsp:include>
 <jsp:include page="footer.jsp" />
	</main>
</body>

</html>