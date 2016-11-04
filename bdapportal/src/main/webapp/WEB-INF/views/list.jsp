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
    

    <title>리스트 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=contextPath%>/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />

	<script src="<%=contextPath%>/resources/js/jquery-3.1.0.js" type="text/javascript"></script>
	<script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
	<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script>
	<script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script>
	<script src="<%=contextPath%>/resources/js/bootstrap.js" type="text/javascript"></script>
  	
  

    
    
  </head>
<!-- <body role="document" onbeforeunload="test()">

    <button id="button_sample">버튼샘플</button>
    <div style="margin-left:20px">
    	<table id="list"></table>
		<div id="jqGridPager"></div>
	</div> -->
<body data-spy="scroll" data-target=".bs-docs-sidebar" style="padding-top: 60px" role="document" onbeforeunload="test()">
  <div class="contatiner-fluid" style="margin-left: 10px; margin-right: 10px">
    <div class="row-fluid">
     
        <table id="list"></table>
        <div id="jqGridPager"></div>
     
    </div>
  </div>

    <script type="text/javascript">
    		

 		$(function(){
 			$("#list").jqGrid({  
 				//ajax 호출할 페이지
 				url:'<%=contextPath%>/list.do',
 				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

 				//로딩중일때 출력시킬 로딩내용
 				loadtext : '로딩중..',
 				//응답값
 				datatype: "json",
 				styleUI : 'Bootstrap',
 			   	colNames:['순번','이미지','파일이름','수정일', '크기', '등록자명','조회수','페이지'],
 			   	/* colNames:['순번','이미지','파일이름','수정일', '크기'], */
 			   	colModel:[
					{name:'count',align: "center", key: true},
 			   		{name:'image', index:'CheckResult',align: "center",formatter: ItemCheckInfo },
 			   		{name:'fileName'},
 			   		{name:'create_date'},
 			   		{name:'size'},
 			   		{name:'creatorid',align: "center"},
 			   		{name:'hitnum',align: "center"},
 			   		{name:'page',align: "center"}
 			
 			   	],
 			   viewrecords: true, 
 			   caption: "이미지 목록",
               pager: "#jqGridPager",
               rowNum : 5,
               height : 'auto',
               autowidth : true,
               shrinkToFit : false,
			   viewrecords: true
             
              
               
 			});
 		});
     
 		function test(){

			var actionURL = "<%=contextPath%>/thumbnailFileDel.do";
			$.ajax({ 
				url: actionURL, 	
				type: "post", 		
				dataType: 'text',              
				async: false, 			// true:비동기, false:동기 
				success: function(data) { 
						
				}, 
				error: function(xhr, txt, err) { 
					
				} 
			}); 
 	   }
 		
 		
    </script>
</body>
</html>