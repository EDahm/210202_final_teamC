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
		<h1 class="page-header">경매 업체 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				업체 리스트
				<button id='regBtn' type="button" class="btn btn-xs pull-right">새
					업체 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#업체번호</th> 
							<th>업체명</th>
							<th>업종</th>
						</tr>
					</thead>

					<c:forEach items="${com_list}" var="company">
						<tr>
							<td><c:out value="${company.c_num}" /></td>
							<td><a class='move' href='<c:out value="${company.c_num}"/>'>
									<c:out value="${company.c_name}" /></a></td>
							<td><c:out value="${company.c_sector}" /></td>
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

			<form id='actionForm' action="/auc/com_list" method='get'>
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

	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='c_num' value='"+
				$(this).attr("href")+"'>");
						actionForm.attr("action","/auc/com_get");
						actionForm.submit();
	});

	});
</script>	
</body>
</html>