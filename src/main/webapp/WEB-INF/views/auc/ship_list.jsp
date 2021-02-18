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
		<h1 class="page-header">배송 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				배송 리스트
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>경매번호</th> 
							<th>업체번호</th>
							<th>배송현황</th>
						</tr>
					</thead>

					<c:forEach items="${ship_list}" var="ship">
						<tr>
							<td><a class='moveShip' href='<c:out value="${ship.a_bno}"/>'>
									<c:out value="${ship.a_bno}" /></a></td>
							<td><c:out value="${ship.c_num}" /></td>
							<td><c:out value="${ship.s_shpng_stts}" /></td>
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
			<form id='actionFormShip' action="/auc/ship_list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
			</form>	
			
<script type="text/javascript">
$(document).ready(function(){ 

var actionForm = $("#actionFormShip");

$(".paginate_button a").on("click", function(e){
	
	e.preventDefault();
	
	console.log('click');
	
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
	});

$(".moveShip").on("click", function(e){
	
	e.preventDefault();
	actionForm.append("<input type='hidden' name='a_bno' value='"+
			$(this).attr("href")+"'>");
					actionForm.attr("action","/auc/ship_get");
					actionForm.submit();
})

});

</script>		
</body>
</html>