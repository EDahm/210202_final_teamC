<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>


<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 font-size-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/main">Main</a></li>
					<li class="breadcrumb-item active">마이페이지</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<!-- CONTENT -->
<section class="py-11">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-4 col-lg-3">

				<!-- Filters -->
				<form class="mb-10 mb-md-0">
					<ul class="nav nav-vertical" id="filterNav">
						<li class="nav-item">
							<!-- Toggle --> <a
							class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6"
							data-toggle="collapse" href="#categoryCollapse"> 내정보관리 </a> <!-- Collapse -->
							<div class="collapse show" id="categoryCollapse">
								<div class="form-group">
									<ul class="list-styled mb-0" id="productsNav" style = "font-size:0.9rem;">
										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 내정보조회 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 그린포인트 조회 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 회원탈퇴 </a></li>
									</ul>
								</div>
							</div>

						</li>


						<li class="nav-item">
							<!-- Toggle --> <a
							class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6"
							data-toggle="collapse" href="#categoryCollapse2"> 참여내역 </a> <!-- Collapse -->
							<div class="collapse" id="categoryCollapse2">
								<div class="form-group">
									<ul class="list-styled mb-0" id="productsNav" style = "font-size:0.9rem;">
										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 플라스틱 수거 예약내역 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 경매 참여내역 </a></li>
									</ul>
								</div>
							</div>

						</li>
					</ul>
				</form>

			</div>
			<div class="col-12 col-md-8 col-lg-9">


				기본정보 수정(연락처, 닉네임) 비밀번호 수정 ㅠㅠ

				<!-- Tags -->
				<div class="row mb-7">
					<div class="col-12">ㅇㅇ?</div>
				</div>


			</div>
		</div>
	</div>
</section>



<%@include file="includes/footer.jsp"%>
