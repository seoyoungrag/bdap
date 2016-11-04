<%@page import="com.kt.bdapportal.domain.BdapBbsCategory"%>
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
  ArrayList<BdapBbsCategory> bdapBbsCategory = (ArrayList<BdapBbsCategory>) request.getAttribute("bdapBbsCategory");
  
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
							<h4 class="m-t-0 header-title" style="padding:10px;"><b>Q & A</b></h4>
						</div>
						<%if(isAdmin){ %>
                    	<div class="col-sm-7 text-right" style="padding-right:30px;">
							<button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goReg();" >등록</button>
						</div>
                    	<%} %>
						<form class="form-horizontal" role="form" id="qnaSearchForm" method="post" action="<%=contextPath%>/qna/list.do" accept-charset="utf-8">
                        <div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
                        			<div class="row">
                        				<div class="col-md-12">
	                        				<div class="row">
	                        				<div class="col-md-2" style="width:250px;">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">진행상황:</label>
	                                                <div class="col-md-4">
		                                                <select class="selectpicker" id="processStatus" name="processStatus">
														  <option value="">전체</option>
														  <option value="P" <%=searchVO.getProcessStatus() == 'P'?"selected":"" %>>처리중</option>
														  <option value="S" <%=searchVO.getProcessStatus() == 'S'?"selected":"" %>>처리완료</option>
														  <option value="R" <%=searchVO.getProcessStatus() == 'R'?"selected":"" %>>보완요청</option>
														</select>
	                                                </div>
	                                            </div>
	                        				</div>
	                        				<div class="col-md-3">
		                                            <div class="form-group" style="margin-bottom:5px;">
		                                                <label class="col-md-2 control-label" style="text-align:center;">등록일 : </label>
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
		                                        
	                        				</div>
	                        				<div class="col-md-2">
		                                            <div class="form-group text-center" style="margin-bottom:10px;">
		                                            	<div class="checkbox checkbox-primary checkbox-inline">
	                                     				   <input id="inlineCheckbox1" type="checkbox" value="Y" name="minePostYN" <%=searchVO.getMinePostYN() == 'Y'?"checked":"" %>>
	                                        				<label for="inlineCheckbox1"> 본인게시물 </label>
	                                    				</div>
	                                    				<div class="checkbox checkbox-primary checkbox-inline">
	                                     				   <input id="inlineCheckbox1" type="checkbox" value="Y" name="question" <%=searchVO.getQuestionYn().equals("Y")?"checked":"" %>>
	                                        				<label for="inlineCheckbox1"> 질문글만 </label>
	                                    				</div>
		                                            </div>
	                        				</div>
	                        				<div class="col-md-1">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <div class="col-md-3">
		                                                <select class="selectpicker" id="searchType" name="searchType">
														  <option value="TITLE" <%=searchVO.getSearchType().equals("TITLE")?"selected":"" %>>제목</option>
														  <option value="CONTENT" <%=searchVO.getSearchType().equals("CONTENT")?"selected":"" %>>내용</option>
														  <option value="WRITERNM" <%=searchVO.getSearchType().equals("WRITERNM")?"selected":"" %>>등록자</option>
														  <!-- <option>소속</option> -->
														</select>
	                                                </div>
	                                            </div>
	                        				</div>
	                        				<div class="col-md-1">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <div class="col-md-3">
		                                                <select class="selectpicker" id="category" name="category" >
		                                                	<option value="">전체</option>
			                                                <%for(int i = 0; i < bdapBbsCategory.size(); i++){ %>
			                                              	  <option value="<%=bdapBbsCategory.get(i).getCateId()%>" <%=searchVO.getCategory().equals(bdapBbsCategory.get(i).getCateId())?"selected":"" %>><%=bdapBbsCategory.get(i).getCateName()%></option>
			                                                <%} %>
															</select>
	                                                </div>
	                                            </div>
	                        				</div>
	                        				<div class="col-md-2">
		                                        <input class="form-control" type="text" placeholder="검색어 입력" id="searchWord" name="searchWord"  value="<%=searchVO.getSearchWord()%>">
		                                    </div>
	                        				<div class="col-md-1">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:qnaSearch();" >검색</button>
	                                                </div>
	                                            </div>
	                        				</div>
	                        			</div>
                        				</div>
                        			</div>
                        			
                        			<div class="row">
                        				<div class="col-md-5">
	                        				<div class="row">
		                        				<div class="col-md-4">
			                                            <div class="form-group" style="margin-bottom:10px;">
			                                                <label class="col-md-8 control-label" style="text-align:right;">처리중 : <span class="label label-primary pull-right" style="margin-top:3px; margin-left:10px;" id="qnaStatusProcess"></span></label>
			                                            </div>
		                        				</div>
		                        				<div class="col-md-4">
		                                            <div class="form-group" style="margin-bottom:10px;">
			                                           <label class="col-md-8 control-label" style="text-align:right;">처리완료 : <span class="label label-success pull-right" style="margin-top:3px; margin-left:10px;" id="qnaStatusComplete"></span></label>
			                                         </div>
		                        				</div>
		                        				<div class="col-md-4">
			                                            <div class="form-group" style="margin-bottom:10px;">
			                                                <label class="col-md-8 control-label" style="text-align:right;">보완요청 : <span class="label label-pink pull-right" style="margin-top:3px; margin-left:10px;" id="qnaStatusReq"></span></label>
			                                            </div>
		                        				</div>
	                        				</div>
                        				</div>
                        				
                        			</div>
                        		</div>
                        	</div>
                        	</form>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">
	                       				<table id="qnaList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       	</div>
                    </div>
                    <!-- end container -->
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


            });

            var param = "processStatus=<%=searchVO.getProcessStatus()%>&startDate=<%=searchVO.getStartDate()%>&endDate=<%=searchVO.getEndDate()%>&minePostYN=<%=searchVO.getMinePostYN()%>&searchType=<%=searchVO.getSearchType()%>&searchWord=<%=searchVO.getSearchWord()%>&question=<%=searchVO.getQuestionYn()%>&category=<%=searchVO.getCategory()%>";
            
    		$(function(){
     			$("#qnaList").jqGrid({  
     				url:'<%=contextPath%>/getQnaList.do?'+param,
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['분류','제목','id','진행상황', '답변담당자','답변예정일','등록자','등록자id','등록일','부모아이디'],
     			   	colModel:[
     			   		{name:'category', index:'CheckResult',align: "center", width:"100", sortable:false},
     			   		{name:'title',align: "left", width:"400",formatter:question, sortable:false},
     			   		{name:'postId',align: "center", width:"100",hidden:true},
     			   		{name:'status',align: "center", width:"100",formatter:setStatus, sortable:false},
     			   		{name:'responsername',align: "center",width:"100", sortable:false},
     			   		{name:'expectDate',align: "center",width:"100", sortable:false},
     			   		{name:'wirterName',align: "left",width:"100", sortable:false},
     			   		{name:'wirterId',align: "center",width:"100",hidden:true},
	       			    {name:'regDate',align: "center",width:"100", sortable:false},
	       			 	{name:'parentId',align: "center",width:"100",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   height : 'auto',
                   autowidth : true,
                   rownumbers: true,
                   shrinkToFit:true, 
                   /* shrinkToFit : false, */
    			   viewrecords: true,
    			   rowNum : 20,
    			   rowList: [20,50,100],
    			   loadComplete : function(data){
						 $(".checkbox").css("margin-top","4px");
		  	    		 $(".checkbox").css("margin-left","8px");
		  	    		$("#qnaStatusProcess").html(data.qnaStatusProcess+"건");
		  	    		$("#qnaStatusComplete").html(data.qnaStatusComplete+"건");
		  	    		$("#qnaStatusReq").html(data.qnaStatusReq+"건");
		  	    	
			   		},
					onCellSelect : function(rowid,index,contents,event){
						var cm = $(this).jqGrid('getGridParam','colModel');	
			   			if(cm[index].name == 'title'){
			   				var id = $(this).jqGrid('getRowData',rowid).postId;	//선택된 row의 id를 가져온다.
				   			document.location.href = "<%=contextPath%>/qna/view.do?bbsPostId="+id;	
			   			}
			   		}
     			});
     		});         
     
    		
			function goReg(){			//Q & A
    			
    			document.location.href = "<%=contextPath%>/qna/reg.do";
    			
    		}
			function goMod(){
    			
				var checkArr = $("#qnaList").getGridParam('selarrrow');
				
				if(checkArr.length > 1){		//두개 이상 선택 되면 alert 띄우기
					alert("하나의 게시글을 선택 하세요.");
				}else if(checkArr.length == 0){
					alert("수정할 게시물을 선택 하세요.");
				}else{
					if(confirm("수정 하시겠습니까?")){
						var bbsPostId = "";
						var bbsParentId = "";
						bbsParentId = $("#qnaList").jqGrid('getRowData',checkArr).parentId;
						bbsPostId = $("#qnaList").jqGrid('getRowData',checkArr).postId;
						
						if(bbsParentId == ""){			//게시글과 답글의 수정 페이지를 구분한다.
							document.location.href = "<%=contextPath%>/qna/mod.do?bbsPostId="+bbsPostId;
						}else{
							document.location.href = "<%=contextPath%>/reply/mod.do?bbsParentId="+bbsParentId+"&bbsPostId="+bbsPostId+"&bbsType=BO2";
						}
					}
				}
    		}
			
			function qnaSearch(){
    			$("#qnaSearchForm").submit();
    		}
			
			function setStatus(value, options, rowObject){
    			var status = "";
    			if(value == "P"){
    				status = "처리중";
    			}else if(value == "S"){
    				status = "처리완료";
    			}else if(value == "R"){
    				status = "보완요청";
    			}
				return status;
			}
			
			function goDel(){
				var checkArr = $("#qnaList").getGridParam('selarrrow'); 
				if(checkArr.length == 0){
					alert("삭제할 게시물을 선택 하세요.");
				}else{
					if(confirm(checkArr.length+"개의 게시물이 삭제 됩니다. 정말 진행 하시겠습니까?")){
						var bbsPostId = "";
						for(var i = 0; i < checkArr.length; i++){
							bbsPostId += $("#qnaList").jqGrid('getRowData',checkArr[i]).postId+"^";
						}
		    			document.location.href = "<%=contextPath%>/qna/del.do?bbsPostIdArr="+bbsPostId;	
					}
				}
				
    		}
    		
    		function question(value, options, rowObject){
    			var commentCnt = '';
    			if(value.length>3){
    				commentCnt = value.substr( value.length-3,value.length );
    				if(commentCnt[0]=='['&&commentCnt[2]==']'){
    					console.log(commentCnt[0]);
    					value = value.replace(commentCnt,'');
    				}else{
    					commentCnt = '';
    				}
    			}
 			    var radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:15px; background-color:#5cb85c; text-align:left">질문</p>&nbsp;&nbsp;&nbsp;';
 			  	var replyContent = rowObject.parentId;
    			if(replyContent != ""){
    				radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:50px; text-align:left">답변</p>&nbsp;&nbsp;&nbsp;'
    			}
 			  	   
    			radioHtml += '<span style="cursor:pointer;" onclick="javascript:goviewpage();">'+value+'&nbsp;<font style="font-style:oblique;font-weight:bold;">'+commentCnt+'</></span>' ;
 			   return radioHtml;
 			}
    		
    		function goviewpage(){
    			
    			document.location.href = "<%=contextPath%>/qna/view.do";
    			
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
    	            $('#endDate').val($('#startDate').val());
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