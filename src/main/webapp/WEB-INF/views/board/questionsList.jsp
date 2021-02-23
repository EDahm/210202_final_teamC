<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@include file="../includes/header.jsp"%>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
</head>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">QnA List Page
			<button id='regBtn' type="button" class="btn btn-xs pull-right">새글 작성</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>게시글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<!-- <th>수정날짜</th> -->
							<!-- <th>비밀번호</th> -->
						</tr>
					</thead>

					<c:forEach items="${questionsList}" var="board">
						<tr>
							<td><c:out value="${board.q_bno}" /></td>
							<td><a class='move' href='<c:out value="${board.q_bno}"/>'>
							<c:out value="${board.q_title}" /><b>[  <c:out value="${board.q_replyCnt}" />  ]</b></a></td>
							<td><c:out value="${board.q_ncnm}" /></td>
							<td><c:out value="${board.q_regdate}" /></td>			
						</tr>
					</c:forEach>
				</table>

				<!-- <화면에서 검색 조건 처리> -->

				<form id='searchForm' action="/board/questionsList" method='get'>
					<select name='type'>
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />			   
				</form>

				<!-- Pagination -->
				<div class='pull-right'>
					<ul class="pagination">
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
							<li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end Pagination -->

				<form id='actionForm' action="/board/questionsList" method='get'>
					<input type='hidden' name='pageNum' value = '${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value = '${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value = '<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' value = '<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>

			</div>
<!-- 			/.panel-body -->
		</div>
<!-- 		/.panel -->
	</div>
<!-- 	/.col-lg-6 -->
</div>

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