<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">Board Read</h1>
   </div>
   <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <div class="panel-heading">Board Modify Page</div>
         <!-- /.panel-heading -->
         <div class="panel-body">
         
         <form role="form" action="/board/modify" method="post">
         <!-- 319p 추가 -->
         <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
         <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
         <!-- 319p 끝 -->
         <!-- 346p 추가 -->
         <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
         <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
         <!-- 346p 끝 -->
         
            <div class="form-group">
               <label>q_bno</label> 
               <input class="form-control" name='q_bno'
               value='<c:out value="${board.q_bno }"/>' readonly="readonly">
            </div>
            
            <div class="form-group">
               <label>q_title</label> 
               <input class="form-control" name='q_title'
               value='<c:out value="${board.q_title }"/>' >
            </div>
            
            <div class="form-group">
               <label>Text area</label>
               <textarea class="form-control" rows="5" name='q_content' >
               <c:out value="${board.q_content}" /></textarea>
            </div>
            
            <div class="form-group">
               <label>Writer</label> 
               <input class="form-control" name='q_ncnm'
               value='<c:out value="${board.q_ncnm}"/>'
               readonly="readonly">
            </div>
            
            <div class="form-group">
               <label>RegDate</label>
               <input class="form-control" name='q_regdate'
                 value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.q_regdate}" />' readonly="readonly">
            </div>
            
            
            <button type="submit" data-oper='modify'
            class="btn btn-default">Modify</button>
            
            <button type="submit" data-oper='remove'
            class="btn btn-danger">Remove</button>
            
            <button type="submit" data-oper='list'
            class="btn btn-info">List</button>
               
         </form>
         
         </div>
         <!-- end panel-body -->
         
      </div>
      <!-- end panel-body -->
   </div>
   <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {


     var formObj = $("form");

     $('button').on("click", function(e){
       
       e.preventDefault(); 
       
       var operation = $(this).data("oper");
       
       console.log(operation);
       
       if(operation === 'remove'){
         formObj.attr("action", "/board/questionsRemove");
         
       }else if(operation === 'list'){
         //move to list
         formObj.attr("action", "/board/questionsList").attr("method","get");
         
         var pageNumTag = $("input[name='pageNum']").clone();
         var amountTag = $("input[name='amount']").clone();
         var keywordTag = $("input[name='keyword']").clone();
         var typeTag = $("input[name='type']").clone();      
         
         formObj.empty();
         
         formObj.append(pageNumTag);
         formObj.append(amountTag);
         formObj.append(keywordTag);
         formObj.append(typeTag);     
         
       }else if(operation === 'modify'){
           
           console.log("submit clicked");
           
           var str = "";
           
           $(".uploadResult ul li").each(function(i, obj){
             
             var jobj = $(obj);
             
             console.dir(jobj);
             
             str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
             str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
             str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
             str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
             
           });
           formObj.append(str).submit();
        }
    
       formObj.submit();
     });

});
</script>

<%@include file="../includes/footer.jsp"%>