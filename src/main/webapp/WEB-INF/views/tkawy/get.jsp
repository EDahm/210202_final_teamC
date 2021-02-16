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
					<label>플라스틱병뚜껑</label> <input name='t_plastic_cap'
						value='<c:out value="${tkawy.t_plastic_cap }" />' readonly="readonly">
				</div>
				<div>
					<label>수거예정업체</label> <input name='t_vstng_cmpny'
						value='<c:out value="${tkawy.t_vstng_cmpny }" />' readonly="readonly">
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
						value='<c:out value="${tkawy.t_progress }" />' readonly="readonly">
				</div>
				
				
				
				<button data-oper='modify'>Modify</button>
				<button data-oper='list'>List</button>

				<form id='operForm' action="/tkawy/modify" method="get">
					<input type='hidden' id='t_bno' name='t_bno'
						value='<c:out value="${tkawy.t_bno }"/>'> <input
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

			operForm.attr("action", "/tkawy/modify").submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#t_bno").remove();
			operForm.attr("action", "/tkawy/list")
			operForm.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>

