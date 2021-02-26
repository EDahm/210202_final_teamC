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
			업체 정보 조회
			</h3>
		  </div>
		 </div>
			
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
			
				<div class="form-group">
					<label>업체번호</label>
					<input class="form-control" name="c_num" value='<c:out value="${comget.c_num}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>업체명</label>
					<input class="form-control" name="c_name" value='<c:out value="${comget.c_name}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input class="form-control" name="c_email" value='<c:out value="${comget.c_email}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>주소</label>
					<input class="form-control" name="c_address" value='<c:out value="${comget.c_address}"/>'readonly="readonly">
				</div>
				<div class="form-group">
					<label>연락처</label>
					<input class="form-control" name="c_contact" value='<c:out value="${comget.c_contact}"/>'readonly="readonly">
				</div>
				<div class="form-group">
					<label>업종</label>
					<input class="form-control" name="c_sector" value='<c:out value="${comget.c_sector}"/>'readonly="readonly">
				</div>
				<button data-oper='com_mod' class="btn btn-success btn-xs" onclick="location.href='/auc/com_mod?c_num=<c:out value="${comget.c_num}"/>'">수정</button>
				<button data-oper='com_list' class="btn btn-outline-success btn-xs" onclick="location.href='/auc/com_list'">목록</button>				
			
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
</section>

</div>
</div>
<!-- 
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
 -->
<%@include file="../includes/footer.jsp"%>