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

				<form role="form" action="/member/modify" method="post">
					<input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='type'
						value='<c:out value="${cri.type}"/>'> <input type='hidden'
						name='keyword' value='<c:out value="${cri.keyword}"/>'>

					<div>
						<label>회원번호</label> <input name='m_num'
							value='<c:out value="${member.m_num }" />' readonly="readonly">
					</div>

					<div>
						<label>가입일</label> <input name='m_regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${member.m_regdate }" />'
							readonly="readonly">
					</div>

					<div>
						<label>이메일ID</label> <input name='m_email'
							value='<c:out value="${member.m_email }" />' readonly="readonly">
					</div>

					<div>
						<label>이름</label> <input name='m_name'
							value='<c:out value="${member.m_name }" />' readonly="readonly">
					</div>
					<div>
						<label>닉네임</label> <input name='m_ncnm'
							value='<c:out value="${member.m_ncnm }" />'>
					</div>
					<div>
						<label>연락처</label> <input name='m_contact'
							value='<c:out value="${member.m_contact }" />'">
					</div>
					<div>
						<label>가입유형</label> <input name='m_type'
							value='<c:out value="${member.m_type }" />' readonly="readonly">
					</div>
					<div>
						<label>포인트</label> <input name='m_point'
							value='<c:out value="${member.m_point }" />'>
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
				formObj.attr("action", "/member/remove");
			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/member/list").attr("method","get");
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

