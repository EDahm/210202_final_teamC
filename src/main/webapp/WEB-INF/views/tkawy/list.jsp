<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>


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
								href="/auc/now_list">진행중인 경매관리</a></li>
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

		<div class="col-12 col-md-8 col-lg-9 col-xl-10">
			<section class="px-md-10 py-10">
				<!-- 여기 section사이에 컨텐츠  넣기 -->


				<div>
					Board List Page
					<button id='regBtn' type="button">Register New Board</button>
				</div>
				<!-- /.panel-heading -->
				<div>
					<table>
						<thead>
							<tr>
								<th>예약번호</th>
								<th>회원번호</th>
								<th>예약일자</th>
								<th>연락처</th>
								<th>일반플라스틱</th>
								<th>플라스틱병뚜껑</th>
								<th>수거예약업체</th>
								<th>수거예약일</th>
								<th>수거완료일</th>
								<th>진행상태</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="tkawy">
							<tr>
								<td><a class='move' href='<c:out value="${tkawy.t_bno}"/>'><c:out
											value="${tkawy.t_bno}" /></a></td>
								<td><c:out value="${tkawy.m_num}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${tkawy.t_regdate}" /></td>
								<td><c:out value="${tkawy.t_contact}" /></td>
								<td><c:out value="${tkawy.t_plastic}" /></td>
								<td><c:out value="${tkawy.t_plastic_cap}" /></td>
								<td><c:out value="${tkawy.t_vstng_cmpny}" /></td>
								<td><input type="hidden"> <fmt:parseDate
										var="t_date_vist" value="${tkawy.t_date_vist}"
										pattern="yyyy-MM-dd" /> <fmt:formatDate pattern="yyyy-MM-dd"
										value="${t_date_vist}" /></td>
								<td><input type="hidden"> <fmt:parseDate
										var="t_done_date" value="${tkawy.t_done_date}"
										pattern="yyyy-MM-dd" /> <fmt:formatDate pattern="yyyy-MM-dd"
										value="${t_done_date}" /></td>
								<td><c:out value="${tkawy.t_progress}" /></td>
							</tr>
						</c:forEach>

					</table>

					<div>
						<div>

							<form id='searchForm' action="/tkawy/list" method='get'>
								<select name='type'>
									<option value=""
										<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>예약번호</option>
									<option value="M"
										<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>회원번호</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>연락처</option>
									<option value="V"
										<c:out value="${pageMaker.cri.type eq 'V'?'selected':''}"/>>수거예정업체</option>
									<option value="P"
										<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>진행상태</option>
								</select> <input type='text' name='keyword'
									value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
									type='hidden' name='pageNum'
									value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
									type='hidden' name='amount'
									value='<c:out value="${pageMaker.cri.amount}"/>' />
								<button>Search</button>
							</form>
						</div>
					</div>


					<div>
						<ul>

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>

						</ul>
					</div>
					<!-- end Pagination -->

					<form id='actionForm' action="/tkawy/list" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${pageMaker.cri.type }"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword }"/>'>
					</form>



				</div>

				<!-- 여기 전까지 사이에 컨텐츠 넣기 -->
			</section>
		</div>
	</div>
</div>





<script type="text/javascript">
	$(document)
			.ready(
					function() {

						// 상단 등록 버튼(Register New Board) 처리
						$("#regBtn").on("click", function() {

							self.location = "/tkawy/register";

						});

						// 312p 추가
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						// 312p 끝

						// 315p 추가
						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='t_bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/tkawy/modify");
											actionForm.submit();

										});

						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();
								});

					});
</script>


<%@include file="../includes/footer.jsp"%>