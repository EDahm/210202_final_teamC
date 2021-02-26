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
              <li class="breadcrumb-item">
                <a class="text-gray-400" href="/main">Home</a>
              </li>
              <li class="breadcrumb-item active">
                바로 구매하기
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
          <div class="col-12 text-center">    
			<h3 class="mb-2" style="color :  #44A379;">얼쑤좋다!</h3>
				<h2 class="mb-4">구매가 완료 되었습니다.</h2>
				
				<p class="mb-10 text-gray-500">구매해주셔서 감사합니다.</p>
		 </div>
	</div>
	<div class="row">
	<div class="col-lg-12 col-md-7">
		<!-- form -->
			<form role="form" action="/auc/ship_regi" method="post">
			
			<h6 class="mb-7 text-center" > 배송정보 입력</h6>
			
				<div class="row mb-9">
                <div class="col-12 col-md-6">
				
				<div class="form-group">
					<label>경매번호(임시)</label>
					<input type="text" class="form-control form-control-underline"  name="a_bno" value='<c:out value="${now.a_bno}"/>'>
				</div>
				
				
				<div class="form-group">
					<label>업체번호(임시)</label>
					<input type="text" class="form-control form-control-underline" name="c_num" value='<c:out value="${apply.c_num}"/>'>
				</div>
				<div class="form-group">
					<label>회원번호</label>
					<input class="form-control form-control-underline" name="m_num">
				</div>
				<div class="form-group">
					<label>배송지</label>
					<input class="form-control form-control-underline" name="s_shpng_addr">
				</div>
				<div class="form-group">
					<label>배송연락처</label>
					<input class="form-control form-control-underline" name="s_shpng_cntct">
				</div>
					<input type="hidden" name="s_shpng_stts">
				
				


               </div>
				</div>
				<button type="submit" class="btn btn-block btn-dark"> 배송신청 </button>		
			</form>
		
				</div>
			</div>
		</div>
		
</section>

<%@include file="../includes/footer.jsp"%>