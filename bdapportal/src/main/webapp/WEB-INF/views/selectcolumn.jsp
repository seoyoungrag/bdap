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

        <script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
	
   </head>
  
  
  
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
        
               <div class="">
                <!-- Start content -->
                <div class="content" style="">
                    <div class="container" style="padding-left:0px; padding-right:0px;">
        				<h4 class="m-t-0 header-title" style="padding:10px; padding-top:15px; margin-bottom:0px; height:50px;"><i class="zmdi zmdi-transform"></i> <span>컬럼 선택</span><%if(type.equals("dec")){ %><span style="float:right;"><button class="btn btn-default waves-effect waves-light" style="font-size:13px;" type="button" onclick="selectAll();" >전체선택</button></span><%} %></h4>
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
            var openFlag = false;
            
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
				
				opener.setData(str.substring(0, str.length-1), id);    		    
				self.close(); 
    		}
    		
    		function selectAll(){
    			if(!openFlag){
    				$( "input[name*='selectCol']" ).attr('checked',true);
    				openFlag = true;
    			}else{
    				$( "input[name*='selectCol']" ).attr('checked',false);
    				openFlag = false;
    			}
    		}
        </script>
</body>
</html>