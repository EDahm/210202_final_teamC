<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<%@include file="../includes/header.jsp"%>
<%@include file="../includes/nav.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">경매 신청하기</h1>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				경매 신청
			</div>
			<!-- /.panel-heading -->
			
			
			<form role="form" action="/auc/apply_regi" method="post">
				<div>
					<label>업체번호</label>
					<input class="form-control" name="c_num">
				</div>
				<div>
					<label>물품명</label>
					<input class="form-control" name="aa_item_nm">
				</div>
				<div>
					<label>시장가격</label>
					<input class="form-control" name="aa_markt_prc">
				</div>
				<div>
					<label>중량</label>
					<input class="form-control" name="aa_weight">
				</div>
				<div>
					<label>원산지</label>
					<input class="form-control" name="aa_cntry_orgn">
				</div>
				<div>
					<label>희망기간</label><!-- datepicker 써야함 -->
					<input type="date" name="aa_hope_prd">
				</div>
				<button type="submit">신청</button>
				<button type="reset">리셋</button>				
			</form>
		</div>
	</div>
</div>

<div>
	<div>
		<div>
		
			<div>경매물품 이미지 첨부</div>
			<div>
				<div class='uploadDiv'>
					<p>반드시 이미지 파일(jpg, png 등)을 첨부해주세요.</p>
					<input type='file' name='uploadFile' multiple>
				</div>
				<div class='uploadResult'>
					<ul>
					
					</ul>
				</div>
				
				
			</div>
		
		</div>
	</div>
</div>

</div>
</div>

<style>
.uploadResult{
	width : 100%
}

.uploadResult ul{
	display : flex;
	flex-flow : row;
	justify-content : center;
	align-items : center;
}

.uploadResult ul li {
	list-style : none;
	padding : 10px;
	allign-content : center;
	text-align : center;
}

.uploadResult ul li img{
	width : 100px;
}
</style>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
 <script>
 	$(document).ready(function(){
 		
 		var formObj = $("form[role='form']");
 		
 		$("button[type='submit']").on("click",function(e){
 			e.preventDefault();
 			
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
		
		
		$(".uploadResult").on("click","button",function(e){
			
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url : '/deleteFile',
				data : {fileName : targetFile, type : type},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					alert(result);
				targetLi.remove();
				}
			});
			
		});

 			
 		});
 </script>

<%@include file="../includes/footer.jsp"%>