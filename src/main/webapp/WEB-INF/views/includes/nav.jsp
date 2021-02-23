<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!-- 관리자페이지 옆 nav -->
<!-- CONTENT -->
<div class="container-fluid">
	<div class="row">
		<div class="col-12 col-md-4 col-lg-3 col-xl-2">

			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-md navbar-light sticky-left mx-n4 mx-md-0 py-3 py-md-0 px-md-0 @@classList">

				<!-- Breadcrumb -->
				<ol class="breadcrumb d-md-none mb-0 font-size-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/resources/docs/getting-started.html">Docs</a></li>
					<li class="breadcrumb-item active">@@title</li>
				</ol>

				<!-- Toggler -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#docsCollapse" aria-controls="docsCollapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Collapse -->
				<div class="collapse navbar-collapse" id="docsCollapse">
					<nav class="py-3 py-md-10 px-md-8">

						<!-- Heading -->
						<p class="mb-5 font-size-xxs font-weight-bold text-uppercase">
							회원관리</p>

						<!-- Links -->
						<ul class="list-styled">
							<li class="list-styled-item"><a class="list-styled-link"
								href="/member/list">일반회원</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">업체회원</a></li>
						</ul>

						<!-- Heading -->
						<p class="mt-7 mb-5 font-size-xxs font-weight-bold text-uppercase">
							수거예약관리</p>

						<!-- Links -->
						<ul class="list-styled">
							<li class="list-styled-item"><a class="list-styled-link"
								href="/tkawy/list">수거내역</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/store/list">수거진행업체</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/store/list2">수거정지업체</a></li>
						</ul>

						<!-- Heading -->
						<p class="mt-7 mb-5 font-size-xxs font-weight-bold text-uppercase">
							경매관리</p>

						<!-- Links -->
						<ul class="list-styled">
							<li class="list-styled-item"><a class="list-styled-link"
								href="/auc/now_list">진행중인 경매관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/auc/bid_list">입찰 관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/auc/apply_list">경매신청관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/auc/ship_list">배송관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="/auc/com_list">경매업체관리</a></li>

						</ul>

						<!-- Heading -->
						<p class="mt-7 mb-5 font-size-xxs font-weight-bold text-uppercase">
							게시판 관리</p>

						<!-- Links -->
						<ul class="list-styled">
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">공지사항</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">재활용 Q&A</a></li>

						</ul>


					</nav>
				</div>

			</nav>

		</div>
		<!-- nav 끝-->