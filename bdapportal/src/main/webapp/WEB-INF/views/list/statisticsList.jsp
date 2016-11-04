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
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>통계</b></h4>
						
                        <div class="col-sm-12" style="">
                        	<div class="card-box" style="margin-bottom:10px; padding-bottom:10px; padding-top:10px;">
                       			<button class="btn btn-inverse waves-effect waves-light" id="computingBtn" onclick="getGrid('computing');">
                       				<i class="zmdi zmdi-lock-outline"></i> <span>COMPUTING 히스토리 조회</span>
                       			</button>
                       			<button class="btn btn-default waves-effect waves-light" id="diskBtn" style="margin-left:15px;" onclick="getGrid('disk');">
                       				<i class="zmdi zmdi-lock-open"></i> <span>DISK 사용량 조회</span>
                       			</button>
                       			<button class="btn btn-default waves-effect waves-light" id="queryBtn" style="margin-left:15px;" onclick="getGrid('query');">
                       				<i class="zmdi zmdi-lock-open"></i> <span>QUERY 사용량 조회</span>
                       			</button>                      			
                        	</div>
                        </div>
						<div class="col-lg-12" style="margin-bottom:10px;">
							<div class="card-box" style="margin-bottom:10px; padding-bottom:0px;">
	                       		<form class="form-horizontal" role="form" id="searchForm" method="post" action="" accept-charset="utf-8">
	                       			<input type="hidden" id="command" value="computing" />
	                       			<div class="row">
		                       			<div class="col-md-5">
                                            <div class="form-group" style="margin-bottom:5px;">
												<label class="col-md-2 control-label" style="text-align:center;">조회날짜 : </label>
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
											    <!-- <div class='col-md-1 text-center p-t-8'>
											    ~
											    </div>
											    <div class='col-md-4'>
											        <div class="form-group">
											            <div class='input-group date' id='datetimepicker7'>
											                <input type='text' class="form-control" id="endDate" name="endDate"  />
											                <span class="input-group-addon">
											                    <span class="glyphicon glyphicon-calendar"></span>
											                </span>
											            </div>
											        </div>
											    </div> -->
                                            </div>
                        				</div>
                        				<div class="col-md-3">
                                            <div class="form-group" style="margin-bottom:10px;">
                                                    	<div class="col-md-12 text-left">
	                                                <button class="btn btn-primary waves-effect waves-light" type="button" onclick="getGrid($('#command').val());">검색</button>
	                                                <button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:exportExcel()" >Export as Excel</button>
                                                </div>
                                            </div>
	                        			</div>
                        			</div>
                       			</form>
                       		</div>
                       		<div class="card-box">
								<div class="table-responsive">
									<table id="gridList" style="width:100%;"></table>
									<div id="gridPager"></div>
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
		<!-- custom -->
		<script src="<%=contextPath%>/resources/kt/js/common.js" type="text/javascript"></script> 
		
        <script type="text/javascript">
	        var columnNames = ['사용자ID','이름'];
	    	var columnModels = [{name:'userId', index:'CheckResult',align: "center"},{name:'userName',align: "center"}];
	    	var computingColumnNames = ['노드명','통계생성일시','통계값(가용수치)','통계값(전체수치)'];
	    	var computionColumnModels = [{name:'nodeNm',align: "left", sortable:false,width:"450"},
	    		{name:'nodeStatCreateDt',align: "center", sortable:false,width:"450"},
	    		{name:'nodeStatAvailVal',align: "right", sortable:false,width:"450", formatter:'integer',formatoptions:{thousandsSeparator:','}},
	    		{name:'nodeStatTotalVal',align: "right", sortable:false,width:"450", formatter:'integer',formatoptions:{thousandsSeparator:','}}];
	    	var addModels = ['statToday','statMinusOne','statMinusTwo','statMinusThree'];
	    	var gridDateGap = 4;
	    	var contextPath = '<%=contextPath%>';
    	
			jQuery(document).ready(function($) {
	            $('#datetimepicker').datetimepicker({
		        	format: 'YYYY/MM/DD',
		            defaultDate: moment().subtract(1, 'days'),
		            useCurrent: false
		        });
				
				// grid를 로드한다.
	            getGrid($("#command").val());
			});
        	
        	// 그리드의 컬럼 뒤에 날짜별 통계데이터를 추가해야 함. gap만큼 날짜를 컬럼으로 추가한다.
			function setDateToColumns(command){
        		if(command == 'computing'){
        			columnNames = computingColumnNames;
    		    	columnModels = computionColumnModels;
        		}else{
        			columnNames = ['사용자ID','이름'];
    		    	columnModels = [{name:'userId', index:'CheckResult',align: "left", sortable:false,width:"300"},{name:'userName',align: "left", sortable:false,width:"300"}];
    				
    		    	if(command == 'disk'){
    		    		for(var i = 0; i < gridDateGap; i++){
        					var addDate = getDateFromVal(i*-1);
        					columnNames.push(addDate);
        					columnModels.push({name:addModels[i], align: "right", formatter:'integer',summaryType:'sum', sortable:false,width:"300",formatter:'integer',formatoptions:{thousandsSeparator:','}});
        	            }
    		    	}else{
    		    		for(var i = 0; i < gridDateGap; i++){
        					var addDate = getDateFromVal(i*-1);
        					columnNames.push(addDate);
        					columnModels.push({name:addModels[i], align: "right", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum', sortable:false,width:"300"});
        	            }
    		    	}
        		}
			}
        	
			// 현재 일로 부터 value일 뒤 혹은 앞의 날짜를 계산한다.
			function getDateFromVal(value){
				var selectedDate = new Date($("#startDate").val());
				var returnDate = new Date(selectedDate.setDate(selectedDate.getDate() + value));
				return returnDate.getFullYear() + '/' + ((returnDate.getMonth()+1) < 10 ? '0'+(returnDate.getMonth()+1) : (returnDate.getMonth()+1)) 
					+ '/' + (returnDate.getDate() < 10?'0'+returnDate.getDate(): returnDate.getDate());
			}
			
			function getGrid(command){
				$("#command").val(command);
				
				// 선택한 날짜 -4일만큼 그리드 컬럼에 추가한다.
	            setDateToColumns(command);
				
				// 1. 버튼의 클래스를 변경해준다.
				var btnNames = ['computingBtn','diskBtn','queryBtn'];
				
				for(var i=0; i<btnNames.length; i++){
					if(btnNames[i].indexOf(command) > -1){
						$( "#"+btnNames[i] ).removeClass( "btn-default" ).addClass( "btn-inverse" );
					}else{
						$( "#"+btnNames[i] ).removeClass( "btn-inverse" ).addClass( "btn-default" );
					}
				}
				
				var selectedDate = new Date($("#startDate").val());
				var url = "";
				var param = "endDate="+getDateFromVal(0)+"&startDate="+getDateFromVal(gridDateGap * -1);
				
				if(command=='computing'){
					url = contextPath + '/getComputingList.do?';
				}else if(command=='disk'){
					url = contextPath + '/getDiskUsageList.do?';
				}else if(command=='query'){
					url = contextPath + '/getQueryUsageList.do?';
				}
				
				$.jgrid.gridUnload("gridList");
				
				$("#gridList").jqGrid({  
					//ajax 호출할 페이지
					url: url+param,
					loadtext : '로딩중..',
					//응답값
					datatype: "json",
					styleUI : 'Bootstrap',
					colNames: columnNames,
					colModel: columnModels,
					viewrecords: true, 
					pager: "#gridPager",
					rowNum : 20,
					height : 'auto',
					/* shrinkToFit : false, */
					viewrecords: true,
					footerrow:true,
	    			userDataOnFooter:true,
    			    rowList: [20,50,100],
					loadComplete : function(data){
						if($("#command").val()!='computing'){
							var sum =  $("#gridList").jqGrid('getCol',addModels[0],false,'sum');
							var sum1 = $("#gridList").jqGrid('getCol',addModels[1],false,'sum');
							var sum2 = $("#gridList").jqGrid('getCol',addModels[2],false,'sum');
							var sum3 = $("#gridList").jqGrid('getCol',addModels[3],false,'sum'); 
							
							$("#gridList").jqGrid('footerData','set',{'userId':'합계','statToday':sum,'statMinusOne':sum1,'statMinusTwo':sum2,'statMinusThree':sum3});
							$(".ui-jqgrid-ftable tr:first td:eq(0)").css("border-right-width","0px");
						}
						
						$('#gridPager').css("border-top", "1px solid #ddd");
					}
				});
			}

        	function exportExcel(){
        		var excelType = $('#command').val();
        		var paramE = "&endDate="+getDateFromVal(0)+"&startDate="+getDateFromVal(gridDateGap * -1);
        		var uriE = '/bdapportal/getComputingListExcel.do';
        		if(excelType=='disk'){
        			var uriE = '/bdapportal/getDiskUsageListExcel.do';
        		}if(excelType=='query'){
        			var uriE = '/bdapportal/getQueryUsageListExcel.do';
        		}
				
  				var cols = [];
  				var mycolModel = $("#gridList").getGridParam("colNames");
  				$.each(mycolModel, function(i) {
  					if (!this.hidden) {
  						 cols.push(this);
  					}
  				});
  				var colsJ = JSON.stringify(cols);
  				var params = "colNamesArr=" + columnNames.length + paramE + "&columns=" + colsJ;
 				jQuery("#gridList").jqGrid('excelExport', {url:uriE+'?'+params});
        	}
			function setPage(page){
				
			}	
        </script>
	</body>
</html>