<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String test = (String) request.getAttribute("test");
	String contextPath = (String) request.getContextPath();

	String type = (String) request.getAttribute("type");

	if (type == null) {
		type = "";
	}
	String tblId = (String) request.getAttribute("tblId");
	if(tblId == null){
		tblId = "";
	}
%>

<!DOCTYPE html>
<html
	class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link href="assets/images/favicon_1.ico" rel="shortcut icon">


<title>컬럼 정보 관리</title>

<link
	href="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.css"
	rel="stylesheet">
<link
	href="<%=contextPath%>/resources/kt/plugins/jquery-circliful/css/jquery.circliful.css"
	rel="stylesheet" type="text/css">

<link href="<%=contextPath%>/resources/kt/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/core.css" rel="stylesheet"
	type="text/css">
<link href="<%=contextPath%>/resources/kt/css/icons.css"
	rel="stylesheet" type="text/css">

<link
	href="<%=contextPath%>/resources/kt/css/material-design-iconic-font.css"
	rel="stylesheet" type="text/css">

<link href="<%=contextPath%>/resources/kt/css/components.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/pages.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/menu.css" rel="stylesheet"
	type="text/css">
<link href="<%=contextPath%>/resources/kt/css/responsive.css"
	rel="stylesheet" type="text/css">

<script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>

<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />


<%-- <link rel="stylesheet" href="<%=contextPath%>/resources/kt/images/style.css" type="text/css"> --%>
<script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/resources/kt/amcharts/serial.js"
	type="text/javascript"></script>


<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}

#curve_chart {
	overflow-x: scroll;
	overflow-y: hidden;
	/* width: 100%; */
	height: 220px;
}

#chartdiv {
	overflow-x: scroll;
	overflow-y: hidden;
	/* width: 100%; */
	height: 247px;
}

#chartdiv1 {
	height: 280px;
}
</style>
</head>



<body class="fixed-left widescreen">

	<!-- Begin page -->
	<div id="wrapper">

		<div class="">
			<!-- Start content -->
			<div class="content" style="">
				<div class="container"
					style="padding-left: 0px; padding-right: 0px;">

					<h4 class="m-t-0 header-title"
						style="padding: 10px; padding-top: 15px; margin-bottom: 0px;">
						<i class="zmdi zmdi-transform"></i> <span>컬럼 정보 관리</span>
					</h4>

					<div class="col-lg-12" style="margin-bottom: 10px;" id="etcManage">
						<div class="card-box">
							<div class="table-responsive" style="">
								<table id="columninfo" style="width: 100%;"></table>
								<div id="jqGridPager3"></div>
							</div>
							<div class="text-right">
								<button class="btn btn-default waves-light"
									style="display: none;">
									<span>입력 완료</span>
								</button>
								<button class="btn btn-default waves-light" onclick="javascript:winclose();">
									<span>닫기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jqeury  -->
	<script src="<%=contextPath%>/resources/kt/js/jquery.min.js"></script>
	
	<script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script>
	<!-- jqeury Custom main Js -->
	<script src="<%=contextPath%>/resources/kt/js/jquery.core.js"></script>
	
	<!-- bootstrap -->
	<script src="<%=contextPath%>/resources/kt/js/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/moment.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/bootstrap-select.js"></script>
	
	<!-- bootstrap treeview -->
	<script src="<%=contextPath%>/resources/kt/js/bootstrap-treeview.js"></script>
	
	<!-- jqgrid -->
	<script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
	<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script> 

	<script type="text/javascript">
            jQuery(document).ready(function($) {
            	$('#datetimepicker6').datetimepicker({
    	        	format: 'YYYY/MM/DD'
    	        	
    	        });
    	        $('#datetimepicker7').datetimepicker({
    	            useCurrent: false, //Important! See issue #1075
    	            format: 'YYYY/MM/DD'
    	        });
    	        $("#datetimepicker6").on("dp.change", function (e) {
    	            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    	        });
    	        $("#datetimepicker7").on("dp.change", function (e) {
    	            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    	        });
    	        
    	        $(".bootstrap-select").css("width","100%"); 
            });
            
    		$(function(){
     			$("#columninfo").jqGrid({  
     				url:'<%=contextPath%>/getColumnByTblId.do?id=<%=tblId%>',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['컬럼ID','영문컬럼명','한글컬럼명','데이터 타입','설명','개인정보 여부','NULL 체크','TYPE 체크', 'TYPE 체크 FORMAT'],
     			   	colModel:[
     			   		{name:'id',align: "center", hidden:true},
     			   		{name:'colEngNm', index:'colEngNm', editable:false, align: "left"},
     			   		{name:'colKorNm', editable:true, align: "left"},
     			   		{name:'dataType', editable:false, align: "center"},
     			   		{name:'desc', editable:true, align: "left"},
     			   		{name:'isEnc',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'isChkNull',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'isChkType',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'chkTypeFormat', editable:true, align: "ceter"},
     			   	],
     			   viewrecords: true, 
                   rowNum : 1000,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,          
                   cellEdit: true,                          
                   cellsubmit:'remote',                    
                   cellurl:'<%=contextPath%>/updateCellColInfo.do', 
                   gridview:true,
                   beforeSubmitCell : function(rowid, cellName, cellValue) { 
	                   return {"id":rowid, "cellName":cellName, "cellValue": cellValue}
                   },
                   afterSubmitCell : function(serverStatus, aPostData) {
                	   var response = serverStatus.responseText;
                	   return [response=='SUCCESS'? true : false,response];
               	   },
               	   afterEditCell: function(rowid, cellname, value, iRow, iCol){
                       if(cellname == 'isEnc' || cellname == 'isChkNull' || cellname == 'isChkType'){
                            var id = $("#columninfo").getCell(rowid,'id');
	           				var saveInfo = 'id='+id+'&cellName='+cellname+'&cellValue='+ value;
	           				 $.ajax({
	           				 type: "POST",
	           				 url:'<%=contextPath%>/updateCellColInfo.do',
	           				 data: saveInfo,
	           				 success: function(data) {
	           					 if(data=='SUCCESS'){
	           						 //alert('데이터가 변경되었습니다.');
	           					 }else{
	           						alert('데이터 입력이 실패하였습니다.');
	           					 }
	           				 }
	           				 });
                       }   
                   }
     			});

				$(document).delegate('#columninfo .jqgrow td input', 'click', function () {
		            var iRow = $("#columninfo").getInd($(this).parent('td').parent('tr').attr('id'));
		            var iCol = $(this).parent('td').parent('tr').find('td').index($(this).parent('td'));
			            //if($(this).parent('td').hasClass('edit-cell')){
		                	$(this).prop('checked',!($(this).attr('checked')));
	                        jQuery("#columninfo").editCell(iRow,iCol,true);
			            //}
				});

    		});
    		function winclose(){
    			self.close();
    		}
        </script>
</body>
</html>