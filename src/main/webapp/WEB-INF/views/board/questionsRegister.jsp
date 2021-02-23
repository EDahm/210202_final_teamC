<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">QnA Register Page</div>

				<div class="panel-body">

					<form role="form" action="/board/questionsRegister" method="post">

						<div class="form-group">
							<label>제목</label> <input class="form-control" name='q_title'>
						</div>

						<div class="form-group">
							<label>내용</label> <input class="form-control" name='q_content'>
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='q_ncnm'>
						</div>

						<!-- <div class="form-group">
						<label>비밀번호</label> <input class="form-control" name='pw'>
					</div>-->

						<button type="submit" class="btn btn-default">등록</button>
					</form>

				</div>

			</div>

		</div>

	</div>

<script>
function goWrite(frm) {
	var q_title = frm.q_title.value;
	var q_ncnm = frm.q_ncnm.value;
	var q_content = frm.q_content.value;
	
	if (q_title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (q_ncnm.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (q_content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>	
