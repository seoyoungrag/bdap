<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%> 
<%
	String test = (String)request.getAttribute("test");
	String contextPath = (String)request.getContextPath();
  
	@SuppressWarnings (value="unchecked")
	List<String> tblList = (List<String>)request.getAttribute("tblList");
  
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


            <!-- ========== Left Sidebar Start ========== -->
           <%--  <div class="left side-menu">
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>적재현황 조회</b></h4>
						<form class="form-horizontal" role="form" id="loadStatusSearchForm" method="post" action="<%=contextPath%>/loadStatusList.do" accept-charset="utf-8">
                        <div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
                        			<div class="row">
                        				<div class="col-md-10">
                        				<div class="row">
                        				<div class="col-md-3">
                        					
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">Schema 선택 :</label>
	                                                <div class="col-md-7">
		                                                <select class="selectpicker" data-width="auto" name="schema" id="schema">
		                                                	<option value="" >전체</option>
															<%for(int i = 0; i < tblList.size(); i++){ 
			                                                	String schemeName = 	tblList.get(i);%>
			                                                	<option value="<%=schemeName%>"  <%=searchVO.getSearchWord().equals(schemeName)?"selected":"" %> ><%=schemeName%></option>
			                                                <%} %>
														</select>
	                                                </div>
	                                            </div>
	                                        
                        				</div>
                        				<div class="col-md-3">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">조회 타입 선택 : </label>
	                                                <div class="col-md-7">
		                                                <select class="selectpicker" data-width="auto" name="searchType" id="searchType">
		                                                	<option value="size" <%=searchVO.getSearchType().equals("size")?"selected":"" %>>사이즈</option>
														  	<option value="count" <%=searchVO.getSearchType().equals("count")?"selected":"" %>>건수</option>
		                                               	 	<option value="all" <%=searchVO.getSearchType().equals("all")?"selected":"" %>>전체</option>
														  <!-- <option>data type 체크 결과</option> -->
														  <!-- <option>data null 체크 결과</option> -->
														</select>
	                                                </div>
	                                            </div>
	                                        
                        				</div>
                        				<div class="col-md-4">
                        					
	                                            <div class="form-group" style="margin-bottom:5px;">
	                                                <label class="col-md-2 control-label" style="text-align:center;">기간 : </label>
	                                               <div class='col-md-4'>
												        <div class="form-group">
												            <div class='input-group date' id='datetimepicker6'>
												                <input type='text' class="form-control" id="startDate" name="startDate"  value="<%=searchVO.getStartDate()%>" />
												                <span class="input-group-addon">
												                    <span class="glyphicon glyphicon-calendar"></span>
												                </span>
												            </div>
												        </div>
												    </div>
												    <div class='col-md-1 text-center p-t-8'>
												    ~
												    </div>
												    <div class='col-md-4'>
												        <div class="form-group">
												            <div class='input-group date' id='datetimepicker7'>
												                <input type='text' class="form-control" id="endDate" name="endDate"  value="<%=searchVO.getEndDate()%>" />
												                <span class="input-group-addon">
												                    <span class="glyphicon glyphicon-calendar"></span>
												                </span>
												            </div>
												        </div>
												    </div>
	                                            </div>
                        				</div>
                        				<div class="col-md-2">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <button class="btn btn-primary waves-effect waves-light" type="button"  onclick="javascript:goSearch();">검색</button>
	                                            	<button class="btn btn-primary waves-effect waves-light" type="button" onclick="exportExcel();" >Export as Excel</button>
	                                            </div>
                        				</div>
                        			</div>
                        				</div>
                        				<div class="col-md-2">
                        				</div>
                        			</div>
                        		
                        		
                        			
                        			</div>
                        		</div>
                        	</form>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">

	                       				<table id="loadStatusList" style="width:100%;"></table>
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
    	            $('#endDate').val($('#startDate').val());
    	        });
    	        $("#datetimepicker7").on("dp.change", function (e) {
    	            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    	        });
    	        
    	        $(".bootstrap-select").css("width","100%"); 
            });
		  var date = new Date();
            
          function add_date(){
        	  
               var currentDate = date.getDate()-1; 
               date.setDate(currentDate);
               
               var month = date.getMonth()+1;
               var day = date.getDate();
               var year = date.getFullYear();
               if(month < 10){
            	   month = '0'+month;
               }
               if(day < 10){
            	   day = '0'+day;
               }
               var calDate = year + '-' + month + '-' + day;
               return calDate;
            }

          var calStartDate = "<%=searchVO.getStartDate()%>";
          var calEndDate = "<%=searchVO.getEndDate()%>"; 
          var arr1;
          var arr2;
          var dat1;
          var dat2;
          var diff;
          var currDay;
          var gap = 7;
          if(calStartDate != ""){
	          arr1 = calStartDate.split('/');
	          arr2 = calEndDate.split('/');
	          dat1 = new Date(arr1[0], arr1[1]-1, arr1[2]);
	          dat2 = new Date(arr2[0], arr2[1]-1, arr2[2]);
	          var currentDate = dat2.getDate()+1; 
	          dat2.setDate(currentDate);
	          date = dat2; 
	          diff = dat2 - dat1;
	          currDay = 24 * 60 * 60 * 1000;
	         gap =  parseInt(diff/currDay);
          }
          
          var searchType = "<%=searchVO.getSearchType()%>";
          
            var colNamesArr = ['Schema','적재 테이블(Managed)'];
            var colModelArr = [{name:'0',align: 'left', sortable:false, width:"100"},{name:'1', index:'CheckResult',align: 'left', sortable:false}];
            var groupHeadersArr = [];
            
            if(searchType == "all"){
            	for(var i = 2; i < (gap*2)+2; i++){											//날짜차이에 2를 곱하고  2를 더한다.
	            	  if(i < gap+2){																//2에 날짜 차이를 더한다.
	            		  colNamesArr.push('적재 사이즈');
	            		  colNamesArr.push('적재 건수');
	            	  }
	          		if(i % 2 == 0){
	          			groupHeadersArr.push({startColumnName: i , numberOfColumns: 2, titleText:add_date()});
	          		}
          		}
            }else if(searchType == "" || searchType == "size"){
            	for(var i = 2; i < gap+2; i++){						
	            	  if(i < gap+2){																//2에 날짜 차이를 더한다.
	            		  colNamesArr.push('적재 사이즈');
	            	  }
	          			groupHeadersArr.push({startColumnName: i , numberOfColumns: 1, titleText:add_date()});
	          		
        		}
            	
            }else if(searchType == "count"){
            	for(var i = 2; i < gap+2; i++){						
	            	  if(i < gap+2){																//2에 날짜 차이를 더한다.
	            		  colNamesArr.push('적재 건수');
	            	  }
	          			groupHeadersArr.push({startColumnName: i , numberOfColumns: 1, titleText:add_date()});
	          		
        		}
            	
            }
              
            for(var i = 2; i < colNamesArr.length; i++){
            	colModelArr.push({name: i ,align: 'right',formatter:'integer',formatoptions:{thousandsSeparator:','}, sortable:false});
               		
            	}  
        
            
            var param = "&startDate=<%=searchVO.getStartDate()%>&endDate=<%=searchVO.getEndDate()%>&searchType=<%=searchVO.getSearchType()%>&searchWord=<%=searchVO.getSearchWord()%>";
            
            
    		$(function(){
     			$("#loadStatusList").jqGrid({  
     				url:'<%=contextPath%>/getLoadStatusList.do?colNamesArr='+colNamesArr.length+param,
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:colNamesArr,
     			   	colModel: colModelArr ,
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : false,
                   shrinkToFit:false, 
     			    rowList: [],        // disable page size dropdown
     			    pgbuttons: false,     // disable page control like next, back button
     			    pgtext: null,         // disable pager text like 'Page 0 of 10'
     			    viewrecords: false, 

     			});
     			
     			$("#loadStatusList").jqGrid('setGroupHeaders', {
     				  useColSpanStyle: true, 
     				  groupHeaders:groupHeadersArr
     				});


     			$("#loadStatusList").jqGrid(
     					'navGrid',
     					'#jqGridPager', 
     					{excel:true, edit:false, add:false, del:false, refresh:false, search:false}
     					);
     		});  
    		
    		function exportExcel(){
    			var cols = [];
  				var mycolModel = $("#loadStatusList").getGridParam("colNames");
  				$.each(mycolModel, function(i) {
  					if (!this.hidden) {
  						 cols.push(this);
  					}
  				});
  				var colsJ = JSON.stringify(cols);
  				var params = "colNamesArr=" + colNamesArr.length + param + "&columns=" + colsJ;
  				var uri = '/bdapportal/loadStatusListExcel.do';
 				jQuery("#loadStatusList").jqGrid('excelExport', {url:uri+'?'+params});
    		}

    	    function goSearch(){
    	    	$("#loadStatusSearchForm").submit();
    	    	
    	    }
    	    
			function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>