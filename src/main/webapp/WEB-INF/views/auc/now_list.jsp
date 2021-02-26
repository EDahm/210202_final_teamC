<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<section class="pt-7 pb-12">
  <div class="container">
        <div class="row">
		<div class="col-12">
			<div class="font-size-h4 mb-4" style="color : #44A379;">
				경매 진행 리스트
				<button id='NowRegiBtn' type="button" class="btn btn-success btn-xs">
					경매 진행 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div>
				<table class="table table-bordered table-sm mb-4">
					<thead>
						<tr class="font-size-h5">
							<th>경매번호</th> 
							<th>신청번호</th>
							<th>시작가</th>
							<th>현재가</th>
							<th>바로 구매가격</th>
							<th>경매상태</th>
							<th>진행기간</th>
						</tr>
					</thead>

					<c:forEach items="${now_list}" var="nowlist">
						<tr>
							<td><a class='moveNow' href='<c:out value="${nowlist.a_bno}"/>'>
									<c:out value="${nowlist.a_bno}" /></a></td>						
							<td><a class='moveApply' href='<c:out value="${nowlist.aa_bno}"/>'>
							<c:out value="${nowlist.aa_bno}" /></a></td>
							<td><c:out value="${nowlist.a_versifier}" /></td>
							<td><c:out value="${nowlist.a_crnt_prc}" /></td>
							<td><c:out value="${nowlist.a_wnng_prc}" /></td>
							<td><c:out value="${nowlist.a_state}" /></td>
							<td><fmt:parseDate value="${nowlist.a_prgrs_prd}" pattern="yyyy-MM-dd HH:mm:ss" var="prgrsprd"/>
							 <fmt:formatDate value="${prgrsprd}" pattern="yyyy-MM-dd"/>
						</tr>
					</c:forEach>
				</table>
								<div>
					<div class="input-group input-group-merge">
						<form id='searchForm' action="/auc/now_list" method="get">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq T? 'selected':''}"/>>경매번호</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq C? 'selected':''}"/>>진행상태</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq W? 'selected':''}"/>>진행기간</option>								
							</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>						
						<button class="btn btn-success btn-circle btn-xxs mb-1"> <i class="fe fe-search"></i></button>
						</form>
					</div>
				</div>
								<div>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button page-item"><a class="page-link page-link-arrow" href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button page-item ${pagemaker.cri.pageNum == num ? "active" : "" } ">
							<a class="page-link" href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button page-item"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 페이징 끝 -->
				<form id="actionForm" action="/auc/now_list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>	
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>			
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>					
				</form>
			</div>
		</div>
	</div>
</div>
</section>	
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#NowRegiBtn").on("click",function(){
		self.location = "/auc/now_regi"
	});

		
	var actionForm = $("#actionForm");
	
	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".moveNow").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='a_bno' value='"+
				$(this).attr("href")+"'>");
		actionForm.attr("action","/auc/now_get");
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