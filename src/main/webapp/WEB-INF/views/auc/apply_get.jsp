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
				경매 신청
			</div>
			<!-- /.panel-heading -->
			
			<div>
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
					<input class="form-control" name="aa_item_nm" value='<c:out value="${applyget.aa_item_nm}"/>' readonly="readonly">
				</div>
				<div>
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc" value='<c:out value="${applyget.aa_markt_prc}"/>'readonly="readonly">
				</div>
				<div>
					<label>중량</label>
					<input class="form-control" name="aa_weight" value='<c:out value="${applyget.aa_weight}"/>'readonly="readonly">
				</div>
				<div>
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn" value='<c:out value="${applyget.aa_cntry_orgn}"/>'readonly="readonly">
				</div>
				<div>
					<label>희망기간</label><!-- datepicker 써야함 -->
					<input class="form-control" name="aa_hope_prd" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${applyget.aa_hope_prd}"/>'readonly="readonly">
				</div>
				<button data-oper='apply_mod' onclick="location.href='/auc/apply_mod?aa_bno=<c:out value="${applyget.aa_bno}"/>'">수정</button>
				<button data-oper='apply_list' onclick="location.href='/auc/apply_list'">목록</button>				
			</div>
		</div>
	</div>
</div>
				
</body>
</html>