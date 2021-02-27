<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


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
                Plastic Project
              </li>
              <li class="breadcrumb-item active">
                플라스틱 프로젝트 소개
              </li>
            </ol>

          </div>
        </div>
      </div>
    </nav>

	    <!-- 이미지 -->
    <section>
      <div class="container">
        <div class="row justify-content-center bg-cover" style="background-image: url(/resources/assets/img/tkawy/tkawy1.jpg);" style="padding-top:5rem; padding-bottom: 50rem;">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5">

            <!-- Heading -->
            <h2 class="mb-0 text-center text-black" style="font-weight: bold;">
              한 번 버려진 플라스틱은<br /> 잘 재활용 되지 않아요
            </h2>

          </div>
        </div>
      </div>
    </section>



	<%@include file="../includes/footer.jsp"%>