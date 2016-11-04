<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	String test = (String)request.getAttribute("test");
	String contextPath = (String)request.getContextPath();
	
	boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
	boolean isProcess = (Boolean)session.getAttribute("isProcess");
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  
  
  
  
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
            <div class="topbar">
				<jsp:include page="/WEB-INF/views/topmenu.jsp" flush="true"/>                    
            </div>
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>암호화 처리 조회</b></h4>
                       <div class="col-lg-12" style="margin-bottom:10px;" id="encTable">
								<div class="card-box">
                                    <div class="table-responsive" id="encTable">
	                       				<table id="encProcessList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
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
            var width = '950';
            <%
        	//TODO role에 따라서 변하도록 한다.
          	if(isProcess){
        	%>
        	width = '800';
        	<%
        	}
        	%>
            
    		$(function(){
     			$("#encProcessList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getEncProcessList.do',
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['Schema','Table','Column','생성일','진행현황','만료일','권한자'],
     			   	colModel:[
    					/* {name:'row',align: "center", key: true,formatter:'checkbox', editable: true, edittype: 'checkbox', editoptions: { value: "True:False" }, formatoptions: { disabled: false},width:"30"}, */
     			   		{name:'schemaNm', index:'CheckResult',align: "left", sortable:false, width:"200"},
     			   		{name:'tableNm', index:'CheckResult',align: "left", sortable:false, width:"250"},
     			   		{name:'columnNm',align: "left", sortable:false, width:width},
     			   		{name:'startDate',align: "center", sortable:false, width:"130"},
     			   		{name:'status',align: "center", sortable:false, width:"130"},
     			   		{name:'endDate',align: "center", sortable:false, width:"150"},
     			   		{name:'ownerId',align: "left", width:"150",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
    			   viewrecords: true,
    			   loadComplete : function(data){
    				    <%
	   		        	//TODO role에 따라서 변하도록 한다.
	   		          	if(isProcess){
	   		        	%>
	   		        	$("#encProcessList").showCol("ownerId");
	   		        	<%
	   		        	}
	   		        	%>    
					}
     			});
     			
     		});         
    		
    		
    		function searchTypeEnc(){
    			
    			$("#decTable").hide();
    			$("#encTable").show();
    			
    			$( "#encBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#decBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}
    		
    		
			function searchTypeDec(){
    			
				$("#encTable").hide();
				$("#decTable").show();
				
				$( "#encBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#decBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    		}
    		
    		
    		function enc(){
    			
    			window.open("<%=contextPath%>/encdec.do?type=enc","암호화 신청","width=420,height=530");
    		}
    		
    		function dec(){
    			window.open("<%=contextPath%>/encdec.do?type=decc","복호화 신청","width=420,height=530");
    		}
    		
    		function process(value, options, rowObject){				//처리
    			   var radioHtml = '<p class="label label-primary" style="width:100px; margin-top:15px; cursor:pointer;">승인</p><p class="label label-pink" style="width:100px; margin-top:15px; margin-left:3px; cursor:pointer;">반려</p>';
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
    	    
			function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>