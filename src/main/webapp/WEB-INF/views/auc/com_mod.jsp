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
		<h1 class="page-header">업체 정보 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				업체 정보 수정
			</div>
			<!-- /.panel-heading -->
			
			<div>
			<form role="form" action="/auc/com_mod" method="post">
				<!-- add -->
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>	
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	
				<div>
					<label>업체번호</label>
					<input class="form-control" name="c_num" value='<c:out value="${comget.c_num}"/>' readonly="readonly">
				</div>
				<div>
					<label>업체명</label>
					<input class="form-control" name="c_name" value='<c:out value="${comget.c_name}"/>'>
				</div>
				<div>
					<label>이메일</label>
					<input class="form-control" name="c_email" value='<c:out value="${comget.c_email}"/>'>
				</div>
				<div>
					<label>주소</label>
					<input class="form-control" name="c_address" value='<c:out value="${comget.c_address}"/>'>
				</div>
				<div>
					<label>연락처</label>
					<input class="form-control" name="c_contact" value='<c:out value="${comget.c_contact}"/>'>
				</div>
				<div>
					<label>업종</label>
					<input class="form-control" name="c_sector" value='<c:out value="${comget.c_sector}"/>'>
				</div>
				<button type="submit" data-oper='com_mod'>수정</button>
				<button type="submit" data-oper='com_rem'>삭제</button>
				<button type="submit" data-oper='com_list'>목록</button>
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
		
		if(operation === 'com_rem'){
			formObj.attr("action","/auc/com_rem");
		} else if(operation === 'com_list'){
			formObj.attr("action", "/auc/com_list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
	});
});
</script>							
</body>
</html>