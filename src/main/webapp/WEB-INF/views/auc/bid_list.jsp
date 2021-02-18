<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">입찰 리스트</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				입찰 리스트				
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>경매번호</th> 
							<th>회원번호</th>
							<th>입찰가격</th>
							<th>입찰시간</th>
							<th>입찰상태</th>
							<th>삭제하기</th>
						</tr>
					</thead>

					<c:forEach items="${bid_list}" var="bid">
						<tr>
							<td><c:out value="${bid.a_bno}" /></td>
							<td><c:out value="${bid.m_num}" /></td>
							<td><c:out value="${bid.b_bid_price}" /></td>
							<td><c:out value="${b_bid_time}" /></td>
							<td><c:out value="${b_bid_state}" /></td>
							<td><button id='delBtn' type="button" data-oper='bid_rem'> X </button></td>
						</tr>
					</c:forEach>
				</table>
								<div class='pull-right'>
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">PREVIOUS</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">NEXT</a></li>
						</c:if>
						
					
					</ul>
				</div>
				<!-- END PAGINATION -->
			</div>
		</div>
	</div>
</div>
			<form id='actionForm' action="/auc/bid_list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>	
<script type="text/javascript">
$(document).ready(function(){

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});	

	$("#delBtn").on("click",function(e){
		
		e.preventDefault();
		
		self.location = "/auc/now_regi"
	});
});
</script>	
</body>
</html>