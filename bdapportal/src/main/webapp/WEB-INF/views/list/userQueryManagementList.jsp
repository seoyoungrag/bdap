<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%>   
<%
	String contextPath = (String)request.getContextPath();
	SearchVO searchVO = (SearchVO)request.getAttribute("searchVO");
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
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>User Query Management</b></h4>
                        	<div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
                        			<div class="row">
                        				<div class="col-md-11">
	                        				<div class="row">
	                        					<form class="form-horizontal" role="form" id="searchForm" method="post" action="<%=contextPath%>/userQueryManagementList.do" accept-charset="utf-8">
		                        				<div class="col-md-2">
	                                            	<div class="radio radio-default radio-inline">
                                       					<input name="searchType" type="radio" value="normal" <%=searchVO.getSearchType().equals("normal")?"checked":"" %>>
                                       					<label for="inlineRadio1"> 일반 </label>
                                   					</div>
	                                            	<div class="radio radio-default radio-inline">
                                       					<input name="searchType" type="radio" value="personal" <%=searchVO.getSearchType().equals("personal")?"checked":"" %>>
                                       					<label for="inlineRadio1"> 개인정보 </label>
                                   					</div>
                                   					<div class="radio radio-default radio-inline">
                                       					<input name="searchType" type="radio" value="longterm" <%=searchVO.getSearchType().equals("longterm")?"checked":"" %>>
                                       					<label for="inlineRadio1"> 장기간 </label>
                                   					</div>
		                        				</div>
		                        				
		                        				<div class="col-md-2">
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                            	<label class="col-md-5 control-label" style="text-align:right;">수행시간:</label>
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" id="termTime" name="termTime">
			                                                  <option value="0" <%=searchVO.getTermTime()==0?"selected":"" %>>1시간이내</option>
															  <option value="1" <%=searchVO.getTermTime()==1?"selected":"" %>>1시간</option>
															  <option value="2" <%=searchVO.getTermTime()==2?"selected":"" %>>2시간</option>
															  <option value="3" <%=searchVO.getTermTime()==3?"selected":"" %>>3시간</option>
															  <option value="4" <%=searchVO.getTermTime()==4?"selected":"" %>>4시간</option>
															  <option value="5" <%=searchVO.getTermTime()==5?"selected":"" %>>5시간</option>
															  <option value="6" <%=searchVO.getTermTime()==6?"selected":"" %>>6시간</option>
															  <option value="7" <%=searchVO.getTermTime()==7?"selected":"" %>>7시간</option>
															  <option value="8" <%=searchVO.getTermTime()==8?"selected":"" %>>8시간</option>
															  <option value="9" <%=searchVO.getTermTime()==9?"selected":"" %>>9시간이상</option>
															</select>
		                                                </div>
		                                            </div>
	                        					</div>
		                        				
		                        				<div class="col-md-2">
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                                <label class="col-md-5 control-label" style="text-align:right;">쿼리결과:</label>
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" id="termStatus" name="termStatus">
			                                                  <option value="" <%=searchVO.getTermStatus().equals("")?"selected":"" %>>전체</option>
			                                                  <option value="SUCCEEDED" <%=searchVO.getTermStatus().equals("SUCCEEDED")?"selected":"" %>>성공</option>
															  <option value="FAILED" <%=searchVO.getTermStatus().equals("FAILED")?"selected":"" %>>실패</option>
															  <option value="RUNNING" <%=searchVO.getTermStatus().equals("RUNNING")?"selected":"" %>>진행중</option>
															</select>
		                                                </div>
		                                            </div>
	                        					</div>
	                        				
				                       			<div class="col-md-4">
		                                            <div class="form-group" style="margin-bottom:5px;">
														<label class="col-md-3 control-label" style="text-align:center;">시작시간 : </label>
														<div class='col-md-3'>
													        <div class="form-group">
													            <div class='input-group date' id='datetimepicker'>
													                <input type='text' class="form-control" id="startDate" name="startDate"   />
													                <span class="input-group-addon">
													                    <span class="glyphicon glyphicon-calendar"></span>
													                </span>
													            </div>
													        </div>
													    </div>
													    <div class='col-md-1 text-center p-t-8'>
													    ~
													    </div>
													    <div class='col-md-3'>
													        <div class="form-group">
													            <div class='input-group date' id='datetimepicker1'>
													                <input type='text' class="form-control" id="endDate" name="endDate"  />
													                <span class="input-group-addon">
													                    <span class="glyphicon glyphicon-calendar"></span>
													                </span>
													            </div>
													        </div>
													    </div>
		                                            </div>
		                        				</div>
		                        				<div class="col-md-1">
		                                            <div class="form-group" style="margin-bottom:10px;">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goSearch();">검색</button>
		                                            </div>
		                        				</div>
	                        				</form>	
	                        				</div>                        				
                        				</div>
                        				<div class="col-md-2">
                        				</div>
                        			</div>
                        		</div>
                        	</div>
							<div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
									<div class="table-responsive">
										<table id="gridList" style="width:100%;"></table>
										<div id="gridPager"></div>
									</div>
									<p class="text-pink text-nowrap text-right" style="margin-left:-10px;">*해당 내역은 실시간이 아닙니다. </p>
								</div>
							</div>
                    	</div>
                    <!-- end container -->
                </div>
                <!-- end content -->
            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->
        </div>
        <!-- END wrapper -->
    
        <!-- jquery  -->
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
		<!-- custom -->
		<script src="<%=contextPath%>/resources/kt/js/common.js" type="text/javascript"></script> 
        
        <script type="text/javascript">
        	var contextPath = '<%=contextPath%>';
        	var searchType = $(":input:radio[name=searchType]:checked").val();
        	var termTime = $("#termTime option:selected").val();
        	var termStatus = $("#termStatus option:selected").val();
        	var defaultStartDate = '<%=searchVO.getStartDate()%>';
        	var defaultEndDate = '<%=searchVO.getEndDate()%>';
        	
			// 개인정보를 선택했을때에만 다른 테이블을 조회해야 한다. 식별하기 편하도록 url로 구분한다.
        	var url = (searchType=='personal')?contextPath+'/getUserPersonalQueryManagementList.do?' : contextPath+'/getUserQueryManagementList.do?';
        	var param = "searchType="+searchType+"&startDate="+defaultStartDate+"&endDate="+defaultEndDate;
        	//param += (searchType=='longterm')?"&term="+term:"";
        	param += "&termTime="+termTime+"&termStatus="+termStatus;
        	
        	jQuery(document).ready(function($) {
	            $(function () {
	            	if(defaultStartDate=='' && defaultEndDate==''){
	            		$('#datetimepicker').datetimepicker({
		    	        	format: 'YYYY/MM/DD',
		    	        	defaultDate: moment().subtract(7, 'days')
		    	        });
		    	        $('#datetimepicker1').datetimepicker({
		    	            useCurrent: false, //Important! See issue #1075
		    	            format: 'YYYY/MM/DD',
		    	            defaultDate: moment()
		    	        });
	            	}else{
	            		$('#datetimepicker').datetimepicker({
		    	        	format: 'YYYY/MM/DD',
		    	        	defaultDate: defaultStartDate
		    	        });
		    	        $('#datetimepicker1').datetimepicker({
		    	            useCurrent: false, //Important! See issue #1075
		    	            format: 'YYYY/MM/DD',
		    	            defaultDate: defaultEndDate
		    	        });
	            	}
	    	    }); 
			});
        	
    		$(function(){
     			$("#gridList").jqGrid({  
     				//ajax 호출할 페이지
     				url:url+param,
     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['수행자','쿼리','시작시간', '완료시간', '수행시간','결과'],
     			   	colModel:[
     			   		{name:'user', index:'CheckResult',align: "left",width:"120", sortable:false},
     			   		{name:'query',align: "left",formatter:editable,width:"800", sortable:false},
     			   		{name:'startTime',align: "center",width:"120", sortable:false},
     			   		{name:'endTime',align: "center",width:"120", sortable:false},
     			   		{name:'term',align: "right",width:"150", sortable:false, formatter:Format.millisecondsToTime},
     			   		{name:'result',align: "center",width:"80", sortable:false, formatter:Format.resultToString}
     			   	],
     			   viewrecords: true, 
                   pager: "#gridPager",
                   rowNum : 20,
                   height : 'auto', 
                   autowidth : true,
                   shrinkToFit:true, 
    			   viewrecords: true,
    			   rowList: [20,50,100]
     			});
     		});         
    	    
    	    function goSearch(){
    	    	$("#searchForm").submit();
    	    }
    	    
    	    var rowCount = 0;
    	    
    	    function editable(value, options, rowObject){
    	    	rowCount++;
    	    	var radioHtml = "";
    	    	
    	    	if(value.length > 145){
    	    		radioHtml ='<div><div id='+rowCount+' style="width:90%; float:left; height:20px; overflow-y:hidden; overflow-x:hidden; white-space:nowrap; text-overflow:ellipsis;" toggle="off">';
    	    		radioHtml += value;	
    	    		radioHtml += '</div><span class="pull-right" style="margin-left: -10px; float:right; cursor: pointer; padding-bottom:-20px;" onclick="rowToggle(this)" ><i class="zmdi zmdi-plus-circle-o"></i></span></div>';	
    	    	}else{
    	    		radioHtml ='<div id='+rowCount+' style="width:100%; height:20px; overflow-y:hidden; overflow-x:hidden;" onclick="rowToggle('+rowCount+')">';
    	    		radioHtml += value;
    	    		radioHtml += '</div>';
    	    	}
    	    	
  			   return radioHtml;
  			}
    	    
    	    function rowToggle(obj){
    	    	var parent = $(obj).parent();
    	    	var selectDiv = $(parent).children().first();
    	    	var toggleSw = $(selectDiv).attr("toggle");
    	    	
    	    	if(toggleSw == "off"){
    	    		var forIconChange = $(obj).children().first();
    	    		$(forIconChange).removeClass( "zmdi-plus-circle-o" ).addClass( "zmdi-close-circle-o" );
    	    		var heightVal = $(selectDiv).css("height");	
    	    		$(selectDiv).attr("toggle",heightVal);
    	    		$(selectDiv).css("white-space","normal");
    	    		$(selectDiv).css("text-overflow","");
    	    		$(selectDiv).css("overflow-y","");
    	    		$(selectDiv).css("overflow-x","");
        	    	$(selectDiv).css("height","");
    	    	}else{
    	    		var forIconChange = $(obj).children().first();
    	    		$(forIconChange).removeClass( "zmdi-close-circle-o" ).addClass( "zmdi-plus-circle-o" );
    	    		$(selectDiv).attr("toggle","off");
    	    		$(selectDiv).css("white-space","nowrap");
    	    		$(selectDiv).css("text-overflow","ellipsis");
    	    		$(selectDiv).css("overflow-y","hidden");
    	    		$(selectDiv).css("overflow-x","hidden");
    	    		$(selectDiv).css("height",toggleSw);
    	    	}
    	    }
	</script>
</body>
</html>