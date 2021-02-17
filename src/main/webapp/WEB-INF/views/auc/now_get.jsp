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
		<h1 class="page-header">경매 진행 조회</h1>
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
					<input class="form-control" name="a_cversifier" value='<c:out value="${nowlist.a_versifier}"/>' readonly="readonly">
				</div>
				<div>
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc" value='<c:out value="${nowlist.a_crnt_prc}"/>' readonly="readonly">
				</div>
				<div>
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc" value='<c:out value="${nowlist.a_wnng_prc}"/>' readonly="readonly">
				</div>
				<div>
					<label>경매상태</label>
					<input class="form-control" name="a_state" value='<c:out value="${nowlist.a_state}"/>' readonly="readonly">
				</div>
				<div>
					<label>진행기간</label>
					<input class="form-control" name="a_prgrs_prd" value='<c:out value="${nowlist.a_prgrs_prd}"/>' readonly="readonly">
				</div>
				<button data-oper='now_mod' onclick="location.href='/auc/now_mod?a_bno=<c:out value="${nowlist.a_bno}"/>'">수정</button>
				<button data-oper='now_list' onclick="location.href='/auc/now_list'">목록</button>				
			</div>
		</div>
	</div>
</div>
				
</body>
</html>