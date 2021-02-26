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
				경매 진행 상황
			</h3>
		  </div>
		 </div>
		 
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				
				<div class="form-group">
					<label>경매번호</label>
					<input class="form-control" name="a_bno" value='<c:out value="${nowlist.a_bno}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>신청번호</label>
					<input class="form-control" name="aa_bno" value='<c:out value="${nowlist.aa_bno}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>시작가</label>
					<input class="form-control" name="a_versifier" value='<c:out value="${nowlist.a_versifier}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc" value='<c:out value="${nowlist.a_crnt_prc}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc" value='<c:out value="${nowlist.a_wnng_prc}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>경매상태</label>
					<input class="form-control" name="a_state" value='<c:out value="${nowlist.a_state}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>진행기간</label>
					<fmt:parseDate var="a_prgrs_prd" value="${nowlist.a_prgrs_prd}" pattern="yyyy-MM-dd" />
					<input type='date' class="form-control" name='a_prgrs_prd' value='<fmt:formatDate pattern="yyyy-MM-dd"
					value="${a_prgrs_prd}" />' readonly="readonly">
				</div>
				<button data-oper='now_mod' class="btn btn-success btn-xs" onclick="location.href='/auc/now_mod?a_bno=<c:out value="${nowlist.a_bno}"/>'">수정</button>
				<button data-oper='now_list' class="btn btn-outline-success btn-xs" onclick="location.href='/auc/now_list'">목록</button>
				
				<form id='operForm' action="/auc/now_mod" method="get">
                        		<input type='hidden' id='a_bno' name='a_bno' value='<c:out value="${nowlist.a_bno}"/>'>
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