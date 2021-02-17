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

#final_mail_ck{
display: none;
}

#final_pw_ck{
display: none;
}

#final_pwck_ck{
display: none;
}

#final_name_ck{
display: none;
}

#final_ncnm_ck{
display: none;
}

#final_contact_ck{
display: none;
}

/* 중복아이디 존재하지 않는 경우 */
#id_input_re_1{
color : green;
display : none;
}

/* 중복아이디 존재하는 경우 */
#id_input_re_2{
color : red;
display : none;
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
			<form role="form" id="#join_form" action="/member/register" method="post">
				<div style="display:flex;">
					<label>이메일주소</label> <input id="email_input" name='m_email'>
					<div id="mail_check_button" style="border: 1px solid grey; width: 120px; text-align:center;">인증번호 전송</div>
					<span id="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span id="id_input_re_2">아이디가 이미 존재합니다.</span>
					<span id="final_mail_ck">이메일을 입력해주세요.</span>
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
					<span id="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div>
					<label>비밀번호확인</label> <input type="password" id="pwd2" name='re_m_password'>
					<span id="final_pwck_ck">비밀번호를 확인해주세요.</span>
				</div>
				<div>
					<label>이름</label> <input name='m_name' id="name_input">
					<span id="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div>
					<label>닉네임</label> <input name='m_ncnm' id="ncnm_input">
					<span id="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div>
				<label>연락처</label>
					<input type="tel" name='m_contact' id="tel_input" maxlength="13" placeholder="예) 010-1234-5678" />
					<span id="final_contact_ck">연락처를 입력해주세요.</span>
				</div>
				
				<button type="submit" id="join_button" data-oper='list'>가입하기</button>

			</form>
		</div>
	</div>


<script type="text/javascript">
	
	var code = "";					//이메일전송 인증번호 저장위한 코드
	
	/* 유효성 검사 통과유무 변수 */
	var mailCheck = false;		//이메일
	var mailckCheck = false;	//이메일 중복 검사
	var mailnumCheck = false;	//이메일 인증번호 확인
	var pwCheck = false;		//비밀번호
	var pwckCheck = false;		//비밀번호 확인
	var pwckcorCheck = false;	//비밀번호 일치 확인
	var nameCheck = false;		//이름
	var ncnmCheck = false;		//닉네임
	var contactCheck = false;	//연락처
	
	
	$(document).ready(function() {
		
		/* 회원가입 버튼(회원가입 기능 작동) */
		$("#join_button").click(function(){
			
			/*var mail = $("#email_input").val();		//이메일 입력란
			var pw = $("#pwd1").val();				//비밀번호 입력란
			var pwck = $("#pw2").val();				//비밀번호 확인 입력란
			var name = $("#name_input").val();		//이름 입력란
			var ncnm = $("#ncnm_input").val();		//닉네임 입력란
			var contact = $("#tel_input").val();	//연락처 입력란
			
			
			/* 메일(ID) 유효성 검사 */
			/*if (mail == ""){
				$("#final_mail_ck").css('display', 'block');
				mailCheck = false;
			}else{
				$("final_mail_ck").css('display', 'none');
				mailCheck = true;
			} */
			
			$("#join_form").attr("action", "/member/register");
			$("#join_form").submit();
		});
		
		
		
		

		/* 인증번호 이메일 전송 */
		$("#mail_check_button").click(function() {

			var email = $("#email_input").val(); //입력한 이메일
			var checkBox = $("#mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스

			$.ajax({

				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {

					//console.log("data : " + data);
					checkBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;

				}

			});

		});
		
		/* 인증번호 비교 */
		$("#mail_check_input").blur(function(){
			
		    var inputCode = $("#mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과   
		    
		    if(inputCode == code){
		    	checkResult.html("인증번호가 일치합니다.");
		    	checkResult.attr("class", "correct");
		    } else {
		    	checkResult.html("인증번호를 다시 확인해주세요.");
		    	checkResult.attr("class", "incorrect");
		    }

		});


/////////////////////////////////////////////////////////////////////
	});
</script>


<%@include file="../includes/footer.jsp"%>

