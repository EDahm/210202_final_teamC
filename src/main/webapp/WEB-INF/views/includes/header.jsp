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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


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
					<li class="nav-item dropdown">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">About</a> <!-- Menu -->
						<div class="dropdown-menu">
							<div class="card card-lg">
								<div class="card-body">
									<ul class="list-styled font-size-sm">
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index.html">Default</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-classic.html">Classic</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-fashion.html">Fashion</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-boxed.html">Boxed</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-simple.html">Simple</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-asymmetric.html">Asymmetric</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-sidenav.html">Sidenav</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/index-landing.html">Landing</a></li>
									</ul>
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
					<li class="nav-item dropdown">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Auction</a> <!-- Menu -->
						<div class="dropdown-menu">
							<div class="card card-lg">
								<div class="card-body">
									<ul class="list-styled font-size-sm">
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/about.html">About</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/contact-us.html">Contact Us</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/store-locator.html">Store Locator</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/faq.html">FAQ</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/coming-soon.html">Coming Soon</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/404.html">404</a></li>
									</ul>
								</div>
							</div>
						</div>


					</li>
					<li class="nav-item dropdown">
						<!-- Toggle --> <a class="nav-link" data-toggle="dropdown"
						href="#">Board</a> <!-- Menu -->
						<div class="dropdown-menu">
							<div class="card card-lg">
								<div class="card-body">
									<ul class="list-styled font-size-sm">
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/blog.html">Blog</a></li>
										<li class="list-styled-item"><a class="list-styled-link"
											href=" /resources/blog-post.html">Blog Post</a></li>
									</ul>
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