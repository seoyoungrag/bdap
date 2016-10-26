<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.kt.bdapportal.domain.BdapAcl"%>
<%@page import="com.kt.bdapportal.domain.BdapUser"%>    
<%
	String test = (String)request.getAttribute("test");
	String contextPath = (String)request.getContextPath();
	  
	List<BdapAcl> bdapAclList = (List<BdapAcl>)request.getAttribute("bdapAclList");
	List<BdapUser> bdapUserList = (List<BdapUser>)request.getAttribute("bdapUserList");
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>Set Up</b></h4>
						
                        <div class="col-sm-12" style="">
                        	<div class="card-box" style="margin-bottom:10px; padding-bottom:10px; padding-top:10px;">
                       			<button class="btn btn-inverse waves-effect waves-light" id="roleBtn" onclick="javascript:searchTypeRole();">
                       				<i class="zmdi zmdi-lock-outline"></i> <span>권한 관리</span>
                       			</button>
                       			<button class="btn btn-default waves-effect waves-light" id="userBtn" style="margin-left:15px;" onclick="javascript:searchTypeUser();">
                       				<i class="zmdi zmdi-lock-open"></i> <span>사용자 관리</span>
                       			</button>
                       			<button class="btn btn-default waves-effect waves-light" id="schemaBtn" style="margin-left:15px;" onclick="javascript:searchTypeSchema();">
                       				<i class="zmdi zmdi-lock-open"></i> <span>Schema Management</span>
                       			</button>
                       			<button class="btn btn-default waves-effect waves-light" id="etcBtn" style="margin-left:15px;display:none;" onclick="javascript:searchTypeEtc();">
                       				<i class="zmdi zmdi-lock-open"></i> <span>기타 설정</span>
                       			</button>
                       			
                        	</div>
                        </div>
                        
                        
                        
                       <div class="col-lg-12" style="margin-bottom:10px;" id="roleManage">
	                       <div class="card-box" style="margin-bottom:10px; padding-bottom:10px;  padding-top:10px;">
	                       		<div class="row">
	                       			<div class="col-lg-6">
				                    	<button class="btn btn-inverse waves-effect waves-light" id="userAclBtn" onclick="javascript:userAclBtn();">
				                       		<i class="zmdi zmdi-lock-outline"></i> <span>사용자 ACL 관리</span>
				                       	</button>
				                       	<button class="btn btn-default waves-effect waves-light" id="roleAclBtn" style="margin-left:15px;" onclick="javascript:roleAclBtn();">
				                       		<i class="zmdi zmdi-lock-open"></i> <span>권한 ACL 관리</span>
				                       	</button>
				                       	<button class="btn btn-default waves-effect waves-light" id="roleUserBtn" style="margin-left:15px;" onclick="javascript:roleUserBtn();">
				                       		<i class="zmdi zmdi-lock-open"></i> <span>사용자 권한 괸리</span>
				                       	</button>
			                       	</div>
			                       	<div class="col-lg-6 text-right" style="padding-right:20px;">
				                       	<button class="btn btn-default waves-effect waves-light " id="" onclick="javascript:saveCurrentAcl();">
				                       		<span>저장</span>
				                       	</button>
			                       	</div>
		                       	</div>
	                        </div>
								<div class="card-box" id="userAcl">
                                  	<div class="row">
                                  		<div class="col-lg-4"  style=" overflow-y:scroll; height:530px;">
	                                  		<div class="table-responsive">
		                       					<table id="userList" style="width:100%;"></table>
	                       					</div>
                                  		</div>
                                  		<div class="col-lg-5" style=" overflow-y:scroll; height:530px;">
                       						<!-- <label class="control-label"></label> -->
											<div id="userAclTree"></div>
										</div>
                       					<div class="col-lg-1" style="display:none; ">
                       						<div style="border:1px solid rgba(152, 166, 173, 0.25); width:100%; height:530px; display: table;">
                       							<div  style=" display: table-cell; vertical-align: middle; text-align:center;">
	                       							<button class="btn btn-default waves-effect waves-light" style="display:block; margin:0 auto;" onclick="javascript:userAclAdd();">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-right"></i>
	                       							</button>
                       								<button class="btn btn-default waves-effect waves-light" style="display:block; margin:30px auto 0 auto;" onclick="javascript:userAclDel();">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-left"></i>
	                       							</button>
                       							</div>
                       						</div>
                                  		</div>
                                  		<div class="col-lg-3">
                                  			<div class="table-responsive"  style=" overflow-y:scroll; height:530px;">
		                       					<table id="userAclList" style="width:100%;"></table>
	                       					</div>
                                  		</div>
                       				</div>
                       			</div>
                       			<div class="card-box" id="roleAcl">
                                    <div class="row">
                                  		<div class="col-lg-4">
	                                  		<div class="table-responsive"  style=" overflow-y:scroll; height:530px;">
		                       					<table id="roleList" style="width:100%;"></table>
	                       					</div>
                                  		</div>
                                  		<div class="col-lg-5" style=" overflow-y:scroll; height:530px;">
                       						<!-- <label class="control-label"></label> -->
											<div id="roleAclTree"></div>
										</div>
                       					<div class="col-lg-1" style="display:none; ">
                       						<div style="border:1px solid rgba(152, 166, 173, 0.25); width:100%;  height:530px; display: table;">
                       							<div  style=" display: table-cell; vertical-align: middle;">
	                       							<button class="btn btn-default waves-effect waves-light" style="display:block; margin:0 auto;">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-right"></i>
	                       							</button>
                       								<button class="btn btn-default waves-effect waves-light" style="display:block; margin:30px auto 0 auto;">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-left"></i>
	                       							</button>
                       							</div>
                       						</div>
                                  		</div>
                                  		<div class="col-lg-3" style=" overflow-y:scroll; height:530px;">
                                  			<div class="table-responsive">
		                       					<table id="roleAclList" style="width:100%;"></table>
	                       					</div>
                                  		</div>
                       				</div>
                       			</div>
                       			<div class="card-box" id="roleUser">
                                    <div class="row">
                                  		<div class="col-lg-4">
	                                  		<div class="table-responsive" style=" overflow-y:scroll; height:530px;">
		                       					<table id="roleListForRoleToUser" style="width:100%;"></table>
	                       					</div>
                                  		</div>
                                  		<div class="col-lg-5" style=" overflow-y:scroll; height:530px;">
											<div id="userTreeForRoleToUser"></div>
										</div>
                       					<div class="col-lg-1" style="display:none; ">
                       						<div style="border:1px solid rgba(152, 166, 173, 0.25); width:100%;  height:530px; display: table;">
                       							<div  style=" display: table-cell; vertical-align: middle;">
	                       							<button class="btn btn-default waves-effect waves-light" style="display:block; margin:0 auto;">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-right"></i>
	                       							</button>
                       								<button class="btn btn-default waves-effect waves-light" style="display:block; margin:30px auto 0 auto;">
	                       								<i class="zmdi zmdi-hc-3x zmdi-long-arrow-left"></i>
	                       							</button>
                       							</div>
                       						</div>
                                  		</div>
                                  		<div class="col-lg-3">
                                  			<div class="table-responsive" style=" overflow-y:scroll; height:530px;">
                                  			<div class="table-responsive">
		                       					<table id="roleUserList" style="width:100%;"></table>
	                       					</div>
	                       					</div>
                                  		</div>
                       				</div>
                       			</div>
                       	</div>
                       	<div class="col-lg-12" style="margin-bottom:10px;" id="userManage">
                       			<div class="card-box" style="margin-bottom:10px; padding-bottom:10px;">
                        			<div class="row">
                        				<div class="col-md-9">
                        				<div class="row">
                        				<div class="col-md-3">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">사용자 ID :</label>
	                                                <div class="col-md-7">
	                                                	<input class="form-control" type="text" value="" id="userManageSearchById">
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				<div class="col-md-3">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">사용자 명 :</label>
	                                                <div class="col-md-7">
	                                                	<input class="form-control" type="text" value="" id="userManageSearchByNm">
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				<div class="col-md-3">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">ROLE :</label>
	                                                <div class="col-md-7">
		                                                <select class="selectpicker" id="userManageSearchByRole">
														  <option>ALL</option>
														</select>
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				<div class="col-md-1">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:userManageSearch();">검색</button>
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				
                        			
                        			</div>
                        				
                        				</div>
                        				<div class="col-md-3 text-right">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px; padding-right:5px;">
	                                            	<div class="col-md-12 text-right">
                                     					<button class="btn btn-default waves-effect waves-light" type="button" style="display:none;" >저장</button>
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        			</div>
                        		
                        		
                        			
                        		</div>
								<div class="card-box">
                       				<div class="table-responsive">
	                       				<table id="userManageList" style="width:100%;"></table>
                       				</div>
                       			</div>
                       	</div>
                       	<div class="col-lg-12" style="margin-bottom:10px;" id="schemaManage">
                       	<div class="card-box" style="margin-bottom:10px; padding-bottom:10px;">
                        			<div class="row">
                        				<div class="col-md-9">
                        				<div class="row">
                        				<div class="col-md-3">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">스키마 명 :</label>
	                                                <div class="col-md-7">
		                                                <select class="selectpicker" id="schemaManageSearchByDbNm">
														  <option>ALL</option>
														</select>
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				<div class="col-md-3">
                        					<div class="form-horizontal">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-5 control-label" style="text-align:right;">테이블 명 :</label>
	                                                <div class="col-md-7">
	                                                	<input class="form-control" type="text" value="" id="schemaManageSearchByTblNm">
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				
                        				<div class="col-md-1">
                        					<div class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-12 text-left">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button"  onclick="javascript:schemaManageSearch();" >검색</button>
	                                                </div>
	                                            </div>
	                                        </div>
                        				</div>
                        				
                        			
                        			</div>
                        				
                        				</div>
                        				<div class="col-md-3 text-right">
                        					<form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px; padding-right:5px;">
	                                            	<div class="col-md-12 text-right">
                                     					<button class="btn btn-default waves-effect waves-light" type="button" style="display:none;">저장</button>
	                                                </div>
	                                            </div>
	                                        </form>
                        				</div>
                        			</div>
                        		</div>
								<div class="card-box">
                       				<div class="table-responsive">
	                       				<table id="schemaManageList" style="width:100%;"></table>
	                       				<div id="jqGridPager2"></div>
                       				</div>
                       			</div>
                       	</div>
                       	<div class="col-lg-12" style="margin-bottom:10px;" id="etcManage">
								<div class="col-lg-6">
                                	<div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: #494e50; height:35px;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">Resource Monitor Management</p>											
										</div>
			                            <div class="row" style="padding:10px;">
			                                <div class="col-lg-12 text-center">
			                                	<form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-2" ></div>
	                                                <label class="col-md-5 control-label" style="text-align:center;">관제 서버로 부터 데이터 추출 주기 설정 :</label>
	                                                <div class="col-md-2">
	                                                	<input class="form-control" type="text" value="">
	                                                </div>
	                                                <label class="col-md-1 control-label" style="text-align:left;">분</label>
	                                            </div>
	                                        	</form>
			                                
			                                </div>
			                            </div>
			                         </div>
                            	</div>
                            	<div class="col-lg-6">
                                	<div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: #494e50; height:35px;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">일 적재 현황 관리</p>											
										</div>
			                            <div class="row" style="padding:10px;">
			                                <div class="col-lg-12 text-center">
			                                	<form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                            	<div class="col-md-2" ></div>
	                                                <label class="col-md-5 control-label" style="text-align:center;">테이블 단위 오차 범위 설정 :</label>
	                                                <div class="col-md-2">
	                                                	<input class="form-control" type="text" value="">
	                                                </div>
	                                                <label class="col-md-1 control-label" style="text-align:left;">%</label>
	                                            </div>
	                                        	</form>
			                                
			                                </div>
			                            </div>
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

            $(document).ready(function(){

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
     			
     			$("#userList").jqGrid({  
     				url:'<%=contextPath%>/getUserList.do',

     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:[' ','사용자 명','사용자 ID'],
     			   	colModel:[
                    	{name: 'radio', align: 'center', sortable: false,
	                        formatter: function (cellValue, option) {
	                            return '<input type="radio" name="radio_' + option.gid + '"  />';
	                        }
     			   		},
     			   		{name:'userNm', index:'userNm',sortable:false, align: "center"},
     			   		{name:'id', index:'id',sortable:false, align: "center", key:true}
     			   	],
     			    viewrecords: false, 
                    height : 'auto',
                    autowidth : true,
                    shrinkToFit:true,
	                beforeSelectRow: function (rowid, e) {
	                    var $radio = $(e.target).closest('tr').find('input[type="radio"]');
	                    $radio.prop('checked', true);
		   				$("#userAclList").setGridParam({
    		    			postData : "userId="+rowid+"&rows=15&page=1&sidx=&sord=asc"
    		    		}).trigger("reloadGrid");
	                    return true; 
	                }
     			});
     			
     			$("#roleList").jqGrid({  
     				url:'<%=contextPath%>/getRoleList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:[' ','권한 명','권한 ID'],
     			   	colModel:[
     	                    	{name: 'radio', align: 'center', sortable: false,
     		                        formatter: function (cellValue, option) {
     		                            return '<input type="radio" name="radio_' + option.gid + '"  />';
     		                        }
     	     			   		},
     	     			   		{name:'roleNm',sortable:false, align: "center"},
     	     			   		{name:'id', sortable:false, align: "center", key:true}
     			   	],
     			   viewrecords: true, 
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,
	               beforeSelectRow: function (rowid, e) {
	                    var $radio = $(e.target).closest('tr').find('input[type="radio"]');
	                    $radio.prop('checked', true);
		   				$("#roleAclList").setGridParam({
    		    			postData : "roleId="+rowid+"&rows=15&page=1&sidx=&sord=asc"
	   		    		}).trigger("reloadGrid");
	                    return true; // allow row selection
	               } 

     			});     			

     			$("#roleListForRoleToUser").jqGrid({  
     				url:'<%=contextPath%>/getRoleList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:[' ','권한 명','권한 ID'],
     			   	colModel:[
     	                    	{name: 'radio', align: 'center', sortable: false,
     		                        formatter: function (cellValue, option) {
     		                            return '<input type="radio" name="radio_' + option.gid + '"  />';
     		                        }
     	     			   		},
     	     			   		{name:'roleNm',sortable:false, align: "center"},
     	     			   		{name:'id', sortable:false, align: "center", key:true}
     			   	],
     			   viewrecords: true, 
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,
	               beforeSelectRow: function (rowid, e) {
	                    var $radio = $(e.target).closest('tr').find('input[type="radio"]');
	                    $radio.prop('checked', true);
		   				$("#roleUserList").setGridParam({
    		    			postData : "roleId="+rowid+"&rows=15&page=1&sidx=&sord=asc"
	   		    		}).trigger("reloadGrid");
	                    return true; // allow row selection
	               } 
     			});
     			
     			$("#userAclList").jqGrid({  
     				url:'<%=contextPath%>/getUserAclList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['접근 가능 ACL','acl Id'],
     			   	colModel:[
	     			   		{name:'aclList', index:'aclList',align: "center"},
	     			   		{name:'id', index:'id',align: "center",hidden:true}
     			   	],
     			   viewrecords: true, 
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   loadComplete : function(data){
    	     			userAclTreeLoad();
			   		}
     			});
     			
     			$("#roleAclList").jqGrid({  
     				url:'<%=contextPath%>/getRoleAclList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['접근 가능 ACL','acl Id'],
     			   	colModel:[
     	     			   		{name:'aclList', index:'aclList',align: "center"},
     	     			   		{name:'id', index:'id',align: "center",hidden:true}
     			   	],
     			   viewrecords: true, 
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   loadComplete : function(data){
    				   roleAclTreeLoad();
			   		}
     			});
     			
     			$("#roleUserList").jqGrid({  
     				url:'<%=contextPath%>/getRoleUserList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['ROLE 부여 사용자','user Id'],
     			   	colModel:[
   	     			   		{name:'userList', align: "center"},
 	     			   		{name:'id', align: "center",hidden:true}
     			   	],
     			   viewrecords: true, 
                   rowNum : 1000,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
    			   loadComplete : function(data){
    				   roleUserTreeLoad();
			   		}

     			});
     			
     			$("#userManageList").jqGrid({
     				url:'<%=contextPath%>/getUserList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['사용자 ID','사용자 명','Email','생성 일시','기본정보 수정'],
     			   	colModel:[
     			   		{name:'id', index:'id',editable:false,align: "center", key:true},
     			   		{name:'userNm', editable:true, align: "center"},
     			   		{name:'email', editable:true, align: "center"},
     			   		{name:'createDt', editable:false,align: "center"},
     			   		{name:'4',align: "center", editable:false, hidden:true,
     			           formatter: 
     			        	   function(){
     			        	   		return '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;display:none;" onclick="javascript:goUserInfoMod();" name="userInfoSave" >수정</p>'
     			        	   }
     			   		}
     			   	],
     			   viewrecords: true, 
                   rowNum : 1000,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,              
                   cellEdit: true,                          
                   cellsubmit:'remote',                    
                   cellurl:'<%=contextPath%>/updateCellUserInfo.do', 
                   gridview:true,
	               beforeSelectRow: function (rowid, e) {
                       var tr = $(this).jqGrid("getInd", rowid, true);
                       $(this).find("p[name='userInfoSave']").hide();
                       $(tr).find("p[name='userInfoSave']").show(); 
	               },
                   beforeSubmitCell : function(rowid, cellName, cellValue) { 
	                   return {"id":rowid, "cellName":cellName, "cellValue": cellValue}
                   },
                   afterSubmitCell : function(serverStatus, aPostData) {
                	   var response = serverStatus.responseText;
                	   return [response=='SUCCESS'? true : false,response];
               	   },
    			   loadComplete : function(data){
    			   }
     			});

     			$("#schemaManageList").jqGrid({  
     				url:'<%=contextPath%>/getSchemaManageList.do',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['tblId','스키마 명','테이블 영문명','테이블 한글명','일 적재 연동 대상','null 체크 대상','정합성 체크 대상','컬럼 정보','테이블 정보 수정'],
     			   	colModel:[
     			   		{name:'id', index:'id',editable:false,align: "center", key:true, hidden:true},
     			   		{name:'schNm', index:'schNm', editable:false, align: "left"},
	     			   	{name:'tblEngNm', index:'tblEngNm',editable:false, align: "left"},
     			   		{name:'tblKorNm', index:'tblKorNm',editable:true, align: "left"},
	     				{name:'isManaged',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
				   		{name:'isCheckNull',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
				   		{name:'isCehckRegex',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'column',align: "center",editable:false, 
     			   			formatter:
	     			   			function(cellValue, opts, rowObject) {
	     			   				return '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;" onclick="javascript:columnPop(\''+rowObject.id+'\');">확인</p>';
	     			   			},
     			   		},
     			   		{name:'4',align: "center", editable:false, hidden:true,
      			           formatter: 
      			        	   function(){
      			        	   		return '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;display:none;" onclick="javascript:goUserInfoMod();" name="tblInfoSave" >수정</p>'
      			        	   }
      			   		}
     			   	],
     			   viewrecords: true, 
                   rowNum : 1000,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,          
                   cellEdit: true,                          
                   cellsubmit:'remote',                    
                   cellurl:'<%=contextPath%>/updateCellTblInfo.do', 
                   gridview:true,
	               beforeSelectRow: function (rowid, e) {
                       var tr = $(this).jqGrid("getInd", rowid, true);
                       $(this).find("p[name='tblInfoSave']").hide();
                       $(tr).find("p[name='tblInfoSave']").show(); 
	               },
                   beforeSubmitCell : function(rowid, cellName, cellValue) { 
	                   return {"id":rowid, "cellName":cellName, "cellValue": cellValue}
                   },
                   afterSubmitCell : function(serverStatus, aPostData) {
                	   var response = serverStatus.responseText;
                	   return [response=='SUCCESS'? true : false,response];
               	   },
               	   afterEditCell: function(rowid, cellname, value, iRow, iCol){
                       if(cellname == 'isManaged' || cellname == 'isCheckNull' || cellname == 'isCehckRegex'){
                            var id = $("#schemaManageList").getCell(rowid,'id');
	           				var saveInfo = 'id='+id+'&cellName='+cellname+'&cellValue='+ value;
	           				 $.ajax({
	           				 type: "POST",
	           				 url:'<%=contextPath%>/updateCellTblInfo.do',
	           				 data: saveInfo,
	           				 success: function(data) {
	           					 if(data=='SUCCESS'){
	           						 //alert('데이터가 변경되었습니다.');
	           					 }else{
	           						alert('데이터 입력이 실패하였습니다.');
	           					 }
	           				 }
	           				 });
                       }   
                   }, 
                   afterSaveCell: function(rowid, cellname, value, iRow, iCol){
                       if(cellname == 'isManaged' || cellname == 'isCheckNull' || cellname == 'isCehckRegex'){
                           //$("#grid").find('tr:eq('+iRow+') td:eq('+iCol+')').removeClass('edit-cell');
                       }   
                   }
     			});
     			
     			$("#userManage").hide();
    			$("#schemaManage").hide();
    			$("#etcManage").hide();
    			$("#roleAcl").hide();
    			$("#roleUser").hide();
				
    			$(window).load(function(){
    	    		$(".bootstrap-select").css("width","100%");
    				initialize();
    			});
    			
     		});         
           function initialize(){
            	var inittype ='init';
            	//아래 jquery 마지막에 tree만 빈 사용자로 선택되게 초기화 해주고 있는데, 다른 초기화 작업들과 묶어두는 작업 해야함
            	userAclTreeLoad(inittype);
			    roleAclTreeLoad(inittype);
			    roleUserTreeLoad(inittype);

				$.ajax({
				 type: "POST",
				 url:'<%=contextPath%>/getRoleList.do', 
				 contentType: "application/json; charset=utf-8",
				 dataType: "json",
				 success: function(data) {
		    			$.each(data.rows, function (index, text) {
		    			    $('select#userManageSearchByRole').append($('<option>', {
		    			        value: data.rows[index].id,
		    			        text : data.rows[index].roleNm 
		    			    }));
		    			});

		    			$('select#userManageSearchByRole').selectpicker('refresh');
				 }
				 });
				

				$.ajax({
				 type: "POST",
				 url:'<%=contextPath%>/getSchemaManageDbNmList.do', 
				 contentType: "application/json; charset=utf-8",
				 dataType: "json",
				 success: function(data) {
		    			$.each(data.rows, function (index, text) {
		    			    $('select#schemaManageSearchByDbNm').append($('<option>', {
		    			        value: data.rows[index].dbNm,
		    			        text : data.rows[index].dbNm 
		    			    }));
		    			});

		    			$('select#schemaManageSearchByDbNm').selectpicker('refresh');
				 }
				 });
				
				$(document).delegate('#schemaManageList .jqgrow td input', 'click', function () {
		            var iRow = $("#schemaManageList").getInd($(this).parent('td').parent('tr').attr('id'));
		            var iCol = $(this).parent('td').parent('tr').find('td').index($(this).parent('td'));
			            //if($(this).parent('td').hasClass('edit-cell')){
		                	$(this).prop('checked',!($(this).attr('checked')));
	                        jQuery("#schemaManageList").editCell(iRow,iCol,true);
			            //}
				});
				
            }
    		function userAclTreeLoad(type){
    			var loadtype = 'userAcl';
    			if(type == 'init'){
    				loadtype=type;
    			}
		    	    $('#userAclTree').treeview({
			    		data: getTree(loadtype),
			    		showCheckbox : true,
						onNodeChecked : function(event, node) {

							var parameters =
							{
								    rowID : node.id,
								    initdata : {aclList:node.text, id:node.id},
								    position :"last",
								    useDefValues : false,
								    useFormatter : false,
								    addRowParams : {extraparam:{}}
								};
			   				$("#userAclList").jqGrid('addRow',parameters);
						 },  
						onNodeUnchecked : function(event, node) {
							$('#userAclList').jqGrid('delRowData',node.id);
						 },
						 
			    	});
    		}
    		function roleAclTreeLoad(type){
    			var loadtype = 'roleAcl';
    			if(type == 'init'){
    				loadtype=type;
    			}
  		    	    $('#roleAclTree').treeview({
	   			    		data: getTree(loadtype),
	   			    		showCheckbox : true,
	   						onNodeChecked : function(event, node) {
	
	   							var parameters =
	   							{
	   								    rowID : node.id,
	   								    initdata : {aclList:node.text, id:node.id},
	   								    position :"last",
	   								    useDefValues : false,
	   								    useFormatter : false,
	   								    addRowParams : {extraparam:{}}
	   								};
	   			   				$("#roleAclList").jqGrid('addRow',parameters);
	   						 },  
	   						onNodeUnchecked : function(event, node) {
	   							$('#roleAclList').jqGrid('delRowData',node.id);
	   						 },
	   						 
	   			    	});
    		}
    		function roleUserTreeLoad(type){
    			var loadtype = 'roleUser';
    			if(type == 'init'){
    				loadtype=type;
    			}
  		    	    $('#userTreeForRoleToUser').treeview({
	   			    		data: getTreeForRoleToUser(loadtype),
	   			    		showCheckbox : true,
	   						onNodeChecked : function(event, node) {
	
	   							var parameters =
	   							{
	   								    rowID : node.id,
	   								    initdata : {userList:node.text, id:node.id},
	   								    position :"last",
	   								    useDefValues : false,
	   								    useFormatter : false,
	   								    addRowParams : {extraparam:{}}
	   								};
	   			   				$("#roleUserList").jqGrid('addRow',parameters);
	   						 },  
	   						onNodeUnchecked : function(event, node) {
	   							$('#roleUserList').jqGrid('delRowData',node.id);
	   						 },
	   						 
	   			    	});
    		}
    		function searchTypeRole(){
    			$("#userManage").hide();
    			$("#schemaManage").hide();
    			$("#etcManage").hide();
    			$("#roleManage").show();
    			$( "#roleBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#userBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#schemaBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#etcBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}
    		
    		function userAclBtn(){
    			$("#roleAcl").hide();
    			$("#roleUser").hide();
    			$("#userAcl").show();
    			$( "#userAclBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#roleUserBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#roleAclBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}	
       	
    		function roleAclBtn(){
    			$("#userAcl").hide();
    			$("#roleUser").hide();
    			$("#roleAcl").show();
    			$( "#roleAclBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#roleUserBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#userAclBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}
    		
    		function roleUserBtn(){
    			$("#roleAcl").hide();
    			$("#userAcl").hide();
    			$("#roleUser").show();
    			$( "#roleUserBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#roleAclBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#userAclBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}
    		
			function searchTypeUser(){
				$("#userManage").show();
    			$("#schemaManage").hide();
    			$("#etcManage").hide();
    			$("#roleManage").hide();
    			$( "#roleBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#userBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#schemaBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#etcBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			
    		}
			
    		function searchTypeSchema(){
    			
    			$("#userManage").hide();
    			$("#schemaManage").show();
    			$("#etcManage").hide();
    			$("#roleManage").hide();
    			$( "#roleBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#userBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#schemaBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    			$( "#etcBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    		}
    		
    		
			function searchTypeEtc(){
    			
				$("#userManage").hide();
    			$("#schemaManage").hide();
    			$("#etcManage").show();
    			$("#roleManage").hide();
    			$( "#roleBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#userBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#schemaBtn" ).removeClass( "btn-inverse" ).addClass( "btn-default" );
    			$( "#etcBtn" ).removeClass( "btn-default" ).addClass( "btn-inverse" );
    		}
    		
    		function goUserInfoMod(){
    			
    			window.open("<%=contextPath%>/userInfoMod.do","사용자 정보 수정","width=420,height=300");
    		}
			
			
 			function userInfoMod(){
 				
 	    		var rtnSelectBox = '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;" onclick="javascript:goUserInfoMod();">수정</p>';
 	    		return rtnSelectBox;
 	    	} 
			
			
			function makeCheck(cellValue, option){
				var radioHtml = '<input type="checkbox" style="cursor:pointer;" name=""></i>';
				if(cellValue='Y'){
					radioHtml = '<input type="checkbox" style="cursor:pointer;" checked></i>';					
				}
   			    return radioHtml;
			}
    		
    		var popWidth = 1000;
    		var popHeight = 500;
    		var width = screen.width;
			var height = screen.height;
    		
    		function columnPop(id){
    			
    			var left = (screen.width/2)-(popWidth/2);
    			var top = (screen.height/2)-(popHeight/2);
    			var param = "width="+popWidth+",height="+popHeight+",left="+left+",top="+top;
    			window.open("<%=contextPath%>/popColumnByTblId.do?id="+id,"컬럼 정보 관리",param);
    		}
    		
    		function gocolumnpop(value, options, rowObject){				//컬럼 정보 확인
    			var radioHtml = '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;" onclick="javascript:columnpop();">확인</p>';
 			   return radioHtml;
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
    		
    		
    	    function getTreeForRoleToUser(type){
				//role 리스트 중에 이미 보유한 user 를 체크하기 위한 로직이 필요하다.
				//1. user리스트 java 객체를 javascript 객체로 변환
    	    	var bdapUserList = [];
    	    	<%
     	    	if(bdapUserList != null && bdapUserList.size() > 0){
     	    		for(int i = 0; i < bdapUserList.size(); i++){
    			%>
    				bdapUserList.push({
		    			nm : '<%=bdapUserList.get(i).getUserNm()%>',
		    			id : '<%=bdapUserList.get(i).getUserId()%>'
		    		});
    			<%
     	    		}
     	    	}
   	    		%>

				//2. 위에서 변환한 acl 리스트 js 객체와 treeview의 객체의 id를 비교하여 있으면 chcked=true로 변경
				//treeview 입력될 array
     	    	var nodesArray = [];
				

				//role user 매핑할 때는 role이 이미 가지고 있는 user리스트를 가지고 온다.
				var ids = $("#roleUserList").getDataIDs();
				if(type=='init'){
					ids = {};
				}
				
				//처리 로직
    	    	for(i = 0 ; i < bdapUserList.length; i ++){
    	    		var user = bdapUserList[i];
					   var isThere = false;
	 				   $.each(ids, function(idx, rowId){
 	 					  if(user.id == rowId){
 	 						 isThere = true;
 	 					  }
 					  	});
	 					nodesArray.push({text : user.nm , id : user.id , selectable: true,state:{checked:isThere==true ?true:false}});
    	    	}
     	    	
     	    	var tree = nodesArray;
		    	
    	    return tree;
    	    	
    	    }
    	    
    	    function getTree(type){
				//user나 role 이미 보유한 acl을 체크하기 위한 로직이 필요하다.
				//1. acl리스트 java 객체를 javascript 객체로 변환
    	    	var bdapAclList = [];
    	    	<%
     	    	if(bdapAclList != null && bdapAclList.size() > 0){
     	    		for(int i = 0; i < bdapAclList.size(); i++){
    			%>
	    			bdapAclList.push({
		    			nm : '<%=bdapAclList.get(i).getAclNm()%>',
		    			id : '<%=bdapAclList.get(i).getAclId()%>'
     	    			<%
     	    			BdapAcl bdapAcl = bdapAclList.get(i);
		    			if(bdapAcl.getChildren()!=null&&!bdapAcl.getChildren().isEmpty()){
		    				List<BdapAcl> bdapAclChildList = bdapAcl.getChildren();
 	    					StringBuffer childAcl = new StringBuffer();
     	    				for(int j = 0; j < bdapAclChildList.size(); j++){
     	    					BdapAcl bdapAclChild = bdapAclChildList.get(j);
     	    					childAcl.append("{ nm: '"+ bdapAclChild.getAclNm() + "', id: '"+ bdapAclChild.getAclId()+"'},");
    					%>
    					, childAcl : [<%=childAcl.toString()%>]
    					<%
     	    				}
		    			}
   	    				%>
		    			 
		    		});
    			<%
     	    		}
     	    	}
   	    		%>
   	    		
				//2. 위에서 변환한 acl 리스트 js 객체와 treeview의 객체의 id를 비교하여 있으면 chcked=true로 변경
				//treeview 입력될 array
     	    	var nodesArray = [];
				
				//이미 가지고 있는 acl 가져오기 ..초기화, user-acl, role-acl분기를 태운다.
			    var ids = $("#userAclList").getDataIDs();
				if(type=='roleAcl'){
					ids = $("#roleAclList").getDataIDs();
				}
				if(type=='init'){
					ids = {};
				}
				
				//처리 로직
    	    	for(i = 0 ; i < bdapAclList.length; i ++){
    	    		var parAcl = bdapAclList[i];
    	    		var child = parAcl.childAcl;
 	    			var childNodesArray = [];
    	    		if(child != null){
    	    			for(j = 0 ; j < child.length; j++ ){
 	 					   var isThere = false;
    	 				   $.each(ids, function(idx, rowId){
    	 					  if(child[j].id == rowId){
    	 						 isThere = true;
    	 					  }
    	 				   });
    	 				  childNodesArray.push({text:child[j].nm ,id:child[j].id,selectable: true,state:{checked:isThere==true ? true : false}});
    	    				
    	    			}
    	    		}
					   var isThere = false;
	 				   $.each(ids, function(idx, rowId){
 	 					  if(parAcl.id == rowId){
 	 						 isThere = true;
 	 					  }
 					  	});
	 					nodesArray.push({text:parAcl.nm,id:parAcl.id,nodes:childNodesArray,state:{expanded:	 i==0?true:false,checked:isThere==true ?true:false}});
    	    	}
     	    	
     	    	var tree = nodesArray;
		    	
    	    return tree;
    	    }
    	    
			function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
			function saveCurrentAcl(){
				var userACL;
				var alertTxt = '선택된 사용자가 없습니다.';
				var saveId = '';
			    var $selRadio = $('#userList input:radio:checked');
			    var saveUrl =  '<%=contextPath%>/saveUserAcl.do';
			    var saveList = $("#userAclList").jqGrid('getDataIDs');
			    var jsonParId = 'userId';
			    var jsonchildId = 'userAclIds';

				if($("#userAcl").is(":visible")==true){
					alertTxt = '선택된 사용자가 없습니다.';
					$selRadio = $('#userList input:radio:checked');
					saveUrl =  '<%=contextPath%>/saveUserAcl.do';
					saveList = $("#userAclList").jqGrid('getDataIDs');
					jsonParId = 'userId';
					jsonchildId = 'userAclIds';
				}
				if($("#roleAcl").is(":visible")==true){
					alertTxt ='선택된 권한이 없습니다.';
					$selRadio = $('#roleList input:radio:checked');
					saveUrl =  '<%=contextPath%>/saveRoleAcl.do';
					saveList = $("#roleAclList").jqGrid('getDataIDs');
					jsonParId = 'roleId';
					jsonchildId = 'roleAclIds';
				}
				if($("#roleUser").is(":visible")==true){
					alertTxt ='선택된 권한이 없습니다.';
					$selRadio = $('#roleListForRoleToUser input:radio:checked');
					saveUrl =  '<%=contextPath%>/saveRoleUser.do';
					saveList = $("#roleUserList").jqGrid('getDataIDs');
					jsonParId = 'roleId';
					jsonchildId = 'roleUserIds';
				}
    			
			    if ($selRadio.length > 0) {
			        $tr = $selRadio.closest('tr');
			        if ($tr.length > 0) {
			        	saveId = $tr.attr('id');
			        }
			    } else {
			        alert(alertTxt);
			        return false;
			    }
				
				var saveInfo = JSON.stringify({
						[jsonParId] : saveId,
						[jsonchildId] : saveList 
				});

				$.ajax({
				 type: "POST",
				 url: saveUrl,
				 data: saveInfo,
				 contentType: "application/json; charset=utf-8",
				 dataType: "json",
				 success: function(msg) {
					 alert(msg.retVal);
				 }
				});
			}
			function userManageSearch(){
				var userId = $("#userManageSearchById").val();
				var userNm = $("#userManageSearchByNm").val();
				var roleId = $("#userManageSearchByRole").val();
				
				$("#userManageList").setGridParam({
		    			postData : "userId="+userId+"&userNm="+userNm+"&roleId="+roleId
		    		}).trigger("reloadGrid");
			}
			function schemaManageSearch(){
				var dbNm = $("#schemaManageSearchByDbNm").val();
				var tblNm = $("#schemaManageSearchByTblNm").val();
				
				$("#schemaManageList").setGridParam({
		    			postData : "schemaNm="+dbNm+"&tblNm="+tblNm
		    		}).trigger("reloadGrid");
			}
        </script>
    
    <input type="hidden" id="selectId" value="">
</body>
</html>