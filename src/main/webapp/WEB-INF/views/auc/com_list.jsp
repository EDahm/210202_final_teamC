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
				업체 리스트
				<button id='regBtn' type="button" class="btn btn-success btn-xs">새
					업체 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-bordered table-sm mb-4">
					<thead>
						<tr class="font-size-h5">
							<th>#업체번호</th> 
							<th>업체명</th>
							<th>업종</th>
						</tr>
					</thead>

					<c:forEach items="${com_list}" var="company">
						<tr>
							<td><c:out value="${company.c_num}" /></td>
							<td><a class='move' href='<c:out value="${company.c_num}"/>'>
									<c:out value="${company.c_name}" /></a></td>
							<td><c:out value="${company.c_sector}" /></td>
						</tr>
					</c:forEach>
				</table>
				
					<div>
					<div>
						<form id='searchForm' action="/auc/com_list" method="get">
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq T? 'selected':''}"/>>업체번호</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq C? 'selected':''}"/>>업체명</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq W? 'selected':''}"/>>업종</option>								
							</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>						
						<button class="btn btn-success btn-circle btn-xxs mb-1"> <i class="fe fe-search"></i></button>
						</form>
					</div>
				</div>
				
				
								<div class='pull-right'>
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button page-item"><a class="page-link page-link-arrow" href="${pageMaker.startPage -1}">PREVIOUS</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button page-item ${pageMaker.cri.pageNum == num ? "active":""}"><a class="page-link" href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
							<li class="paginate_button page-item"><a class='page-link' href="${pageMaker.endPage +1 }">NEXT</a></li>
						</c:if>
						
					
					</ul>
				</div>
				<!-- END PAGINATION -->
			<form id='actionForm' action="/auc/com_list" method='get'>
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
	
	$("#regBtn").on("click",function(){
		self.location = "/auc/com_regi"
	});
	
	
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e){
		
		e.preventDefault();
		
		console.log('click');
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});

	$(".move").on("click", function(e){
		
		e.preventDefault();
		actionForm.append("<input type='hidden' name='c_num' value='"+
				$(this).attr("href")+"'>");
						actionForm.attr("action","/auc/com_get");
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