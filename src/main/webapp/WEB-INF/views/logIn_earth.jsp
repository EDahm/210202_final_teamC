<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="includes/header.jsp"%>

<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 font-size-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="/main">Main</a></li>
					<li class="breadcrumb-item active">로그인</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<!-- CONTENT -->
<section class="pt-8 pb-12">
	<div class="container">

		<div class="row justify-content-center">
			<div class="col-5">

				<h2 style="margin-bottom: 0; font-weight: bold;">L O G I N</h2>
				<p style="font-size: .8rem; color: grey;">지구를 위한 시작 얼쑤좋다에 오신 것을
					환영합니다.
				<p>
				<div class="row mb-9">

					<div class="col-12">
						<div class="form-group">
							<input class="form-control form-control-sm" name='m_name'
								placeholder="메일 아이디 *" id="name_input"
								style="border: none; border-bottom: 1px solid #e5e5e5;">
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<input type="password" class="form-control form-control-sm" name='m_ncnm'
								placeholder="비밀번호 *" id="ncnm_input"
								style="border: none; border-bottom: 1px solid #e5e5e5;">
						</div>
					</div>

					<button class="btn btn-block btn-dark"
						style="background: #44A379; border-color: white;" type="submit"
						id="join_button" data-oper='afterSignUp'>로그인</button>


					<div class="col-12 col-md-6"
						style="padding-left: 0; font-size: .9rem;">
						<a href="/member/beforeSignUp">회원가입</a>
					</div>
					<div class="col-12 col-md-6"
						style="text-align: right; padding-right: 0; font-size: .9rem;">
						<a href="#">아이디 비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<%@include file="includes/footer.jsp"%>
