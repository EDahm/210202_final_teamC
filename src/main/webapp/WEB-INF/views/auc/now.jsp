<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

    <nav class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="/main">Home</a>
              </li>
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="shop.html">Auction</a>
              </li>
              <li class="breadcrumb-item active">
                경매 참여하기
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>
<!-- item -->
<section class="secStyle">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 col-md-6">

						<!-- 이미지부분 -->
						<div class="card">
							   <!-- Badge -->
                  				<div class="badge badge-primary card-badge text-uppercase">
                  				  <c:out value='${now.a_state}'/>
                  				</div>

                  		<!-- Slider -->
                  		<div class="mb-4" data-flickity='{"draggable": false, "fade": true}' id="productSlider">

                    	<!-- Item -->
                    	<a href="/resources/img/peanuta.jpg" data-fancybox>
                      	<img src="/resources/img/peanuta.jpg" alt="..." class="card-img-top">
                    	</a>

                    	<!-- Item -->
                    	<a href="/resources/img/peanutb.jpeg" data-fancybox>
                      	<img src="/resources/img/peanutb.jpeg" alt="..." class="card-img-top">
                    	</a>

                    	<!-- Item -->
                    	<a href="/resources/img/peanut.jpg" data-fancybox>
                      	<img src="/resources/img/peanut.jpg" alt="..." class="card-img-top">
                    	</a>

                  </div>

                </div>

                <!-- Slider -->
                <div class="flickity-nav mx-n2 mb-10 mb-md-0" data-flickity='{"asNavFor": "#productSlider", "contain": true, "wrapAround": false}'>

                  <!-- Item -->
                  <div class="col-12 px-2" style="max-width: 113px;">

                    <!-- Image -->
                    <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(/resources/img/peanuta.jpg);"></div>

                  </div>

                  <!-- Item -->
                  <div class="col-12 px-2" style="max-width: 113px;">

                    <!-- Image -->
                    <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(/resources/img/peanutb.jpeg);"></div>

                  </div>

                  <!-- Item -->
                  <div class="col-12 px-2" style="max-width: 113px;">

                    <!-- Image -->
                    <div class="embed-responsive embed-responsive-1by1 bg-cover" style="background-image: url(/resources/img/peanut.jpg);"></div>

                  </div>

                </div>

              </div>			
		<!-- 이미지부분 끝 -->

					<div class="col-12 col-md-6 pl-lg-10">
	 <!-- Header -->
                <div class="row mb-1">
                  <div class="col">
					
						<div class="itemname">
							<h3 class="mb-4 border-bottom">
								<c:out value="${apply.aa_item_nm}" />
							</h3>
							<div class="nowstyle1">
								<div class="timestyle">
									<div><p class="time-title font-size-h6">경매 마감까지 남은 시간</p></div>
									<div class="time font-size-h5">
										<span class="hours"></span> <span class="col">:</span> <span
											class="minutes"></span> <span class="col">:</span> <span
											class="seconds"></span>
									</div>
								</div>
							</div>
							<div>
							<div class="mb-5 font-size-h6">
								<span>입찰 수</span> 
								<span class="forGreen"><c:out value="${countBid}" /></span>
								<span>회</span>
							</div>
								<div class="nowstyle1 mb-5 font-size-h6">
									<div>현재가</div>
									<div class="forGreen">
										<fmt:formatNumber value="${now.a_crnt_prc}" />
										<span>원</span>
									</div>
									<div class="forGreen">
										<c:out value="${bestmember}" />
									<span>님이 입찰했어요!</span>
									</div>
								</div>
								<div class="nowstyle1 mb-7 font-size-h6">
									<div class="nowstyle1 width50">
									<div>시작가</div>
									<div class="forGreen">
										<fmt:formatNumber value="${now.a_versifier}" />
										<span>원</span>
									</div>
									</div>
									
									<div class="nowstyle1 width50" style="margin-left: 3.2rem;">
										<div>바로 구매하기</div>
											<div class="forGreen">
												<fmt:formatNumber value="${now.a_wnng_prc}" />
												<span>원</span>
											</div>
									</div>
								</div>
								<div class="mb-5" style="text-align-last: justify;">
								<button class="btn btn-success btn-sm butstyle1" type="button" id="bid_regi" value="${now.a_bno}">나도 입찰하기</button>
								<button class="btn btn-success btn-sm butstyle1" data-oper='ship_regi'
									onclick="location.href='/auc/ship_regi?a_bno=<c:out value="${now.a_bno}"/>&c_num=<c:out value="${apply.c_num}"/>'">바로
									구매하기</button>
								</div>
							</div>
							
							<div>
							<ul class="list-group list-group-flush">
                 				 <li class="list-group-item active"><b>중량</b> <span><c:out value="${apply.aa_weight}" /></span></li>
              					 <li class="list-group-item"><b>원산지</b> <span><c:out value="${apply.aa_cntry_orgn}" /></span></li>
                  				 <li class="list-group-item"><b>배송</b> <span>수령까지 2~3일 정도 예상</span> <span class="forGreen text-decoration-underline">직접 수령 가능!!</span></li>
               				</ul>
							</div>
						</div>
					</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Product Details Section End -->
<section>
<div class="container">
	<div class="row">
		<div class="col-12">
			
			<!-- Nav -->
            <div class="nav nav-tabs nav-overflow justify-content-start justify-content-md-center border-bottom">
              <a class="nav-link active" data-toggle="tab" href="#bidlistTab">
                 입찰 내역
              </a>
              <a class="nav-link" data-toggle="tab" href="#descriptionTab">
                제품 설명
              </a>
            </div>
			
 <!-- Content -->
            <div class="tab-content">
              <div class="tab-pane fade show active" id="bidlistTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12">
                      <!-- 입찰내역출력 -->
							<div class="panel-body">
							<ul class="joinBid">
							</ul>
							</div>
							<div class="panel-footer"></div>
						<!-- 입찰내역끝 -->
					</div>
				</div>
			</div>
		</div>
		
		<div class="tab-pane fade" id="descriptionTab">
                <div class="row justify-content-center py-9">
                  <div class="col-12 col-lg-10 col-xl-8">
                    <div class="row">
                      <div class="col-12 col-md-6">
                      
                       <p class="mb-4">
                          <strong>제품설명아이우에오</strong>
                        </p>
                       </div>
                      </div>
                     </div>
                    </div>
                   </div>
                   
          </div>
         </div>
</div>
</div>
</div>
</section>
<!-- modal -->
<div class="modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">나도 입찰하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div>
      		<p>반드시 100원 단위로 입력해주세요.</p>
      	</div>
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">입찰금액</label>
            <input class="form-control" name="b_bid_price"	type="text">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">회원번호(임시)</label>
            <input class="form-control" name="m_num">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalRegisterBtn" class="btn btn-secondary" data-dismiss="modal">입찰하기</button>
        <button type="button" id="modalCloseBtn" class="btn btn-primary">닫기</button>
      </div>
    </div>
  </div>
</div>		


<style>
.secStyle {
	margin-top: 3rem;
}

.timestyle {
	display: flex;
	width : 100%;
	justify-content : space-between;
}

.hours, .minutes, .seconds {
	color: #44A379;
}

.nowstyle1 {
	display: flex;
	justify-content: space-between;
}


.width50 {
	width : 50%;
}

.itemname h3 {
	color: #44A379;
	margin : 5px;
	margin-top : 1rem;
}


.forGreen {
	color: #44A379;
}

.forGreen span{
	color: #000000;
}

.butstyle1 {
	background : #44A379;
	color : #ffffff;
	border-radius : 5px;
	border : none;
}


.bidstyle1{
	display : flex;
    justify-content: space-between;
}

.bidstyle2{
	margin-left: 10px;
}

ul, li{
	list-style : none;
}

</style>
<script type="text/javascript" src="/resources/jjs/auctionModal.js"></script>
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
<script>
$(document).ready(function(){

	var a_bnoValue = '<c:out value= "${now.a_bno}"/>';
	var bidUL = $(".joinBid");

	showList(1);
	
	function showList(page){
		
		console.log("show list :" + page);
		
		BidService.bidList({ a_bno : a_bnoValue, page : page || 1}, 
			function(bidCnt, bid_list){
			
				console.log("bidCnt : " + bidCnt);
				
				if(page == -1){
					pageNum = Math.ceil(bidCnt/10.0);
					showList(pageNum);
					return;
				}
				
				var str = "";
				
			if(bid_list == null || bid_list.length == 0){
				return;
			}
			
				for(var i = 0, len = bid_list.length || 0; i < len; i++){
				str += "<li class='bidstyle2 mb-5 font-size-h6 border-bottom' data-rno='"+bid_list[i].b_bno+"'>";
				str += " <strong><span class='material-icons md-36'>eco</span>"+bid_list[i].m_num+"님이";
				str += "<span class='forGreen bidstyle2' >"+bid_list[i].b_bid_price+"</span>원 입찰했어요!</strong>";
				str += " <small class='bidstyle2 font-size-xs text-gray-400'>" + bid_list[i].b_bid_time+"</small></li>";
			}
			
			bidUL.html(str);
			
			showBidPage(bidCnt);
			
		});
		}
	
	var modal = $(".modal");
	var modalInputBid = modal.find("input[name='b_bid_price']");
	var modalInputMnum = modal.find("input[name='m_num']");
	
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalCloseBtn = $("#modalCloseBtn");
	
	modalCloseBtn.on("click",function(e){
		$(".modal").modal("hide");
	});
	
	
	$("#bid_regi").on("click", function(e){
		
		modal.find("input").val("");
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		$(".modal").modal("show");
		
		});
	
	$("#checkout").on("click", function(e){
		
		var goShip = confirm("바로 구매하시겠습니까?");
		
		if(goShip == true) {
			e.preventDefault();
			
			self.location = "/auc/ship_regi"
		}
		
	});
	
	modalRegisterBtn.on("click",function(e){
		var bid = {				
				b_bid_price : modalInputBid.val(),
				m_num : modalInputMnum.val(),
				a_bno : a_bnoValue
		};
		
		BidService.bidAdd(bid, function(result){
			
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1);
		});
	});
	
	
	$("#bid_rem").on("click", function(e){
		
				
		alert("tttt");
		
		BidService.bidRemove(b_bno, function(result){
			
			alert(result);
		
		});
			
	});
	
	var pageNum = 1;
	var bidPageFooter = $(".panel-footer");
	
	function showBidPage(bidCnt){
		
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= bidCnt){
			endNum = Math.ceil(bidCnt/10.0);
		}
		
		if(endNum * 10 < bidCnt){
			next = true;
		}
		
		var str = "<ul class='pagination pagination-sm'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link page-link-arrow' href='"+(startNum -1) + "'> <i class='fa fa-caret-left'></i></a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
			
			var active = pageNum == i? "active":"";
			
			str += "<li class='page-item " + active + " '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			
			if(next){
				str += "<li class='page-item'><a class='page-link page-link-arrow' href='"+(endNum + 1)+"'><i class='fa fa-caret-right'></i></a></li>";
				
			}
				str += "</ul></div>";
				
				console.log(str);
				
				bidPageFooter.html(str);
				
				
			}
	}
	
	bidPageFooter.on("click","li a",function(e){
		
		e.preventDefault();
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
		
	});
		
});
</script>

<%@include file="../includes/footer.jsp"%>