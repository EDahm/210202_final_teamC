<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<style>
#final_contact_ck{
display: none;
}

#final_plastic_ck{
display: none;
}

#final_cmpny_ck{
display: none;
}

#final_date_ck{
display: none;
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
	<div>
		<div>

			<div>Board Register</div>
			<!-- /.panel-heading -->
			<div>

				<form role="form" id="submit_form" action="/tkawy/register" method="post">
					<div>
						<label>회원번호(임시- 자동으로 들어가야됨, 창도 없애야됨)</label> <input name='m_num'>
					</div>
					<div>
						<label>연락처</label> <input name='t_contact' id="tel_input">
						<span id="final_contact_ck">연락처를 확인해주세요.</span>
					</div>
					<div>
						<label>일반플라스틱</label> <input name='t_plastic' type="number" id="plastic_input" value="0"  min="0" max="50">
						
					</div>
						<span>일반 플라스틱 품목은 크기와 상관없이 1개에서 50개까지 수거 가능합니다.</span>
					<div>
						<label>플라스틱병뚜껑</label> <input name='t_plastic_cap' type="number" id="cap_input" value="0"  min="0" max="100">
					</div>
						<span>플라스틱병 뚜껑은 1개에서 100개까지 수거 가능합니다.</span>
						<span id="final_plastic_ck">개수를 확인해주세요.</span>
					<div>
						<label>수거예약업체(팝업창 검색기능ㅠㅠ)</label> <input name='t_vstng_cmpny' id="cmpny_input">
						<button id="searchCmpny">검색</button>
						<span id="final_cmpny_ck">수거업체를 선택해주세요.</span>
						
					</div>
					<div onload="validDate()">
						<label>수거예약일자</label> <input type="date" name='t_date_vist' id="date_input">
						<span id="final_date_ck">수거예약일자를 입력해주세요.</span>
					</div>

					<button type="submit" id="submit_button" >Submit
						Button</button>
					<br><br><br><br><br>
					<br>
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

/* 날짜 오늘 기준으로 자동 선택 */
 document.getElementById('date_input').value = new Date().toISOString().substring(0, 10);


/* 날짜 유효성 검사 */
/* 오늘부터 */
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();



 if(dd<10){
        dd='0'+dd
    } 
    if(mm<10){
        mm='0'+mm
    } 
today = yyyy+'-'+mm+'-'+dd;

document.getElementById("date_input").setAttribute("min", today);

/* 오늘 날짜기준 한달뒤까지 */
var endDay = new Date();
var enddd = endDay.getDate();
var endmm = endDay.getMonth()+2; //January is 0!
var endyyyy = endDay.getFullYear();



 if(enddd<10){
        enddd='0'+enddd
    } 
    if(endmm<10){
    	endmm='0'+endmm
    } 
endDay = endyyyy+'-'+endmm+'-'+enddd;

document.getElementById("date_input").setAttribute("max", endDay);


/* 유효성 검사 통과유무 변수 */
var contactCheck = false;	//연락처
var plasticCheck = false;	//플라스틱 체크
var cmpnyCheck = false;	//수거업체
var dateCheck = false;	//수거예약일자


$(document).ready(function(){

/* 신청완료 버튼(수거예약 기능 작동) */
$("#submit_button").click(function(){

var contact = $("#tel_input").val();		//연락처 입력란
var plastic = $("#plastic_input").val();		//플라스틱 입력란
var plastic_cap = $("#cap_input").val();		//플라스틱뚜껑 입력란
var cmpny = $("#cmpny_input").val();		//수거업체 입력란
var date = $("#date_input").val();		//예약일자 입력란

/* 연락처 유효성 검사 */
	        if(contact == ""){
	            $('#final_contact_ck').css('display','block');
	            contactCheck = false;
	        }else{
	            $('#final_contact_ck').css('display', 'none');
	            contactCheck = true;
	        }


/* 플라스틱 숫자 유효성 검사 */
 
if(plastic == 0 || plastic_cap < 0){
$('#final_plastic_ck').css('display', 'block');
plasticCheck = false;
} else if (plastic < 0 && plastic_cap < 0){
$('#final_plastic_ck').css('display', 'block');
plasticCheck = false;
} else if(plastic > 50 || plastic_cap > 100){
$('#final_plastic_ck').css('display', 'block');
plasticCheck = false;
} else if (plastic > 50 && plastic_cap > 100){
$('#final_plastic_ck').css('display', 'block');
plasticCheck = false;
} else if(plastic == 0 && plastic_cap == 0 ){
$('#final_plastic_ck').css('display', 'block');
plasticCheck = false;
} else {
$('#final_plastic_ck').css('display', 'block');
plasticCheck = true;
}

/* 수거예약업체 유효성 검사 */
 if(cmpny == ""){
	            $('#final_cmpny_ck').css('display','block');
	            cmpnyCheck = false;
	        }else{
	            $('#final_cmpny _ck').css('display', 'none');
	            cmpnyCheck = true;
	        }


/* 수거예약일 유효성 검사 */
 if(date == ""){
	            $('#final_date_ck').css('display','block');
	            dateCheck = false;
	        }else{
	            $('#final_contact_ck').css('display', 'none');
	            dateCheck = true;
	        }


if(contactCheck && plasticCheck && cmpnyCheck && dateCheck){

$("#submit_form").attr("action", "/tkawy/register");
$("#submit_form").submit();
}

return false;


});


$(function(){

	  $('#searchCmpny').click(function(event) {
		  event.preventDefault();
		  oPopupOpen();
	  });
	  

	});
	
function oPopupOpen() {
	var url = "/store/listforsearch.do";
	var winWidth = 1000;
	var winHeight = 500;
	var popupOption = "width=" + winWidth + ", height=" + winHeight;
	window.open(url,"",popupOption);
}


});


/* 연락처 자동 하이픈(-) 삽입 */

$(document).on("keyup", "#tel_input", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	
});

</script>
<%@include file="../includes/footer.jsp"%>

