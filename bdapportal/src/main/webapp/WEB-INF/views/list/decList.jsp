<%@page import="com.kt.bdapportal.domain.BdapUser"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String contextPath = (String)request.getContextPath();
  
  boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
  boolean isProcess = (Boolean)session.getAttribute("isProcess");
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
<head>
<style>
	.ui-jqgrid {position: relative; font-size:11px;}
	#decList {position: relative; font-size:11px;}
</style>
</head> 
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
        
                <!-- Top Bar Start -->
            <div class="topbar">
				<jsp:include page="/WEB-INF/views/topmenu.jsp" flush="true"/>                    
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <%-- <div class="left side-menu">
               <jsp:include page="/WEB-INF/views/leftmenu.jsp" flush="true"/>
            </div> --%>
            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>복호화 신청 및 현황 조회</b></h4>
						
                        <div class="col-sm-12" style="">
                        	<div class="card-box" style="margin-bottom:10px; padding-bottom:10px; padding-top:10px;">
                       			
                       			<%if(isAdmin){ %>
	                        		<button class="btn btn-inverse waves-effect waves-light" onclick="javascript:dec();">
	                       				<i class="zmdi zmdi-transform"></i> <span>복호화 신청</span>
	                       			</button>
                        		<%} %>
                       			<button class="btn btn-inverse waves-effect waves-light">
                       				<i class="zmdi zmdi-library"></i> <span>복호화 신청 프로세스 안내</span>
                       			</button>
                        	</div>
                        </div>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">

	                       				<table id="decList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       	</div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END wrapper -->
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
            });

            
    		$(function(){
     			$("#decList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getDecList.do',
     				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     				colNames:['신청일시','프로젝트명','신청사유','Schema','Table','Column','진행','신청자','처리일','만료일','첨부','재신청','처리','id'],
     			   	colModel:[
	     			   	{name:'reqDt', index:'CheckResult',align: "center", sortable:false, width:"65"},
	 			   		{name:'projectNm',align: "left", sortable:false, width:"100"},
	 			   		{name:'reason',align: "left", sortable:false, width:"200"},
	 			   		{name:'schema',align: "left", sortable:false, width:"100"},
	 			   		{name:'table',align: "left", sortable:false, width:"100"},
	 			   		{name:'column',align: "left", sortable:false, width:"150"},
	 			   		{name:'status',align: "center", sortable:false, width:"30"},
	 					{name:'ownerId',align: "left", width:"60",hidden:true},
	 			  		{name:'processDt',align: "center", sortable:false, width:"60"},
	 			  		{name:'validateDate',align: "center", sortable:false, width:"60"},
	 			 		{name:'download',align: "center",formatter:download, sortable:false, width:"30"},
	 					{name:'reapplication',align: "center",formatter:reapplication, sortable:false, width:"50"},
	 					{name:'process',align: "center",formatter:processType, width:"50",hidden:true, sortable:false},
	 					{name:'cryptoId',align: "center",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   viewrecords: true,
    			   loadComplete : function(data){
    	    	        <%
        	        	// 권한에 따른 화면 버튼 숨기기
        	        	if(isProcess){
        	        	%>
        	        	$("#decList").hideCol("reapplication");
        	        	$("#decList").showCol("process");
        	        	$("#decList").showCol("ownerId");
        	        	<%
        	        	}
        	        %>   
					}
    			   /* rownumbers:true,
    			   rownumWidth:40 */

     			});
     		});         

    		var popWidth = 450;
    		var popHeight = 620;
    		var width = screen.width;
			var height = screen.height;
			
    		function dec(){

    			var left = (screen.width/2)-(popWidth/2);
    			var top = (screen.height/2)-(popHeight/2);
    			
    			var param = "width="+popWidth+",height="+popHeight+",left="+left+",top="+top;
    			
    			window.open("<%=contextPath%>/encdec.do?type=dec","복호화 신청",param);
    		}
    		
			function processType(value, options, rowObject){				//처리
    			
    			var cryptoId = rowObject.cryptoId;
    			var radioHtml = "<p class='label label-primary' style='width:100px; margin-top:15px; cursor:pointer;'  onclick='javascript:processSuc(\""+cryptoId+"\");'>승인</p><p class='label label-pink' style='width:100px; margin-top:15px; margin-left:3px; cursor:pointer;' onclick='javascript:processFal(\""+cryptoId+"\");'>반려</p>";
    			return radioHtml;
    			}
    		
			function reapplication(value, options, rowObject){			//재신청
    			var cryptoId = rowObject.cryptoId;
    			var radioHtml = "<p class='label label-inverse' style='width:100px; margin-top:15px; cursor:pointer;' onclick='javascript:reapplicationProcess(\""+cryptoId+"\", \""+rowObject.status+"\");'>재신청</p>";
    			return radioHtml;
    			}
			
			function reapplicationProcess(id, status){
				if(status == '승인'){
    				alert('승인된 건은 재신청 할 수 없습니다.');
    			}else{
    				if(confirm("재신청 하시겠습니까?")){
    					document.location.href = "<%=contextPath%>/reapplicationProcess.do?cryptoId="+id+"&type=dec";
        			}
    			}
			}
        		
			function processSuc(id){
				if(confirm("승인 처리 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/encDecProcess.do?cryptoId="+id+"&processType=SUC&type=dec";
				}
    		}
    		
    		function processFal(id){
    			if(confirm("반려 처리 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/encDecProcess.do?cryptoId="+id+"&processType=FAL&type=dec";
    			}
    		}
    		
    		
    		
    		function download(value, options, rowObject){				//다운로드
    			var radioHtml ="";
        		
    			if(value != ""){
    				var fileName = "fileDownload?fileName="+value+"&userId="+rowObject.ownerId;
    	    		
        			radioHtml += "<form class=\"\" action=\""+fileName+"\" method=\"post\">";
        			radioHtml += "<i class='zmdi zmdi-download' onclick='javascirpt:fileDownload(this);' style='cursor:pointer;'></i>";
        			radioHtml += "</form>";	
    			}else{
    				radioHtml = "";
    			}
    			
   			   return radioHtml;
   			}
    		
			function fileDownload(obj){
    			
    			var parent = $(obj).parent();
    			$(parent).submit();
    			
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

        </script>
</body>
</html>