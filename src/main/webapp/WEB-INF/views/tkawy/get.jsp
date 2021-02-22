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
		<h1>Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>

			<div>Board Read Page</div>
			<!-- /.panel-heading -->
			<div>

				<div>
					<label>예약번호</label> <input name='t_bno'
						value='<c:out value="${tkawy.t_bno }" />' readonly="readonly">
				</div>
				<div>
					<label>회원번호</label> <input name='m_num'
						value='<c:out value="${tkawy.m_num }" />' readonly="readonly">
				</div>
				<div>
					<label>예약일자</label> <input name='t_regdate'
						value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${tkawy.t_regdate }" />'
						readonly="readonly">
				</div>

				<div>
					<label>연락처</label> <input name='t_contact'
						value='<c:out value="${tkawy.t_contact }" />' readonly="readonly">
				</div>
				<div>
					<label>일반플라스틱</label> <input name='t_plastic'
						value='<c:out value="${tkawy.t_plastic }" />' readonly="readonly">
				</div>
				<div>
					<label>플라스틱병뚜껑</label> <input name='t_plastic_cap'
						value='<c:out value="${tkawy.t_plastic_cap }" />' readonly="readonly">
				</div>
				<div>
					<label>수거예정업체</label> <input name='t_vstng_cmpny'
						value='<c:out value="${tkawy.t_vstng_cmpny }" />' readonly="readonly">
				</div>
				<div>
					<label>수거예정일</label><input type="hidden">
					<fmt:parseDate var="t_date_vist" value="${tkawy.t_date_vist}"
						pattern="yyyy-MM-dd" />
					<input name='t_date_vist'
						value='<fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_date_vist}" />'
						readonly="readonly">
				</div>
				<div>
					<label>수거완료일</label><input type="hidden">
					<fmt:parseDate var="t_done_date" value="${tkawy.t_done_date}"
						pattern="yyyy-MM-dd" />
					<input name='t_done_date'
						value='<fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_done_date}" />'
						readonly="readonly">
				</div>
				<div>
					<label>진행상태</label> <input name='t_progress'
						value='<c:out value="${tkawy.t_progress }" />' readonly="readonly">
				</div>
				
				
				
				<button data-oper='modify'>Modify</button>
				<button data-oper='list'>List</button>

				<form id='operForm' action="/tkawy/modify" method="get">
					<input type='hidden' id='t_bno' name='t_bno'
						value='<c:out value="${tkawy.t_bno }"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
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

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/tkawy/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#t_bno").remove();
			operForm.attr("action", "/tkawy/list")
			operForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>

