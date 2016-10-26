<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%>    
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
			                                                <select class="selectpicker" name="schema" id="schema">
			                                                <%for(int i = 0; i < mgmtTblStatDbList.size(); i++){ 
			                                                	MgmtTblStat mgmtTblStat = 	mgmtTblStatDbList.get(i);%>
			                                                <option value="<%=mgmtTblStat.getDbName() %>"  <%=searchVO.getSearchWord().equals(mgmtTblStat.getDbName())?"selected":"" %> ><%=mgmtTblStat.getDbName() %></option>
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
		                                                    <!-- <button class="btn btn-warning waves-effect waves-light" type="button" >수정</button> -->
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
                       
                        <!-- <div class="col-lg-12" style="margin-bottom:10px; padding-left:0px; padding-right:0px;">
								<div class="card-box">
                                    <div class="table-responsive">
                                        <table class="table m-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>적재 테이블</th>
                                                    <th>적재 사이즈</th>
                                                    <th>적재 건수</th>
                                                    <th>적재 사이즈</th>
                                                    <th>적재 건수</th>
                                                    <th>적재 사이즈</th>
                                                    <th>적재 건수</th>                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">4</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">5</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">6</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">7</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">8</th>
                                                    <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">9</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">10</th>
                                                     <td>trc_cdr_vc</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                    <td>22,850</td>
                                                    <td>1,019</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"></th>
                                                    <td>합계</td>
                                                    <td>228,500</td>
                                                    <td>10,190</td>
                                                    <td>228,500</td>
                                                    <td>10,190</td>
                                                    <td>228,500</td>
                                                    <td>10,190</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
								</div>
							</div> -->

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
            <div class="side-bar right-bar">
                <div tabindex="5001" class="nicescroll" style="position: relative; -ms-overflow-x: hidden; -ms-overflow-y: hidden; -ms-touch-action: none;">
                    <ul class="nav nav-tabs tabs" style="width: 100%;">
                        <li class="active tab" style="width: 33.33%;">
                            <a class="active" aria-expanded="false" href="#home-2" data-toggle="tab">
                                <span class="visible-xs"><i class="fa fa-home"></i></span>
                                <span class="hidden-xs">Activity</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 33.33%;">
                            <a aria-expanded="false" href="#profile-2" data-toggle="tab">
                                <span class="visible-xs"><i class="fa fa-user"></i></span>
                                <span class="hidden-xs">Chat</span>
                            </a>
                        </li>
                        <li class="tab" style="width: 33.33%;">
                            <a aria-expanded="true" href="#messages-2" data-toggle="tab">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span>
                                <span class="hidden-xs">Settings</span>
                            </a>
                        </li>
                    <div class="indicator" style="left: 0px; right: 180px;"></div></ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home-2">
                            <div class="timeline-2">
                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">5 minutes ago</small>
                                        <p><strong><a class="text-info" href="#">John Doe</a></strong> Uploaded a photo <strong>"DSC000586.jpg"</strong></p>
                                    </div>
                                </div>

                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">30 minutes ago</small>
                                        <p><a class="text-info" href="">Lorem</a> commented your post.</p>
                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                    </div>
                                </div>

                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">59 minutes ago</small>
                                        <p><a class="text-info" href="">Jessi</a> attended a meeting with<a class="text-success" href="#">John Doe</a>.</p>
                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                    </div>
                                </div>

                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">1 hour ago</small>
                                        <p><strong><a class="text-info" href="#">John Doe</a></strong>Uploaded 2 new photos</p>
                                    </div>
                                </div>

                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">3 hours ago</small>
                                        <p><a class="text-info" href="">Lorem</a> commented your post.</p>
                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                    </div>
                                </div>

                                <div class="time-item">
                                    <div class="item-info">
                                        <small class="text-muted">5 hours ago</small>
                                        <p><a class="text-info" href="">Jessi</a> attended a meeting with<a class="text-success" href="#">John Doe</a>.</p>
                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="tab-pane fade" id="profile-2" style="display: none;">
                            <div tabindex="5002" class="contact-list nicescroll" style="-ms-overflow-x: hidden; -ms-overflow-y: hidden; -ms-touch-action: none;">
                                <ul class="list-group contacts-list">
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-1.jpg">
                                            </div>
                                            <span class="name">Chadengle</span>
                                            <i class="fa fa-circle online"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-2.jpg">
                                            </div>
                                            <span class="name">Tomaslau</span>
                                            <i class="fa fa-circle online"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-3.jpg">
                                            </div>
                                            <span class="name">Stillnotdavid</span>
                                            <i class="fa fa-circle online"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-4.jpg">
                                            </div>
                                            <span class="name">Kurafire</span>
                                            <i class="fa fa-circle online"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-5.jpg">
                                            </div>
                                            <span class="name">Shahedk</span>
                                            <i class="fa fa-circle away"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-6.jpg">
                                            </div>
                                            <span class="name">Adhamdannaway</span>
                                            <i class="fa fa-circle away"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-7.jpg">
                                            </div>
                                            <span class="name">Ok</span>
                                            <i class="fa fa-circle away"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-8.jpg">
                                            </div>
                                            <span class="name">Arashasghari</span>
                                            <i class="fa fa-circle offline"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-9.jpg">
                                            </div>
                                            <span class="name">Joshaustin</span>
                                            <i class="fa fa-circle offline"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#">
                                            <%-- <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-10.jpg">
                                            </div> --%>
                                            <span class="name">Sortino</span>
                                            <i class="fa fa-circle offline"></i>
                                        </a>
                                        <span class="clearfix"></span>
                                    </li>
                                </ul>
                            </div>
                        </div>



                        <div class="tab-pane fade" id="messages-2" style="display: none;">

                            <div class="row m-t-20">
                                <div class="col-xs-8">
                                    <h5 class="m-0">Notifications</h5>
                                    <p class="text-muted m-b-0"><small>Do you need them?</small></p>
                                </div>
                                <div class="col-xs-4 text-right">
                                    <input style="display: none;" type="checkbox" checked="" data-size="small" data-color="#3bafda" data-plugin="switchery" data-switchery="true"><span class="switchery switchery-small" style="border-color: rgb(59, 175, 218); transition:border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small style="transition:background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
                                </div>
                            </div>

                            <div class="row m-t-20">
                                <div class="col-xs-8">
                                    <h5 class="m-0">API Access</h5>
                                    <p class="m-b-0 text-muted"><small>Enable/Disable access</small></p>
                                </div>
                                <div class="col-xs-4 text-right">
                                    <input style="display: none;" type="checkbox" checked="" data-size="small" data-color="#3bafda" data-plugin="switchery" data-switchery="true"><span class="switchery switchery-small" style="border-color: rgb(59, 175, 218); transition:border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small style="transition:background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
                                </div>
                            </div>

                            <div class="row m-t-20">
                                <div class="col-xs-8">
                                    <h5 class="m-0">Auto Updates</h5>
                                    <p class="m-b-0 text-muted"><small>Keep up to date</small></p>
                                </div>
                                <div class="col-xs-4 text-right">
                                    <input style="display: none;" type="checkbox" checked="" data-size="small" data-color="#3bafda" data-plugin="switchery" data-switchery="true"><span class="switchery switchery-small" style="border-color: rgb(59, 175, 218); transition:border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small style="transition:background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
                                </div>
                            </div>

                            <div class="row m-t-20">
                                <div class="col-xs-8">
                                    <h5 class="m-0">Online Status</h5>
                                    <p class="m-b-0 text-muted"><small>Show your status to all</small></p>
                                </div>
                                <div class="col-xs-4 text-right">
                                    <input style="display: none;" type="checkbox" checked="" data-size="small" data-color="#3bafda" data-plugin="switchery" data-switchery="true"><span class="switchery switchery-small" style="border-color: rgb(59, 175, 218); transition:border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small style="transition:background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
                                </div>
                            </div>

                        </div>
                    </div>
                <div class="nicescroll-rails" id="ascrail2002" style="left: -1702px; top: -70px; width: 8px; height: 100px; display: none; position: absolute; z-index: 99; cursor: default; -ms-touch-action: none;"><div style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 6px; height: 0px; float: right; position: relative; -ms-touch-action: none; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div></div><div class="nicescroll-rails" id="ascrail2002-hr" style="left: -1694px; top: 22px; height: 8px; display: none; position: absolute; z-index: 99; cursor: default;"><div style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 0px; height: 6px; position: relative; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div></div></div>
            <div class="nicescroll-rails" id="ascrail2001" style="left: 262px; top: 0px; width: 8px; height: 388px; position: absolute; z-index: 99; cursor: default; opacity: 0; -ms-touch-action: none;"><div style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 6px; height: 174px; float: right; position: relative; -ms-touch-action: none; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div></div><div class="nicescroll-rails" id="ascrail2001-hr" style="left: 0px; top: 380px; width: 262px; height: 8px; display: none; position: absolute; z-index: 99; cursor: default; opacity: 0;"><div style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 270px; height: 6px; position: relative; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div></div></div>
            <!-- /Right-bar -->

        </div>
        <!-- END wrapper -->

		
    
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
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                $('.circliful-chart').circliful();
            });

            /* BEGIN SVG WEATHER ICON */
            if (typeof Skycons !== 'undefined'){
            var icons = new Skycons(
                {"color": "#3bafda"},
                {"resizeClear": true}
                ),
                    list  = [
                        "clear-day", "clear-night", "partly-cloudy-day",
                        "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                        "fog"
                    ],
                    i;

                for(i = list.length; i--; )
                icons.set(list[i], list[i]);
                icons.play();
            };

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
     			   		{name:'tblNm', index:'CheckResult',align: "center"},
     			   		{name:'monthAvg',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'week',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'yesterday',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'today',align: "center", formatter:'integer',formatoptions:{thousandsSeparator:','},summaryType:'sum'},
     			   		{name:'monthPercentage',align: "center",formatter:editable},
     			   		{name:'weekPercentage',align: "center",formatter: editable},
     			   		{name:'dayPercentage',align: "center",formatter: editable},
     			   		{name:'chkNull',align: "center",formatter: typeChk},
     			   		{name:'chkType',align: "center",formatter: typeChk},
     			   		
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
    			   }

     			});
     			
     			$("#dailyLoadStatusList").jqGrid('setGroupHeaders', {
   				  /* useColSpanStyle: false, */ 
   					useColSpanStyle: true,
   				  groupHeaders:[{startColumnName: 'chkNull' , numberOfColumns: 2, titleText:'정합성'}]
   				});
     			

     			$("#dailyLoadStatusList").jqGrid(
     					'navGrid',
     					'#jqGridPager', 
     					{excel:true, edit:false, add:false, del:false, refresh:false, search:false}
     					);
     			
     			$("#dailyLoadStatusList").jqGrid(
     					'navButtonAdd',
     					'#jqGridPager', 
     					{caption:"Excel DownLoad",
     		     			onClickButton: function() {
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
     					}
     				);
     			
     			/* $("#dailyLoadStatusList").jqGrid('destroyGroupHeader'); */
     			
     		});         
            
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
    		
    		
    		function expirationDateModi(){
    			
    			window.open("<%=contextPath%>/expirationDateModi.do","유효기간 수정","width=420,height=400,scrollbar=false");
    			
    		}
    		
    		
    		function radio(value, options, rowObject){
    			   var radioHtml = '<input type="radio" value=' + value + ' name="radioid" />';
    			   return radioHtml;
    		}
    		
    		function goSearch(){
    	    	$("#loadStatusSearchForm").submit();
    	    	
    	    }
    		
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "";
    	    	 checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>";
    	         return checkResult;

    	    }
    	    
    	    $(window).load(function(){
   	    		
 	    		 $(".bootstrap-select").css("width","100%"); 
 	    	});
    	    
    	    $(function () {
    	    	
                    $('#datetimepicker1').datetimepicker({
                    	format: 'YYYY/MM/DD'
                    });
                
    	    }); 
    	    
function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>