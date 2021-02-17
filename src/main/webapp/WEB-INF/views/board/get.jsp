<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div>
	<div>
		<h1>Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div>
	<div>
		<div>

			<div>Board Read Page</div>
			<!-- /.panel-heading -->
			<div>

				<div>
					<label>번호</label> <input name='q_bno'
						value='<c:out value="${board.q_bno }"/>' readonly="readonly">
				</div>

				<div>
					<label>제목</label> <input name='q_title'
						value='<c:out value="${board.q_title }"/>' readonly="readonly">
				</div>

				<div>
					<label>내용</label>
					<textarea rows="3" name='q_content'
						readonly="readonly"><c:out value="${board.q_content}" /> </textarea>
				</div>

				<div>
					<label>닉네임</label> <input name='q_ncnm'
						value='<c:out value="${board.q_ncnm }"/>' readonly="readonly">
				</div>

				<button data-oper='modify'>Modify</button>
				<button data-oper='list'>List</button>

				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='q_bno' name='q_bno'
						value='<c:out value="${board.q_bno}"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row. -->

<div class="container">
	<form id="replyForm" name="replyForm" method="post">
		<br>
		<br>
		<div>
			<div>
				<span><strong>Comments</strong></span> <span id="cCnt"></span>
			</div>
			<div>
				<table class="table">
					<tr>
						<td><textarea style="width:100%" rows="3" cols="30"
								id="qr_replyer" name="comment" placeholder="댓글을 입력하세요."></textarea>
							<br>

							<div class="form-group">
								<button type="button" id="replyBtn" class="btn pull-right btn-success">등록</button>
								<a id="replyBtn" href= "#" role="button" class="btn pull-right btn-success">등록</a>	
							</div>
							
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<div class="container">
	<form id="commentListForm" name="commentListForm" method="post">
		<div id="commentList"></div>
	</form>
</div>





<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#q_bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>
