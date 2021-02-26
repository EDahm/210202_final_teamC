<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>


 <section class="pt-7 pb-12" style="width: 70%;">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
			<h3 class="mb-10">
				경매 진행 수정
				</h3>
		  </div>
		 </div>
			
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				<form role="form" action="/auc/now_mod" method="post">
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
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
					<input class="form-control" name="a_versifier" value='<c:out value="${nowlist.a_versifier}"/>'>
				</div>
					<div class="form-group">
					<label>현재가</label>
					<input class="form-control" name="a_crnt_prc" value='<c:out value="${nowlist.a_crnt_prc}"/>' >
				</div>
					<div class="form-group">
					<label>바로 구매가격</label>
					<input class="form-control" name="a_wnng_prc" value='<c:out value="${nowlist.a_wnng_prc}"/>' >
				</div>
				<div class="form-group">
					<label>경매상태</label>
					<input id="state" type="hidden">
					<select class="custom-select" id="a_state" name="a_state">
						<option value="준비중" selected="selected">준비중</option>
						<option value="경매종료">종료</option>
						<option value="진행중">진행중</option>
						<option value="유찰">유찰</option>
					</select>
				</div>
					<div class="form-group">
					<label>진행기간</label> <!-- datepicker님 도와주세요 -->
					<input type="hidden">
					<fmt:parseDate var="a_prgrs_prd" value="${nowlist.a_prgrs_prd}" pattern="yyyy-MM-dd" />
					<input type='date' class="form-control" name='a_prgrs_prd' value='<fmt:formatDate pattern="yyyy-MM-dd"
					value="${a_prgrs_prd}" />'>
				</div>
				<button type="submit" class="btn btn-success btn-xs" data-oper='now_mod'>수정</button>
				<button type="submit" class="btn btn-danger btn-xs" data-oper='now_rem'>삭제</button>
				<button type="submit" class="btn btn-outline-success btn-xs" data-oper='now_list'>목록</button>
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
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'now_rem'){
			formObj.attr("action","/auc/now_rem");
		} else if(operation === 'now_list'){
			formObj.attr("action", "/auc/now_list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
	});
});
</script>		

<%@include file="../includes/footer.jsp"%>