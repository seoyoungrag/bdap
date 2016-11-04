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
                    <form class="form-horizontal" role="form" id="linkageSearchForm" method="post" action="<%=contextPath%>/linkage/list.do" accept-charset="utf-8">
						<div class="col-sm-5" style="">
							<h4 class="m-t-0 header-title" style="padding:10px;"><b>비정기 자료연동 진행 현황</b></h4>
						</div>
						<div class="col-sm-7 text-right" style="padding-right:30px;">
							<%if(isAdmin){ %>
	                    	<button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goReg();" >등록</button>
	                    	<%} %>
                            <button class="btn btn-default waves-effect waves-light" type="button" >자료요청안내</button>
                            <!-- <button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goDel();" >삭제</button> -->
						</div>
                        <div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
                        			<div class="row">
                        				<div class="col-md-11">
                        				<div class="row">
                        				<div class="col-md-2">
                        					
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">자료유형:</label>
	                                                <div class="col-md-4">
		                                                <select class="selectpicker" data-width="auto" name="referenceType">                                  
														  <option value="">전체</option>
														    <option value="func" <%=searchVO.getReferenceType().equals("func")?"selected":"" %>>기능</option>
															<option value="must" <%=searchVO.getReferenceType().equals("must")?"selected":"" %>>필독</option>
															<option value="etc" <%=searchVO.getReferenceType().equals("etc")?"selected":"" %>>기타</option>
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
												                <input type='text' class="form-control" id="startDate" name="startDate"  value="<%=searchVO.getStartDate()%>"/>
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
												                <input type='text' class="form-control" id="endDate" name="endDate"  value="<%=searchVO.getEndDate()%>"/>
												                <span class="input-group-addon">
												                    <span class="glyphicon glyphicon-calendar"></span>
												                </span>
												            </div>
												        </div>
												    </div>
	                                            </div>
	                                        
                        				</div>
                        				<div class="col-md-3">
                        					
	                                            <div class="form-group text-center" style="margin-bottom:10px;">
	                                            	<div class="checkbox checkbox-primary checkbox-inline">
                                     				   <input name="searchTypes" id="id_TITLE" type="checkbox" value="TITLE">
                                        				<label for="inlineCheckbox1"> 제목 </label>
                                    				</div>
                                    				<div class="checkbox checkbox-primary checkbox-inline">
                                     				   <input name="searchTypes" id="id_CONTENT" type="checkbox" value="CONTENT">
                                        				<label for="inlineCheckbox2"> 내용 </label>
                                    				</div>
                                    				<div class="checkbox checkbox-primary checkbox-inline">
                                     				   <input name="searchTypes" id="id_WRITER_NM" type="checkbox" value="WRITER_NM">
                                        				<label for="inlineCheckbox3"> 등록자 </label>
                                    				</div>
	                                            </div>
	                                        
                        				</div>
                        				<div class="col-md-2">
	                                                    <input class="form-control" type="text" placeholder="검색어 입력" id="searchWord"  name="searchWord" value="<%=searchVO.getSearchWord()%>">
	                                                </div>
                        				<div class="col-md-1">
                        					
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:linkageSearch();">검색</button>
	                                                </div>
	                                            </div>
	                                        
                        				</div>
                        				

                        			</div>
                        				
                        				
                        				</div>
                        				<div class="col-md-1">
                        					
	                                            <div class="form-group" style="margin-bottom:10px; margin-right:-10px;">
	                                            	<div class="col-md-12 text-right">
                                     					<!-- <button class="btn btn-default waves-effect waves-light" type="button" onclick="javascript:goReg();" >등록</button> -->
	                                                </div>
	                                            </div>
	                                        
                        				</div>
                        			</div>
                        		
                        		
                        			
                        		</div>
                        	</div>
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">

	                       				<table id="linkageList" style="width:100%;"></table>
	                       				 <div id="jqGridPager"></div>
                       				</div>
                       			</div>
                       	</div>
                       </form>
                       

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
            	<%
            	StringBuffer searchTypes = new StringBuffer();
            	
            	if(searchVO.getSearchTypes().length != 0){
            		for(int i=0; i<searchVO.getSearchTypes().length;i++){
            			out.print("$('#id_"+searchVO.getSearchTypes()[i]+"').attr('checked',true);");
            			searchTypes.append("&searchTypes="+searchVO.getSearchTypes()[i]);
            		}
            	}
            	%>
            });

            var searchTypes = '<%=searchTypes.toString()%>';
            var param = "referenceType=<%=searchVO.getReferenceType()%>&startDate=<%=searchVO.getStartDate()%>&endDate=<%=searchVO.getEndDate()%>&searchType=<%=searchVO.getSearchType()%>&searchWord=<%=searchVO.getSearchWord()%>"+searchTypes;
            
    		$(function(){
     			$("#linkageList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getLinkageList.do?'+param,
     				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['자료유형','제목','id','등록자','등록일', '조회수','부모아이디'],
     			   	colModel:[
    					/* {name:'row',align: "center", key: true,formatter:'checkbox', editable: true, edittype: 'checkbox', editoptions: { value: "True:False" }, formatoptions: { disabled: false},width:"30"}, */
     			   		/* {name:'row', index:'CheckResult',align: "center", width:"50"}, */
     			   		{name:'category', index:'CheckResult',align: "center", width:"100",formatter:subFormatter, sortable:false},
     			   		{name:'title',align: "left", width:"500",formatter:title, sortable:false},
     			   		{name:'postId',align: "center", width:"100",hidden:true},
     			   		{name:'writerNm',align: "left", width:"100", sortable:false},
     			   		{name:'regDate',align: "center", width:"100", sortable:false},
     			   		{name:'postHit',align: "center",width:"50", sortable:false},
     			   		{name:'parentId',align: "center",width:"100",hidden:true}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   rownumbers: true,
                   shrinkToFit:true, 
                   /* shrinkToFit : false, */
    			   viewrecords: true,
    			   loadComplete : function(data){
						
						 $(".checkbox").css("margin-top","4px");
		  	    		 $(".checkbox").css("margin-left","8px");
				   
			   		},
					onCellSelect : function(rowid,index,contents,event){
			   			
						var cm = $(this).jqGrid('getGridParam','colModel');	
			   			if(cm[index].name == 'title'){
			   				
			   				var id = $(this).jqGrid('getRowData',rowid).postId;	//선택된 row의 id를 가져온다.
				   			document.location.href = "<%=contextPath%>/linkage/view.do?bbsPostId="+id;
			   			}
						
			   			
			   		}
     			});
     		});   
    		
    		function subFormatter(value, options, rowObject){
    			var returnVal = '';
    			if(value == 'func'){
    				returnVal = '기능';
    			}else if(value == 'must'){
    				returnVal = '필독';
    			}else if(value == 'etc'){
    				returnVal = '기타';
    			}
    			return returnVal;
  			}
            
			function goReg(){			//비정기자료 연동
    			
    			document.location.href = "<%=contextPath%>/linkage/reg.do";
    		}
    		
			
			function goMod(){
    			
				var checkArr = $("#linkageList").getGridParam('selarrrow');
				
				if(checkArr.length > 1){		//두개 이상 선택 되면 alert 띄우기
					alert("하나의 게시글을 선택 하세요.");
				}else if(checkArr.length == 0){
					alert("수정할 게시물을 선택 하세요.");
				}else{
					if(confirm("수정 하시겠습니까?")){
						var bbsPostId = "";
						var bbsParentId = "";
						bbsParentId = $("#linkageList").jqGrid('getRowData',checkArr).parentId;
						bbsPostId = $("#linkageList").jqGrid('getRowData',checkArr).postId;
						
						if(bbsParentId == ""){			//게시글과 답글의 수정 페이지를 구분한다.
							document.location.href = "<%=contextPath%>/linkage/mod.do?bbsPostId="+bbsPostId;
						}else{
							document.location.href = "<%=contextPath%>/reply/mod.do?bbsParentId="+bbsParentId+"&bbsPostId="+bbsPostId+"&bbsType=BO4";
						}
						
						
					}
				}
		
    		}
			
			function goDel(){
    			
				var checkArr = $("#linkageList").getGridParam('selarrrow'); 
				
				if(checkArr.length == 0){
					alert("삭제할 게시물을 선택 하세요.");
				}else{
					if(confirm(checkArr.length+"개의 게시물이 삭제 됩니다. 정말 진행 하시겠습니까?")){
						var bbsPostId = "";
						for(var i = 0; i < checkArr.length; i++){
							bbsPostId += $("#linkageList").jqGrid('getRowData',checkArr[i]).postId+"^";
						}
		    			document.location.href = "<%=contextPath%>/linkage/del.do?bbsPostIdArr="+bbsPostId;	
					}
				}
				
    		}
		
	
		function linkageSearch(){
			
			$("#linkageSearchForm").submit();
		}
			
			
			
			function title(value, options, rowObject){
	    		
    			var radioHtml = '&nbsp;&nbsp;&nbsp;';
    			var replyContent = rowObject.parentId;
    			if(replyContent != ""){
    				radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:50px; text-align:left">답변</p>&nbsp;&nbsp;&nbsp;'
    			}
    			
    			radioHtml += '<span style="cursor:pointer;"">'+value+'</span>' ;
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