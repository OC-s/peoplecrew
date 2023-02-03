<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<title>개인문서함</title>
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<!-- Nucleo Icons -->
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js"
	crossorigin="anonymous"></script>
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files -->
<link id="pagestyle" href="./assets/css/argon-dashboardApv.css?v=2.0.4"
	rel="stylesheet" />
</head>

<body class="g-sidenav-show   bg-gray-100">
	<div class="min-height-300 position-absolute w-100" style="background-color:#5e72e4;"></div>

	<!-- 사이드바  -->
	<%@ include file="../include/sidebar.jsp" %>

	<main class="main-content position-relative border-radius-lg ">
		<!-- Navbar -->
		<nav
			class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl "
			id="navbarBlur" data-scroll="false">
			<div class="container-fluid py-1 px-3">
				<nav aria-label="breadcrumb">
					<h2 class="font-weight-bolder text-white mb-0"></h2>
				</nav>

       <!-- 로그인헤더  -->
		<%@ include file="../include/header.jsp" %>
			</div>
		</nav>
		<!-- End Navbar -->









<!-- ==========================================================내작업======================  -->
	<div class="container bg-white p-2 rounded" style="min-width:1400px;min-height:1130px;">
	<div class="border border-secondary border-opacity-25 border-2 rounded" style="margin-top:100px;width:1100px;align:center;min-height:1000px;margin-left:100px;margin-right:auto;">
	<div style="height:200px;">
		<table class="table table-borderless">
			<tr class="align-bottom" style="height:100px;">
				<th style="width:250px;font-size:25px;padding-left:58px;" colspan=""></th>
				<th style="text-align:center;"><h3>${form }</h3></th>
			</tr>
				<form action="/apvWrite">
			<tr style="height:50px;">
				<td style="width:250px;padding-left:80px;">
					<select name="form" id="" class="form-select" style="width:200px;">
						<option value="연차신청서" <c:if test="${form eq '연차신청서' }">selected="selected"</c:if>>연차신청서</option>
						<option value="업무보고서" <c:if test="${form eq '업무보고서' }">selected="selected"</c:if>>업무보고서</option>
					</select>
				</td>
				<td>
					<input class="btn btn-primary" type="submit" value="선택" />
				</td>
				</form>
				<form action="/apvWriteOk" method="post">
				<td style="width:50px;"><input class="btn btn-success" type="submit" style="" value="기안하기" /></td>
				<td style="width:50px;padding-right:50px;"><a href="/apvHome"><input class="btn btn-light" type="button" style="margin:auto;" value="취소" /></a></td>
			</tr>
		</table>
	</div>
	<div style="width:1000px;">
		<table class="table table-bordered align-middle" style="margin-left:10%;width:61%;float:left;">
			<tr class="bg-secondary p-2 text-dark bg-opacity-10 w-25" style="text-align:center;">
				<th>이름</th>
				<th>직책</th>
				<th>부서</th>
				<th>사번</th>
				<th>작성일자</th>
			</tr>
			<tr style="text-align:center;">
				<td class="border border-1">${mdto.mname }</td>
				<td class="border border-1">${mdto.mrank }</td>
				<td class="border border-1">${mdto.oname }</td>
				<td class="border border-1">${mdto.mno }</td>
				<td class="border border-1">${now }</td>
				<input type="hidden" name="mno" value="${mdto.mno }" />
			</tr>
		</table>
		<table class="table table-bordered align-middle" style="width:25%;float:right;text-align:center;">
			<tr class="bg-secondary p-2 text-dark bg-opacity-10 w-25">
				<th>결재자1</th>
				<th>결재자2</th>
			</tr>
			<tr>
				<td class="border border-1">아무개</td>
				<td class="border border-1">아무개</td>
			</tr>
		</table>
	</div>
	
	<c:choose>
		<c:when test="${form eq '연차신청서' }">
			<jsp:include page="form/vacation.jsp" />
		</c:when>
		<c:when test="${form eq '업무보고서' }">
			<jsp:include page="form/businessReport.jsp" />
		</c:when>
	</c:choose>
	
	<div>
	<table class="table table-borderless align-middle" style="width:25%;text-align:center;margin-left:auto;margin-right:auto;margin-bottom:50px;">
		<tr>
			<td style="padding-top:50px;">상기 명 본인은 위와같은 사유로 제출합니다. </td>
		</tr>
		<tr>
			<td style="padding-top:50px;">PeopleCrew <img src="./assets/img/logo-ct-dark.png" alt="" style="width:30px;"/></td>
		</tr>
	</table>
	</div>
	
	</div>
	</div>
	</form>
<!-- ===================================================================================  -->
	
	
	
	
	
	
	
	
	
	
	
	
	</main>

	<!--   Core JS Files   -->
	<script src="./assets/js/core/popper.min.js"></script>
	<script src="./assets/js/core/bootstrap.min.js"></script>
	<script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
	<script src="./assets/js/plugins/chartjs.min.js"></script>
	<script>
		var ctx1 = document.getElementById("chart-line").getContext("2d");

		var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);

		gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
		gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
		gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
		new Chart(ctx1, {
			type : "line",
			data : {
				labels : [ "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct",
						"Nov", "Dec" ],
				datasets : [ {
					label : "Mobile apps",
					tension : 0.4,
					borderWidth : 0,
					pointRadius : 0,
					borderColor : "#5e72e4",
					backgroundColor : gradientStroke1,
					borderWidth : 3,
					fill : true,
					data : [ 50, 40, 300, 220, 500, 250, 400, 230, 500 ],
					maxBarThickness : 6

				} ],
			},
			options : {
				responsive : true,
				maintainAspectRatio : false,
				plugins : {
					legend : {
						display : false,
					}
				},
				interaction : {
					intersect : false,
					mode : 'index',
				},
				scales : {
					y : {
						grid : {
							drawBorder : false,
							display : true,
							drawOnChartArea : true,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							padding : 10,
							color : '#fbfbfb',
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
					x : {
						grid : {
							drawBorder : false,
							display : false,
							drawOnChartArea : false,
							drawTicks : false,
							borderDash : [ 5, 5 ]
						},
						ticks : {
							display : true,
							color : '#ccc',
							padding : 20,
							font : {
								size : 11,
								family : "Open Sans",
								style : 'normal',
								lineHeight : 2
							},
						}
					},
				},
			},
		});
	</script>
	<script>
		var win = navigator.platform.indexOf('Win') > -1;
		if (win && document.querySelector('#sidenav-scrollbar')) {
			var options = {
				damping : '0.5'
			}
			Scrollbar.init(document.querySelector('#sidenav-scrollbar'),
					options);
		}
	</script>
	<!-- Github buttons -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>