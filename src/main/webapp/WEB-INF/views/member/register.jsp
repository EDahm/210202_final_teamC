<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<style>

#mail_check_input_box_false{
background-color:#ebebe4;
}

#mail_check_input_box_true{
background-color:white;
}

.correct{
color : green;
}

.incorrect{
color : red;
}

</style>

<div>
	<div>
		<h1>Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
		<h3>회원가입-일반가입</h3>
		<hr>
		<div>
			<form role="form" action="/member/register" method="post">
				<div style="display:flex;">
					<label>이메일주소</label> <input id="email_input" name='m_email'>
					<div id="mail_check_button" style="border: 1px solid grey; width: 120px; text-align:center;">인증번호 전송</div>
				</div>

				<div id="mail_check_wrap">
					<div class = "mail_check_input_box" id="mail_check_input_box_false">
						<label>인증번호입력</label> <input id="mail_check_input" disabled="disabled">
					</div>
					<div></div>
					<span id="mail_check_input_box_warn"></span>
				</div>
				<div>
					<label>비밀번호</label> <input type="password" id="pwd1" name='m_password'>
				</div>
				<div>
					<label>비밀번호확인</label> <input type="password" id="pwd2" name='re_m_password'>
				</div>
				<div>
					<label>이름</label> <input name='m_name' id="name_input">
				</div>
				<div>
					<label>닉네임</label> <input name='m_ncnm' id="ncnm_input">
				</div>
				<div>
				<label>연락처</label>
					<input type="tel" name='m_contact' id="telInput" maxlength="13" placeholder="예) 010-1234-5678" />
				</div>
				<button type="submit" data-oper='list'>가입하기</button>

			</form>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			
			/* 인증번호 이메일 전송 */
			$("#mail_check_button").click(function(){
				
				var email = $("#email_input").val(); 		//입력한 이메일
				
				$.ajax({
					
					type:"GET",
					url:"mailCheck?email=" + email,
					success:function(data){
						
						//console.log("data : " + data);
						
					}
							
				});
				
			});
			
			
		});
		
	</script>


<%@include file="../includes/footer.jsp"%>

