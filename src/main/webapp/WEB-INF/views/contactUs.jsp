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
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="/main">Main</a>
              </li>
              <li class="breadcrumb-item active">
                About
              </li>
              <li class="breadcrumb-item active">
                제휴문의
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

    <!-- CONTENT -->
    <section class="pt-7 pb-12">
      <div class="container">
        <div class="row">
          <div class="col-12">
	<hr>
            <!-- Heading -->

          </div>
        </div>
        <div class="row justify-content-between">
          <div class="col-12 col-md-4 col-xl-3">
            <aside class="mb-9 mb-md-0">

              <!-- Heading -->
              <h6 class="mb-6">
                <i class="fe fe-phone text-primary mr-4"></i> Call to Us:
              </h6>

              <!-- Text -->
              <p class="text-gray-500">
                월-금 10 am - 06 pm
              </p>
  
              <p class="mb-0">
                <strong>Number:</strong><br>
                <a class="text-gray-500">00-0000-0000</a>
              </p>

              <!-- Divider -->
              <hr>

              <!-- Heading -->
              <h6 class="mb-6">
                <i class="fe fe-mail text-primary mr-4"></i> Write to Us:
              </h6>

              <!-- Text -->
              <p class="text-gray-500">
               양식을 작성하여 메일을 보내주시면 24시간 내에 답해드립니다.
              </p>
              <p class="mb-0">
                <strong>Address:</strong><br>
                <a class="text-gray-500">gooodforearth@gmail.com</a>
              </p>

              <!-- Divider -->
              <hr>

            </aside>
          </div>
          <div class="col-12 col-md-8">

            <!-- Form -->
            <form>

              <!-- Email -->
              <div class="form-group">
                <label class="sr-only" for="contactName">
                  Your Name *
                </label>
                <input class="form-control form-control-sm" id="contactName" type="text" placeholder="이름 *" required>
              </div>

              <!-- Email -->
              <div class="form-group">
                <label class="sr-only" for="contactEmail">
                  Your Email *
                </label>
                <input class="form-control form-control-sm" id="contactEmail" type="email" placeholder="메일주소 *" required>
              </div>

              <!-- Email -->
              <div class="form-group">
                <label class="sr-only" for="contactTitle">
                  Title *
                </label>
                <input class="form-control form-control-sm" id="contactTitle" type="text" placeholder="제목 *" required>
              </div>

              <!-- Email -->
              <div class="form-group mb-7">
                <label class="sr-only" for="contactMessage">
                  Message *
                </label>
                <textarea class="form-control form-control-sm" id="contactMessage" rows="5" placeholder="내용 *" required></textarea>
              </div>

              <!-- Button -->
              <button class="btn btn-dark" style="background: #44A379; border: none; margin: 0 auto;">
                전송하기
              </button>

            </form>

          </div>
        </div>
      </div>
    </section>

	
	<%@include file="includes/footer.jsp"%>
	