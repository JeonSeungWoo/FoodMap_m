<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
</head>
<%@ include file="/resources/include/header.jsp" %>

<form id="form">

<div id="container">
  <!--  HeadMenu ----------------------------------------------------->
        <div class="jumbotron jumbo-he-2">
            <h2><span style="color: #1564f9;">현재 동네</span>의 맛집은 어디 일까요?</h2>
            <p> 현재 위치 하신 곳을 입력해 주세요~</p>
              <!-- Actual search box -->
             <div id="searchDiv">
             <div class="form-group has-feedback has-search">
               <span class="glyphicon glyphicon-search form-control-feedback"></span>
               <input type="text" class="form-control" placeholder="Search">
               <button type="button" class="btn btn-primary">검색</button>
             </div>
             </div>
         </div>



</div>



</form>
<%@ include file="/resources/include/footer.jsp" %>
<script type="text/javascript">


</script>

</html>