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
		<h1 class="page-header">경매 진행 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 진행 상황
			</div>
			<!-- /.panel-heading -->
			
			<div>
				<form role="form" action="/auc/now_mod" method="post">
				
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
				<div>
					<label>경매번호</label>
					<input class="form-control" name="a_bno" value='<c:out value="${nowlist.a_bno}"/>' readonly="readonly">
				</div>
				<div>
					<label>신청번호</label>
					<input class="form-control" name="aa_bno" value='<c:out value="${nowlist.aa_bno}"/>' readonly="readonly">
				</div>
				<div>
					<label>시작가</label>
					<input class="form-control" name="a_versifier" value='<c:out value="${nowlist.a_versifier}"/>'>
				</div>
				<div>
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc" value='<c:out value="${nowlist.a_crnt_prc}"/>' >
				</div>
				<div>
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc" value='<c:out value="${nowlist.a_wnng_prc}"/>' >
				</div>
				<div>
					<label>경매상태</label>
					<select name="a_state">
						<option>준비중</option>
						<option>종료</option>
						<option>진행중</option>
						<option>유찰</option>
					</select>
				</div>
				<div>
					<label>진행기간</label> <!-- datepicker님 도와주세요 -->
					<input class="form-control" name="a_prgrs_prd" value='<c:out value="${nowlist.a_prgrs_prd}"/>'>
				</div>
				<button type="submit" data-oper='now_mod'>수정</button>
				<button type="submit" data-oper='now_rem'>삭제</button>
				<button type="submit" data-oper='now_list'>목록</button>
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
		
		if(operation === 'now_rem'){
			formObj.attr("action","/auc/now_rem");
		} else if(operation === 'now_list'){
			formObj.attr("action", "/auc/now_list").attr("method", "get");
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