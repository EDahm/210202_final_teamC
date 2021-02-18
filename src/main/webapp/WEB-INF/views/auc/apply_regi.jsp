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
		<h1 class="page-header">경매 신청하기</h1>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 신청
			</div>
			<!-- /.panel-heading -->
			
			<form role="form" action="/auc/apply_regi" method="post">
				<div>
					<label>업체번호</label>
					<input class="form-control" name="c_num">
				</div>
				<div>
					<label>물품명</label>
					<input class="form-control" name="aa_item_nm">
				</div>
				<div>
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc">
				</div>
				<div>
					<label>중량</label>
					<input class="form-control" name="aa_weight">
				</div>
				<div>
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn">
				</div>
				<div>
					<label>희망기간</label><!-- datepicker 써야함 -->
					<input class="form-control" name="aa_hope_prd">
				</div>
				
				<button type="submit">신청</button>
				<button type="reset">리셋</button>				
			</form>
		</div>
	</div>
</div>
				
</body>
</html>