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
				배송 정보 수정	
	</h3>
		  </div>
		 </div>
		 
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				
	<form role="form" action="/auc/ship_mod" method="post">
	
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>	
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	
				<div class="form-group">			
					<input type=hidden class="form-control" name="a_bno" value='<c:out value="${shipget.a_bno}"/>'  readonly="readonly">
				</div>
				<div class="form-group">
			
					<input type=hidden class="form-control" name="c_num" value='<c:out value="${shipget.c_num}"/>'  readonly="readonly">
				</div>
				<div class="form-group">
			
					<input type=hidden class="form-control" name="m_num" value='<c:out value="${shipget.m_num}"/>'  readonly="readonly">
				</div>
				<div class="form-group">
					<label>배송지</label>
					<input class="form-control" name="s_shpng_addr" value='<c:out value="${shipget.s_shpng_addr}"/>'>
				</div>
				<div class="form-group">
					<label>배송연락처</label>
					<input class="form-control" name="s_shpng_cntct" value='<c:out value="${shipget.s_shpng_cntct}"/>'>
				</div>
				<div class="form-group">
					<label>배송현황</label>				
					<input id="shpng_stts" type="hidden">
					<select class="custom-select" id="s_shpng_stts" name="s_shpng_stts">
						<option value="배송준비중" selected="selected">배송준비중</option>
						<option value="배송진행중">배송진행중</option>
						<option value="배송완료">배송완료</option>
					</select>
				</div>
				
				<button class="btn btn-success btn-xs" type="submit" data-oper='ship_mod'>수정</button>
				<button class="btn btn-danger btn-xs" type="submit" data-oper='ship_rem'>삭제</button>
				<button  class="btn btn-outline-success btn-xs" type="submit" data-oper='ship_list'>목록</button>
				</form>				
		
			</div>
		</div>
	</div>
</section>

</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$('select[name=s_shpng_stts]').change(function(){
		if($(this).val()=="준비중"){
			$('#shpng_stts').val("준비중");
		} else {
			$('#shpng_stts').val($(this).val());
		}
		
	});
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'ship_rem'){
			formObj.attr("action","/auc/ship_rem");
			
		} else if(operation === 'ship_list'){
			//move to list
			formObj.attr("action", "/auc/ship_list").attr("method","get");
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