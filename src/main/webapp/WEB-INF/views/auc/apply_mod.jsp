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
				경매 진행정보 수정
				</h3>
		  </div>
		 </div>
			
			<div class="row">
				<div class="col-12 col-md-9 col-lg-8 offset-lg-1">
				
			<form role="form" action="/auc/apply_mod" method="post">
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
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
					<input class="form-control" name="aa_item_nm" value='<c:out value="${applyget.aa_item_nm}"/>'>
				</div>
				<div class="form-group">
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc" value='<c:out value="${applyget.aa_markt_prc}"/>'>
				</div>
				<div class="form-group">
					<label>중량</label>
					<input class="form-control" name="aa_weight" value='<c:out value="${applyget.aa_weight}"/>'>
				</div>
				<div class="form-group">
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn" value='<c:out value="${applyget.aa_cntry_orgn}"/>'>
				</div>
				<div class="form-group">
					<label>희망기간</label><!-- datepicker 써야함 -->
					<input type="hidden">
					<fmt:parseDate var="aa_hope_prd" value="${applyget.aa_hope_prd}" pattern="yyyy-MM-dd" />
					<input type='date' class="form-control" name='aa_hope_prd' value='<fmt:formatDate pattern="yyyy-MM-dd"
					value="${aa_hope_prd}" />'>
				</div>
				<div class="form-group">
					<div>첨부 이미지</div>
					<div class="border rounded">
						<div class='uploadDiv'>
							<div class="input-group mb-3">
 								 <div class="input-group-prepend">
   								 <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
 								 </div>
  							<div class="custom-file">
    						<input type="file" class="custom-file-input" name='uploadFile' multiple="multiple" aria-describedby="inputGroupFileAddon01">
							<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
  </div>
</div>
						</div>
						<div class='uploadResult'>
						<ul>
						</ul>
						</div>
					</div>
				</div>				
				<button class="btn btn-success btn-xs" type="submit" data-oper='apply_mod'>수정</button>
				<button class="btn btn-danger btn-xs" type="submit" data-oper='apply_rem'>삭제</button>
				<button class="btn btn-outline-success btn-xs" type="submit" data-oper='apply_list'>목록</button>
				</form>				
			</div>
		</div>
		</div>
	</section>
	</div>
</div>

<div class='bigPictureWrapper'>
	<div class='bigPicture'>
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
</style>


	<script type="text/javascript">
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click",function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'apply_rem'){
			formObj.attr("action","/auc/apply_rem");
			
		} else if(operation === 'apply_list'){
			
			formObj.attr("action", "/auc/apply_list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		} else if(operation === 'apply_mod'){
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				
				var jobj = $(obj);
				
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].aa_file_name'value='"+jobj.data("filename")+"'>";
 				str += "<input type='hidden' name='attachList["+i+"].aa_uuid'value='"+jobj.data("uuid")+"'>";
 				str += "<input type='hidden' name='attachList["+i+"].aa_upload_path'value='"+jobj.data("path")+"'>";
 				str += "<input type='hidden' name='attachList["+i+"].aa_file_type'value='"+jobj.data("type")+"'>";
 				
			});
			formObj.append(str).submit();
		}
		formObj.submit();
	});
});
</script>		
<script>
$(document).ready(function(){
	(function(){
		var aa_bno = '<c:out value="${applyget.aa_bno}"/>';
		
		$.getJSON("/auc/getAttachList", {aa_bno : aa_bno},function(arr){
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(i, attach){
  				
  				var fileCallPath = encodeURIComponent(attach.aa_upload_path+"/s_"+attach.aa_uuid+"_"+attach.aa_file_name);

					str += "<li data-path='"+attach.aa_upload_path+"' data-uuid='"+attach.aa_uuid+"' "
					str += " data-filename='"+attach.aa_file_name+"' data-type='"+attach.aa_file_type+"' ><div>";
					str += "<span> " + attach.aa_file_name + "</span>";
					str += "<button type='button' class='btn btn-warning btn-circle btn-xxs mb-1' data-file=\'"+fileCallPath+"\'data-type='image' "
					str += "> X </button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
					
  			});
  			
  			$(".uploadResult ul").html(str);
  		}); 
  	})();
	
	$(".uploadResult").on("click","button",function(e){
		console.log("delete file");
		
		if(confirm("이 파일을 삭제하시겠습니까? ")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	

	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|pdf)$");
	var maxSize = 5242880; //5MB
		
	function checkExtension(fileName, fileSize){
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과 : 5MB 미만의 파일을 업로드해주세요.");
				return false;	
			}
							
			return true;
				
	}
	
	$("input[type='file']").change(function(e){
		
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;

			for(var i = 0; i < files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			
			}
			
			$.ajax({
 				url : '/uploadPic',
 				processData : false,
 				contentType : false,
 				data : formData,
 				type : 'POST',
 				dataType : 'json',
 				success : function(result){
 					console.log(result);
 					showUploadResult(result);
 				}
 			});
	});
			
			function showUploadResult(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length == 0){ return; }
				
				var uploadUL = $(".uploadResult ul");
				
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){

					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);

					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-warning btn-circle'> x </button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str + "</li>";
					
				});
				
				uploadUL.append(str);		
			}
		});
</script>		

<%@include file="../includes/footer.jsp"%>