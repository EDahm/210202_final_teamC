<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<style>

#mail_check_input_box_false{
background-color:white;
}

#mail_check_input_box_true{
background-color:white;
}

.correct{
color : grey;
}

.incorrect{
color : grey;
}

#final_mail_ck{
color : #ff7052;
display: none;
}

#final_pw_ck{
color : #ff7052;
display: none;
}

#final_pwck_ck{
color : #ff7052;
display: none;
}

#final_name_ck{
color : #ff7052;
display: none;
}

#final_ncnm_ck{
color : #ff7052;
display: none;
}

#final_contact_ck{
color : #ff7052;
display: none;
}

/* 중복아이디 존재하지 않는 경우 */
#id_input_re_1{
color : grey;
display : none;
}

/* 중복아이디 존재하는 경우 */
#id_input_re_2{
color : grey;
display : none;
}

/* 중복아이디 존재하지 않는 경우 */
#ncnm_input_re_1{
color : grey;
display : none;
}

/* 중복아이디 존재하는 경우 */
#ncnm_input_re_2{
color : grey;
display : none;
}

/* 비밀번호 확인 일치 유효성 검사 */
#pwck_input_re_1{
color : grey;
display : none;
}

#pwck_input_re_2{
color : grey;
display : none;
}

#ncnm_type_ck{
color : grey;
display : none;
}

#mail_check_button{
border-color: none;
background : #44A379;
color : white;
text-align : center;
height: calc(1.5rem + 1.75rem + 2px);
cursor: pointer;
line-height: calc(1.5rem + 1.75rem + 2px)

</style>
<!-- BREADCRUMB -->
    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="/main">Main</a>
              </li>
              <li class="breadcrumb-item active">
               회원가입
              </li>
              <li class="breadcrumb-item active">
               정보입력
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>
    
<!-- CONTENT -->
<section class="pt-8 pb-12">
	<div class="container">

		<div class="row justify-content-center">
			<div class="col-7">

				<form role="form" id="join_form" action="/member/register"
					method="post">
					<div class="row mb-9">
						<div class="col-12 col-md-9">
							<div class="form-group">
								<label>이메일주소 *</label> <input
									class="form-control form-control-sm" id="email_input"
									name='m_email' placeholder="이메일 주소를 입력하세요"> <span
									id="id_input_re_1">사용 가능한 아이디입니다.</span> <span
									id="id_input_re_2">아이디가 이미 존재합니다.</span> <span
									id="final_mail_ck">이메일을 입력해주세요.</span> <span
									id="mail_input_box_warn"></span>
							</div>
						</div>
						<div class="col-12 col-md-3">
							<label style="color: white;">.</label>
							<div id="mail_check_button">인증번호
								전송</div>
						</div>

						<div class="col-12">
							<div class="form-group" id="mail_check_wrap">
								<div class="mail_check_input_box"
									id="mail_check_input_box_false">
									<label>인증번호입력 *</label> <input
										class="form-control form-control-sm" id="mail_check_input"
										placeholder="인증번호를 입력하세요" disabled="disabled">
								</div>
								<span id="mail_check_input_box_warn"></span>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>비밀번호 *</label> <input
									class="form-control form-control-sm" type="password" id="pwd1"
									placeholder="비밀번호를 입력하세요(숫자+영문자+특수문자 조합 8자리 이상)" name='m_password'> <span
									id="final_pw_ck">비밀번호를 입력해주세요.</span>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>비밀번호확인 *</label> <input
									class="form-control form-control-sm" type="password" id="pwd2"
									placeholder="비밀번호를 확인하세요" name='re_m_password'> <span
									id="final_pwck_ck">비밀번호를 확인해주세요.</span> <span
									id="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
									id="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>이름 *</label> <input
									class="form-control form-control-sm" name='m_name'
									placeholder="이름을 입력하세요" id="name_input"> <span
									id="final_name_ck">이름을 입력해주세요.</span> <span id="name_check"></span>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>닉네임 *</label> <input
									class="form-control form-control-sm" name='m_ncnm'
									placeholder="닉네임을 입력하세요(2자 이상 20자 이내, 특수문자 입력 불가)" id="ncnm_input"> <span
									id="final_ncnm_ck">닉네임을 입력해주세요.</span> <span
									id="ncnm_input_re_1">사용 가능한 닉네임입니다.</span> <span
									id="ncnm_input_re_2">이미 존재하는 닉네임입니다.</span>
									<span id="ncnm_type_ck">한글,영문,숫자로 이루어진 2~20자의 닉네임을 입력해주세요.</span>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								<label>연락처 *</label> <input
									class="form-control form-control-sm" type="tel"
									name='m_contact' id="tel_input" maxlength="13"
									placeholder="연락처를 입력하세요 (010-1234-5678)"> <span
									id="final_contact_ck">연락처를 입력해주세요.</span>
							</div>
						</div>
						<button class="btn btn-block btn-dark" style="background: #44A379; border-color: white;" type="submit" id="join_button" data-oper='afterSignUp'>가입하기</button>

					</div>
				</form>
			</div>
		</div>
	</div>
</section>


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
	var ncnmckCheck = false;	//닉네임 중복 검사
	var contactCheck = false;	//연락처
	
	
	$(document).ready(function() {
		
		/* 회원가입 버튼(회원가입 기능 작동) */
		$("#join_button").click(function(){
			
			var mail = $("#email_input").val();		//이메일 입력란
			var pw = $("#pwd1").val();				//비밀번호 입력란
			var pwck = $("#pw2").val();				//비밀번호 확인 입력란
			var name = $("#name_input").val();		//이름 입력란
			var ncnm = $("#ncnm_input").val();		//닉네임 입력란
			var contact = $("#tel_input").val();	//연락처 입력란
			
			
			/* 메일(ID) 유효성 검사 */
			if (mail == ""){
				$('#id_input_re_1').css("display", 'none');
				$("#final_mail_ck").css('display', 'block');
				mailCheck = false;
			}else{
				$("#final_mail_ck").css('display', 'none');
				mailCheck = true;
			}
			
			
			/* 비밀번호 유효성 검사 */
	        if(pw == ""){
	            $('#final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('#final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
			
			
	        /* 비밀번호 확인 유효성 검사 */
	        if(pwck == ""){
	            $('#final_pwck_ck').css('display','block');
	            pwckCheck = false;
	        }else{
	            $('#final_pwck_ck').css('display', 'none');
	            pwckCheck = true;
	        }
	        
	        
	        /* 이름 유효성 검사 */
	        if(name == ""){
	            $('#final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('#final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
	        
	        var specialCheck = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	        
	        /* 닉네임 유효성 검사 */
	        if(ncnm == ""){
	        	$('#ncnm_input_re_1').css("display", "none");
	        	$('#final_ncnm_ck').css('display','block');
	            ncnmCheck = false;
	        }else if(ncnm.search(/\s/) != -1) { 
	        	$('#ncnm_input_re_1').css("display", "none");
	        	$('#ncnm_type_ck').css('display','block');
	        	alert("닉네임은 빈 칸을 포함 할 수 없습니다."); //닉네임 한글 1~10자, 영문 및 숫자 2~20자 
	        	ncnmCheck = false;
	        }else if (ncnm.length<2 || ncnm.length>20) {
	        	$('#ncnm_input_re_1').css("display", "none");
	        	$('#ncnm_type_ck').css('display','block');	        	
	        	alert("2~20자의 닉네임만 가능합니다."); 
	        	ncnmCheck = false;
	        }else if (specialCheck.test(ncnm)) { 
	        	$('#ncnm_input_re_1').css("display", "none");
	        	$('#ncnm_type_ck').css('display','block');
	        	alert("닉네임은 특수문자를 포함 할 수 없습니다.");
	        	ncnmCheck = false;
	        }else{
	        	$('#ncnm_type_ck').css('display','none');
	        	$('#final_ncnm_ck').css('display', 'none');
	            ncnmCheck = true;
	        }
	        
	        /* 연락처 유효성 검사 */
	        if(contact == ""){
	            $('#final_contact_ck').css('display','block');
	            contactCheck = false;
	        }else{
	            $('#final_contact_ck').css('display', 'none');
	            contactCheck = true;
	        }

	    	if(mailCheck && mailckCheck && mailnumCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && ncnmCheck && ncnmckCheck && contactCheck){
	    		
			
	    		$("#join_form").attr("action", "/member/register");
	    		$("#join_form").submit();
	    		
	    	}
	    	
	    	return false;

			
		});
		
		
		
		

		/* 인증번호 이메일 전송 */
		$("#mail_check_button").click(function() {

			var email = $("#email_input").val(); //입력한 이메일
			var checkBox = $("#mail_check_input"); // 인증번호 입력란
			var boxWrap = $(".mail_check_input_box"); // 인증번호 입력란 박스
			var warnMsg = $("#mail_input_box_warn");	//이메일 형식 경고글

			
			 /* 이메일 형식 유효성 검사 */
		    if(mailFormCheck(email) && mailckCheck == true){
		        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
		        warnMsg.css("display", "inline-block");
		    } else {
		        $('#id_input_re_1').css("display", 'none');
		        warnMsg.html("올바르지 못한 이메일 형식입니다.");
		        warnMsg.css("display", "inline-block");
		        return false;
		    } 

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
		    	mailnumCheck = true;
		    } else {
		    	checkResult.html("인증번호를 다시 확인해주세요.");
		    	checkResult.attr("class", "incorrect");
		    	mailnumCheck = false;
		    }

		});
		
		/* 이메일아이디 중복검사 */
		$("#email_input").on("propertychange change keyup paste input", function(){
			//console.log("keyup 테스트"); 
			var email = $('#email_input').val(); // email_input에 입력되는 값 
			var data = {email : email} // '컨트롤에 넘길 데이터 이름' : '데이터(email_input에 입력되는 값)' 
			
			$.ajax({
				type : "post", 
				url : "/member/memberIdChk", 
				data : data,
				success : function(result){
					//console.log("성공 여부" + result);
					if(result != 'fail'){
						$('#id_input_re_1').css("display","inline-block"); 
						$('#id_input_re_2').css("display", "none"); 
						mailckCheck = true;
					} else { 
						$("#final_mail_ck").css('display', 'none');
						$('#id_input_re_2').css("display","inline-block"); 
						$('#id_input_re_1').css("display", "none");
						mailckCheck = false;
					}

				}
				
			}); // ajax 종료

	});
		
		
		
		/* 닉네임 중복검사 */
		$('#ncnm_input').on("propertychange change keyup paste input", function(){ 
			
			/* console.log("keyup 테스트"); */
			
			var m_ncnm = $("#ncnm_input").val();
			var data = {m_ncnm : m_ncnm}		//컨트롤러 매개변수 이름이랑 일치해주니까 오류안남
			
			$.ajax({
				type : "post",
				url : "/member/memberNcnmChk",
				data : data,
				success : function(result){
					//console.log("성공여부" + result);
					if(result != 'fail'){
						$('#ncnm_type_ck').css('display','none');
						$('#ncnm_input_re_1').css("display","inline-block"); 
						$('#ncnm_input_re_2').css("display", "none"); 
						ncnmckCheck = true;
					} else { 
						$('#ncnm_input_re_2').css("display","inline-block"); 
						$('#ncnm_input_re_1').css("display", "none");
						ncnmckCheck = false;
					}
				}
			}); //ajax 종료
			
			
		});// function 종료
		
		
		/* 비밀번호 확인 일치 유효성 검사 */
		 
		$('#pwd2').on("propertychange change keyup paste input", function(){
			  
			var pw = $('#pwd1').val();
			var pwck = $('#pwd2').val();
			$('#final_pwck_ck').css('display', 'none');
			
			if(pw == pwck){
				$("#pwck_input_re_1").css('display', 'block');
				$("#pwck_input_re_2").css('display', 'none');
				pwckcorCheck = true;
			} else {
				$("#pwck_input_re_1").css('display', 'none');
				$("#pwck_input_re_2").css('display', 'block');
				pwckcorCheck = false;
			}
		    
		});  
		
		
		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    return form.test(email);
			
		}
		
		
		/* 비밀번호 형식 유효성 */
		$("#pwd1").change(function(){
		    checkPassword($('#pwd1').val(),$('#email_input').val());
		});
		
		function checkPassword(m_password, m_email){
		    
		    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(m_password)){            
		        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
		        $('#pwd1').val('').focus();
		        return false;
		    }  
		    
		    return true;
		}
		
/////////////////////////////////////////////////////////////////////
	});
	
	
 	/* 연락처 자동 하이픈(-) 삽입 */
	$(document).on("keyup", "#tel_input", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
		
	});

</script>


<%@include file="../includes/footer.jsp"%>

