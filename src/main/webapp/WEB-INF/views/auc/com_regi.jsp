<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">업체 정보 등록</h1>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				업체 정보 등록
			</div>
			<!-- /.panel-heading -->
			
			<div>
			<form role="form" action="/auc/com_regi" method="post">
				<div>
					<label>업체명</label>
					<input name="c_name">
				</div>
				<div>
					<label>이메일</label>
					<input name="c_email">
				</div>
				<div>
					<label>주소</label>
					<input name="c_address">
				</div>
				<div>
					<label>연락처</label>
					<input name="c_contact">
				</div>
				<div>
					<label>업종</label>
					<input name="c_sector">
				</div>
				<button type="submit">신청</button>
				<button type="reset">리셋</button>
			</form>				
			</div>
		</div>
	</div>
</div>

</div>
</div>
	
<%@include file="../includes/footer.jsp"%>			