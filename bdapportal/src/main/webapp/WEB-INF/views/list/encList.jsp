<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  
  
  
  
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>암호화 신청 및 현황 조회</b></h4>
						
                        <div class="col-sm-12" style="">
                        	<div class="card-box" style="margin-bottom:10px; padding-bottom:10px; padding-top:10px;">
                       			<button class="btn btn-inverse waves-effect waves-light" onclick="javascript:enc();">
                       				<i class="zmdi zmdi-transform"></i> <span>암호화 신청</span>
                       			</button>
                       			<!-- <button class="btn btn-inverse waves-effect waves-light" style="margin-left:15px;" onclick="javascript:dec();">
                       				<i class="zmdi zmdi-transform"></i> <span>복호화 신청</span>
                       			</button> -->
                       			
                        	</div>
                        </div>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">

	                       				<table id="encList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       	</div>

                    </div>
                </div>

            </div>
           
        </div>
        <!-- END wrapper -->

		
    
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
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                $('.circliful-chart').circliful();
            });

            /* BEGIN SVG WEATHER ICON */
            if (typeof Skycons !== 'undefined'){
            var icons = new Skycons(
                {"color": "#3bafda"},
                {"resizeClear": true}
                ),
                    list  = [
                        "clear-day", "clear-night", "partly-cloudy-day",
                        "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                        "fog"
                    ],
                    i;

                for(i = list.length; i--; )
                icons.set(list[i], list[i]);
                icons.play();
            };

            
    		$(function(){
     			$("#encList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getEncList.do',
					//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['구분','신청일시','프로젝트명','신청사유','Schema','Table','Column','진행상황','처리일','만료일','다운로드','재신청','처리','id'],
     			   	colModel:[
     			   		{name:'separation', index:'CheckResult',align: "center"},
     			   		{name:'reqDt', index:'CheckResult',align: "center"},
     			   		{name:'projectNm',align: "center"},
     			   		{name:'reason',align: "left"},
     			   		{name:'schema',align: "center"},
     			   		{name:'table',align: "center"},
     			   		{name:'column',align: "center"},
     			   		{name:'status',align: "center"},
     			  		{name:'processDt',align: "center"},
     			  		{name:'validateDate',align: "center"},
     			 		{name:'download',align: "center",formatter:download},
     					{name:'reapplication',align: "center",formatter:reapplication},
     					{name:'process',align: "center",formatter:processType, hidden:true},
     					{name:'cryptoId',align: "center",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   viewrecords: true
     			});
     		});         

    		
    		var popWidth = 450;
    		var popHeight = 680;
    		var width = screen.width;
			var height = screen.height;
			
    		function enc(){

    			var left = (screen.width/2)-(popWidth/2);
    			var top = (screen.height/2)-(popHeight/2);
    			
    			var param = "width="+popWidth+",height="+popHeight+",left="+left+",top="+top;
    			
    			window.open("<%=contextPath%>/encdec.do?type=enc","암호화 신청",param);
    		}
    		
    		
    		function processType(value, options, rowObject){				//처리
    			
    			var cryptoId = rowObject.cryptoId;
    			var radioHtml = "<p class='label label-primary' style='width:100px; margin-top:15px; cursor:pointer;'  onclick='javascirpt:processSuc(\""+cryptoId+"\");'>승인</p><p class='label label-pink' style='width:100px; margin-top:15px; margin-left:3px; cursor:pointer;' onclick='javascript:processFal(\""+cryptoId+"\");'>반려</p>";    			
    			return radioHtml;
    			}
    		
    		function reapplication(value, options, rowObject){			//재신청
    			var cryptoId = rowObject.cryptoId;
    			var radioHtml = "<p class='label label-inverse' style='width:100px; margin-top:15px; cursor:pointer;' onclick='javascript:reapplicationProcess(\""+cryptoId+"\");'>재신청</p>";
    			return radioHtml;
    			}
        		
    		function reapplicationProcess(id){
    			if(confirm("재신청 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/reapplicationProcess.do?cryptoId="+id+"&type=enc";
    			}
    		}
    		
    		
    		function processSuc(id){
    			if(confirm("승인 처리 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/encDecProcess.do?cryptoId="+id+"&processType=SUC&type=enc";
    			}
    		}
    		
    		function processFal(id){
    			if(confirm("반려 처리 하시겠습니까?")){
    				document.location.href = "<%=contextPath%>/encDecProcess.do?cryptoId="+id+"&processType=FAL&type=enc";	
    			}
    		}
    		
    		function download(value, options, rowObject){				//다운로드
    			
    			var radioHtml ="";
    		
    			if(value != ""){
    				var fileName = "fileDownload?fileName="+value;
    	    		
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
    		
    		
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "";
    	    	 checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>";
    	         return checkResult;

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

    	        <%
    	        //TODO role에 따라서 변하도록 한다.
    	          	String userId = (String)session.getAttribute("USER_ID");
    	        	if(userId.equals("admin")){
    	        	%>
    	        	$("#encList").hideCol("reapplication");
    	        	$("#encList").showCol("process");
    	        	<%
    	        	}
    	        %>    
    	        
    	    }); 
    	    
function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>