<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- Favicons -->

<link rel="shortcut icon" type="image/x-icon"
	href="/resources/assets/img/title_logo.png">

<!-- Libs CSS -->
<link rel="stylesheet"
	href="/resources/node_modules/jquery.fancybox.min.css">
<link rel="stylesheet" href="/resources/node_modules/all.min.css">
<link rel="stylesheet" href="/resources/node_modules/flickity.min.css">
<link rel="stylesheet" href="/resources/node_modules/vs2015.css">
<link rel="stylesheet" href="/resources/node_modules/simplebar.min.css">
<link rel="stylesheet"
	href="/resources/assets/libs/flickity-fade/flickity-fade.css">
<link rel="stylesheet"
	href="/resources/assets/fonts/feather/feather.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<!-- Theme CSS -->
<!-- build:css /resources//resources/assets/css/theme.min.css -->
<link rel="stylesheet" href="/resources/assets/css/theme.css">
<!-- endbuild -->

<title>얼쑤[EARTH]좋다</title>

</head>
<body>





	<!-- NAVBAR -->
	<!-- @@include("partials/navbar-topbar.html", {"classList": "bg-light"}) -->

	<!-- NAVBAR -->
	<nav class="navbar navbar-expand-lg navbar-light @@classList">
		<div class="container">

			<!-- Brand -->
			<a class="navbar-brand" href="/main">
				<img src="/resources/assets/img/logo.png"></a>

			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="navbarCollapse">

				<!-- Nav -->
				<ul class="navbar-nav mx-auto">
					<li class="nav-item dropdown position-static">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">About</a> <!-- Menu -->
						<div class="dropdown-menu w-100">
								<!-- Tab content -->
							<div class="card card-lg">
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade show active" id="navTab">
											<div class="container">
												<div class="row">
													<div class="col-6 col-md">

														<!-- Heading -->
														<div class="mb-5 font-weight-bold">얼쑤[EARTH]좋다</div>

														<!-- Links -->
														<ul class="list-styled mb-6 mb-md-0 font-size-sm">
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">제로웨이스트</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">얼쑤좋다 사업소개가튼거</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="/storelocation">오프라인 제로웨이스트 상점</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">제휴문의</a></li>
														</ul>

													</div>
													
													
													
													
													<div class="col-4 d-none d-lg-block">

														<!-- Card -->
														<div class="card">

															<!-- Image -->
															<img class="card-img"
																src=" /resources/assets/img/recycling_menu.jpg"
																alt="...">

														

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</li>
					<li class="nav-item dropdown position-static">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Recycling</a> <!-- Menu -->
						<div class="dropdown-menu w-100">

							<!-- Tabs -->
					<!-- 		<form class="mb-2 mb-lg-0 border-bottom-lg">
								<div class="container">
									<div class="row">
										<div class="col-12">

											Nav
											<nav
												class="nav nav-tabs nav-overflow font-size-xs border-bottom border-bottom-lg-0">
												<a class="nav-link text-uppercase active" data-toggle="tab"
													href="#navTab"> Women </a> <a
													class="nav-link text-uppercase" data-toggle="tab"
													href="#navTab"> Men </a> <a class="nav-link text-uppercase"
													data-toggle="tab" href="#navTab"> Kids </a>
											</nav>

										</div>
									</div>
								</div>
							</form> -->

							<!-- Tab content -->
							<div class="card card-lg">
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade show active" id="navTab">
											<div class="container">
												<div class="row">
													<div class="col-6 col-md">

														<!-- Heading -->
														<div class="mb-5 font-weight-bold">How to Recycle</div>

														<!-- Links -->
														<ul class="list-styled mb-6 mb-md-0 font-size-sm">
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">Basic Recycling Manual</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">Recycle or Not</a></li>
														</ul>

													</div>
													
													
													
													
													<div class="col-4 d-none d-lg-block">

														<!-- Card -->
														<div class="card">

															<!-- Image -->
															<img class="card-img"
																src=" /resources/assets/img/recycling_menu.jpg"
																alt="...">

														

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</li>
					
					
					<li class="nav-item dropdown position-static">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Plastic Project</a> <!-- Menu -->
						<div class="dropdown-menu w-100">
								<!-- Tab content -->
							<div class="card card-lg">
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade show active" id="navTab">
											<div class="container">
												<div class="row">
													<div class="col-6 col-md">

														<!-- Heading -->
														<div class="mb-5 font-weight-bold">Plastic Project</div>

														<!-- Links -->
														<ul class="list-styled mb-6 mb-md-0 font-size-sm">
															<li class="list-styled-item"><a
																class="list-styled-link" href="/tkawy/main">플라스틱 프로젝트 소개</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">참여하기</a></li>
														</ul>

													</div>
													
													
													
													
													<div class="col-4 d-none d-lg-block">

														<!-- Card -->
														<div class="card">

															<!-- Image -->
															<img class="card-img"
																src=" /resources/assets/img/recycling_menu.jpg"
																alt="...">

														

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</li>
					<li class="nav-item dropdown position-static">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Auction</a> <!-- Menu -->
						<div class="dropdown-menu w-100">
								<!-- Tab content -->
							<div class="card card-lg">
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade show active" id="navTab">
											<div class="container">
												<div class="row">
													<div class="col-6 col-md">

														<!-- Heading -->
														<div class="mb-5 font-weight-bold">Auction</div>

														<!-- Links -->
														<ul class="list-styled mb-6 mb-md-0 font-size-sm">
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">Imperfect, I'm PERFECT!</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="/auc/now">경매 참여하기</a></li>
														</ul>

													</div>
													
													
													
													
													<div class="col-4 d-none d-lg-block">

														<!-- Card -->
														<div class="card">

															<!-- Image -->
															<img class="card-img"
																src=" /resources/assets/img/auction_menu.jpg"
																alt="...">

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</li>
					
								<li class="nav-item dropdown position-static">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Board</a> <!-- Menu -->
						<div class="dropdown-menu w-100">
								<!-- Tab content -->
							<div class="card card-lg">
								<div class="card-body">
									<div class="tab-content">
										<div class="tab-pane fade show active" id="navTab">
											<div class="container">
												<div class="row">
													<div class="col-6 col-md">

														<!-- Heading -->
														<div class="mb-5 font-weight-bold">Board</div>

														<!-- Links -->
														<ul class="list-styled mb-6 mb-md-0 font-size-sm">
															<li class="list-styled-item"><a
																class="list-styled-link" href="#">Notice</a></li>
															<li class="list-styled-item"><a
																class="list-styled-link" href="/board/questionsList">큐앤에이</a></li>
														</ul>

													</div>
													
													
													
													
													<div class="col-4 d-none d-lg-block">

														<!-- Card -->
														<div class="card">

															<!-- Image -->
															<img class="card-img"
																src=" /resources/assets/img/auction_menu.jpg"
																alt="...">

														</div>

													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</li>
				
				
				
				
				
				
				
				</ul>

				<!-- Nav -->
				<ul class="navbar-nav flex-row" style="font-size:0.8rem;">
					
					<li class="nav-item ml-lg-n4"><a class="nav-link"
						href="/member/register"><i class="fas fa-sign-in-alt"></i> SignUp
					</a></li>
					<li class="nav-item ml-lg-n4"><a class="nav-link"
						href="/mypages"> <i class="fe fe-user"></i> MyPages
					</a></li>
					<li class="nav-item ml-lg-n4"><a class="nav-link"
						href="/admin/main"><i class="fas fa-cog"></i>
					</a></li>
					
					
				</ul>

			</div>

		</div>
	</nav>