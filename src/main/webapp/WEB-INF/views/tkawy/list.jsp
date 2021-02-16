<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>


<%@include file="../includes/header.jsp" %>

<div >
	<div>
		<h1>Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div>
	<div>
		<div>
			<div>
				Board List Page
				<button id='regBtn' type="button">Register
					New Board</button>
			</div>
			<!-- /.panel-heading -->
			<div>
				<table>
					<thead>
						<tr>
							<th>예약번호</th>
							<th>회원번호</th>
							<th>예약일자</th>
							<th>연락처</th>
							<th>일반플라스틱</th>
							<th>플라스틱병뚜껑</th>
							<th>수거예약업체</th>
							<th>수거예약일</th>
							<th>진행상태</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="tkawy">
						<tr>
							<td><a class='move'
								href='<c:out value="${tkawy.t_bno}"/>'><c:out
										value="${tkawy.t_bno}" /></a></td>
							<td><c:out value="${tkawy.m_num}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${tkawy.t_regdate}" /></td>
							<td><c:out value="${tkawy.t_contact}" /></td>
							<td><c:out value="${tkawy.t_plastic}" /></td>
							<td><c:out value="${tkawy.t_plastic_cap}" /></td>
							<td><c:out value="${tkawy.t_vstng_cmpny}" /></td>
							<td><input type="hidden"> <fmt:parseDate
									var="t_date_vist" value="${tkawy.t_date_vist}"
									pattern="yyyy-MM-dd" />
								<fmt:formatDate pattern="yyyy-MM-dd" value="${t_date_vist}" /></td>
							<td><c:out value="${tkawy.t_progress}" /></td>
						</tr>
					</c:forEach>

				</table>

				<div>
					<div>

						<form id='searchForm' action="/tkawy/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>예약번호</option>
								<option value="M"
									<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>회원번호</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>연락처</option>
								<option value="V"
									<c:out value="${pageMaker.cri.type eq 'V'?'selected':''}"/>>수거예정업체</option>
								<option value="P"
									<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>진행상태</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button>Search</button>
						</form>
					</div>
				</div>


				<div>
					<ul>

						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!-- end Pagination -->
				
				<form id='actionForm' action="/tkawy/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>
				


			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
            
            <script type="text/javascript">
				$(document).ready(function() {
					
					// 상단 등록 버튼(Register New Board) 처리
					$("#regBtn").on("click", function() {

						self.location = "/tkawy/register";

					});
					
					// 312p 추가
					var actionForm = $("#actionForm");

					$(".paginate_button a").on("click", function(e) {

						e.preventDefault();

						console.log('click');

						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					});
					// 312p 끝
					
					// 315p 추가
					$(".move").on("click", function(e) {

						e.preventDefault();
						actionForm.append("<input type='hidden' name='t_bno' value='"
										+ $(this).attr(
												"href") + "'>");
						actionForm.attr("action", "/tkawy/get");
						actionForm.submit();

					});
					
					
					var searchForm = $("#searchForm");
					
					$("#searchForm button").on("click", function(e) {
						
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

            
  <%@include file = "../includes/footer.jsp" %>