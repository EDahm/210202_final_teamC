<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
        <div>
            <div>
                <div>
                    <div>
                        <div>
                        	<img src="/resources/img/mikan.jpg">
                        </div>
                    </div>
                </div>
                <div>
                    <div>    
                        <h3>물품명</h3>
                        <div>
                        <div>
                           <span>입찰 수</span>
                           <span>3 명</span>
                        </div>
                        <div >
                        	<p class="time-title">경매 마감까지 남은 시간</p>
              				<div class="time font40">
		                	<span class="hours"></span>
			                <span class="col">:</span>
            			    <span class="minutes"></span>
                			<span class="col">:</span>
                			<span class="seconds"></span>
              				</div>
                        </div>
                        </div>
                        <div>
                        현재가
                        </div>
                        <button id="popup_bid">입찰하기</button>
                        <a href="#">바로 구매하기</a>
                        <ul>
                            <li><b>원산지</b> <span>용암동 혜윤하우스</span></li>
                            <li><b>배송</b> <span>2~3일 소요 <samp>직접 수령 가능</samp></span></li>
                            <li><b>중량</b> <span>10 kg</span></li>
                        </ul>
                    </div>
                </div>
  
                        </div>
                    </div>         
    </section>
    <!-- Product Details Section End -->
         
        
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function remaindTime() {
    var now = new Date(); //현재시간을 구한다. 
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),22,00,00);

//오늘날짜의 저녁 10시 - 종료시간기준
    var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),09,00,00);

//오늘날짜의 오전 9시 - 오픈시간기준
  
    var nt = now.getTime(); // 현재의 시간만 가져온다
    var ot = open.getTime(); // 오픈시간만 가져온다
    var et = end.getTime(); // 종료시간만 가져온다.
  
   if(nt<ot){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다. 
     $(".time").fadeIn();
     $("p.time-title").html("경매 오픈까지 남은 시간");

     sec =parseInt(ot - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
   } else if(nt>et){ //현재시간이 종료시간보다 크면
    $("p.time-title").html("경매 종료");
    $(".time").fadeOut();
   }else { //현재시간이 오픈시간보다 늦고 마감시간보다 이르면 마감시간까지 남은 시간을 구한다. 
       $(".time").fadeIn();
     $("p.time-title").html("경매 마감까지 남은 시간");
     sec =parseInt(et - nt) / 1000;
     day  = parseInt(sec/60/60/24);
     sec = (sec - (day * 60 * 60 * 24));
     hour = parseInt(sec/60/60);
     sec = (sec - (hour*60*60));
     min = parseInt(sec/60);
     sec = parseInt(sec-(min*60));
     if(hour<10){hour="0"+hour;}
     if(min<10){min="0"+min;}
     if(sec<10){sec="0"+sec;}
      $(".hours").html(hour);
      $(".minutes").html(min);
      $(".seconds").html(sec);
   }
 }
 setInterval(remaindTime,1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다. 
</script>

</body>
</html>