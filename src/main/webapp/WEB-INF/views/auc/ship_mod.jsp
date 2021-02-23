<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<div>
<h1>배 송 조 회</h1>
</div>
<div>
	<form role="form" action="/auc/ship_mod" method="post">
	
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>	
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
	
				<div>			
					<input type=hidden class="form-control" name="a_bno" value='<c:out value="${shipget.a_bno}"/>'  readonly="readonly">
				</div>
				<div>
			
					<input type=hidden class="form-control" name="c_num" value='<c:out value="${shipget.c_num}"/>'  readonly="readonly">
				</div>
				<div>
			
					<input type=hidden class="form-control" name="m_num" value='<c:out value="${shipget.m_num}"/>'  readonly="readonly">
				</div>
				<div>
					<label>배송지</label>
					<input class="form-control" name="s_shpng_addr" value='<c:out value="${shipget.s_shpng_addr}"/>'>
				</div>
				<div>
					<label>배송연락처</label>
					<input class="form-control" name="s_shpng_cntct" value='<c:out value="${shipget.s_shpng_cntct}"/>'>
				</div>
				<div>
					<label>배송현황</label>				
					<input name="s_shpng_stts" value='<c:out value="${shipget.s_shpng_stts}"/>' >
				</div>
				
				<button type="submit" data-oper='ship_mod'>수정</button>
				<button type="submit" data-oper='ship_rem'>삭제</button>
				<button type="submit" data-oper='ship_list'>목록</button>
				</form>				
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
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