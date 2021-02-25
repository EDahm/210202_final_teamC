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

				<!-- /.panel-heading -->
				<div>
				
				<div>
						<div>

							<form id='searchForm' action="/store/listforsearch" method='get'>
								<select name='type'>
									<option value="A"
										<c:out value="${pageMaker.cri.type eq 'A'?'selected':''}"/>>지역명</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>업체명</option>
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
					<table>
						<thead>
							<tr>
								<th>수거업체명</th>
								<th>업체주소</th>
							</tr>
						</thead>

						<c:forEach items="${listforsearch}" var="store">
							<tr>
								<td><button style="border:none; background: none;"><c:out value="${store.t_vstng_cmpny}" /></button></td>
								<td><c:out value="${store.s_address}" /></td>
							</tr>
						</c:forEach>

					</table>

					


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

					<form id='actionForm' action="/store/listforsearch" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${pageMaker.cri.type }"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword }"/>'>
					</form>



				</div>

	



<script type="text/javascript">
	$(document)
			.ready(
					function() {


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


	<!-- JAVASCRIPT -->
	<!-- Libs JS -->
	<script src="/resources/node_modules/jquery.min.js"></script>
	<script src="/resources/node_modules/jquery.fancybox.min.js"></script>
	<script src="/resources/node_modules/bootstrap.bundle.min.js"></script>
	<script src="/resources/node_modules/flickity.pkgd.min.js"></script>
	<script src="/resources/node_modules/highlight.pack.min.js"></script>
	<script src="/resources/node_modules/jarallax.min.js"></script>
	<script src="/resources/node_modules/list.min.js"></script>
	<script src="/resources/node_modules/simplebar.min.js"></script>
	<script src="/resources/node_modules/smooth-scroll.min.js"></script>
	<script src="/resources/assets/libs/flickity-fade/flickity-fade.js"></script>

	<!-- Map (replace the API key to enable) -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQOOsu7TTfYKr4dn07EmexYx4P0PJcYLs"></script>

	<!-- Theme JS -->
	<!-- build:js /resources/assets/js/theme.min.js -->
	<script src="/resources/assets/js/card.js"></script>
	<script src="/resources/assets/js/collapse.js"></script>
	<script src="/resources/assets/js/countdown.js"></script>
	<script src="/resources/assets/js/dropdown.js"></script>
	<script src="/resources/assets/js/flickity.js"></script>
	<script src="/resources/assets/js/form.js"></script>
	<script src="/resources/assets/js/highlight.js"></script>
	<script src="/resources/assets/js/img-comp.js"></script>
	<script src="/resources/assets/js/list.js"></script>
	<script src="/resources/assets/js/map.js"></script>
	<script src="/resources/assets/js/navbar.js"></script>
	<script src="/resources/assets/js/popover.js"></script>
	<script src="/resources/assets/js/rating.js"></script>
	<script src="/resources/assets/js/simplebar.js"></script>
	<script src="/resources/assets/js/smooth-scroll.js"></script>
	<script src="/resources/assets/js/theme.js"></script>
	<script src="/resources/assets/js/tooltip.js"></script>
	<script src="/resources/assets/js/vote.js"></script>
	<!-- endbuild -->

</body>
</html>