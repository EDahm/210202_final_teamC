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
					<li class="breadcrumb-item active">회원가입</li>
					<li class="breadcrumb-item active">가입완료</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

    <!-- CONTENT -->
    <section class="py-12">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 col-xl-6 text-center">

            <!-- Icon -->
            <div class="mb-7 font-size-h1">❤️</div>

            <!-- Heading -->
            <h2 class="mb-5">회원가입이 완료되었습니다</h2>

            <!-- Text -->
            <p class="mb-7 text-gray-500">
              <span class="text-body text-decoration-strong"><c:out value="${result }"/></span> 님 얼쑤좋다와 함께하게 되신 것을 환영합니다!
            </p>

            <!-- Button -->
            <a class="btn btn-dark" href="/logIn" style="background: #44A379; border: none;">
              	로그인하기
            </a>

          </div>
        </div>
      </div>
    </section>


<%@include file="../includes/footer.jsp"%>