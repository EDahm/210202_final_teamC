<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div>
   <div>
      <h1>Board Read</h1>
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
         
         <form role="form" action="/board/questionsModify" method="post">
         <!-- 319p 추가 -->
         <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
         <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
         <!-- 319p 끝 -->
         <!-- 346p 추가 -->
         <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
         <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
         <!-- 346p 끝 -->
         
            <div class="form-group">
               <label>번호</label> 
               <input class="form-control" name='q_bno'
               value='<c:out value="${board.q_bno }"/>' readonly="readonly">
            </div>
            
            <div class="form-group">
               <label>제목</label> 
               <input class="form-control" name='q_title'
               value='<c:out value="${board.q_title }"/>' >
            </div>
            
            <div class="form-group">
               <label>내용</label>
               <textarea class="form-control" rows="5" name='q_content' >
               <c:out value="${board.q_content}" /></textarea>
            </div>
            
            <div class="form-group">
               <label>작성자</label> 
               <input class="form-control" name='q_ncnm'
               value='<c:out value="${board.q_ncnm}"/>'
               readonly="readonly">
            </div>
            
            <div class="form-group">
               <label>작성날짜</label>
               <input class="form-control" name='q_regdate'
                 value='<fmt:formatDate pattern = "yyyy-MM-dd" value = "${board.q_regdate}" />' readonly="readonly">
            </div>
            
            
            <!-- <button data-oper='modify' class="btn btn-default">Modify</button>
            <button data-oper='list' class="btn btn-info">List</button> -->
            
            <button type="submit" data-oper='questionsModify' class="btn btn-default">수정</button>
            
            <button type="submit" data-oper='questionsRemove' class="btn btn-danger">삭제</button>
            
            <button type="submit" data-oper='questionsList' class="btn btn-info">목록</button>
               
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
       
       if(operation === 'questionsRemove'){
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
         
       }else if(operation === 'questionsModify'){
           
           console.log("submit clicked");
           
           var str = "";
</script>
<%@include file="../includes/footer.jsp"%>