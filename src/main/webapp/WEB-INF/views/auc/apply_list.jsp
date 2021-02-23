<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">경매 신청 조회</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				신청 리스트
				<button id='NowRegiBtn' type="button" class="btn btn-xs pull-right">
					경매 진행 등록</button>
				<button id='ApplyBtn' type="button" class="btn btn-xs pull-right">
					경매 신청하기</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#신청번호</th> 
							<th>업체번호</th>
							<th>물품명</th>
							<th>희망기간</th>
						</tr>
					</thead>

					<c:forEach items="${apply_list}" var="apply">
						<tr>
							<td><c:out value="${apply.aa_bno}" /></td>
							<td><c:out value="${apply.c_num}" /></td>
							<td><a class='moveApply' href='<c:out value="${apply.aa_bno}"/>'>
									<c:out value="${apply.aa_item_nm}" /></a></td>
							<!-- <td><c:out value="${apply.aa_hope_prd}" /></td> -->
							<td> <fmt:parseDate value="${apply.aa_hope_prd}" pattern="yyyy-MM-dd HH:mm:ss" var="hopeprd"/>
							 <fmt:formatDate value="${hopeprd}" pattern="yyyy-MM-dd"/>
						</tr>
					</c:forEach>
				</table>
				
				<div>
					<div>
						<form id='searchForm' action="/auc/apply_list" method="get">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq T? 'selected':''}"/>>물품명</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq C? 'selected':''}"/>>업체번호</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq W? 'selected':''}"/>>희망기간</option>								
							</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>						
						<button>Search</button>
						</form>
					</div>
				</div>
				
				<div>
					<ul>
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button"><a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button ${pagemaker.cri.pageNum == num ? "active" : "" } ">
							<a href="${num}"></a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button"><a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 페이징 끝 -->
				<form id="actionFormApply" action="/auc/apply_list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>			
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>			
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 이 페이지 ./div -->
</div>
</div>
<!-- nav ./div -->
			
<script type="text/javascript">
$(document).ready(function(){
	
	$("#NowRegiBtn").on("click",function(){
		self.location = "/auc/now_regi"
	});

	$("#ApplyBtn").on("click",function(){
		self.location = "/auc/apply_regi"
	});
	
	var actionForm = $("#actionFormApply");
	
	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".moveApply").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='aa_bno' value='"+
				$(this).attr("href")+"'>");
		actionForm.attr("action","/auc/apply_get");
		actionForm.submit();
	});
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e){
	
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요");
			return false;
		}
	
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요");
			return false;
		}
		
		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();
		
		searchForm.submit();
	
	});
	
});
</script>	

<%@include file="../includes/footer.jsp"%>