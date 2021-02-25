<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
</head>


<!-- <style>
#board1{
border-top : 1px solid black;
border-bottom : 1px solid black;
}
.table th, .table td {
	border-bottom: 1px solid #444444;
}
</style> -->

<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h3 class="mb-10">QnA 게시판</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-3">
				<nav class="mb-10 mb-md-0">
					<div class="list-group list-group-sm list-group-strong list-group-flush-x">
						<a class="list-group-item list-group-item-action dropright-toggle "	href="#"> 공지사항 </a> 
						<a class="list-group-item list-group-item-action dropright-toggle "	href="/board/questionsList"> 게시판 </a>
					</div>
				</nav>
			</div>

			<div class="col-12 col-md-9 col-lg-8 offset-lg-1"
				style="margin-left: 3rem;">
				<table class="table table-bordered table-hover" id="board1"
					style="font-size: 0.8rem; margin-bottom: 0;">
					<thead>
						<tr style="text-align: center;">
							<th style="color: white;">.</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<c:forEach items="${questionsList}" var="board">
						<tr>
							<td><c:out value="${board.q_bno}" /></td>
							<!-- 조회하면 이동 시 페이지 처리 -->
							<td><a class='move' href='<c:out value="${board.q_bno}"/>'>
									<c:out value="${board.q_title}" /><b>[ <c:out value="${board.q_replyCnt}" /> ]</b></a></td>
							<td><c:out value="${board.q_ncnm}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.q_regdate}" /></td>
							<td><c:out value="${board.q_hits}" /></td> <!-- 조회수  -->
						</tr>
					</c:forEach>
				</table>
				<div style="display: flex; justify-content: flex-end;">
					<button id='regBtn' type="button" class="btn btn-gray-500 btn-lg"
						style="background: none; border: none; color: #44A379;">
						<i class="fas fa-pencil-alt"></i> 글쓰기
					</button>
				</div>


				<!-- <화면에서 검색 조건 처리> -->
				<div class="col-auto">
					<form id='searchForm' style="text-align: center;"
						action="/board/questionsList" method='get'>
						<select name='type'>
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
								or 내용</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
								or 작성자</option>
							<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
								or 내용 or 작성자</option>
						</select> 
						<input type='text' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
							type='hidden' name='pageNum'
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class="btn btn-default" style="padding: 0.5rem;">
							<i class="fas fa-search"></i> 검색
						</button>
					</form>

					<!-- Pagination -->

					<nav class="d-flex justify-content-center">
						<ul class="pagination pagination-sm text-gray-400">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link page-link-arrow"
									href="${pageMaker.startPage -1}"> <i
										class="fa fa-caret-left"></i>
								</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="page-item  ${pageMaker.cri.pageNum == num ? "active":""} ">
									<a class="page-link" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link page-link-arrow"
									href="${pageMaker.endPage +1}"> <i
										class="fa fa-caret-right"></i>
								</a></li>
							</c:if>
						</ul>
					</nav>
					<!-- end Pagination -->

					<form id='actionForm' action="/board/questionsList" method='get'>
						<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
						<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
						<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
						<input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>



<script type="text/javascript">
$(document).ready(function() {

 	$('#regBtn').click(function() {

		$(location).attr('href','questionsRegister');

	});
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e) {
		e.preventDefault();
		actionForm.append("<input type='hidden' name='q_bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/board/questionsGet");
		actionForm.submit();
	});
	
	
	var searchForm = $("#searchForm");
    $("#searchForm button").on("click", function(e) {

		if (!searchForm.find("option:selected").val()) {
			
		   alert("검색종류를 선택하세요");
		   return false;
		   
		}
		
		if (!searchForm.find("input[name='keyword']").val()) {
			
		   alert("키워드를 입력하세요");
		   return false;
		   
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>