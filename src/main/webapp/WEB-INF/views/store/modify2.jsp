<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



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
								href="#">메인경매관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">경매신청목록</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">배송관리</a></li>
							<li class="list-styled-item"><a class="list-styled-link"
								href="#">경매업체</a></li>

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

		<div class="col-12 col-md-8 col-lg-9 col-xl-10">
			<section class="px-md-10 py-10">
				<!-- 여기 section사이에 컨텐츠  넣기 -->


				<div>
					<div>
						<h1>Board Modify</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div>
					<div>
						<div>

							<div>Board Modify Page</div>
							<!-- /.panel-heading -->
							<div>

								<form role="form" action="/store/modify" method="post">
									<input type='hidden' name='pageNum'
										value='<c:out value="${cri.pageNum}"/>'> <input
										type='hidden' name='amount'
										value='<c:out value="${cri.amount}"/>'> <input
										type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
									<input type='hidden' name='keyword'
										value='<c:out value="${cri.keyword}"/>'>

									<div>
										<label>업체명</label> <input name='t_vstng_cmpny'
											value='<c:out value="${store.t_vstng_cmpny }" />'
											readonly="readonly">
									</div>
									<div>
										<label>업체주소</label> <input name='s_address'
											value='<c:out value="${store.s_address }" />'>
									</div>
									<div>
										<label>연락처</label> <input name='s_contact'
											value='<c:out value="${store.s_contact }" />'>
									</div>
									<div>
										<label>운영시간</label> <input name='s_biz_h'
											value='<c:out value="${store.s_biz_h }" />'
											readonly="readonly">
									</div>
									<div>
										<label>수거진행상태</label>
											<select name = "s_progress">
											<option value="진행중">진행중</option>
											<option value="정지" selected>정지</option>
											</select>
									</div>

									<button type="submit" data-oper='modify'
										class="btn btn-default">수정하기</button>
									<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
									<button type="submit" data-oper='list' class="btn btn-info">List</button>

								</form>

							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.row -->

				<!-- 여기 전까지 사이에 컨텐츠 넣기 -->
			</section>
		</div>
	</div>
</div>






<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/store/remove");
			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/store/list2").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}
			formObj.submit();

		});
	});
</script>


<%@include file="../includes/footer.jsp"%>

