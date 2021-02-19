<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">업체 정보 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				업체 정보
			</div>
			<!-- /.panel-heading -->
			
			<div>
				<div>
					<label>업체번호</label>
					<input class="form-control" name="aa_bno" value='<c:out value="${comget.c_num}"/>' readonly="readonly">
				</div>
				<div>
					<label>업체명</label>
					<input class="form-control" name="c_num" value='<c:out value="${comget.c_name}"/>' readonly="readonly">
				</div>
				<div>
					<label>이메일</label>
					<input class="form-control" name="aa_item_nm" value='<c:out value="${comget.c_email}"/>' readonly="readonly">
				</div>
				<div>
					<label>주소</label>
					<input class="form-control" name="aa_markt_prc" value='<c:out value="${comget.c_address}"/>'readonly="readonly">
				</div>
				<div>
					<label>연락처</label>
					<input class="form-control" name="aa_weight" value='<c:out value="${comget.c_contact}"/>'readonly="readonly">
				</div>
				<div>
					<label>업종</label>
					<input class="form-control" name="aa_cntry_orgn" value='<c:out value="${comget.c_sector}"/>'readonly="readonly">
				</div>
				<button data-oper='com_mod' onclick="location.href='/auc/com_mod?c_num=<c:out value="${comget.c_num}"/>'">수정</button>
				<button data-oper='com_list' onclick="location.href='/auc/com_list'">목록</button>				
			</div>
			<form id='operForm' action="/auc/com_mod" method= "get">
	<input type='hidden' id='c_num' value='<c:out value="${comget.c_num}"/>'>
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
    <input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
</form>	
		</div>
	</div>
</div>
		  <script type="text/javascript">
  	$(document).ready(function(){
  		var operForm = $("#operForm");
  		
  		$("button[data-oper='com_mod']").on("click",function(e){
  			
  			operForm.attr("action","/auc/com_mod").submit();
  			
  		});
  		
  		$("button[data-oper='com_list']").on("click",function(e){
  			
  			operForm.find("#c_num").remove();
  			operForm.attr("action","/auc/com_list")
  			operForm.submit();
  			
  		});
  	});
  </script>						
</body>
</html>