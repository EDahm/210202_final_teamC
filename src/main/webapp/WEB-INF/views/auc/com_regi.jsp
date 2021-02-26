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
			업체 정보 등록
</h3>
		  </div>
		 </div>
			
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
			<form role="form" action="/auc/com_regi" method="post">
				<div class="form-group">
					<label>업체명</label>
					<input name="c_name" class="form-control">
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input name="c_email" class="form-control">
				</div>
				<div class="form-group">
					<label>주소</label>
					<input name="c_address" class="form-control">
				</div>
				<div class="form-group">
					<label>연락처</label>
					<input name="c_contact" class="form-control">
				</div>
				<div class="form-group">
					<label>업종</label>
					<input name="c_sector" class="form-control">
				</div>
				<button type="submit" class="btn btn-success btn-xs">신청</button>
				<button type="reset" class="btn btn-outline-success btn-xs">리셋</button>
			</form>				
			</div>
		</div>
	</div>
</section>
</div>
</div>
	
<%@include file="../includes/footer.jsp"%>			