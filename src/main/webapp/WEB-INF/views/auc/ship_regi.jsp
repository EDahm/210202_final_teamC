<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h2 class="page-header">얼쑤좋다!</h2>
		<h1>구매가 완료 되었습니다.</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				구매해 주셔서 감사합니다.
			</div>
			<div>
			<button type="button" id="buyItem"> 결제하기 </button>
			<button type="button" id="buyItem"> 배송정보 입력 </button>
			</div>
			<!-- /.panel-heading -->
			
			<form role="form" action="/auc/ship_regi" method="post">
				<div>
					<label>경매번호</label>
					<input type="hidden" class="form-control" name="a_bno" value='<c:out value="${now.a_bno}"/>'>
				</div>
				<div>
					<label>업체번호</label>
					<input type="hidden" class="form-control" name="c_num" value='<c:out value="${apply.c_num}"/>'>
				</div>
				<div>
					<label>회원번호</label>
					<input class="form-control" name="m_num">
				</div>
				<div>
					<label>배송지</label>
					<input class="form-control" name="s_shpng_addr">
				</div>
				<div>
					<label>배송연락처</label>
					<input class="form-control" name="s_shpng_cntct">
				</div>
					<input type="hidden" name="s_shpng_stts">
				
				<button type="submit">신청</button>
				<button type="reset">리셋</button>				
			</form>
		</div>
	</div>
</div>

</div>
</div>

<%@include file="../includes/footer.jsp"%>