<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>    
 <%@page import="com.kt.bdapportal.domain.BdapCol"%>    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  
  String type = (String)request.getAttribute("type");
  
  if(type == null){
	  type = "";
  }
  
  @SuppressWarnings (value="unchecked")
 	List<BdapCol> colList = (List<BdapCol>)request.getAttribute("colList");
  
  
  
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  <head>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link href="assets/images/favicon_1.ico" rel="shortcut icon">

        <title>컬럼 선택</title>

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

        <script src="//www.google-analytics.com/analytics.js" async=""></script><script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
        
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
	
	
	
	
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-72255993-1', 'auto');
            ga('send', 'pageview');
        </script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
       
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
       
       
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
                    <div class="container" style="padding-left:0px; padding-right:0px;">
        				<h4 class="m-t-0 header-title" style="padding:10px; padding-top:15px; margin-bottom:0px;"><i class="zmdi zmdi-transform"></i> <span>컬럼 선택</span></h4>
						   <div class="col-lg-12" style="margin-bottom:10px;">
								 <div class="card-box" style="padding-bottom:10px; padding-top:10px;">
								 <form class="form-horizontal group-border-dashed" action="#" novalidate="">
								 	<%for(int i = 0; i < colList.size(); i++){ %>
						 				<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
											<input id="<%=colList.get(i).getColId() %>" name="selectCol" type="checkbox" value="<%=colList.get(i).getColEngNm() %>" style="margin-left:15px;">
                                      				<label for="inlineCheckbox1" style="margin-left:10px;"> <%=colList.get(i).getColEngNm() %> </label>
										</div>
								 	<%} %>
									</form>
									<div class="form-group" style="margin-bottom:0px;">
										<div class="col-sm-offset-3 col-sm-9 text-right">
											<button class="btn btn-primary waves-effect waves-light" onclick="sendDataToOpener();">
												확인
											</button>
											<button class="btn btn-default waves-effect m-l-5" type="reset" onclick="javascript:winclose();">
												취소
											</button>
										</div>
									</div>
											
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
              
            });

          	  

    		
    		function winclose(){
    			self.close();
    		}
    		
    		function sendDataToOpener(){
    			
    			var str = "";  
    			var id = "";
    		    $("input:checkbox:checked").each(function (index) {  
    		        str += $(this).val() + ",";
    		        id += $(this).attr("id") + ",";
    		    });
    		    
				opener.setData(str,id);    		    
    		    
    		   self.close(); 
    		   
    			
    		}
    		
    		
    		
    		
    		function process(value, options, rowObject){				//처리
    			   var radioHtml = '<p class="label label-primary" style="width:100px; margin-top:15px; cursor:pointer;">승인</p>'+'/'+'<p class="label label-pink" style="width:100px; margin-top:15px; cursor:pointer;">반려</p>';
    			   return radioHtml;
    			}
    		
    		function reapplication(value, options, rowObject){			//재신청
    			   var radioHtml = '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;">재신청</p>';
    			   return radioHtml;
    			}
        		
    		function download(value, options, rowObject){				//다운로드
   			   var radioHtml = '<i class="zmdi zmdi-download" style="cursor:pointer;"></i>';
   			   return radioHtml;
   			}
    		
    		
    		function emer(value, options, rowObject){
  			   var radioHtml = '<p class="label label-danger" style="width:100px; margin-top:15px; margin-left:0px; text-align:left">긴급</p>&nbsp;&nbsp;&nbsp;'+value;
  			   return radioHtml;
  			}
    		
    		
    		function question(value, options, rowObject){
 			   var radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:0px; background-color:#5cb85c; text-align:left">질문</p>&nbsp;&nbsp;&nbsp;'+value;
 			   return radioHtml;
 			}
    		
    		
    		
    		function radio(value, options, rowObject){
    			   var radioHtml = '<input type="radio" value=' + value + ' name="radioid" />';
    			   return radioHtml;
    		}
    		
    		
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "";
    	    	 checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>";
    	         return checkResult;

    	    }
    	    
    	    function selectColumn(){
    	    	
    	    	var popWidth = 450;
        		var popHeight = 600;
        		var width = screen.width;
    			var height = screen.height;

        			var left = (screen.width/2)-(popWidth/2);
        			var top = (screen.height/2)-(popHeight/2);
        			
        			var param = "width="+popWidth+",height="+popHeight+",left="+left+",top="+top;
        			
        			window.open("<%=contextPath%>/selectcolumn.do","암호화 신청",param);
        		
    	    }
    	    
    	    
    	    
    	    $(function () {
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
    	    }); 
    	    
    	    $(window).load(function(){
   	    		
  	    		 $(".bootstrap-select").css("width","100%"); 
  	    	});
    	    
    	    
    	    $(function() {

    	    	  // We can attach the `fileselect` event to all file inputs on the page
    	    	  $(document).on('change', ':file', function() {
    	    	    var input = $(this),
    	    	        numFiles = input.get(0).files ? input.get(0).files.length : 1,
    	    	        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    	    	    input.trigger('fileselect', [numFiles, label]);
    	    	  });

    	    	  // We can watch for our custom `fileselect` event like this
    	    	  $(document).ready( function() {
    	    	      $(':file').on('fileselect', function(event, numFiles, label) {

    	    	          var input = $(this).parents('.input-group').find(':text'),
    	    	              log = numFiles > 1 ? numFiles + '개 파일이 선택 되었습니다.' : label;

    	    	          if( input.length ) {
    	    	              input.val(log);
    	    	          } else {
    	    	              if( log ) alert(log);
    	    	          }

    	    	      });
    	    	  });
    	    	  
    	    	});
    	    
    	    
        </script>
    
    
</body>
</html>