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
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 진행 등록
			</div>
			<!-- /.panel-heading -->
			
			<form role="form" action="/auc/now_regi" method="post">
				<div>
					<label>신청번호</label>
					<input class="form-control" name="c_num">
				</div>
				<div>
					<label>시작가</label>
					<input class="form-control" name="aa_item_nm">
				</div>
				<div>
					<label>현재가</label>
					<input class="form-control" name="aa_markt_prc">
				</div>
				<div>
					<label>바로 구매가격</label>
					<input class="form-control" name="aa_weight">
				</div>
				<div>
					<label>경매상태</label>
					<select name="aa_cntry_orgn">
						<option> 준비중 </option>
						<option> 진행중 </option>
						<option> 종료	 </option>
						<option> 유찰 </option>
					</select>
				</div>
				<div>
					<label>진행기간</label><!-- datepicker 써야함 -->
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