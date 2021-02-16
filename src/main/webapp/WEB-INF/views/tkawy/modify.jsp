<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<div>
	<div>
		<h1>Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>

			<div>Board Modify Page</div>
			<!-- /.panel-heading -->
			<div>

				<form role="form" action="/tkawy/modify" method="post">
					<input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='type'
						value='<c:out value="${cri.type}"/>'> <input type='hidden'
						name='keyword' value='<c:out value="${cri.keyword}"/>'>

					<div>
						<label>예약번호</label> <input name='t_bno'
							value='<c:out value="${tkawy.t_bno }" />' readonly="readonly">
					</div>
					<div>
						<label>회원번호</label> <input name='m_num'
							value='<c:out value="${tkawy.m_num }" />' readonly="readonly">
					</div>
					<div>
						<label>예약일자</label> <input name='t_regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${tkawy.t_regdate }" />'
							readonly="readonly">
					</div>

					<div>
						<label>연락처</label> <input name='t_contact'
							value='<c:out value="${tkawy.t_contact }" />' readonly="readonly">
					</div>
					<div>
						<label>일반플라스틱</label> <input name='t_plastic'
							value='<c:out value="${tkawy.t_plastic }" />' readonly="readonly">
					</div>
					<div>
						<label>플라스틱병뚜껑</label> <input
							name='t_plastic_cap'
							value='<c:out value="${tkawy.t_plastic_cap }" />'
							readonly="readonly">
					</div>
					<div>
						<label>수거예정업체</label> <input
							name='t_vstng_cmpny'
							value='<c:out value="${tkawy.t_vstng_cmpny }" />'
							readonly="readonly">
					</div>
					<div>
						<label>수거예정일</label><input type="hidden">
						<fmt:parseDate var="t_date_vist" value="${tkawy.t_date_vist}"
							pattern="yyyy-MM-dd" />
						<input name='t_date_vist'
							value='<fmt:formatDate pattern="yyyy-MM-dd"
									value="${t_date_vist}" />'
							readonly="readonly">
					</div>
					<div>
						<label>진행상태</label> <input name='t_progress'
							value='<c:out value="${tkawy.t_progress }" />'
							readonly="readonly">
					</div>

					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>

				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.row -->


<script type="text/javascript">
	$(document).ready(function() {

		var formObj = $("form");

		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/tkawy/remove");
			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/tkawy/list").attr("method","get");
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

