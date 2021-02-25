<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

	<!-- SLIDER -->
	<section>
		<div data-flickity='{"prevNextButtons": true, "fade": true}'>

			<!-- Item -->
			<div class="w-100 bg-cover"
				style="background-image: url(/resources/assets/img/main1.jpg);">
				<div class="container d-flex flex-column">
					<div class="row align-items-center py-12"
						style="min-height: 550px;">
						<div class="col-12 col-md-6 col-lg-5 col-xl-4 offset-md-1">

							<!-- Heading -->
							<!-- <h1></h1> -->

							<!-- Heading -->
							<h4 class="display-1 text-primary">What is ZeroWaste?</h4>

							<!-- Heading -->
							<h5 class="mt-n4 mb-8">지구를 살리는 제로웨이스트를 소개합니다</h5>

							<!-- Button -->
							<a class="btn btn-dark" href="/about_zerowaste"> With us! <i
								class="fe fe-arrow-right ml-2"></i>
							</a>

						</div>
					</div>
				</div>
			</div>

			<!-- Item -->
			<div class="w-100 bg-cover"
				style="background-image: url(/resources/assets/img/main2.jpg);">
				<div class="container d-flex flex-column">
					<div class="row align-items-center justify-content-end py-12"
						style="min-height: 550px;">
						<div class="col-12 col-md-6 col-lg-5 col-xl-4 offset-md-n1"><a href = "#" style="cursor : point;">

							<!-- Heading -->
							<h1 class="mb-5">플라스틱 빨대, 아직도 재활용 하시나요?</h1>

							<!-- Text -->
							<p class="mb-8 font-size-lg text-gray-500">햇반 용기, 플라스틱 빨대, 영수증 종이 등 재활용 여부 알아보기</p>
							
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Item -->
			<div class="w-100 bg-cover"
				style="background-image: url(/resources/assets/img/main3.jpg);">
				<div class="container d-flex flex-column">
					<div class="row align-items-center justify-content-end py-12"
						style="min-height: 550px;">
						<div class="col-12 col-md-6 col-lg-5 col-xl-4 offset-md-n1">

							<!-- Heading -->
							<h1 class="mb-5">일반쓰레기...? 아니 이건 재활용 되는건가!?!?!?</h1>

							<!-- Text -->
							<p class="mb-8 font-size-lg text-gray-500">So called give,
								one whales tree seas dry place own day, winged tree created
								spirit.</p>

							<!-- Button -->
							<a class="btn btn-dark" href="shop.html"> Shop Now <i
								class="fe fe-arrow-right ml-2"></i>
							</a>

						</div>
					</div>
				</div>
			</div>

		</div>
	</section>


	<!-- FEATURES -->
	<section class="py-9">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-6 col-lg-3">

					<!-- Item -->
					<div class="d-flex mb-6 mb-lg-0">

						<!-- Icon -->
						<i class="fe fe-truck font-size-lg text-primary"></i>

						<!-- Body -->
						<div class="ml-6">

							<!-- Heading -->
							<h6 class="heading-xxs mb-1">Free shipping</h6>

							<!-- Text -->
							<p class="mb-0 font-size-sm text-muted">From all orders over
								$100</p>

						</div>

					</div>

				</div>
				<div class="col-12 col-md-6 col-lg-3">

					<!-- Item -->
					<div class="d-flex mb-6 mb-lg-0">

						<!-- Icon -->
						<i class="fe fe-repeat font-size-lg text-primary"></i>

						<!-- Body -->
						<div class="ml-6">

							<!-- Heading -->
							<h6 class="mb-1 heading-xxs">Free returns</h6>

							<!-- Text -->
							<p class="mb-0 font-size-sm text-muted">Return money within
								30 days</p>

						</div>

					</div>

				</div>
				<div class="col-12 col-md-6 col-lg-3">

					<!-- Item -->
					<div class="d-flex mb-6 mb-md-0">

						<!-- Icon -->
						<i class="fe fe-lock font-size-lg text-primary"></i>

						<!-- Body -->
						<div class="ml-6">

							<!-- Heading -->
							<h6 class="mb-1 heading-xxs">Secure shopping</h6>

							<!-- Text -->
							<p class="mb-0 font-size-sm text-muted">You're in safe hands
							</p>

						</div>

					</div>

				</div>
				<div class="col-12 col-md-6 col-lg-3">

					<!-- Item -->
					<div class="d-flex">

						<!-- Icon -->
						<i class="fe fe-tag font-size-lg text-primary"></i>

						<!-- Body -->
						<div class="ml-6">

							<!-- Heading -->
							<h6 class="mb-1 heading-xxs">Over 10,000 Styles</h6>

							<!-- Text -->
							<p class="mb-0 font-size-sm text-muted">We have everything
								you need</p>

						</div>

					</div>

				</div>
			</div>
		</div>
	</section>

	
	<%@include file="includes/footer.jsp"%>
	