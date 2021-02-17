<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">경매 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 리스트
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>경매번호</th> 
							<th>신청번호</th>
							<th>시작가</th>
							<th>현재가</th>
							<th>바로 구매가격</th>
							<th>경매상태</th>
							<th>진행기간</th>
						</tr>
					</thead>

					<c:forEach items="${now_list}" var="nowlist">
						<tr>
							<td><a href='/auc/now_get?a_bno=<c:out value="${nowlist.a_bno}"/>'>
									<c:out value="${nowlist.a_bno}" /></a></td>						
							<td><c:out value="${nowlist.aa_bno}" /></td>
							<td><c:out value="${nowlist.a_versifier}" /></td>
							<td><c:out value="${nowlist.a_crnt_prc}" /></td>
							<td><c:out value="${nowlist.a_wnng_prc}" /></td>
							<td><c:out value="${nowlist.a_state}" /></td>
							<td><c:out value="${nowlist.a_prgrs_prd}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>	
			
</body>
</html>