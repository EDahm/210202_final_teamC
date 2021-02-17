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
		<h1 class="page-header">경매 진행 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 신청
			</div>
			<!-- /.panel-heading -->
			
			<div>
			<form role="form" action="/auc/apply_mod" method="post">
				<div>
					<label>신청번호</label>
					<input class="form-control" name="aa_bno" value='<c:out value="${applyget.aa_bno}"/>' readonly="readonly">
				</div>
				<div>
					<label>업체번호</label>
					<input class="form-control" name="c_num" value='<c:out value="${applyget.c_num}"/>' readonly="readonly">
				</div>
				<div>
					<label>물품명</label>
					<input class="form-control" name="aa_item_nm" value='<c:out value="${applyget.aa_item_nm}"/>'>
				</div>
				<div>
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc" value='<c:out value="${applyget.aa_markt_prc}"/>'>
				</div>
				<div>
					<label>중량</label>
					<input class="form-control" name="aa_weight" value='<c:out value="${applyget.aa_weight}"/>'>
				</div>
				<div>
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn" value='<c:out value="${applyget.aa_cntry_orgn}"/>'>
				</div>
				<div>
					<label>희망기간</label><!-- datepicker 써야함 -->
					<input class="form-control" name="aa_hope_prd" value='<c:out value="${applyget.aa_hope_prd}"/>'>
				</div>
				<button type="submit" data-oper='apply_mod'>수정</button>
				<button type="submit" data-oper='apply_rem'>삭제</button>
				<button type="submit" data-oper='apply_list'>목록</button>
				</form>				
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'apply_rem'){
			formObj.attr("action","/auc/apply_rem");
		} else if(operation === 'apply_list'){
			self.location="/auc/apply_list";
			return;
		}
		formObj.submit();
	});
});
</script>				
</body>
</html>