<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
 <%@ page import="com.kt.bdapportal.common.util.SearchVO"%>
 <%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>   
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  
  @SuppressWarnings (value="unchecked")
	List<MgmtTblStat> mgmtTblStatDbList = (List<MgmtTblStat>)request.getAttribute("mgmtTblStatDbList");
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>Table Management</b></h4>
						
                        <div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:10px;">
                        			<div class="row">
                        				<div class="col-md-9">
                        				<div class="row">
                        				<form class="form-horizontal" role="form" id="tableManagementSearchForm" method="post" action="<%=contextPath%>/tableManagementList.do" accept-charset="utf-8">
	                        				<div class="col-md-3">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">Schema 선택 :</label>
	                                                <div class="col-md-7">
		                                                <select class="selectpicker" name="schema" id="schema">
															<%for(int i = 0; i < mgmtTblStatDbList.size(); i++){ 
			                                                	MgmtTblStat mgmtTblStat = 	mgmtTblStatDbList.get(i);%>
			                                                	<option value="<%=mgmtTblStat.getDbName() %>"  <%=searchVO.getSearchWord().equals(mgmtTblStat.getDbName())?"selected":"" %> ><%=mgmtTblStat.getDbName() %></option>
			                                                <%} %>
														</select>
	                                                </div>
	                                            </div>
	                        				</div>
	                        				<div class="col-md-2">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
	                                    					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goSearch();">검색</button>
	                                                    <!-- <button class="btn btn-warning waves-effect waves-light" type="button" >수정</button> -->
	                                                </div>
	                                            </div>
	                        				</div>
                        				</form>
                        				<div class="col-md-3">
                        					<!-- <form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">조회 타입 선택 : </label>
	                                                <div class="col-md-4">
		                                                <select class="selectpicker">
														  <option>생성일자</option>
														  <option>사이즈</option>
														  <option>건수</option>
														</select>
	                                                </div>
	                                            </div>
	                                        </form> -->
                        				</div>
                        				<div class="col-md-4">
                        					<!-- <form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:5px;">
	                                                <label class="col-md-2 control-label" style="text-align:center;">기간 : </label>
	                                               <div class='col-md-4'>
												        <div class="form-group">
												            <div class='input-group date' id='datetimepicker6'>
												                <input type='text' class="form-control" />
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
												                <input type='text' class="form-control" />
												                <span class="input-group-addon">
												                    <span class="glyphicon glyphicon-calendar"></span>
												                </span>
												            </div>
												        </div>
												    </div>
	                                            </div>
	                                        </form> -->
                        				</div>
                        				<div class="col-md-2">
                        					<!-- <form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" >검색</button>
	                                                    <button class="btn btn-warning waves-effect waves-light" type="button" >수정</button>
	                                                </div>
	                                            </div>
	                                        </form> -->
                        				</div>
                        				

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

	                       				<table id="tableManagementList" style="width:100%;"></table>
	                       				 <!-- <div id="jqGridPager"></div> -->
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
        
        <!-- jqgrid -->
        <script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script> 

        <script type="text/javascript">
            jQuery(document).ready(function($) {
            });

            var param = "&searchWord=<%=searchVO.getSearchWord()%>";
            
    		$(function(){
     			$("#tableManagementList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getTableManagementList.do?'+param,
     				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['Schema','적재 테이블(Managed)','생성일자', '사이즈', '건수','유효기간','id','유효기간 수정'],
     			   	colModel:[
    					/* {name:'row',align: "center", key: true,formatter:'checkbox', editable: true, edittype: 'checkbox', editoptions: { value: "True:False" }, formatoptions: { disabled: false},width:"30"}, */
     			   		/* {name:'row', index:'CheckResult',align: "center",formatter: radio }, */
     			   		{name:'schema', index:'CheckResult',align: "center"},
     			   		{name:'table',align: "center"},
     			   		{name:'createDt',align: "center"},
     			   		{name:'size',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'count',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'validateDate',align: "center"},
	     			   	{name:'tblId',align: "center",hidden:true}, 			   		
     			   		{name:'validateDateMod',align: "center",formatter: editable}
     			   	],
     			   viewrecords: true, 
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   viewrecords: true,
    			   footerrow:true,
    			   userDataOnFooter:true,
    			   loadComplete : function(data){
							var tabSizeCol = $("#tableManagementList").jqGrid('getCol','size',false,'sum');
							var tabNumberCol = $("#tableManagementList").jqGrid('getCol','count',false,'sum');
							$("#tableManagementList").jqGrid('footerData','set',{'table':'합계','size':tabSizeCol,'count':tabNumberCol});
							
							 /* $(".ui-jqgrid-ftable td:eq(1)").hide();
							$(".ui-jqgrid-ftable td:eq(0)").hide();  */
									  
							 $(".ui-jqgrid-ftable tr:first td:eq(0)").css("border-right-width","0px");
							 $(".ui-jqgrid-ftable tr:first td:eq(1)").css("border-right-width","0px");
    				   
    			   }

     			});
     		});         
            
    		function date(value, options, rowObject){
    			var radioHtml = '2016-06-22';
  			   return radioHtml;
    		}
    		
    		function editable(value, options, rowObject){
    			
    			var tblId = rowObject.tblId;
 			   var radioHtml = "<button class='btn btn-warning waves-effect waves-light' type='button' style='padding-top:3px; padding-bottom:3px;' onclick='javascript:expirationDateModi(\""+tblId+"\");' >수정</button>";
 			   return radioHtml;
 			}
 		
    		function expirationDateModi(tblId){
    			
    			 window.open("<%=contextPath%>/expirationDateModi.do?tblId="+tblId,"유효기간 수정","width=420,height=160,scrollbar=false"); 
    			
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
    	    
    	    function goSearch(){
    	    	$("#tableManagementSearchForm").submit();
    	    }
    	    
    	    $(window).load(function(){
   	    		
	    		 $(".bootstrap-select").css("width","100%"); 
	    	});
    	    
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