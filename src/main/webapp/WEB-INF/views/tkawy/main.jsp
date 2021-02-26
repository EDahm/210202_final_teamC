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
        <div class="row justify-content-center bg-cover" style="background-image: url(/resources/assets/img/tkawy/tkawy1.jpg); padding-top:2rem; padding-bottom: 20rem;">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5">

            <!-- Heading -->
            <h2 class="mb-0 text-center text-black" style="font-weight: bold;">
              한 번 버려진 플라스틱은<br /> 잘 재활용 되지 않아요
            </h2>
            <br/>
            <p style="color:grey; font-size: .75rem; text-align: center;">전세계에서 매년 최소 800만 톤의 플라스틱이 바다로 유출되지만 재활용되는 양은 전체의 단 7%에 불과합니다. 그리고 이 플라스틱이 분해되려면 500년의 시간이 필요하죠.</p>

          </div>
        </div>
        <div class="row bg-cover" style="background-image: url(/resources/assets/img/tkawy/tkawy2.jpg); padding-top:10rem; padding-bottom: 10rem;">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5.5">

            <!-- Heading -->
            <h2 class="mb-0 text-right text-white" style="font-weight: bold;">
              작은 플라스틱은<br /> 재활용이 더 어려워요
            </h2>
            <br/>
            <p style="color:black; font-size: 1rem; text-align: center;">너무 작은 플라스틱은 선별 공정에서 분리되기가 어려워 재활용이 될 수 없어요.</p>

          </div>
        </div>
      </div>
    </section>



	<%@include file="../includes/footer.jsp"%>