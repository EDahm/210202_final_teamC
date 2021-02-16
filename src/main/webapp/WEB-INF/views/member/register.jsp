<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<div>
	<div>
		<h1>Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>

			<div>Board Register</div>
			<!-- /.panel-heading -->
			<div>

				<form role="form" action="/board/register" method="post">
					<div>
						<label>Title</label> <input name='title'>
					</div>

					<div>
						<label>Text area</label>
						<textarea rows="3" name='content'></textarea>
					</div>

					<div>
						<label>Writer</label> <input name='writer'>
					</div>
					<button type="submit">Submit
						Button</button>
					<button type="reset">Reset Button</button>
				</form>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.row -->


<%@include file="../includes/footer.jsp"%>

