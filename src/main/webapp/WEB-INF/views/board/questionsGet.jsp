<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<head>
<script type="text/javascript" src="/resources/jjs/reply.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<style>
.modal {
display: contents; 
position: unset;
}
</style>

<section class="pt-7 pb-12">
	<div class="container">
		<div class="row">
			<div class="col-12 text-left">
				<h3 class="mb-10">Test</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-3">
				<nav class="mb-10 mb-md-0">
					<div class="list-group list-group-sm list-group-strong list-group-flush-x">
						<a class="list-group-item list-group-item-action dropright-toggle "	href="#">공지사항 </a> 
						<a class="list-group-item list-group-item-action dropright-toggle "	href="/board/questionsList">게시판 </a>
					</div>
				</nav>		
			</div>
			
			<div class="col-12 col-md-9 col-lg-8 offset-lg-1" style="border:1px solid #e5e5e5; border-radius:15px;">
				<div class="table table-boardered table-hover" id="board2" style="font-size:0.8rem;" style="border:1px solid #e5e5e5;">
					<form id='operForm' action="/board/questionsGet" method="post">
						<a class="mmmmm" href="/board/questionsList" style="color:#28a745;">QnA게시판 ></a>
						<!-- 제목 -->
						<div class="form-group" style="margin-bottom:0;">
							<input class="form-control" style="border:none; font-size:1.5rem; background-color:white; height:50px;" name='q_title' value='<c:out value="${board.q_title}"/>' readonly="readonly">
							<input class="form-control" style="border:none; background:white; padding:0rem 1.5rem; height:20px; font-size:0.8rem;" name='q_ncnm' value='<c:out value="${board.q_ncnm}"/>' readonly="readonly">
							<input class="form-control" style="border:none; background:white; padding:0rem 1.5rem; height:20px; font-size:0.3rem; border-bottom:1px solid #e5e5e5;" name='q_regdate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.q_regdate}" />' readonly="readonly"><br>
						</div>	
						<!-- 내용 -->
						<div class="form-group">
							<input class="form-control" style="border:none; background:white; border-bottom:1px solid #e5e5e5; height:200px; font-size:1rem;" name='q_content' value='<c:out value="${board.q_content}"/>' readonly="readonly">
						</div>
					
						<!-- 게시글 번호 hidden -->
						<div class="form-group"> 
							<input class="form-control" type="hidden" style="border:none;" name='q_bno' value='<c:out value="${board.q_bno}"/>' readonly="readonly">
						</div>
						
						<button data-oper='questionsModify' class="btn btn-success btn-xs" style="padding:0.25rem 0.5rem; border-radius:5px; margin:3px;">수정</button>
						<button data-oper='questionsList' class="btn btn-success btn-xs" style="padding:0.25rem 0.5rem; border-radius:5px; margin:3px;">목록</button>
						<button data-oper='questionsRemove' class="btn btn-success btn-xs" style="padding:0.25rem 0.5rem; border-radius:5px; margin:3px;">삭제</button>
	
						<input type='hidden' id='q_bno' name='q_bno' value='<c:out value="${board.q_bno}"/>'> 
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
						<input type='hidden' name='keyword'	value='<c:out value="${cri.keyword}"/>'>
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					</form>
				</div>
			
			<!-- /.panel-body -->
		
		<div class="modal">
		
			<div class="form-group">
				<label>댓글</label>
				<input class="form-control" name='qr_reply' value=''>
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input class="form-control" name='qr_replyer' value=''>
			</div>
			
			<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
		
		</div>
		
		<!-- /.panel -->
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i> Reply
		<!-- 718p -->
		<!-- <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button> -->
		</div>      
		
		
		<!-- /.panel-heading -->
		<div class="panel-body modal">        
		
			<ul class="chat">
				<!-- Start reply -->
				<li class="left clearfix" data-ron='12'>
					<div>
						<div class="header">
							<strong class="primary-font">user00</strong>
							<small class="pull-right text-muted">2018-01-01 13:13</small>
						</div>
						<p>Good job!</p>
					</div>
				</li>
			<!-- End reply -->
			</ul>
		<!-- ./ end ul -->
		</div>
		<div class="panel-footer" id="replyList"></div>
		</div>
	</div>
</div>
</section>

<script type="text/javascript">
$(document).ready(function() {
	
	console.log("===================");
	console.log("JS TEST");
	
	var bnoValue = '<c:out value="${board.q_bno}"/>';
	var replyUL = $(".chat");
 
	showList(1);
   
	function showList(page){

		console.log("show list " + page);
	   

 		QnaReplyService.getList({q_bno:bnoValue, page: page|| 1 }, function(q_replyCnt, list) {
 			
		console.log("replyCnt: "+ q_replyCnt );
		console.log("list: " + list);
		console.log(list);
	   
 		if(page == -1){
		  pageNum = Math.ceil(q_replyCnt/10.0);
		  showList(pageNum);
		  return;
		}
	   
		var str="";
		
		if(list == null || list.length == 0){
			return;
		}
	  
	  
		for (var i = 0, len = list.length || 0; i < len; i++) {
		    str +="<li class='left clearfix' data-qr_rno='"+list[i].qr_rno+"'>";
		    str +="  <div><div class='header'><strong class='primary-font'>[<span class='test'>"
		 	   +list[i].qr_rno+"</span>] "+list[i].qr_replyer+"</strong>"; 
		    str +="    <small class='pull-right text-muted'>"
		        +QnaReplyService.displayTime(list[i].qr_regdate)+"</small>";
		    str +="    <p id='con'>"+list[i].qr_reply+"</p><input id='inputdis' style='display:none' type='text' value='"+list[i].qr_reply+"'></div>";
		    str += "<button id='hidebutton' type='button' class='testMod' style='display: none;'>저장</button>";
		    str +="<button id='modalModBtn' type='button' class='btn btn-default'>" + '수정' + "</button>";
		    str +="<button id='modalRemoveBtn' type='button' class='btn btn-default'>" + '삭제' + "</button>" + "</div></li>";
		    
		} 
	  
		replyUL.html(str);
		
		showReplyPage(q_replyCnt);


	});
	}
		
    //버튼처리
    
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='qr_reply']");
	var modalInputReplyer = modal.find("input[name='qr_replyer']");
	var modalInputReplyDate = modal.find("input[name='qr_regdate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	modalRegisterBtn.on("click", function(){

		var rreply = {
			qr_reply: modalInputReply.val(),
			qr_replyer: modalInputReplyer.val(),
			q_bno:bnoValue
		};
		
		QnaReplyService.add(rreply, function(){

			showList(-1);
		})
	});
	
	
	$(document).on("click", '#modalModBtn', function(){
		
		$(this).hide();
		$(this).parent().find('#con').hide();
		$(this).parent().find('#hidebutton').show();
		$(this).parent().find('#inputdis').show();
		
	});
	
	$(document).on("click", '#hidebutton', function(){
		
 		var qr_rno = $(this).parent().find(".test").text();
 		var qr_reply = $(this).parent().find("#inputdis").val();
 		var qr_reply = $(this).parent().find('#inputdis').val();
		
		var rreply = {qr_rno, qr_reply};
		
		QnaReplyService.update(rreply, function(){
			
			showList(pageNum);
		});
	});
	
	$(document).on("click", '#modalRemoveBtn', function(){

		var qr_rno = $(this).parent().find(".test").text();
		
		QnaReplyService.remove(qr_rno, function(){
			
			showList(pageNum);
		});
	});
	
	
	QnaReplyService.get(10, function(data){
		console.log(data);
	});
	
	var pageNum = 1;
	var replyPageFooter = $("#replyList");
	
	function showReplyPage(q_replyCnt){
	 
		var endNum = Math.ceil(pageNum / 10.0) * 10;  
		var startNum = endNum - 9; 
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= q_replyCnt){
		  endNum = Math.ceil(q_replyCnt/10.0);
		}
		
		if(endNum * 10 < q_replyCnt){
		  next = true;
		}
		
		var str = "<ul class='pagination pagination-sm text-gray-400'>";
		
		if(prev){
			str+= "<li class='page-item'><a class='page-link page-link-arrow' href='"+(startNum -1)+"'><i class='fa fa-caret-left'></i></a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
		  
			var active = pageNum == i? "active":"";
			
			str+= "<li class='page-item active"+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
			str+= "<li class='page-item'><a class='page-link page-link-arrow' href='"+(endNum + 1)+"'><i class='fa fa-caret-right'></i></a></li>";
		}
		
		str += "</ul></div>";
		
		console.log(str);
		
		replyPageFooter.html(str);
	}
//paging - end-------------------------

	//페이지 번호 클릭 이벤트
	replyPageFooter.on("click","li a", function(e){
		
		e.preventDefault();
		
		console.log("page click");
		
		var targetPageNum = $(this).attr("href");
		
		console.log("targetPageNum: " + targetPageNum);
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	}); 
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	

	var operForm = $("#operForm");

	$("button[data-oper='questionsModify']").on("click", function(e) {
		operForm.attr("action", "/board/questionsModify").submit();
	});

	$("button[data-oper='questionsList']").on("click", function(e) {
		operForm.find("#q_bno").remove();
		operForm.attr("action", "/board/questionsList").attr("method","get").submit();
	});

	$("button[data-oper='questionsRemove']").on("click", function(e){
		operForm.attr("action", "/board/questionsRemove").submit();
	});
});
</script>
<%@include file="../includes/footer.jsp"%>