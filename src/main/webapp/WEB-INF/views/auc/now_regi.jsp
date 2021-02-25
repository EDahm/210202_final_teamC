<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

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
					<input class="form-control" name="aa_bno">
				</div>
				<div>
					<label>시작가</label>
					<input class="form-control" name="a_versifier">
				</div>
				<div>
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc">
				</div>
				<div>
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc">
				</div>
				<div>
					<label>경매상태</label>
					<input name="state" type="hidden">
					<select id="a_state" name="a_state">
						<option value="준비중" selected="selected">준비중</option>
						<option value="경매종료">종료</option>
						<option value="진행중">진행중</option>
						<option value="유찰">유찰</option>
					</select>
				</div>
				<div>
					<label>진행기간</label>
					<input type="date" name="a_prgrs_prd">
				</div>
				
				<button type="submit">신청</button>
				<button type="reset">리셋</button>				
			</form>
		</div>
	</div>
</div>
	
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	$('select[name=a_state]').change(function(){
		if($(this).val()=="준비중"){
			$('#state').val("준비중");
		} else {
			$('#state').val($(this).val());
		}
		
	});
});
</script>			

<%@include file="../includes/footer.jsp"%>