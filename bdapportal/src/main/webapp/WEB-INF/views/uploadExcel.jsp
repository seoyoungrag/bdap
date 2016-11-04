<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  
  
  String validateDate = (String)request.getAttribute("validateDate");
  String tblId = (String)request.getAttribute("tblId");
  
  if(validateDate == null){
	  validateDate = "";
  }
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  <head>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link href="assets/images/favicon_1.ico" rel="shortcut icon">

        <title>유효기간 수정</title>

        <link href="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.css" rel="stylesheet">
        <link href="<%=contextPath%>/resources/kt/plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css">

        <link href="<%=contextPath%>/resources/kt/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/core.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/icons.css" rel="stylesheet" type="text/css">
        
        <link href="<%=contextPath%>/resources/kt/css/material-design-iconic-font.css" rel="stylesheet" type="text/css">
        
        <link href="<%=contextPath%>/resources/kt/css/components.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/pages.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/menu.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/responsive.css" rel="stylesheet" type="text/css">

        <script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
	
       
       <%-- <link rel="stylesheet" href="<%=contextPath%>/resources/kt/images/style.css" type="text/css"> --%>
       <script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js" type="text/javascript"></script>
       <script src="<%=contextPath%>/resources/kt/amcharts/serial.js" type="text/javascript"></script>

        
    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    	
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
 	height:280px;     
 
        
	}
    
    
    </style></head>
  
  
  
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
        
               <div class="">
                <!-- Start content -->
                <div class="content" style="">
                    <div class="container" style="height:500px;">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>엑셀 Import</b></h4>
						
                       <div class="col-lg-12" style="margin-bottom:10px;">
								 <div class="card-box" style="padding-bottom:10px;">
								 	<form class="form-horizontal group-border-dashed" action="importExcel.do" name="dropzone" method="post" enctype="multipart/form-data">
									            <div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
										            <div class="input-group" style="margin-right:10px;">
										                <label class="input-group-btn">
										                    <span class="btn btn-default">
										                      <input type="file" id="fileArr"  name="fileArr" />
										                    </span>
										                </label>
										                <div class="input-group" style="margin-left:10px; margin-top:2px;">
										                	<button class="btn btn-primary waves-effect waves-light" >
															확인
														</button>
														<button class="btn btn-default waves-effect m-l-5" type="reset" onclick="javascript:winclose();">
															취소
														</button>
										                </div>
										            </div>
												</div>
											</form>	
								</div>
                       	</div>
                    </div>
                </div>
            </div>
        </div>
            
        <script>
            var resizefunc = [];
        </script>

        <!-- Plugins  -->
        <script src="<%=contextPath%>/resources/kt/js/jquery.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/detect.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/fastclick.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.slimscroll.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.blockUI.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/waves.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/wow.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.nicescroll.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.scrollTo.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-treeview.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/dropzone.js"></script>
        
        
       
       
       <script src="<%=contextPath%>/resources/kt/js/moment.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-select.js"></script>
        
        
        
        <!-- Counter Up  -->
        <script src="<%=contextPath%>/resources/kt/lib/jquery.waypoints.js"></script>
        <script src="<%=contextPath%>/resources/kt/plugins/counterup/jquery.counterup.min.js"></script>

        <!-- circliful Chart -->
        <script src="<%=contextPath%>/resources/kt/plugins/jquery-circliful/js/jquery.circliful.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>

        <!-- skycons -->
        <script src="<%=contextPath%>/resources/kt/plugins/skyicons/skycons.min.js" type="text/javascript"></script>
        
        <!-- Page js  -->
        <script src="<%=contextPath%>/resources/kt/pages/jquery.dashboard.js"></script>

        <!-- Custom main Js -->
        <script src="<%=contextPath%>/resources/kt/js/jquery.core.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.app.js"></script>

		<script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script>

        <script type="text/javascript">
            jQuery(document).ready(function($) {
            	$('#datetimepicker1').datetimepicker({
                   	format: 'YYYY/MM/DD'
                });
            	
            	var conW = $(".popup_wrap").innerWidth(); //컨텐트 사이즈
                var conH = $(".popup_wrap").innerHeight();
            
                var winOuterW = window.outerWidth; //브라우저 전체 사이즈
                var winOuterH = window.outerHeight;
                
                var winInnerW = window.innerWidth; //스크롤 포함한 body영역
                var winInnerH = window.innerHeight;
                
                var winOffSetW = window.document.body.offsetWidth; //스크롤 제외한 body영역
                var winOffSetH = window.document.body.offsetHeight;
                
                var borderW = winOuterW - winInnerW;
                var borderH = winOuterH - winInnerH;
                
                
                winResizeW = conW + borderW;
            	
            	$("#datetimepicker1").on("dp.show", function(e) {
            		window.resizeTo('546','450');
                });
            	$("#datetimepicker1").on("dp.hide", function(e) {
            		window.resizeTo('546','270');
                });
            });

    		
    		function winclose(){
    			self.close();
    		}
    		
    		function validateDateMod(){
    			
    			var validateDate = $("#modDate").val();
    			if(confirm("유효기간을 수정 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/expirationDateUpdate.do?tblId=<%=tblId%>&validateDate="+validateDate;
    			}
    			
    		}
        </script>
</body>
</html>