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
				배송조회
				</h3>
		  </div>
		 </div>
		 
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				
				<div class="form-group">
					<input type=hidden class="form-control" name="a_bno" value='<c:out value="${shipget.a_bno}"/>'>
				</div>
				<div class="form-group">
			
					<input type=hidden class="form-control" name="c_num" value='<c:out value="${shipget.c_num}"/>'>
				</div>
				<div class="form-group">
			
					<input type=hidden class="form-control" name="m_num" value='<c:out value="${shipget.m_num}"/>'>
				</div>
				<div class="form-group">
					<label>배송지</label>
					<input class="form-control" name="s_shpng_addr" value='<c:out value="${shipget.s_shpng_addr}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>배송연락처</label>
					<input class="form-control" name="s_shpng_cntct" value='<c:out value="${shipget.s_shpng_cntct}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>배송현황</label>				
					<input class="form-control" name="s_shpng_stts" value='<c:out value="${shipget.s_shpng_stts}"/>' readonly="readonly">
				</div>
				
				<button data-oper='ship-mod' class="btn btn-success btn-xs" onclick="location.href='/auc/ship_mod?a_bno=<c:out value="${shipget.a_bno}"/>'"> 수정 </button>
				<button data-oper='ship-list' class="btn btn-outline-success btn-xs" onclick="location.href='/auc/ship_list'">배송목록</button>				
		
<form id='operForm' action="/auc/ship_mod" method= "get">
	<input type='hidden' id='a_bno' value='<c:out value="${shipget.a_bno}"/>'>
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


<%@include file="../includes/footer.jsp"%>