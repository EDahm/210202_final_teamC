<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<section class="pt-7 pb-12" style="width: 70%;">
      <div class="container">
        <div class="row">
          <div class="col-12 text-center">
			<h3 class="mb-10">
				경매 신청
			</h3>
		  </div>
		 </div>
		 
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				
				<div class="form-group">
					<label>신청번호</label>
					<input class="form-control" name="aa_bno" value='<c:out value="${applyget.aa_bno}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>업체번호</label>
					<input class="form-control" name="c_num" value='<c:out value="${applyget.c_num}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>물품명</label>
					<input class="form-control" name="aa_item_nm" value='<c:out value="${applyget.aa_item_nm}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc" value='<c:out value="${applyget.aa_markt_prc}"/>'readonly="readonly">
				</div>
				<div class="form-group">
					<label>중량</label>
					<input class="form-control" name="aa_weight" value='<c:out value="${applyget.aa_weight}"/>'readonly="readonly">
				</div>
				<div class="form-group">
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn" value='<c:out value="${applyget.aa_cntry_orgn}"/>'readonly="readonly">
				</div>
				<div class="form-group">
					<label>희망기간</label>
					<input type="hidden">
					<fmt:parseDate var="aa_hope_prd" value="${applyget.aa_hope_prd}" pattern="yyyy-MM-dd" />
					<input type='date' class="form-control" name='aa_hope_prd' value='<fmt:formatDate pattern="yyyy-MM-dd"
					value="${aa_hope_prd}" />' readonly="readonly">
					
				</div>
				<div class='bigPictureWrapper'>
					<div class='bigPicture'>
					</div>
				</div>
				<div class="form-group">		
					<div>첨부 이미지</div>
					<div class="border rounded">			
						<div class='uploadResult'>
							<ul>
							</ul>
						</div>
					</div>
				</div>
				<button data-oper='apply_mod' class="btn btn-success btn-xs" onclick="location.href='/auc/apply_mod?aa_bno=<c:out value="${applyget.aa_bno}"/>'">수정</button>
				<button data-oper='apply_list' class="btn btn-outline-success btn-xs" onclick="location.href='/auc/apply_list'">목록</button>				
				<form id='operForm' action="/auc/apply_mod" method="get">
                        		<input type='hidden' id='bno' name='aa_bno' value='<c:out value="${applyget.aa_bno}"/>'>
                        		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                        		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                        		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
                        		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
                </form>
			</div>
		</div>
	</div>


</section>
</div>
</div>

<style>
.bigPictureWrapper{
	position : absolute;
	display : none;
	justify-content : center;
	align-items : center;
	top : 0%;
	width : 100%;
	height : 100%;
	background-color : gray;
	z-index : 100;
	background:rgba(255,255,255,0.5);
}

.bigPicture{
	position : relative;
	display : flex;
	justify-content : center;
	align-items : center;
}

.bigPicture img{
	width:600px;
}

ul li {
	list-style : none;
}
</style>


<script>
$(document).ready(function(){
 	(function(){
  		var aa_bno = '<c:out value="${applyget.aa_bno}"/>';
  
  		$.getJSON("/auc/getAttachList", {aa_bno : aa_bno}, function(arr){
  			
  			console.log(arr);
  			
  			var str = "";
  			
  			$(arr).each(function(i, attach){
  				
  				var fileCallPath = encodeURIComponent(attach.aa_upload_path+"/s_"+attach.aa_uuid+"_"+attach.aa_file_name);

					str += "<li data-path='"+attach.aa_upload_path+"' data-uuid='"+attach.aa_uuid+"' data-filename='"+attach.aa_file_name+"' data-type='"+attach.aa_file_type+"' ><div>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
					
  			});
  			
  			$(".uploadResult ul").html(str);
  		}); 
  	})();
 	
 	$(".uploadResult").on("click","li",function(e){
 		console.log("view image");
 		
 		var liObj = $(this);
 		
 		var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
 		
 		showImage(path.replace(new RegExp(/\\/g),"/"));
 	});
 	
 	function showImage(fileCallPath){
 	 		
 		$(".bigPictureWrapper").css("display","flex").show();
 		
 		$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
 		.animate({width:'100%',height:'100%'}, 1000);
 	}
 	
 	$(".bigPictureWrapper").on("click", function(e){
 		
 		$(".bigPicture").animate({width:'0%',height: '0%'}, 1000);
 		setTimeout(function(){
 			$('.bigPictureWrapper').hide();
 		}, 1000);
 		
 	});
});
</script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		var operForm = $("#operForm");
  		
  		$("button[data-oper='apply_mod']").on("click",function(e){
  			
  			operForm.attr("action","/auc/apply_mod").submit();
  			
  		});
  		
  		$("button[data-oper='apply_list']").on("click",function(e){
  			
  			operForm.find("#bno").remove();
  			operForm.attr("action","/auc/apply_list")
  			operForm.submit();
  			
  		});

  	});
  </script>				

<%@include file="../includes/footer.jsp"%>