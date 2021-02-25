<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-12 col-md-6">

						<!-- 이미지부분 -->
						<div class="card">
							<div class="mb-4">
								<img src='/resources/img/fruit_mikan_set.png' />
							</div>
						</div>
						<!-- 이미지부분 끝 -->
					</div>

					<div class="col-12 col-md-6 pl-lg-10">
						<div class="itemname">
							<h3 class="mb-2"><c:out value="${apply.aa_item_nm}" /></h3>
							<div class="nowstyle1">
								<div class="countstyle">
									<span>입찰 수</span> <span><c:out value="${countBid}" />명</span>
								</div>
								<div class="timestyle">
									<p class="time-title">경매 마감까지 남은 시간</p>
									<div class="time font40">
										<span class="hours"></span> <span class="col">:</span> <span
											class="minutes"></span> <span class="col">:</span> <span
											class="seconds"></span>
									</div>
								</div>
							</div>
							<div>

								<div>
									<div>현재가</div>
									<div>
										<fmt:formatNumber value="${now.a_crnt_prc}" />
										원
									</div>
									<div>현재입찰자</div>
									<div>
										<c:out value="${bestmember}" />
										님
									</div>
								</div>
								<div>
									<div>시작가</div>
									<div>
										<fmt:formatNumber value="${now.a_versifier}" />
										원
									</div>
									<div>바로 구매하기</div>
									<div>
										<fmt:formatNumber value="${now.a_wnng_prc}" />
										원
									</div>
								</div>
								<button data-oper='ship_regi'
									onclick="location.href='/auc/ship_regi?a_bno=<c:out value="${now.a_bno}"/>&c_num=<c:out value="${apply.c_num}"/>'">바로
									구매하기</button>
							</div>

							<div>
								<ul>
									<li><b>중량</b> <span><c:out
												value="${apply.aa_weight}" /></span></li>
									<li><b>원산지</b> <span><c:out
												value="${apply.aa_cntry_orgn}" /></span></li>
									<li><b>배송</b> <span>수령까지 2~3일 정도 예상 <samp>직접
												수령 가능!!</samp></span></li>
									<li><b>Share on</b>
										<div class="share">
											<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
												class="fa fa-twitter"></i></a> <a href="#"><i
												class="fa fa-instagram"></i></a> <a href="#"><i
												class="fa fa-pinterest"></i></a>
										</div></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Product Details Section End -->
<div class="container">
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-12 col-md-6">
					<div>
						<div>
							입찰 참가 내역 출력
							<button type="button" id="bid_regi" value="${now.a_bno}">나도
								입찰하기</button>
						</div>

						<div></div>
						<div class="panel-body">
							<ul class="joinBid">
							</ul>
						</div>
						<div class="panel-footer"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 id="modal-title" class="modal-title"></h4>
					</div>
					<div class="modal-body">
						<table class="table">
							<tr>
								<td>입찰금액</td>
								<td><input class="form-control" name="b_bid_price"
									type="text"></td>
								<td><input class="form-control" name="m_num"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button id="modalRegisterBtn" type="button"
							class="btn btn-warning">submit</button>
						<button id="modalCloseBtn" type="button" class="btn btn-default"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<style>
.timestyle{
	display : flex;
}

.nowstyle1{
	display : flex;
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
				str += "<li data-rno='"+bid_list[i].b_bno+"'>";
				str += " <div><div><strong>"+bid_list[i].m_num+"님이</strong>";
				str += " <small>" + bid_list[i].b_bid_time+"</small></div>";
				str += " <p>"+bid_list[i].b_bid_price+"원 입찰했어요!</p></div></li>";
			}
			
			bidUL.html(str);
			
			showBidPage(bidCnt);
			
		});
		}
	
	var modal = $(".modal");
	var modalInputBid = modal.find("input[name='b_bid_price']");
	var modalInputMnum = modal.find("input[name='m_num']");
	
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	
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
			
			alert(result);
			
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
		
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1) + "'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
			
			var active = pageNum == i? "active":"";
			
			str += "<li class='page-item" + active + "'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
				
			}
				str += "</ul></div>";
				
				console.log(str);
				
				bidPageFooter.html(str);
				
				
			}
	}
		
});
</script>

<%@include file="../includes/footer.jsp"%>