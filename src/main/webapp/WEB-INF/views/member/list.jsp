<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>


<%@include file="../includes/header.jsp" %>

<div>
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
							<th>회원번호</th>
							<th>가입일</th>
							<th>이메일ID</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>연락처</th>
							<th>가입유형</th>
							<th>포인트</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="member">
						<tr>
							<td><a class='move' href='<c:out value="${member.m_num}"/>'>
									<c:out value="${member.m_num}" />
							</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${member.m_regdate}" /></td>
							<td><c:out value="${member.m_email}" /></td>
							<td><c:out value="${member.m_name}" /></td>
							<td><c:out value="${member.m_ncnm}" /></td>
							<td><c:out value="${member.m_contact}" /></td>
							<td><c:out value="${member.m_type}" /></td>
							<td><c:out value="${member.m_point}" /></td>
						</tr>
					</c:forEach>

				</table>

				<div>
					<div>

						<form id='searchForm' action="/member/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="M"
									<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>회원번호</option>
								<option value="E"
									<c:out value="${pageMaker.cri.type eq 'E'?'selected':''}"/>>이메일ID</option>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
								<option value="I"
									<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>닉네임</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>연락처</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-dafault'>Search</button>
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
				
				<form id='actionForm' action="/member/list" method='get'>
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

						self.location = "/member/register";

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
						actionForm
								.append("<input type='hidden' name='m_num' value='"
										+ $(this).attr(
												"href") + "'>");
						actionForm.attr("action", "/member/get");
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