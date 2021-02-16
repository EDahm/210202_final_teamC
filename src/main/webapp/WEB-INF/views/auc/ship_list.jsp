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
		<h1 class="page-header">배송 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				배송 리스트
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>경매번호</th> 
							<th>업체번호</th>
							<th>배송현황</th>
						</tr>
					</thead>

					<c:forEach items="${ship_list}" var="ship">
						<tr>
							<td><a href='/auc/ship_get?a_bno=<c:out value="${ship.a_bno}"/>'>
									<c:out value="${ship.a_bno}" /></a></td>
							<td><c:out value="${ship.c_num}" /></td>
							<td><c:out value="${ship.s_shpng_stts}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>	
			
</body>
</html>