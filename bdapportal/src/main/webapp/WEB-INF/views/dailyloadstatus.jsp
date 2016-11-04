<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>일 적재 현황</b></h4>
						
                        <div class="col-sm-12" style="">
                        	<form class="form-horizontal" role="form" id="loadStatusSearchForm" method="post" action="<%=contextPath%>/dailyloadstatus.do" accept-charset="utf-8">
	                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:10px;">
	                        			<div class="row">
	                        				<div class="col-md-9">
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
		                        			
		                        					<label class="col-md-5 control-label" style="text-align:right;">기준일자 :</label>
			                        				<div class='input-group date' id='datetimepicker1'>
									                    <input type='text' class="form-control" id="startDate" name="startDate"   value="<%=searchVO.getStartDate()%>"/>
									                    <span class="input-group-addon">
									                        <span class="glyphicon glyphicon-calendar"></span>
									                    </span>
									                </div>
									        
											</div>
	                        				<div class="col-md-2">
	                        				
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                            	<div class="col-md-12 text-left">
	                                     					<button class="btn btn-primary waves-effect waves-light" type="button"   onclick="javascript:goSearch();">검색</button>
		                                                    <button class="btn btn-primary waves-effect waves-light" type="button" onclick="exportExcel();" >Export as Excel</button>
		                                                
		                                                </div>
		                                            </div>
		                                    
	                        				</div>
	                        				
	                        			</div>
	                        				
	                        				
	                        				</div>
	                        				<div class="col-md-2">
	                        				</div>
	                        			</div>
	                        		
	                        		
	                        			
	                        		</div>
                        		</form>
                        	</div>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">

	                       				<table id="dailyLoadStatusList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       	</div>
                    </div>
                    <!-- end container -->
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
            	$('#datetimepicker1').datetimepicker({
                	format: 'YYYY/MM/DD'
                });
				$(".bootstrap-select").css("width","100%"); 
            });

            var colNamesArr = ['테이블명','월평균젹재량'];
            
            function add_date(dat,num){
          	  
                var currentDate = dat.getDate()+num; 
                dat.setDate(currentDate);
                
                var month = dat.getMonth()+1;
                var day = dat.getDate();
                var year = dat.getFullYear();
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
            var arr1;
            var dat1;
            if(calStartDate != ""){
  	          arr1 = calStartDate.split('/');
  	          dat1 = new Date(arr1[0], arr1[1]-1, arr1[2]);
  	    	colNamesArr.push(add_date(dat1,-7));
 		    colNamesArr.push(add_date(dat1,6));
  	        colNamesArr.push(add_date(dat1,1));
  	    	
  	    	colNamesArr.push('월 평균 대비 증감율');
  	    	colNamesArr.push('전주 대비 증감율');
  	    	colNamesArr.push('전일 대비 증감율');
  	    	colNamesArr.push('NULL');
  	    	colNamesArr.push('TYPE');
            }else{
            	 var date = new Date();
       	    	colNamesArr.push(add_date(date,-7));
      		    colNamesArr.push(add_date(date,6));
            	colNamesArr.push(add_date(date,1));
       	    	
       	    	colNamesArr.push('월 평균 대비 증감율');
       	    	colNamesArr.push('전주 대비 증감율');
       	    	colNamesArr.push('전일 대비 증감율');
       	    	colNamesArr.push('NULL');
       	    	colNamesArr.push('TYPE');
            	
            }
            
            var param = "&startDate=<%=searchVO.getStartDate()%>&searchWord=<%=searchVO.getSearchWord()%>";
            
    		$(function(){
     			$("#dailyLoadStatusList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/dailyloadstatuslist.do?'+param,
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	/* colNames:['테이블명','월평균젹재량','2016-08-16', '2016-08-22', '2016-08-23','월 평균 대비 증감율','전주 대비 증감율','전일 대비 증감율','NULL','TYPE'], */
     			   	colNames:colNamesArr,
     			   	colModel:[
     			   		{name:'tblNm', index:'CheckResult',align: "left", sortable:false},
     			   		{name:'monthAvg',align: "right", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum', sortable:false},
     			   		{name:'week',align: "right", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum', sortable:false},
     			   		{name:'yesterday',align: "right", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum', sortable:false},
     			   		{name:'today',align: "right", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum', sortable:false},
     			   		{name:'monthPercentage',align: "right",formatter:editable, sortable:false},
     			   		{name:'weekPercentage',align: "right",formatter: editable, sortable:false},
     			   		{name:'dayPercentage',align: "right",formatter: editable, sortable:false},
     			   		{name:'chkNull',align: "center",formatter: typeChk, sortable:false},
     			   		{name:'chkType',align: "center",formatter: typeChk, sortable:false},
     			   		
     			   	],
     			   viewrecords: true, 
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   viewrecords: true,
    			   footerrow:true,
    			   userDataOnFooter:true,
                   pager: "#jqGridPager",
    			   loadComplete : function(data){
    				   
    				   		var monthSum = $("#dailyLoadStatusList").jqGrid('getCol','monthAvg',false,'sum');
    				   		var weekSum = $("#dailyLoadStatusList").jqGrid('getCol','week',false,'sum');
							var daySum = $("#dailyLoadStatusList").jqGrid('getCol','3',false,'sum');
							var todaySum = $("#dailyLoadStatusList").jqGrid('getCol','4',false,'sum');
							$("#dailyLoadStatusList").jqGrid('footerData','set',{'tblNm':'합계','monthAvg':monthSum,'week':weekSum,'yesterday':daySum,'today':todaySum});
							
							$(".ui-jqgrid-ftable tr:first td:eq(5)").css("border-right-width","0px");
							$(".ui-jqgrid-ftable tr:first td:eq(6)").css("border-right-width","0px");
							$(".ui-jqgrid-ftable tr:first td:eq(8)").css("border-right-width","0px");
							
							$('#jqGridPager').css("border-top", "1px solid #ddd");
    			   }

     			});
     			
     			$("#dailyLoadStatusList").jqGrid('setGroupHeaders', {
   				  /* useColSpanStyle: false, */ 
   					useColSpanStyle: true,
   				  groupHeaders:[{startColumnName: 'chkNull' , numberOfColumns: 2, titleText:'정합성'}]
   				});
    		}
    	    );
     			
    		function exportExcel(){
    			var cols = [];
  				var mycolModel = $("#dailyLoadStatusList").getGridParam("colNames");
  				$.each(mycolModel, function(i) {
  					if (!this.hidden) {
  						 cols.push(this);
  					}
  				});
  				var colsJ = JSON.stringify(cols);
  				var params = "colNamesArr=" + colNamesArr.length + param + "&columns=" + colsJ;
  				var uri = '/bdapportal/dailyloadstatusListExcel.do';
 				jQuery("#dailyLoadStatusList").jqGrid('excelExport', {url:uri+'?'+params});
    		}
            
    		function date(value, options, rowObject){
    			var radioHtml = '2016-06-22';
  			   return radioHtml;
    		}
    		
    		function editable(value, options, rowObject){
 			   var radioHtml = value+"%";
 			   return radioHtml;
 			}
 		
    		function typeChk(value, options, rowObject){
    			  var rtnVal = value;
    			   return rtnVal;
    			   
    		}
    		
    		function goSearch(){
    	    	$("#loadStatusSearchForm").submit();
    	    }
    		
        </script>
    
    
</body>
</html>