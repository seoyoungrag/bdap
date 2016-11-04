<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="org.springframework.web.util.WebUtils"%> 
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%> 
 
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  SearchVO searchVO = (SearchVO)request.getAttribute("searchVO");
  
  boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
  boolean isProcess = (Boolean)session.getAttribute("isProcess");
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
                    	<div class="col-sm-5" style="">
							<h4 class="m-t-0 header-title" style="padding:10px;"><b>공지사항</b></h4>
						</div>
						
						<%if(isAdmin){ %>
                    	<div class="col-sm-7 text-right" style="padding-right:30px;">
							<button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goReg();" >등록</button>
						</div>
                    	<%} %>
						<form class="form-horizontal" role="form" id="noticeSearchForm" method="post" action="<%=contextPath%>/notice/list.do" accept-charset="utf-8">
						
	                        <div class="col-sm-12" style="">
	                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
	                        			<div class="row">
	                        				<div class="col-md-11">
	                        				<div class="row">
	                        				<%-- <div class="col-md-2">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                                <label class="col-md-5 control-label" style="text-align:right;">시스템명:</label>
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" data-width="auto" name="category">                                  
															  <option value="">전체</option>
															  <option value="BDAP" <%=searchVO.getCategory().equals("BDAP")?"selected":"" %>>BDAP</option>
															  <option value="KDAP" <%=searchVO.getCategory().equals("KDAP")?"selected":"" %>>KDAP</option>
															  <option value="BIDW" <%=searchVO.getCategory().equals("BIDW")?"selected":"" %>>BIDW</option>
															</select>
		                                                </div>
		                                            </div>
		                                        <!-- </form> -->
	                        				</div> --%>
	                        				<div class="col-md-2">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                                <label class="col-md-5 control-label" style="text-align:right;">업무구분:</label>
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" data-width="auto" name="categorySub">
															  <option value="normal" <%=searchVO.getCategorySub().equals("normal")?"selected":"" %>>일반</option>
															  <option value="data" <%=searchVO.getCategorySub().equals("data")?"selected":"" %>>데이터</option>
															  <option value="work" <%=searchVO.getCategorySub().equals("work")?"selected":"" %>>작업</option>
															</select>
		                                                </div>
		                                            </div>
		                                        <!-- </form> -->
	                        				</div>
	                        				<div class="col-md-4">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:5px;">
		                                                <label class="col-md-2 control-label" style="text-align:center;">기간 : </label>
		                                               <div class='col-md-4'>
													        <div class="form-group">
													            <div class='input-group date' id='datetimepicker6'>
													                <input type='text' class="form-control" name="startDate" id="startDate" value="<%=searchVO.getStartDate()%>" />
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
													                <input type='text' class="form-control" name="endDate" id="endDate" value="<%=searchVO.getEndDate()%>"/>
													                <span class="input-group-addon">
													                    <span class="glyphicon glyphicon-calendar"></span>
													                </span>
													            </div>
													        </div>
													    </div>
		                                            </div>
		                                       <!--  </form> -->
	                        				</div>
	                        				
	                        				<div class="col-md-1">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" data-width="auto" name="searchType" id="searchType">
															  <option value="TITLE" <%=searchVO.getSearchType().equals("TITLE")?"selected":"" %>>제목</option>
															  <option value="WRITER" <%=searchVO.getSearchType().equals("WRITER")?"selected":"" %>>등록자</option>
															</select>
		                                                </div>
		                                            </div>
		                                        <!-- </form> -->
	                        				</div>
	                        				
	                        				<div class="col-md-2">
		                                         <input class="form-control" type="text" id="searchWord" name="searchWord" value="<%=searchVO.getSearchWord()%>">
		                                    </div>
	                        				<div class="col-md-1">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:10px;">
		                                            	<div class="col-md-12 text-left">
	                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:noticeSearch();" >검색</button>
		                                                </div>
		                                                <!-- <div class="col-md-6 text-left">
	                                     					<button class="btn btn-primary waves-effect waves-light" type="button" >검색</button>
		                                                </div> -->
		                                            </div>
		                                        <!-- </form> -->
	                        				</div>
	                        			
	                        			</div>
	                        				
	                        				</div>
	                        				<div class="col-md-1">
	                        					<!-- <form class="form-horizontal" role="form"> -->
		                                            <div class="form-group" style="margin-bottom:10px; margin-right:-10px;">
		                                            	<div class="col-md-12 text-right">
	                                     					<!-- <button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goReg();" >등록</button> -->
	                                     					<!-- <button class="btn btn-warning waves-effect waves-light" type="button" onclick="javascript:goReg();" >수정</button>
	                                     					<button class="btn btn-pink waves-effect waves-light" type="button" onclick="javascript:goReg();" >삭제</button> -->
		                                                </div>
		                                            </div>
		                                        <!-- </form> -->
	                        				</div>
	                        			</div>
	                        		
	                        		
	                        			
	                        		</div>
	                        	</div>
                        	</form>
                      		<!-- <div class="col-lg-12" >
								<div class="card-box">
                                    <div>
										<table id="emergencyList" style="width:1750px;"></table>
                       				</div>
                       			</div>
                       		</div> -->
                       		<div class="col-lg-12" >
								<div class="card-box">
                                    <div>
	                       				<table id="noticeList" style="width:98%;"></table>
	                       				
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       		</div>
                    </div>
                    <!-- end container -->
                </div>
                <!-- end content -->

                <!-- <footer class="footer text-right">
                  
                </footer> -->

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


            <!-- Right Sidebar -->

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
            });
            
            var param = "category=<%=searchVO.getCategory()%>&categorySub=<%=searchVO.getCategorySub()%>&startDate=<%=searchVO.getStartDate()%>&endDate=<%=searchVO.getEndDate()%>&searchType=<%=searchVO.getSearchType()%>&searchWord=<%=searchVO.getSearchWord()%>";
            
    		 $(function(){
     			$("#noticeList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getNoticeList.do?'+param,

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     				multiselect: false,
     			   	colNames:['시스템명','업무구분','긴급','제목','등록자','id','등록일','등록자 아이디','부모아이디'],
     			   	colModel:[
     			   		{name:'category', index:'CheckResult',align: "center", width:"100",hidden:true},
     			   		{name:'categorySub',align: "center", width:"100",formatter:subFormatter, sortable:false},
     			   		{name:'emer',align: "center", width:"100",hidden:true},
     			   		{name:'title',align: "left", width:"400",formatter:emer, sortable:false},
     			   		{name:'writer',align: "left", width:"100", sortable:false},
     			   		{name:'noticeId',align: "center", width:"100",hidden:true},
     			   		{name:'regDate',align: "center",width:"100", sortable:false},
     			   		{name:'userId',align: "center",width:"100",hidden:true},
     			   		{name:'parentId',align: "center",width:"100",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
                   rownumbers: true,
    			   viewrecords: true,
			   	   onCellSelect : function(rowid,index,contents,event){
			   			var cm = $(this).jqGrid('getGridParam','colModel');	
			   			if(cm[index].name == 'title'){
			   				var id = $(this).jqGrid('getRowData',rowid).noticeId;	//선택된 row의 id를 가져온다.
				   			document.location.href = "<%=contextPath%>/notice/view.do?bbsPostId="+id;	
			   			}
			   		}
     			});
     		});          
    		 
    		function goReg(){
    			document.location.href = "<%=contextPath%>/notice/reg.do";
    		}
    		
    		function noticeSearch(){
    			$("#noticeSearchForm").submit();
    		}
    		
    		function subFormatter(value, options, rowObject){
    			var returnVal = '';
    			
    			if(value == 'normal'){
    				returnVal = '일반';
    			}else if(value == 'data'){
    				returnVal = '데이터';
    			}else if(value == 'work'){
    				returnVal = '작업';
    			}
    			
  			   return returnVal;
  			}
    		
    		function emer(value, options, rowObject){
    			var emerYN = rowObject.emer;
    			var radioHtml = "&nbsp;&nbsp;&nbsp;";
    			if(emerYN == 'Y'){
    				radioHtml = '<p class="label label-danger" style="width:100px; margin-top:15px; margin-left:15px; text-align:left">긴급</p>&nbsp;&nbsp;&nbsp;'
    			}
    			
    			var replyContent = rowObject.parentId;
    			if(replyContent != ""){
    				radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:50px; text-align:left">답변</p>&nbsp;&nbsp;&nbsp;'
    			}
    			
  			   radioHtml += '<span style="cursor:pointer">'+value+'</span>';
  			   return radioHtml;
  			}
    		
    		function question(value, options, rowObject){
 			   var radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:0px; background-color:#5cb85c; text-align:left">질문</p>&nbsp;&nbsp;&nbsp;'+value;
 			   return radioHtml;
 			}
        </script>
</body>
</html>