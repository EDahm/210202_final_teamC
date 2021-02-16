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

				<form role="form" action="/tkawy/register" method="post">
					<div>
						<label>회원번호(임시- 자동으로 들어가야됨)</label> <input name='m_num'>
					</div>
					<div>
						<label>연락처</label> <input name='t_contact'>
					</div>
					<div>
						<label>일반플라스틱</label> <input name='t_plastic'>
					</div>
					<div>
						<label>플라스틱병뚜껑</label> <input name='t_plastic_cap'>
					</div>
					<div>
						<label>수거예약업체(팝업창 검색기능ㅠㅠ)</label> <input name='t_vstng_cmpny'>
					</div>
					<div>
						<label>수거예약일자</label> <input name='t_date_vist'>
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

