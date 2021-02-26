<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>


 <section class="pt-7 pb-12" style="width: 70%;">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
			<h3 class="mb-10">
				경매 진행 등록
			</h3>
		  </div>
		 </div>
			
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
			<form role="form" action="/auc/now_regi" method="post">
				<div class="form-group">
					<label>신청번호</label>
					<input class="form-control" name="aa_bno">
					</div>
				<div class="form-group">
					<label>시작가</label>
					<input class="form-control" name="a_versifier">
				</div>
				<div class="form-group">
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc">
				</div>
				<div class="form-group">
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc">
				</div>
				<div class="form-group">
					<label>경매상태</label>
					<input name="state" type="hidden">
					<select class="custom-select" id="a_state" name="a_state">
						<option value="준비중" selected="selected">준비중</option>
						<option value="경매종료">종료</option>
						<option value="진행중">진행중</option>
						<option value="유찰">유찰</option>
					</select>
				</div>
				<div class="form-group">
					<label>진행기간</label>
					<input type="date" class="form-control" name="a_prgrs_prd">
				</div>
				
				<button type="submit" class="btn btn-success btn-xs" >신청</button>
				<button type="reset" class="btn btn-outline-success btn-xs">리셋</button>				
			</form>
		</div>
	</div>
</div>
</section>
	
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