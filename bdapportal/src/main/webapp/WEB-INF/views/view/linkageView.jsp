<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="org.springframework.web.util.WebUtils"%>     
<%@ page import="com.kt.bdapportal.domain.BdapBbs"%>
<%@page import="com.kt.bdapportal.domain.BdapComment"%>
<%@page import="com.kt.bdapportal.common.util.BbsConstant"%>
  
<%
String fileTempPath = BbsConstant.FILE_TEMP_PATH;
String fileStorePath = BbsConstant.FILE_STORE_PATH;
BdapBbs bbs = (BdapBbs)request.getAttribute("linkageView");
String fileName = (String)request.getAttribute("fileName"); 
String test = (String)request.getAttribute("test");
String contextPath = (String)request.getContextPath();
String bbsPostId = (String)request.getAttribute("bbsPostId");
Long cmtCount = (Long)request.getAttribute("cmtCount");
ArrayList<BdapComment> bdapCmtList = (ArrayList<BdapComment>) request.getAttribute("bdapCmtList");
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  
  
  
  
<body class="fixed-left widescreen">
<form name="tx_editor_form" id="tx_editor_form" action="" method="post" accept-charset="utf-8"></form>
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>비정기자료 연동 진행현황 </b></h4>
						
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                        					<form class="form-horizontal" role="form">
	                                          <%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsTitle()%>">
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsCategory()%>">
	                                                </div>
	                                            </div>
	                                            <%}else{ %>
	                                            <div class="form-group" style="margin-bottom:0px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsTitle()%>">
	                                                </div>
	                                            </div>
	                                            <%} %>
	                                        </form>
                        				</div>

                        				<div class="col-md-6" style="padding-right:20px;">
                        					<form class="form-horizontal" role="form">
												<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">자료유형 :  </label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsCategorySub().equals("func")?"기능":bbs.getBbsCategorySub().equals("must")?"필독":"기타"%>">
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:17px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;"></label>
	                                                <div class="col-md-6">
	                                                    <!-- <div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio1" type="radio" checked="" value="option1">
                                        						<label for="inlineRadio1"> 예 </label>
                                    					</div>
                                    					<div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio2" type="radio" value="option1">
                                        						<label for="inlineRadio2"> 아니요 </label>
                                    					</div> -->
	                                                </div>
	                                                <div class="col-md-3 text-right">
                                     					<!-- <button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goMod();">수정</button>
	                                                    <button class="btn btn-warning waves-effect waves-light" type="button" >취소</button> -->
	                                                </div>
	                                            </div>
	                                            <%} %>
	                                        </form>
                        				</div>
                        			</div>
                       			<!-- <div id='daum_editor_panel'></div> -->
                       			<textarea id='editor_contents_source' style='display:none;'><%= bbs.getBbsContent() %></textarea>
                       			<input type='hidden' id='content' name='content' />
                       			
                       		</div>
                       		<div class="card-box">
								<div class="" id="" style="border:1px solid #b3b3b3; padding:10px; min-height:150px; max-height:400px; overflow-y:scroll">
										<%= bbs.getBbsContent() %>
									
							    </div>
							</div>	
								<%if(!fileName.equals("")){%>
									<div class="card-box">
									<div style="left: -100000px; position: absolute; opacity: 0;" contenteditable="true"><br></div><div class="inline-editor note-air-editor note-editable panel-body" id="note-editor-1" contenteditable="false">
									<%String[]  fileNameArr = fileName.split("\\*");
										for(int i = 0;i < fileNameArr.length; i++ ){ %>
											<form class="" action="../fileDownload?fileName=<%=fileNameArr[i]%>" method="post" >
											<div class="col-md-6">
												<div class="col-md-6">
	                                				<p><%= fileNameArr[i] %></p>
	                                			</div>
	                                			<div class="col-md-6">
	                                				<input type = "submit" value = "다운로드">
	                                			</div>
                                			</div>
                                		</form>
                                		<%}%>	
								    </div>
									</div>
								<%}%>
								
							<label class="col-md-3 control-label" style="text-align:left;">댓글(<span id="cmtCount"><%=cmtCount%></span>)</label>	
							<div class="col-sm-9 text-right" style="">
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goList();">목록</button>
								<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
									<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goReply();">답글</button>
								<%}%>
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goMod();">수정</button>
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goDelete();">삭제</button>
							</div>
							<div class="col-sm-12" style="border:1px solid #b3b3b3; margin-bottom:20px;">
							</div>	
							<form class="form-horizontal" role="form" id="commentRegForm" method="post" action="<%=contextPath%>/commentReg.do" accept-charset="utf-8">
								<div class="card-box col-sm-12" style="padding-left:20px;">
									<div class="col-sm-11 " id="commentContent" name="commentContent" contenteditable="true" style="border:1px solid #b3b3b3; height:65px; overflow-y:scroll;">
								    </div>
								    <div class="col-sm-1 text-right" style="">
											<button class="btn-lg btn-inverse waves-effect waves-light" type="button" style="height:65px; width:120px;" onclick="javascript:commentReg();">등록</button>
									</div>
								</div>
								<input type='hidden' id='comment' name='comment' />
								<input type='hidden' id='bbsPostId' name='bbsPostId' value="<%=bbsPostId%>" />
								<input type='hidden' id='viewName' name='viewName' value="noticeView" />
							</form>
							
							
							<div class="card-box col-sm-12 p-b-0" style="padding-top:10px;   <%= bdapCmtList.size() == 0 ?"display:none":"" %>" id="commentArea">
								<%if(bdapCmtList.size() > 0){ %>
										<%for(int i = 0; i < bdapCmtList.size(); i++){ %>
											<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">
												<div class="col-sm-8" style="">
													<label class="control-label" style="text-align:left; display:block; margin-left:0px;"><i class="zmdi zmdi-account"></i>&nbsp;&nbsp;<%=bdapCmtList.get(i).getCmtWriterId()%><span class="m-b-0 text-muted"><small>&nbsp;&nbsp;(<%=bdapCmtList.get(i).getCmtRegDt().toString().substring(0, 19)%>)</small></span></label>
													<div class="col-sm-12" id="<%=bdapCmtList.get(i).getCmtId()%>" style="padding-left:0px;">
														<p><%=bdapCmtList.get(i).getCmtContent()%> </p>
													</div>
												</div>
												
												<div class="col-sm-2 text-right" style="">
												</div>
										    	<div class="col-sm-2 text-right" style="margin-top:12px;">
													<button class="btn-sm btn-inverse waves-effect waves-light inline" id="" type="button" value="<%=bdapCmtList.get(i).getCmtId()%>" onclick="javascript:commentMod(this);">수정</button>
													<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="" value="<%=bdapCmtList.get(i).getCmtId()%>" onclick="javascript:commentDel(this);">삭제</button>
												</div>
											</div>
										<%} %>
								<%} %>
							</div>
                        </div>
                          <!-- <div class="col-md-12 portlets">
                                Your awesome content goes here
                                <div class="m-b-30">
                                    <form class="dropzone dz-clickable" id="dropzone" action="#">
                                    	<div class="dz-default dz-message"><span>file upload</span>
                                    	</div>
                                    </form>
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


		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/editor_loader.js?environment=production" charset="utf-8"></script>    
		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/jquery.webkitresize.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/daumeditor.js" charset="utf-8"></script>


	<!-- Dropzone js -->
        <script src="<%=contextPath%>/resources/kt/js/dropzone.js"></script>



        <script type="text/javascript">
        
        var serverName = "";
        var contextroot = "";
            jQuery(document).ready(function($) {
                serverName = '<%= (String)request.getServerName() %>';
                contextroot = '<%=contextPath%>';
            });

            
            daumEditor = new DaumEditor('BBS');
        	daumEditor.create();
        	daumEditor.setContent();
    		
    		function goReg(){
    			
    			document.location.href = "<%=contextPath%>/notice/reg.do";
    			
    		}
    		
			function goMod(){
    			
				if(confirm("수정 하시겠습니까?")){
					<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
						document.location.href = "<%=contextPath%>/linkage/mod.do?bbsPostId=<%=bbsPostId%>";
					<%}else{%>
						document.location.href = "<%=contextPath%>/reply/mod.do?bbsParentId=<%=bbs.getBbsParentBbsId()%>&bbsPostId=<%=bbs.getBbsId()%>&bbsType=BO4";
					<%}%>
					}
    		}
			
			function goList(){
    			
    			document.location.href = "<%=contextPath%>/linkage/list.do";
    		}
    		
    		function goReply(){
    			
    			document.location.href = "<%=contextPath%>/reply/reg.do?bbsPostId=<%=bbsPostId%>&bbsType=BO4";
    			
    		}
			
			
			function commentMod(obj){
	    		
    			var commentContent = $("#"+obj.value + " > p").html();
    			
    			var commentHtml = '<div style="height:30px; padding:0px; margin:0px;"><input type="text" style="width:100%; margin-top:-3px; margin-left:-2px;" value="'+commentContent+'"/></div>';
    			
    			$("#"+obj.value).html(commentHtml);
    			
    			$(obj).removeClass("btn-primary");
    			$(obj).addClass("btn-warning");
    			$(obj).html("확인");
    			$(obj).attr("onClick","javascript:commentUpdate(this);");
    			
    		}
    		
    		
    		function commentUpdate(obj){
    			
    			var commentContent = $("#"+obj.value + "> div > input").val();
    			
    			var param = "&bbsPostId=<%=bbsPostId%>&commentId="+ obj.value + "&commentContent="+commentContent+"&viewName=notice";
    			$.ajax({
    				type:'post',
    				async:true,
    				/* data:$('#commentRegForm').serialize(), */
    				dataType:'json',
    				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    				url:'<%=contextPath%>/commentUpdate.do?'+param,
    				success:function(data) {
    					var commentHtml = '<p>'+data.commentContent+'</p>';
    					$("#"+data.commentId).html(commentHtml)
    					$(obj).removeClass("btn-warning");
    	    			$(obj).addClass("btn-primary");
    	    			$(obj).html("수정");
    	    			$(obj).attr("onClick","javascript:commentMod(this);");
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    		}
    		
    		function commentReg(){

    			$("#comment").val($("#commentContent").html());
    			
    			$.ajax({
    				type:'post',
    				async:true,
    				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    				data:$('#commentRegForm').serialize(),
    				dataType:'json',
    				url:'<%=contextPath%>/commentReg.do',
    				success:function(data) {
    					data.commentContent
    					data.commentId
    					data.commentWriterId
    					data.commentRegDt
    					
    					var date = new Date(data.commentRegDt.time);
    					var formattedDate = moment(date).format('YYYY-MM-DD HH:mm:ss');
						var firstChild = false;    					
    					if($("#commentArea").children().size()==0){
    						firstChild = true;
    					}
    					var cmtHtml = ""
    					
						if(firstChild){
							cmtHtml = '<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">'
						}else{
							cmtHtml = '<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">'
						}
							
    						cmtHtml += '<div class="col-sm-8" style="">';
    						cmtHtml += '<label class="control-label" style="text-align:left; display:block; margin-left:0px;"><i class="zmdi zmdi-account"></i>&nbsp;&nbsp;'+data.commentWriterId+'<span class="m-b-0 text-muted"><small>&nbsp;&nbsp;('+formattedDate+')</small></span></label>'; 
    						cmtHtml += '<div class="col-sm-12" id="'+data.commentId+'" style="padding-left:0px;">';
    						cmtHtml += '<p>'+data.commentContent+'</p>';
    						cmtHtml += '</div>';
    						cmtHtml += '</div>';
    						cmtHtml += '<div class="col-sm-2 text-right" style="">';
    						cmtHtml += '</div>';
    						cmtHtml += '<div class="col-sm-2 text-right" style="margin-top:12px;">'; 
    						cmtHtml += '<button class="btn-sm btn-inverse waves-effect waves-light" id="" style:"" type="button" value="'+data.commentId+'" onclick="javascript:commentMod(this);">수정</button>';
    						cmtHtml += '<button class="btn-sm btn-inverse waves-effect waves-light" type="button" style="margin-left:3px;" value="'+data.commentId+'" onclick="javascript:commentDel(this);">삭제</button>';
    						cmtHtml += '</div>';
    						cmtHtml += '</div>';
    						
    					if($("#commentArea").css("display") == 'none'){
    						$("#commentArea").css("display",'block');
    					}
    						
    					var temp = $("#commentArea").html();
    					$("#commentArea").html(cmtHtml+temp);
    					$("#commentContent").empty();
    					$("#cmtCount").html(data.cmtCount);
    						
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    			//$("#comment").val($("#commentContent").html());
    			//$("#commentRegForm").submit();
    			
    		}
    		
    		function commentDel(obj){
    			
    			if(confirm("댓글을 삭제 하시겠습니까?")){
	    			var param = "&bbsPostId=<%=bbsPostId%>&commentId="+obj.value;
	    			$.ajax({
	    				type:'post',
	    				async:true,
	    				/* data:$('#commentRegForm').serialize(), */
	    				dataType:'json',
	    				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    				url:'<%=contextPath%>/commentDelete.do?'+param,
	    				success:function(data) {
	    					
	    	    			$(obj).parent().parent().remove();
	    	    			if($("#commentArea").children().size()==0){
	    	    				$("#commentArea").css("display","none");
	    	    			}
	    	    			
	    	    			$("#cmtCount").html(data.cmtCount);
	    	    			
	    				},
	    				error:function(data,status,err) {
	    				}
	    			});
    			}
    			
    			
    			
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
    		
    		
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "";
    	    	 checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>";
    	         return checkResult;

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
    	        });
    	        $("#datetimepicker7").on("dp.change", function (e) {
    	            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    	        });
    	    }); 
    	    
    	    function goDelete(){
				if(confirm("게시물이 삭제 됩니다. 정말 진행 하시겠습니까?")){
	    			document.location.href = "<%=contextPath%>/linkage/del.do?bbsPostIdArr=<%=bbsPostId%>";	
				}
    		}
    	    
        </script>
    
    
</body>
</html>