<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
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
				<!-- <button id='regBtn' type="button" class="btn btn-xs pull-right">Register
					New Board</button> -->
				<input type="button" value="Register New Board" style="float: right;" onclick="location.href='/board/register'">
			</div>
			<!-- /.panel-heading -->
			<div>
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.q_bno}" /></td>

							<!-- 조회화면 이동 시 페이지 처리 -->
							<td><a class='move' href='<c:out value="${board.q_bno}"/>'>
									<c:out value="${board.q_title}" />   <b>[  <c:out value="${board.q_replyCnt}" />  ]</b>
							</a></td>

							<td><c:out value="${board.q_ncnm}" /></td>

							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.q_regdate}" /></td>
							<td><c:out value="${board.q_hits}" /></td> <!-- 조회수  -->
						</tr>
					</c:forEach>
				</table>
				
				<!-- 340p 추가 -->
				<div>
					<div>

						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 or 내용</option>
								<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 or 작성자</option>
								<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 or 내용 or 작성자</option>
							</select> 
							<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
							<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
							<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button>Search</button>
						</form>
					</div>
				</div>
				<!-- 340p 끝 -->

				<!-- 308p 페이지 처리 추가 -->
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

				<!-- 311p 추가 및 344p 수정-->
				<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
				</form>
				<!-- 311p, 344p 끝-->

			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						
						// 상단 등록 버튼(Register New Board) 처리
						$("#regBtn").on("click", function() {

							self.location = "/board/register";

						});

						// 312p 추가
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						// 312p 끝

						// 315p 추가
						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='q_bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/get");
											actionForm.submit();

										});
						
						// 342p 추가
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
						// 342p 끝
					});
</script>

<%@include file="../includes/footer.jsp"%>