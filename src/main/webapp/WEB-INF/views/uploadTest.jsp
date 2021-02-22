<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class='uploadDiv'>
	<input type = 'file' name='uploadFile' multiple>
</div>

<div class='uploadResult'>
	<ul>
	
	</ul>
</div>

<button id='uploadBtn'>Upload</button>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
  
 <script>
 	function showImage(fileCallPath){
 		alert(fileCallPath);
 	}
 	
 	$(document).ready(function(){
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
		
		var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr){
											
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){

					var fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
					
					var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					
					str += "<li><a href=\"javascript:showImage(\'"+ originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>"
							+"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+"</li>";
					
					
				});
				
				uploadResult.append(str);
			}
		
		var cloneObj = $(".uploadDiv").clone();
		
 		$("#uploadBtn").on("click",function(e){
 			var formData = new FormData();
 			
 			var inputFile = $("input[name='uploadFile']");
 			
 			var files = inputFile[0].files;
 			
 			console.log(files);
 			
 			//add filedate to formdata
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
 					
 					showUploadedFile(result);
 					
 					$(".uploadDiv").html(cloneObj.html());
 					
 				}
 			});
 		});
 		
 		$(".uploadResult").on("click","span",function(e){
 			
 			var targetFile = $(this).data("file");
 			var type = $(this).data("type");
 			console.log(targetFile);
 			
 			$.ajax({
 				url: '/deleteFile',
 				data: {fileName: targetFile, type:type},
 				dataType:'text',
 				type:'POST',
 				success: function(result){
 					alert(result);
 				}
 			});
 		});
 	});
 </script>
</body>
</html>