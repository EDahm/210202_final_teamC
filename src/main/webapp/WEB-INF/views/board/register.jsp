<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<title>Board Register</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>
<!-- 555p  -->
<!-- <style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

/* 543p */

.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
  }
  
</style> -->
<!-- 555p end -->

<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="/board/register">
		<input type="text" name="q_ncnm" style="width: 20%;" placeholder="작성자"/><br><br>
		<input type="text" name="q_title" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<textarea id="summernote" name="q_content"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>

		
		


		<!-- 554p 첨부파일영역  -->
<div>
  <div>
    <div>

      <div>File Attach</div>
      <!-- /.panel-heading -->
      <div>
        <div>
            <input type="file" name='uploadFile' multiple>
        </div>
        
        <div> 
          <ul>
          
          </ul>
        </div>      
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- 554p 첨부파일영역 end  -->

</body>
<script>
function goWrite(frm) {
	var q_title = frm.q_title.value;
	var q_ncnm = frm.q_ncnm.value;
	var q_content = frm.q_content.value;
	
	if (q_title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (q_ncnm.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (q_content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>	

<!-- 556p  -->
<script>

$(document).ready(function(e){

  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
    var str = "";
    
    $(".uploadResult ul li").each(function(i, obj){
      
      var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
    });
    
    console.log(str);
    
    formObj.append(str).submit();
    
  });
//564p end
  
  // 556p
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(qa_file_name, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(qa_file_name)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  
  // 557p
  $("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
   $.ajax({
     url: '/uploadAjaxAction',
     processData: false, 
     contentType: false,data: 
     formData,type: 'POST',
     dataType:'json',
       success: function(result){
         console.log(result); 
	     showUploadResult(result); //559p 업로드 결과 처리 함수 

     }
   }); //$.ajax
	    
 });
// 557p end  

//558p  
function showUploadResult(uploadResultArr){
   
   if(!uploadResultArr || uploadResultArr.length == 0){ return; }
   
   var uploadUL = $(".uploadResult ul");
   
   var str ="";
   
   $(uploadResultArr).each(function(i, obj){
	  /* 559p 
	 //image type
     if(obj.image){
        var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
        str += "<li><div>";
        str += "<span> "+ obj.fileName+"</span>";
        //559p
        //str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        
        //561p
        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        
        str += "<img src='/display?fileName="+fileCallPath+"'>";
        str += "</div>";
        str +"</li>";
      }else{
        var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
          var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
            
        str += "<li><div>";
        str += "<span> "+ obj.fileName+"</span>";
        //559p
        //str += "<button type='button' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        
        //561p
        str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
        
        str += "<img src='/resources/img/attach.png'></a>";
        str += "</div>";
        str +"</li>";
      } // if end
      559p end */ 
      
     //563p
	 //image type		
		  if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.qa_upload_path+ "/s_"+obj.qa_uuid +"_"+obj.qa_file_name);
			
			//첨부파일 관련 정보 추가
			str += "<li data-path='"+obj.qa_upload_path+"'";
			str +=" data-uuid='"+obj.qa_uuid+"' data-filename='"+obj.qa_file_name+"' data-type='"+obj.image+"'"
			str +" ><div>";
			
			str += "<span> "+ obj.qa_file_name+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.qa_upload_path+"/"+ obj.qa_uuid +"_"+obj.qa_file_name);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		    
		    //첨부파일 관련 정보 추가
			str += "<li "
			str += "data-path='"+obj.qa_upload_path+"' data-uuid='"+obj.qa_uuid+"' data-filename='"+obj.qa_file_name+"' data-type='"+obj.image+"' ><div>";
			
			str += "<span> "+ obj.qa_file_name+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}
      //563p end
	  
	});
   
   uploadUL.append(str);
 }
// 558p end 

//560p
 $(".uploadResult").on("click", "button", function(e){
	    
   console.log("delete file");
   
   // 561p
   var targetFile = $(this).data("file");
   var type = $(this).data("type");
   
   var targetLi = $(this).closest("li");
   
   $.ajax({
     url: '/deleteFile',
     data: {qa_file_name: targetFile, type:type},
     dataType:'text',
     type: 'POST',
       success: function(result){
          alert(result);
          
          targetLi.remove();
        }
   }); //$.ajax 
   // 561p end     
   
  });
//560p end 
  
}); // $(document).ready(function(e)    
</script>

</html>
