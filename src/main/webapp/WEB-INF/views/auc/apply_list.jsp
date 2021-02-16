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
		<h1 class="page-header">경매 신청 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				신청 리스트
				<button id='regBtn' type="button" class="btn btn-xs pull-right">새
					경매 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#신청번호</th> 
							<th>업체번호</th>
							<th>물품명</th>
							<th>희망기간</th>
						</tr>
					</thead>

					<c:forEach items="${apply_list}" var="apply">
						<tr>
							<td><c:out value="${apply.aa_bno}" /></td>
							<td><c:out value="${apply.c_num}" /></td>
							<td><a href='/auc/apply_get?aa_bno=<c:out value="${apply.aa_bno}"/>'>
									<c:out value="${apply.aa_item_nm}" /></a></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${apply.aa_hope_prd}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
	
	<!--  모달 -->			
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">진행 등록 완료</h4>
						</div>
						<div class="modal-body">등록이 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								Changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->

			</div>
			<!--  /.modal -->
			
<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	function checkModal(result){
		if(result === ''){
			return;
		}
		if(parseInt(result)>0){
			$(".modal-body").html("게시글"+parseInt(result)+ " 경매가 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
		}
});
</script>	
</body>
</html>