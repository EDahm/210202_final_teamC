<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<div>
	<div>
		<h1>Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>

			<div>Board Read Page</div>
			<!-- /.panel-heading -->
			<div>

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
						value='<c:out value="${member.m_ncnm }" />' readonly="readonly">
				</div>
				<div>
					<label>연락처</label> <input name='m_contact'
						value='<c:out value="${member.m_contact }" />' readonly="readonly">
				</div>
				<div>
					<label>가입유형</label> <input name='m_type'
						value='<c:out value="${member.m_type }" />' readonly="readonly">
				</div>
				<div>
					<label>포인트</label> <input name='m_point'
						value='<c:out value="${member.m_point }" />' readonly="readonly">
				</div>
				
				
				<button data-oper='modify'>Modify</button>
				<button data-oper='list'>List</button>

				<form id='operForm' action="/member/modify" method="get">
					<input type='hidden' id='m_num' name='m_num'
						value='<c:out value="${member.m_num }"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
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

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/member/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#m_num").remove();
			operForm.attr("action", "/member/list")
			operForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>

