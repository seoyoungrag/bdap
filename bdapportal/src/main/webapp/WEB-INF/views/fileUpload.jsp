<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>파일 업로드 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=contextPath%>/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=contextPath%>/resources/css/signin.css" rel="stylesheet">
 	<script src="<%=contextPath%>/resources/js/jquery-3.1.0.js" type="text/javascript"></script>
	<script src="<%=contextPath%>/resources/js/bootstrap.js" type="text/javascript"></script>
  
    <script type="text/javascript">

	function fileUpload(){
		
		
	}
	
	function pagemove(){
		window.location.href = '<%=contextPath%>/move.do';
	}
 	
    </script>
    
    
  </head>
<body role="document">

    <div class="container">
      	<form class="form-signin" id="frm" name="frm" method="post" enctype="multipart/form-data" action ="<%=contextPath%>/fileUpload.do">
        	<h2 class="form-signin-heading" style="color:#fff;">파일 업로드</h2>
        	<input class="form-control" id="file" name="file" autofocus="" required="" type="file">
        	<div class="checkbox"></div>
        	<button class="btn btn-lg btn-default btn-block" type="submit">업로드</button>
        	<button class="btn btn-lg btn-default btn-block" onclick ="pagemove()">목록으로 이동</button>
		</form>
	</div>
</body>
</html>