<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 font-size-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/main">Main</a></li>
					<li class="breadcrumb-item active">마이페이지</li>
				</ol>

			</div>
		</div>
	</div>
</nav>
<!-- CONTENT -->
<section class="py-11">
	<div class="container">
		<div class="row">
			<div class="col-12 col-md-4 col-lg-3">
			
			<!-- Filters -->
				<form class="mb-10 mb-md-0">
					<ul class="nav nav-vertical" id="filterNav">
						<li class="nav-item">
							<!-- Toggle --> <a
							class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6"
							data-toggle="collapse" href="#categoryCollapse"> 내정보관리 </a> <!-- Collapse -->
							<div class="collapse show" id="categoryCollapse">
								<div class="form-group">
									<ul class="list-styled mb-0" id="productsNav" style = "font-size:0.9rem;">
										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 내정보조회 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 그린포인트 조회 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 회원탈퇴 </a></li>
									</ul>
								</div>
							</div>

						</li>


						<li class="nav-item">
							<!-- Toggle --> <a
							class="nav-link dropdown-toggle font-size-lg text-reset border-bottom mb-6"
							data-toggle="collapse" href="#categoryCollapse2"> 참여내역 </a> <!-- Collapse -->
							<div class="collapse" id="categoryCollapse2">
								<div class="form-group">
									<ul class="list-styled mb-0" id="productsNav" style = "font-size:0.9rem;">
										<li class="list-styled-item"><a class="list-styled-link"
											href="#"> 플라스틱 수거 예약내역 </a></li>

										<li class="list-styled-item"><a class="list-styled-link"
											href="/auc/myAuction"> 경매 참여내역 </a></li>
									</ul>
								</div>
							</div>

						</li>
					</ul>
				</form>
			</div>
			
			
<div class="row">
	<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>입찰번호</th> 
							<th>경매번호</th> 
							<th>회원번호</th>
							<th>입찰가격</th>
							<th>입찰시간</th>
							<th>입찰상태</th>
						</tr>
					</thead>

					<c:forEach items="${myAuclist}" var="bid">
						<tr>
							<td><c:out value="${bid.b_bno}" /></td>
							<td><c:out value="${bid.a_bno}" /></td>
							<td><c:out value="${bid.m_num}" /></td>
							<td><c:out value="${bid.b_bid_price}" /></td>
							<td><c:out value="${bid.b_bid_time}" /></td>
							<td><c:out value="${bid.b_bid_state}" /></td>
						</tr>
					</c:forEach>
				</table>
				
					<div>
					<div>
						<form id='searchForm' action="/auc/bid_list" method="get">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq T? 'selected':''}"/>>경매번호</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq C? 'selected':''}"/>>회원번호</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq W? 'selected':''}"/>>입찰상태</option>								
							</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>						
						<button>Search</button>
						</form>
					</div>
				</div>
								<div class='pull-right'>
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">PREVIOUS</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">NEXT</a></li>
						</c:if>
						
					
					</ul>
				</div>
				<!-- END PAGINATION -->
			</div>
	
			</div>
		</div>
	</div>
</section>


			<form id='actionForm' action="/auc/bid_list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>			
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
			</form>	
<script type="text/javascript">
$(document).ready(function(){

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
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