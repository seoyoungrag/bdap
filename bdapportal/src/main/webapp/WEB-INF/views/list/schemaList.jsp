<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="org.springframework.web.util.WebUtils"%> 
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%>  
<%@page import="com.kt.bdapportal.domain.BdapTbl"%>

<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  SearchVO searchVO = (SearchVO)request.getAttribute("searchVO");
  
  @SuppressWarnings (value="unchecked")
  List<BdapTbl> bdapTblTree = (List<BdapTbl>)request.getAttribute("bdapTblTree");
  
  String tblId = (String)request.getAttribute("tblId");
  
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
            <div class="left side-menu">
               <%-- <jsp:include page="/WEB-INF/views/leftmenu.jsp" flush="true"/> --%>
               <div class="card-box" style="margin-bottom:0px; padding-bottom:0px; padding-top:5px; overflow-y:scroll; height:815px;">
					<label class="control-label">Schema 탐색</label>
					<div id="tree"></div> 
				</div>
            </div>
            <!-- Left Sidebar End --> 


            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page" style="margin-left:240px;">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>schema 조회</b></h4>
						<!-- <div class="col-sm-8">
							<div class="card-box" style="margin-bottom:0px; padding-bottom:0px; padding-top:5px; overflow-y:scroll; height:201px;">
								<label class="control-label">스키마 별 테이블 트리</label>
								<div id="tree"></div> 
							</div>
                        </div> -->
                        <div class="col-sm-12" style="">
                        		<div class="card-box" style="margin-bottom:10px; padding-bottom:10px;">
                        			<div class="row">
                        				<div class="col-md-12">
											<form class="form-horizontal" role="form" id="schemaListForm" method="post" action="<%=contextPath%>/schemaList.do" accept-charset="utf-8">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <!-- <label class="col-md-5 control-label" style="text-align:right;">조회 타입 선택 : </label> -->
	                                                <div class="col-md-1" id="selectFirst">
		                                                <select class="selectpicker" data-width="auto" name="searchType" id="searchType">
														  <option value="tblKorNm" <%=searchVO.getSearchType().equals("tblKorNm")?"selected":"" %>>테이블 한글명</option>
														  <option value="tblEngNm" <%=searchVO.getSearchType().equals("tblEngNm")?"selected":"" %>>테이블 영문명</option>
														  <option value="colKorNm" <%=searchVO.getSearchType().equals("colKorNm")?"selected":"" %>>컬럼 한글명</option>
														  <option value="colEngNm" <%=searchVO.getSearchType().equals("colEngNm")?"selected":"" %>>컬럼 영문명</option>
														  <%-- <option value="systemNm" <%=searchVO.getSearchType().equals("systemNm")?"selected":"" %>>시스템명</option> --%>
														  <option value="desc" <%=searchVO.getSearchType().equals("desc")?"selected":"" %>>설명</option>
														</select>
	                                                </div>
	                                                <div class="col-md-3">
	                                                    <input class="form-control" type="text" placeholder="검색어를 입력 하세요." name="searchWord" id="searchWord" value="<%=searchVO.getSearchWord()%>">
	                                                </div>
	                                                <div class="form-group" style="margin-bottom:10px;">
		                                                <div class="col-md-3 text-right" style="padding-right:16px;">
		                                                    <button class="btn btn-warning waves-effect waves-light" type="button" onclick="javascript:goinit();" >초기화</button>
	                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goSearch();" >검색</button>
		                                                	<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:exportCsv()" >Export as Excel</button>
		                                                </div>
	                                                </div>
	                                            </div>
	                                           <input type="hidden"  name="tblId" id="tblId" value="<%=tblId%>"/>
	                                        </form>
                        				</div>
										

                        			</div>
                        		</div>
                        	</div>
                       
                       <div class="col-lg-12" style="margin-bottom:10px;">
								<div class="card-box">
                                    <div class="table-responsive">
	                       				<table id="schemaList" style="width:100%;"></table>
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
        
        <!-- bootstrap treeview -->
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-treeview.js"></script>
        
        <!-- jqgrid -->
        <script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script> 
		<style>
            .ui-jqgrid {position: relative; font-size:11px;}
            #schemaList {position: relative; font-size:11px;}
		</style>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
            	$(".bootstrap-select").css("width","100%"); 
            });

    	    function getTree() {
    	    	var nodesArray = [];
    	    	<%if(bdapTblTree != null && bdapTblTree.size() > 0){
    	    		for(int i = 0; i < bdapTblTree.size(); i++){%>
    	    			var childNodesArray = [];		
	    	    		<%BdapTbl bdapTbl = bdapTblTree.get(i);
    	    			String tblNm = bdapTbl.getTblDbNm();
    	    			String[] tblChildArr = bdapTbl.getTblEngNM().split(","); 
    	    			String[] tblChildIdArr = bdapTbl.getTblId().split(",");
    	    				for(int j = 0; j < tblChildArr.length; j++){
        	    				String tblChild =   tblChildArr[j]; %>
        	    					childNodesArray.push({text:"<%=tblChild%>",id:"<%=tblChildIdArr[j]%>"});
    	    		<%	}	%>
    	    			nodesArray.push({text:"<%=tblNm%>",id:"parent",nodes:childNodesArray,state:{expanded:	<%= i==0?true:false%>}});	
    	    		<%	}	%>
    	    	<%	}%>
    	    	
    	    	  var tree = nodesArray;
    	    	  return tree;
    	    	}

    	    var tblId = "<%=tblId%>";
    	    $("#tblId").val(tblId);
    	    var param = "tblId="+tblId+"&searchType="+$("#searchType").val()+"&searchWord="+$("#searchWord").val(); 
    	    	$('#tree').treeview({
    	    		data: getTree(),
    	    		onNodeSelected: function(event, data) {
    	    		    // Your logic goes here
    	    		    if(data.id != "" && data.id != "parent"){
							$("#tblId").val(data.id);
							
							$.jgrid.gridUnload("schemaList");
							param = "tblId="+data.id+"&searchType="+$("#searchType").val()+"&searchWord="+$("#searchWord").val(); 
							
							$("#schemaList").jqGrid({  
			     				//ajax 호출할 페이지
			     				url:'<%=contextPath%>/getSchemaList.do?'+param,
			     				//로딩중일때 출력시킬 로딩내용
			     				loadtext : '로딩중..',
			     				//응답값
			     				datatype: "json",
			     				styleUI : 'Bootstrap',
			     			   	colNames:['순서','Schema','테이블 영문명', '테이블 한글명', '컬럼 영문명','컬럼 한글명','설명','컬럼 타입'],
			     			    colModel:[
			     			   		{name:'order',align: "center", sortable:false, width:"50"},
			     			   		{name:'schema',align: "left", sortable:false, width:"100"},
			     			   		{name:'tblEngNm',align: "left", sortable:false, width:"150"},
			     			   		{name:'tblKorNm',align: "left", sortable:false, width:"150"},
			     			   		{name:'colEngNm',align: "left", sortable:false, width:"150"},
			     			   		{name:'colKorNm',align: "left", sortable:false, width:"150"},
			     			   		{name:'desc',align: "left", sortable:false, width:"700"},
			     			   		{name:'colType',align: "center", sortable:false, width:"100"}
			     			   	 ],
			     			   viewrecords: true, 
			                   pager: "#jqGridPager",
			                   rowNum : 15,
			                   height : 'auto',
			                   autowidth: true,
			                   shrinkToFit:true, 
			    			   viewrecords: true
			    			  /*  ondblClickRow: function (rowId, iRow, colId, e) {
			    				   if(colId == 6){ // 설명컬럼은 더블클릭하면 복사를 허용한다.
			    					   
			    				   }
			    				    var rowData = jQuery(this).getRowData(rowId); 
			    				    alert(rowId +  ", " + colId + " , "+ rowData[colId]);
			    				} */
			     			});
    	    		    }else{
    	    		    	$(this).treeview('toggleNodeExpanded',data.nodeId).treeview('unselectNode',data.nodeId);
    	    		    }
					}
    	    	}
    	    );

    	    	function getCellValue(content) {
    	    	    var k1 = content.indexOf(' value=', 0);
    	    	    var k2 = content.indexOf(' name=', k1);
    	    	    var val = '';
    	    	    if (k1 > 0) {
    	    	        val = content.substr(k1 + 7, k2 - k1 - 6);
    	    	    }
    	    	    return val;
    	    	}
    	    	
    			function exportCsv(){
    				var paramE = "&tblId="+$("#tblId").val()+"&searchType="+$("#searchType").val()+"&searchWord="+$("#searchWord").val();
      				var cols = [];
      				var mycolModel = $("#schemaList").getGridParam("colNames");
      				$.each(mycolModel, function(i) {
      					if (!this.hidden) {
      						 cols.push(this);
      					}
      				});
      				var colsJ = JSON.stringify(cols);
      				var params = "colNamesArr=" + colNamesArr.length + paramE + "&columns=" + colsJ;
      				var uri = '/bdapportal/schemaListExcel.do';
     				jQuery("#schemaList").jqGrid('excelExport', {url:uri+'?'+params});
    			}
    			
    			var colNamesArr = ['순서','Schema','테이블 영문명', '테이블 한글명', '컬럼 영문명','컬럼 한글명','설명','컬럼 타입'];
    		$(function(){
     			$("#schemaList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/getSchemaList.do?'+param,
     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:colNamesArr,
     			   colModel:[
     				  {name:'order',align: "center", sortable:false, width:"50"},
   			   		{name:'schema',align: "left", sortable:false, width:"100"},
   			   		{name:'tblEngNm',align: "left", sortable:false, width:"150"},
   			   		{name:'tblKorNm',align: "left", sortable:false, width:"150"},
   			   		{name:'colEngNm',align: "left", sortable:false, width:"150"},
   			   		{name:'colKorNm',align: "left", sortable:false, width:"150"},
   			   		{name:'desc',align: "left", sortable:false, width:"700"},
   			   		{name:'colType',align: "center", sortable:false, width:"100"}
    			   	],
     			   	
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth: true,
                   shrinkToFit:true, 
    			   viewrecords: true
     			});

     		});         
            
    	    function goSearch(){
    	    	if($("#searchWord").val() == ""){
    	    		alert("검색어가 입력 되지 않았습니다.");
    	    	}else{
    	    		$("#schemaListForm").submit();
    	    	}
    	    }
    	    
    	    function goinit(){
    	    	$("#searchWord").val("");
    	    	$("#searchType").val("");
    	    	$('.selectpicker').selectpicker('refresh');
    	    	$(".bootstrap-select").css("width","100%"); 
    	    	$("#schemaListForm").submit();
    	    }
        </script>
    
    
</body>
</html>