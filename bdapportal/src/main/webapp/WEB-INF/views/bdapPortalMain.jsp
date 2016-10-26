<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.kt.bdapportal.domain.BdapBbs"%>
<%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>
<%@page import="com.kt.bdapportal.domain.MgmtNodeStat"%>
<%@ page import="java.util.*"%>
<%
	String test = (String)request.getAttribute("test");
	String contextPath = (String)request.getContextPath();
	DecimalFormat formatter = new DecimalFormat("#,###");
	
	@SuppressWarnings (value="unchecked")
	List<BdapBbs> noticeList = (List<BdapBbs>)request.getAttribute("noticeList");
	
	@SuppressWarnings (value="unchecked")
	List<BdapBbs> qnaList = (List<BdapBbs>)request.getAttribute("qnaList");
	
	@SuppressWarnings (value="unchecked")
	List<BdapBbs> referenceList = (List<BdapBbs>)request.getAttribute("referenceList");
	
	@SuppressWarnings (value="unchecked")
	List<BdapBbs> linkageList = (List<BdapBbs>)request.getAttribute("linkageList");
	
	@SuppressWarnings (value="unchecked")
	List<BdapBbs> devreqList = (List<BdapBbs>)request.getAttribute("devreqList");
	
	@SuppressWarnings (value="unchecked")
	List<MgmtTblStat> mgmtTblStatList = (List<MgmtTblStat>)request.getAttribute("mgmtTblStat");
	
	MgmtNodeStat storageNode = (MgmtNodeStat)request.getAttribute("storageNode");
	MgmtNodeStat computingNode = (MgmtNodeStat)request.getAttribute("computingNode");
	
	Long managedAreaUsage = (Long)request.getAttribute("managedAreaUsage");
	if(managedAreaUsage == null){
		managedAreaUsage = 0L;
	}
	Long userAreaUsage = (Long)request.getAttribute("userAreaUsage");
	if(userAreaUsage == null){
		userAreaUsage = 0L;
	}
	
	Long accumulateQueryCount = request.getAttribute("accumulateQueryCount")==null?0L:(Long)request.getAttribute("accumulateQueryCount");
	Long weekQueryCount = request.getAttribute("weekQueryCount")==null?0L:(Long)request.getAttribute("weekQueryCount");
	Long dailyQueryLoadCount = request.getAttribute("dailyQueryLoadCount")==null?0L:(Long)request.getAttribute("dailyQueryLoadCount");
	Long qnaCount = request.getAttribute("qnaCount")==null?0L:(Long)request.getAttribute("qnaCount");
	

	Long mau = 0L;
	Long uau = 0L;
	if(storageNode != null){
		mau = managedAreaUsage/(storageNode.getNodeStatTotalVal()*100);
		uau = userAreaUsage/(storageNode.getNodeStatTotalVal()*100);
	}
	
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
               <jsp:include page="/WEB-INF/views/leftmenu.jsp" flush="true"/>
            </div>
            <!-- Left Sidebar End --> 


            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page" style="margin-left:240px;">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">


	                       
	                       <div class="row" style="margin-left:0px;">
                            
                            <div class="col-lg-5">
                                <div class="card-box" style="padding-bottom:4px; margin-bottom:10px;">
                                    <h4 class="text-dark  header-title m-t-0 m-b-0" style="">게시판</h4>
                        		
                                <ul class="nav nav-tabs tabs" style="width: 100%;">
                                    <li class="active tab" style="width: 20%;">
                                        <a class="active" aria-expanded="false" href="#home-12" data-toggle="tab">
                                            <span class="visible-xs"><i class="fa fa-home"></i></span>
                                            <span class="hidden-xs">공지사항</span>
                                        </a>
                                    </li>
                                    <li class="tab" style="width: 20%;">
                                        <a aria-expanded="false" href="#profile-12" data-toggle="tab">
                                            <span class="visible-xs"><i class="fa fa-user"></i></span>
                                            <span class="hidden-xs">Q & A</span>
                                        </a>
                                    </li>
                                    <li class="tab" style="width: 20%;">
                                        <a aria-expanded="true" href="#messages-12" data-toggle="tab">
                                            <span class="visible-xs"><i class="fa fa-envelope-o"></i></span>
                                            <span class="hidden-xs">자료실</span>
                                        </a>
                                    </li>
                                    <li class="tab" style="width: 20%;">
                                        <a aria-expanded="false" href="#settings-12" data-toggle="tab">
                                            <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                            <span class="hidden-xs">비정기자료</span>
                                        </a>
                                    </li>
                                    
                                    <li class="tab" style="width: 20%;">
                                        <a aria-expanded="false" href="#test-12" data-toggle="tab">
                                            <span class="visible-xs"><i class="fa fa-cog"></i></span>
                                            <span class="hidden-xs">개발요청</span>
                                        </a>
                                    </li>
                                    
                                    
                                    
                                <div class="indicator" style="left: 0px; right: 584px;"></div></ul>
                                <div class="tab-content" style="padding-top:5px; padding:0px;">
                                    <div class="tab-pane active" id="home-12">
                                        <div class="table-responsive">
	                                        <table class="table" style="margin-bottom:5px;">
	                                            <thead>
	                                            <tr>
	                                                <th style="width:60%;">제목</th>
	                                                <th style="width:20%;">작성일</th>
	                                                <th style="width:20%;">작성자</th>
	                                            </tr>
	                                            </thead>
	                                            <tbody>
	                                            <%
	                                            if(noticeList != null){
	                                            for(int i = 0; i < noticeList.size(); i++){ %>
	                                                <tr>
	                                                    <td style="width:60%; white-space:nowrap; cursor:pointer; text-overflow: ellipsis;" onclick="javascript:goPostView('BO1','<%=noticeList.get(i).getBbsId()%>')"><%=noticeList.get(i).getBbsTitle()%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=noticeList.get(i).getBbsRegDt().toString().substring(0,10)%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=noticeList.get(i).getBbsWriterNm()%></td>
	                                                </tr>
	                                                <%} 
	                                            }
	                                                %>
	                                            </tbody>
	                                        </table>
	                                    </div>
                                        
                                    </div>
                                    <div class="tab-pane" id="profile-12" style="display: none;">
                                        <div class="table-responsive">
	                                        <table class="table" style="margin-bottom:5px;">
	                                            <thead>
	                                            <tr>
	                                                <th style="width:60%;">제목</th>
	                                                <th style="width:20%;">작성일</th>
	                                                <th style="width:20%;">작성자</th>
	                                            </tr>
	                                            </thead>
	                                            <tbody>
	                                                <%
	                                                if(qnaList != null){
	                                                for(int i = 0; i < qnaList.size(); i++){ %>
	                                                <tr>
	                                                    <td style="width:60%; white-space:nowrap; cursor:pointer; text-overflow: ellipsis;" onclick="javascript:goPostView('BO2','<%=qnaList.get(i).getBbsId()%>')"><%=qnaList.get(i).getBbsTitle()%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=qnaList.get(i).getBbsRegDt().toString().substring(0,10)%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=qnaList.get(i).getBbsWriterNm()%></td>
	                                                </tr>
	                                                <%}
	                                                }
	                                                %>
	                                            </tbody>
	                                        </table>
	                                    </div>
                                        
                                    </div>
                                    <div class="tab-pane" id="messages-12" style="display: none;">
                                        <div class="table-responsive">
                                        <table class="table" style="margin-bottom:5px;">
                                            <thead>
                                            <tr>
                                              	<th style="width:60%;">제목</th>
                                                <th style="width:20%;">작성일</th>
                                                <th style="width:20%;">작성자</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                               <%
                                               if(referenceList != null){
                                               for(int i = 0; i < referenceList.size(); i++){ %>
	                                                <tr>
	                                                    <td style="width:60%; white-space:nowrap; cursor:pointer; text-overflow: ellipsis;" onclick="javascript:goPostView('BO3','<%=referenceList.get(i).getBbsId()%>')"><%=referenceList.get(i).getBbsTitle()%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=referenceList.get(i).getBbsRegDt().toString().substring(0,10)%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=referenceList.get(i).getBbsWriterNm()%></td>
	                                                </tr>
	                                            <%} 
                                               }
	                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                        
                                    </div>
                                    <div class="tab-pane" id="settings-12" style="display: none;">
                                        <div class="table-responsive">
                                        <table class="table" style="margin-bottom:5px;">
                                            <thead>
                                            <tr>
                                                <th style="width:60%;">제목</th>
                                                <th style="width:20%;">작성일</th>
                                                <th style="width:20%;">작성자</th>
                                      
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                if(linkageList != null){
                                                for(int i = 0; i < linkageList.size(); i++){ %>
	                                                <tr>
	                                                    <td style="width:60%; white-space:nowrap; cursor:pointer; text-overflow: ellipsis;" onclick="javascript:goPostView('BO4','<%=linkageList.get(i).getBbsId()%>')"><%=linkageList.get(i).getBbsTitle()%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=linkageList.get(i).getBbsRegDt().toString().substring(0,10)%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=linkageList.get(i).getBbsWriterNm()%></td>
	                                                </tr>
	                                            <%}
                                                }
                                                %>
                                            </tbody>
                                        </table>
                                    </div>

                                    </div>
                                    <div class="tab-pane" id="test-12" style="display: none;">
										<div class="table-responsive">
                                        <table class="table" style="margin-bottom:5px;">
                                            <thead>
                                            <tr>
                                                <th style="width:60%;">제목</th>
                                                <th style="width:20%;">작성일</th>
                                                <th style="width:20%;">작성자</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                  <%
                                                  if(devreqList != null){
                                                  for(int i = 0; i < devreqList.size(); i++){ %>
	                                                <tr>
	                                                    <td style="width:60%; white-space:nowrap; cursor:pointer; text-overflow: ellipsis;" onclick="javascript:goPostView('BO5','<%=devreqList.get(i).getBbsId()%>')"><%=devreqList.get(i).getBbsTitle()%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=devreqList.get(i).getBbsRegDt().toString().substring(0,10)%></td>
	                                                    <td style="width:20%; white-space:nowrap; text-overflow: ellipsis;"><%=devreqList.get(i).getBbsWriterNm()%></td>
	                                                </tr>
	                                            <%}
                                                  }
                                                  %>                                          
	                                        </tbody>
                                        </table>
                                    </div>

                                    </div>
                                    
                                </div>

                                </div>
                            </div>
                            <div tabindex="-1" class="modal fade bs-example-modal-sm" role="dialog" aria-hidden="true" aria-labelledby="mySmallModalLabel" style="display: none;">
                                 <div class="modal-dialog modal-sm">
                                     <div class="modal-content">
                                         <div class="modal-header">
                                             <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                                             <h4 class="modal-title" id="mySmallModalLabel">그래프 선택</h4>
                                         </div>
                                         <div class="modal-body" style="padding-top:0px; padding-bottom:0px;">
                                           <div class="table-responsive text-center">
			                                    <table class="table m-0">
			                                        
			                                        <tbody>
			                                            <tr>
			                                                <td style="cursor:pointer;">OTV</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">WIFI</td>                                                
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">인터넷</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">SMS</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">3G_VC</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">LTE_VC</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">LTAS</td>
			                                            </tr>
			                                            <tr>
			                                                <td style="cursor:pointer;">S1-AP</td>
			                                            </tr>
			                                        </tbody>
			                                    </table>
                       						</div>
                                         </div>
                                     </div><!-- /.modal-content -->
                                 </div><!-- /.modal-dialog -->
                             </div><!-- /.modal -->
                                    
                            <div class="col-lg-5"  style="padding-left:0px;">
                                <div class="card-box" style="margin-bottom:10px;">
                                       	<h4 class="text-dark  header-title m-t-0" style="float:left;">테이블별 일 적재 현황</h4>
                                        <!-- <button class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-sm" style="margin-top:-10px; margin-right:18px; float:right;">그래프 선택</button> -->
                                    <div id="chartdiv" style="clear:both;"></div>
                                </div>
                            </div>
                            <div class="col-lg-2"  style="padding-left:0px;">
                                <div class="card-box" style="margin-bottom:10px; height:302px; overflow-x:hidden; overflow-y:scroll;">
                                    <h4 class="text-dark  header-title m-t-0">일 적재 통계</h4>
                                    <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                           
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>전체</td>
                                                <td style="text-align:right;" id="totalValue"></td>
                                            </tr>
                                            <tr>
                                                <td id="load1"></td>
                                                <td style="text-align:right;" id="value1"></td>
                                            </tr>
                                            <tr>
                                                <td id="load2"></td>
                                                <td style="text-align:right;" id="value2"></td>
                                            </tr>
                                            <tr>
                                                <td id="load3"></td>
                                                <td style="text-align:right;" id="value3"></td>
                                            </tr>
                                            <tr>
                                                <td id="load4"></td>
                                                <td style="text-align:right;" id="value4"></td>
                                            </tr>
                                            <tr>
                                                <td id="load5"></td>
                                                <td style="text-align:right;" id="value5"></td>
                                            </tr>
                                            <tr>
                                                <td id="load6"></td>
                                                <td style="text-align:right;" id="value6"></td>
                                            </tr>
                                            <tr>
                                                <td id="load7"></td>
                                                <td style="text-align:right;" id="value7"></td>
                                            </tr>
                                            <tr>
                                                <td id="load8"></td>
                                                <td style="text-align:right;" id="value8"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    
	                       				<!-- <table id="sourcreamList" style="width:100%;"></table> -->
	                       				 <!-- <div id="jqGridPager"></div> -->
                       				</div>
                                </div>
                            </div>
                        </div>
	    
                        <!-- end row -->

						<div class="row" style="margin-left:0px;">
							<div class="row" style="margin-left:0px;">
								<div class="col-lg-8" style="margin:0px; padding-right:0px;">
									<div class="col-lg-6" style="padding-left:0px;">
										<div class="card-box" style="margin-bottom:10px;">
										<h4 class="text-dark  header-title m-t-0" style="margin-left:10px;">cpu 점유율</h4>
											<div id="cpuchart"></div>
										</div>
									</div>
	                            <div class="col-lg-6" style="padding-left:0px; padding-right:3px;">
										<div class="card-box" style="margin-bottom:10px;">
										<h4 class="text-dark  header-title m-t-0" style="margin-left:10px;">memory 점유율</h4>
											<div id="memchart"></div>
										</div>
								</div>
								</div>
								<div class="col-lg-4" style="padding-left:6px; padding-right:20px;">
									<div class="card-box" style="margin-bottom:10px;">
									<h4 class="text-dark  header-title m-t-0" style="margin-left:10px;">DISK 사용량</h4>
									<div id="diskchart"></div>
								</div>
								</div>
							</div>
			
						</div>	
   
   
   
   
   
   						<div class="row" style="margin-left:0px;">
                            <div class="col-sm-8 col-lg-2" style="padding-right:0px; width:20%">
		                        <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: #494e50; height:35px; border-radius:5px 5px 0 0;">
											<div style="border:none;">
												<p class="text-white text-nowrap text-center" style="padding-top:7px;">누적 쿼리 건수</p>
											</div>
										</div>
			                            <div class="row">
	                            			<div class="col-lg-6 text-center">
			                                   <i class="zmdi zmdi-floppy zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
			                                    <h3 class="text-pink"><span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(accumulateQueryCount))) %></span>건</h3>
			                                </div>
			                            </div>
			                         </div>
		                     </div>
							<div class="col-sm-6 col-lg-2" style="padding-right:0px; width:20%">
								<div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: #494e50; height:35px; border-radius:5px 5px 0 0;">
											<div style="border:none;">
												<p class="text-white text-nowrap text-center" style="padding-top:7px;">주간 쿼리 건수</p>
											</div>
										</div>
			                            <div class="row">
	                            			<div class="col-lg-6 text-center">
			                                    <i class="zmdi zmdi-gamepad zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
			                                    <h3 class="text-pink"><span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(weekQueryCount))) %></span>건</h3>
			                                </div>
			                            </div>
			                         </div>
                            </div>
                            <div class="col-sm-6 col-lg-2" style=" width:20%">
                                <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
									
										<div style="background-color: #494e50; height:35px; border-radius:5px 5px 0 0;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">Workflow 건수</p>											
										</div>
			                            <div class="row">
	                            			<div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-disc-full zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter" id="totalworkflow"></span>건</h3>
			                                </div>
			                            </div>
			                         </div>
                            </div>
                            
                            <div class="col-sm-6 col-lg-2" style=" width:20%">
                                <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
									
										<div style="background-color: #494e50; height:35px; border-radius:5px 5px 0 0;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">누적 일 적재 건수</p>											
										</div>
			                            <div class="row">
	                            			<div class="col-lg-5 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-disc-full zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-7 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(dailyQueryLoadCount))) %></span>건</h3>
			                                </div>
			                            </div>
			                         </div>
                            </div>
                            
                            <div class="col-sm-6 col-lg-2" style=" width:20%">
                                <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
									
										<div style="background-color: #494e50; height:35px; border-radius:5px 5px 0 0;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">Q & A 건수</p>											
										</div>
			                            <div class="row">
	                            			<div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-disc-full zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(qnaCount))) %></span>건</h3>
			                                </div>
			                            </div>
			                         </div>
                            </div>
                          
                        </div>
                        <!-- end row -->

						<%-- <div class="row" style="margin-left:0px;">
							<div class="row" style="margin-left:0px;">
								<div class="col-lg-8" style="margin:0px; padding-right:0px;">
									<div class="col-lg-6" style="padding-left:0px;">
	                                <div class="card-box" style="margin-bottom:10px;">
	                                    <h4 class="text-dark  header-title m-t-0">공지사항</h4>
	                                    <p class="text-muted m-b-25 font-13">
	                                      
	                                    </p>
	
	                                    <div class="table-responsive">
	                                        <table class="table">
	                                            <thead>
	                                            <tr>
	                                                <th>#</th>
	                                                <th>제목</th>
	                                                <th>작성일</th>
	                                                <th>작성자</th>
	                                            </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>1</td>
	                                                    <td>인사 발령에 관한 공지</td>
	                                                    <td>26/04/2016</td>
	                                                    <td>인사팀</td>
	                                                </tr>
	                                                <tr>
	                                                    <td>2</td>
	                                                    <td>인사 발령에 관한 공지</td>
	                                                    <td>26/04/2016</td>
	                                                    <td>인사팀</td>
	                                                </tr>
	                                                <tr>
	                                                    <td>3</td>
	                                                    <td>인사 발령에 관한 공지</td>
	                                                    <td>10/05/2016</td>
	                                                    <td>인사팀</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg-6" style="padding-left:0px; padding-right:3px;">
	                                <div class="card-box" style="margin-bottom:10px;">
	                                	<div style="width:95%; height:15px;">
			                               	<h4 class="text-dark header-title m-t-0" style="float:left;">Q & A </h4><!-- <span style="float:right;"><a style="cursor:pointer;"><i class="zmdi zmdi-border-color"></i></a></span> -->
	        	                        </div>
	                                    <p class="text-muted m-b-25 font-13">
	                                      
	                                    </p>
	                                    <div class="table-responsive">
	                                        <table class="table">
	                                            <thead>
	                                            <tr>
	                                                <th>#</th>
	                                                 <th>제목</th>
	                                                <th>작성일</th>
	                                                <th>작성자</th>
	                                            </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr>
	                                                    <td>1</td>
	                                                    <td>Query log 확인 방법</td>
	                                                    <td>26/04/2016</td>
	                                                    <td>질문자</td>
	                                                </tr>
	                                                <tr>
	                                                    <td>2</td>
	                                                    <td>Query log 확인 방법</td>
	                                                    <td>26/04/2016</td>
	                                                    <td>질문자</td>
	                                                </tr>
	                                                <tr>
	                                                    <td>3</td>
	                                                    <td>Query log 확인 방법</td>
	                                                    <td>10/05/2016</td>
	                                                    <td>질문자</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
	                                    </div>
	                                </div>
	                            </div>
								</div>
								<div class="col-lg-4" style="padding-left:6px; padding-right:20px;">
								<div class="card-box" style="margin-bottom:10px;">
                                    <h4 class="text-dark  header-title m-t-0">자료실</h4>
                                    <p class="text-muted m-b-25 font-13">
                                    
                                    </p>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                 <th>제목</th>
                                                <th>작성일</th>
                                                <th>작성자</th>
                                               <!--  <th>Status</th>
                                                <th>Assign</th> -->
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>소프트웨어 업데이트</td>
                                                    <td>01/01/2016</td>
                                                    <td>정보팀</td>
                                                   <!--  <td><span class="label label-info">Released</span></td>
                                                    <td>Coderthemes</td> -->
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>소프트웨어 업데이트</td>
                                                    <td>01/01/2016</td>
                                                    <td>정보팀</td>
                                                   <!--  <td><span class="label label-success">Released</span></td>
                                                    <td>Minton admin</td> -->
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>소프트웨어 업데이트</td>
                                                    <td>01/01/2016</td>
                                                    <td>정보팀</td>
                                                  <!--   <td><span class="label label-pink">Pending</span></td>
                                                    <td>Coderthemes</td> -->
                                                </tr>
                                                <!-- <tr>
                                                    <td>4</td>
                                                    <td>소프트웨어 업데이트</td>
                                                    <td>01/01/2016</td>
                                                    <td>정보팀</td>
                                                    <td><span class="label label-purple">Work in Progress</span>
                                                    </td>
                                                    <td>Minton admin</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>소프트웨어 업데이트</td>
                                                    <td>01/01/2016</td>
                                                    <td>정보팀</td>
                                                    <td><span class="label label-warning">Coming soon</span></td>
                                                    <td>Coderthemes</td>
                                                </tr> -->

                                               <!--  <tr>
                                                    <td>6</td>
                                                    <td>Minton Admin v1.3</td>
                                                    <td>01/01/2016</td>
                                                    <td>31/05/2016</td>
                                                    <td><span class="label label-primary">Coming soon</span></td>
                                                    <td>Minton admin</td>
                                                </tr> -->

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
								</div>
							</div>
						
                            
                            
                            
                            
                            
                            
                                               
                            <!-- end col -8 -->

                            <div class="col-lg-4">
                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-1.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Chadengle</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-warning"><b>Admin</b></small>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-2.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Tomaslau</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-success"><b>User</b></small>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-7.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Ok</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-pink"><b>Admin</b></small>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div> --%>

                        <%-- <div class="row" style="margin-left:0px;">
                            <!-- <div class="col-lg-2">
                                <div class="card-box">
                                    <h4 class="text-dark  header-title m-t-0">테이블별 일 적재 현황</h4>
                                    <p class="text-muted m-b-25 font-13">
                                      
                                    </p>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>테이블명</th>
                                                <th>적재건수</th>
                                                <th>Status</th>
                                                <th>Assign</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>table</td>
                                                    <td>24건</td>
                                                    <td>인사팀</td>
                                                    <td><span class="label label-info">Released</span></td>
                                                    <td>Coderthemes</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>table</td>
                                                    <td>24건</td>
                                                    <td>인사팀</td>
                                                    <td><span class="label label-success">Released</span></td>
                                                    <td>Minton admin</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>table</td>
                                                    <td>24건</td>
                                                    <td>인사팀</td>
                                                    <td><span class="label label-pink">Pending</span></td>
                                                    <td>Coderthemes</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>table</td>
                                                    <td>24건</td>
                                                    <td>인사팀</td>
                                                    <td><span class="label label-purple">Work in Progress</span>
                                                    </td>
                                                    <td>Minton admin</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                   <td>table</td>
                                                    <td>24건</td>
                                                    <td>인사팀</td>
                                                    <td><span class="label label-warning">Coming soon</span></td>
                                                    <td>Coderthemes</td>
                                                </tr>

                                                <tr>
                                                    <td>6</td>
                                                    <td>Minton Admin v1.3</td>
                                                    <td>01/01/2016</td>
                                                    <td>31/05/2016</td>
                                                    <td><span class="label label-primary">Coming soon</span></td>
                                                    <td>Minton admin</td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> -->
                            
                            
                            <div class="col-lg-6">
                                <div class="card-box">
                                	<!-- <div class="rows">
                                		<div class="col-lg-6">
                                    		<h4 class="text-dark header-title m-t-0">Q & A</h4>
                                    	</div>
                                    	<div class="col-lg-6 text-right">
                                    	작성하기
                                    	</div>
                                    </div> -->
                                    <h4 class="text-dark header-title m-t-0">비정기 자료 연동</h4>
                                    <p class="text-muted m-b-25 font-13">
                                      
                                    </p>


                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>테이블명</th>
                                                <th>적재건수</th>
                                                <th>대분류</th>
                                                <th>중분류</th>
                                                <th>소분류</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>유선테이블 1</td>
                                                    <td>12건</td>
                                                    <td>임대</td>
                                                    <!-- <td><span class="label label-info">Released</span></td> -->
                                                    <td>장비</td>
                                                    <td>셋탑</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>유선테이블 2</td>
                                                    <td>3건</td>
                                                    <td>임대</td>
                                                  <!-- <td><span class="label label-success">Released</span></td> -->
                                                  <td>장비</td>
                                                   <td>셋탑</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>유선테이블 3</td>
                                                    <td>28건</td>
                                                    <td>임대</td>
                                                   <!-- <td><span class="label label-pink">Pending</span></td> -->
                                                   <td>장비</td>
                                                    <td>셋탑</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>유선테이블 4</td>
                                                    <td>11건</td>
                                                    <td>임대</td>
                                                   <!-- <td><span class="label label-purple">Work in Progress</span> -->
                                                   <td>장비</td>
                                                    <td>셋탑</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>유선테이블 5</td>
                                                    <td>43건</td>
                                                    <td>임대</td>
                                                   <!-- <td><span class="label label-warning">Coming soon</span></td> -->
                                                   <td>장비</td>
                                                    <td>셋탑</td>
                                                </tr>

                                              <!--   <tr>
                                                    <td>6</td>
                                                    <td>Minton Admin v1.3</td>
                                                    <td>01/01/2016</td>
                                                    <td>31/05/2016</td>
                                                    <td><span class="label label-primary">Coming soon</span></td>
                                                    <td>Minton admin</td>
                                                </tr> -->

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-6"  style="padding-left:0px;">
                                <div class="card-box">
                                    <h4 class="text-dark  header-title m-t-0">개발</h4>
                                    <p class="text-muted m-b-25 font-13">
                                    
                                    </p>

                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>테이블명</th>
                                                <th>적재건수</th>
                                                <th>대분류</th>
                                                <th>중분류</th>
                                                <th>소분류</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>무선테이블 1</td>
                                                    <td>31건</td>
                                                    <td>임대</td>
                                                    <!-- <td><span class="label label-info">Released</span></td> -->
                                                    <td>장비</td>
                                                    <td>EGG</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>무선테이블 2</td>
                                                    <td>27건</td>
                                                    <td>임대</td>
                                                    <!-- <td><span class="label label-success">Released</span></td> -->
                                                    <td>장비</td>
                                                    <td>EGG</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>무선테이블 3</td>
                                                    <td>12건</td>
                                                    <td>임대</td>
                                                    <!-- <td><span class="label label-pink">Pending</span></td> -->
                                                    <td>장비</td>
                                                    <td>EGG</td>
                                                </tr>
                                                <tr>
                                                    <td>4</td>
                                                    <td>무선테이블 4</td>
                                                    <td>25건</td>
                                                    <td>임대</td>
                                                    <!-- <td><span class="label label-purple">Work in Progress</span> -->
                                                    <td>장비</td>
                                                    <td>EGG</td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>무선테이블 5</td>
                                                    <td>3건</td>
                                                    <td>임대</td>
                                                  	<!-- <td><span class="label label-warning">Coming soon</span></td> -->
                                                  	<td>장비</td>
                                                    <td>EGG</td>
                                                </tr>

                                               <!--  <tr>
                                                    <td>6</td>
                                                    <td>Minton Admin v1.3</td>
                                                    <td>01/01/2016</td>
                                                    <td>31/05/2016</td>
                                                    <td><span class="label label-primary">Coming soon</span></td>
                                                    <td>Minton admin</td>
                                                </tr> -->

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                                               
                            <!-- end col -8 -->

                            <div class="col-lg-4">
                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-1.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Chadengle</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-warning"><b>Admin</b></small>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-2.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Tomaslau</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-success"><b>User</b></small>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-box widget-user">
                                    <div>
                                        <img class="img-responsive img-circle" alt="user" src="<%=contextPath%>/resources/kt/images/users/avatar-7.jpg">
                                        <div class="wid-u-info">
                                            <h4 class="m-t-0 m-b-5">Ok</h4>
                                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                                            <small class="text-pink"><b>Admin</b></small>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div> --%>
                        <!-- end row -->
						

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
		<%-- <script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script> --%>
        
        <script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="<%=contextPath%>/resources/kt/amcharts/gauge.js" type="text/javascript"></script>
        <script src="<%=contextPath%>/resources/kt/amcharts/pie.js" type="text/javascript"></script>
        <script src="<%=contextPath%>/resources/kt/amcharts/plugins/export/export.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="<%=contextPath%>/resources/kt/amcharts/plugins/export/export.css" type="text/css" media="all" />
        <script src="<%=contextPath%>/resources/kt/amcharts/themes/light.js" type="text/javascript"></script>
        
        
        
        
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

            $(function(){
            	/* alert("alert"); */
     			$("#sourcreamList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/ktlist.do',
     				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['이름','건수'],
     			   	colModel:[
    					{name:'1',align: "center", key: true},
     			   		{name:'2', index:'CheckResult',align: "center",formatter: ItemCheckInfo }
     			   		/* {name:'2', index:'CheckResult',align: "center"} */
     			
     			   	],
     			   viewrecords: true, 
                  /*  pager: "#jqGridPager", */
                   rowNum : 10,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
                   /* shrinkToFit : false, */
    			   viewrecords: true
    			   /* rownumbers:true,
    			   rownumWidth:40 */

     			});
     		});         
            
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "25";
    	    	 /* checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>"; */
    	         return checkResult;

    	    }
            
    	    function goPostView(type,bbsId){
    	    	
    	    	if(type == "BO1"){
    	    		document.location.href = "<%=contextPath%>/notice/view.do?bbsPostId="+bbsId;	
    	    	}else if(type == "BO2"){
    	    		document.location.href = "<%=contextPath%>/qna/view.do?bbsPostId="+bbsId;	
    	    	}else if(type == "BO3"){
    	    		document.location.href = "<%=contextPath%>/reference/view.do?bbsPostId="+bbsId;	
    	    	}else if(type == "BO4"){
    	    		document.location.href = "<%=contextPath%>/linkage/view.do?bbsPostId="+bbsId;	
    	    	}else if(type == "BO5"){
    	    		document.location.href = "<%=contextPath%>/devreq/view.do?bbsPostId="+bbsId;	
    	    	}
    	    }
    	    
    	
    	    
            
/*      	    var diskchart = AmCharts.makeChart( "diskchart", {
    	    	  "type": "pie",
    	    	  "theme": "light",
    	    	  "dataProvider": [ {
    	    	    "country": "사용 가능 공간",
    	    	    "value": 33.12
    	    	  }, {
    	    	    "country": "분석계 영역",
    	    	    "value": 46.50
    	    	  }, {
    	    	    "country": "사용자 영역",
    	    	    "value": 20.38
    	    	  } ],
    	    	  "labelsEnabled": false,
    	    	  "valueField": "value",
    	    	  "titleField": "country",
    	    	  "outlineAlpha": 0.4,
    	    	  "depth3D": 15,
    	    	  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
    	    	  "angle": 30,
    	    	  "export": {
    	    	    "enabled": true
    	    	  },
                  "legend": {
                      "enabled": true,
                      "align": "center",
                      "markerType": "circle"
                   },
    	    	} ); 
    	     */
    	  
    	     function makegraphs(){
    	    	 var graph = [];
    	    	<%if(!mgmtTblStatList.isEmpty()){%>
	    	    	 <%for(int i = 0; i < mgmtTblStatList.size(); i++){%>
	    	    	 	<%if(i == 0){ %>
	    	    	 		graph.push({"bullet": "diamond" , "id": "<%=mgmtTblStatList.get(i).getTblId()%>" ,"title": "<%=mgmtTblStatList.get(i).getTblName()%>","type": "smoothedLine","valueField": "<%=mgmtTblStatList.get(i).getTblName()%>"});
	    	    	 	<%}else{%>
	    	    	 		graph.push({"bullet": "diamond" , "id": "<%=mgmtTblStatList.get(i).getTblId()%>" ,"title": "<%=mgmtTblStatList.get(i).getTblName()%>","type": "smoothedLine","valueField": "<%=mgmtTblStatList.get(i).getTblName()%>","hidden": true});
	    	    	 	<%}%>
						
	    	    	 <%}%>
    	    	 <%}%>
    	    	// alert(graph); 
    	    	 return graph;
    	     }
    	     
    	     function makeValues(){
    	    	 var values = [];
    	    	 <%
    	    	 if(!mgmtTblStatList.isEmpty()){
	    	    	 StringBuffer values = new StringBuffer();
	    	    	 int totalCnt = 0;
	    	    	 
	    	    	 for(int i = 0; i < mgmtTblStatList.size(); i++){
						if(i==0){
							values.append("\""+mgmtTblStatList.get(i).getInsertDt().toString().subSequence(5, 10)+"\"");
						}
						values.append(",\""+mgmtTblStatList.get(i).getTblName()+"\": \"" + mgmtTblStatList.get(i).getTblCnt() +"\"");
						try{
							totalCnt += mgmtTblStatList.get(i).getTblCnt();
						}catch(Exception e){
							totalCnt += 0;
						}
	    	    	 %>
	    	    	 	 $("#load<%=i+1%>").html("<%=mgmtTblStatList.get(i).getTblName()%>");
		    	    	 $("#value<%=i+1%>").html(Number("<%=mgmtTblStatList.get(i).getTblCnt()%>").toLocaleString('en'));
		    	    	 <%}%>
		    	    	 
		    	    	 values.push({"category": <%=values.toString()%>});
		    	    	 $("#totalValue").html(Number("<%=totalCnt%>").toLocaleString('en'));
	    	    	<%}%>
    	    	 return values;
    	     }
    	     
    	     
    	     AmCharts.makeChart("chartdiv",
    	   				{
    	   					"type": "serial",
    	   					"categoryField": "category",
    	   					"columnSpacing": 15,
    	   					"columnWidth": 0,
    	   					"maxSelectedSeries": 7,
    	   					"maxSelectedTime": 7,
    	   					"mouseWheelScrollEnabled": true,
    	   					"mouseWheelZoomEnabled": true,
    	   					"angle": 7,
    	   					"autoMarginOffset": 9,
    	   					"marginBottom": 0,
    	   					"marginLeft": 0,
    	   					"marginRight": 5,
    	   					"marginTop": 0,
    	   					"maxZoomFactor": 19,
    	   					"sequencedAnimation": false,
    	   					"startEffect": "easeInSine",
    	   					"autoDisplay": true,
    	   					"fontSize": 11,
    	   					"handDrawScatter": 0,
    	   					"usePrefixes": true,
    	   					"categoryAxis": {
    	   						"autoRotateAngle": 0,
    	   						"gridPosition": "start",
    	   						"labelsEnabled": false,
    	   						"title": ""
    	   					},
    	   					"chartCursor": {
    	   						"enabled": true,
    	   						"balloonPointerOrientation": " vertical"
    	   					},
    	   					"chartScrollbar": {
    	   						"enabled": true,
    	   						"color": "#000000",
    	   						"graphType": "smoothedLine",
    	   						"gridCount": 7,
    	   						"hideResizeGrips": true,
    	   						"maximum": 3,
    	   						"minimum": 1,
    	   						"oppositeAxis": false,
    	   						"scrollbarHeight": 16,
    	   						"scrollDuration": 4
    	   					},
    	   					"trendLines": [],
    	   					"graphs": makegraphs(),
    	   					
    	   					"guides": [],
    	   					"valueAxes": [
    	   						{
    	   							"id": "ValueAxis-1",
    	   							"zeroGridAlpha": 0,
    	   							"title": ""
    	   						}
    	   					],
    	   					"allLabels": [],
    	   					"balloon": {
    	   						"showBullet": true
    	   					},
    	   					"legend": {
    	   						"enabled": true,
    	   						"align": "center",
    	   						"autoMargins": false,
    	   						"fontSize": 11,
    	   						"gradientRotation": 0,
    	   						"marginBottom": 5,
    	   						"marginLeft": 10,
    	   						"marginRight": 0,
    	   						"markerSize": 5,
    	   						"maxColumns": 8,
    	   						"rollOverGraphAlpha": 0,
    	   						"spacing": 0,
    	   						"useMarkerColorForLabels": true,
    	   						"useMarkerColorForValues": true,
    	   						"valueAlign": "left",
    	   						"valueWidth": 20,
    	   						"verticalGap": 0
    	   					},
    	   					"titles": [
    	   						{
    	   							"id": "Title-1",
    	   							"size": 15,
    	   							"text": ""
    	   						}
    	   					],
    	   					"dataProvider": makeValues()
    	   				}
    	   			);
    	     
    	
            var gaugeChart = AmCharts.makeChart( "cpuchart", {
            	  "type": "gauge",
            	  "theme": "light",  "axes": [ {
            	    "axisThickness": 1,
            	    "axisAlpha": 0.2,
            	    "tickAlpha": 0.2,
            	    "valueInterval": 5,
            	    "bands": [ {
            	      "color": "#84b761",
            	      "endValue": 70,
            	      "startValue": 0
            	    }, {
            	      "color": "#fdd400",
            	      "endValue": 90,
            	      "startValue": 70
            	    }, {
            	      "color": "#cc4748",
            	      "endValue": 100,
            	      "innerRadius": "95%",
            	      "startValue": 90
            	    } ],
            	    "bottomText": "0 %",
            	    "bottomTextYOffset": -20,
            	    "endValue": 100
            	  } ],
            	  "arrows": [ {} ],
            	  "export": {
            	    "enabled": true
            	  }
            	} );

            	setInterval( randomValue, 10000 );

            	// set random value
            	function randomValue() {
            		
        			$.ajax({
        				type:'post',
        				async:true,
        				/* data:$('#commentRegForm').serialize(), */
        				dataType:'json',
        				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        				url:'<%=contextPath%>/getComputingGraph.do',
        				success:function(data) {
        					var value = data.computingNode.nodeStatAvailVal/data.computingNode.nodeStatTotalVal*100;
        	            	  if ( gaugeChart ) {
        	            	    if ( gaugeChart.arrows ) {
        	            	      if ( gaugeChart.arrows[ 0 ] ) {
        	            	        if ( gaugeChart.arrows[ 0 ].setValue ) {
        	            	          gaugeChart.arrows[ 0 ].setValue( value.toFixed(2) );
        	            	          gaugeChart.axes[ 0 ].setBottomText( value.toFixed(2) + " %" );
        	            	        }
        	            	      }
        	            	    }
        	            	  }		
        				},
        				error:function(data,status,err) {
        				}
        			});
            		
            	}
            
            	var gaugeChart1 = AmCharts.makeChart( "memchart", {
            		  "type": "gauge",
            		  "theme": "light",  "axes": [ {
            		    "axisThickness": 1,
            		    "axisAlpha": 0.2,
            		    "tickAlpha": 0.2,
            		    "valueInterval": 5,
            		    "bands": [ {
            		      "color": "#84b761",
            		      "endValue": 70,
            		      "startValue": 0
            		    }, {
            		      "color": "#fdd400",
            		      "endValue": 90,
            		      "startValue": 70
            		    }, {
            		      "color": "#cc4748",
            		      "endValue": 100,
            		      "innerRadius": "95%",
            		      "startValue": 90
            		    } ],
            		    "bottomText": "0 %",
            		    "bottomTextYOffset": -20,
            		    "endValue": 100
            		  } ],
            		  "arrows": [ {} ],
            		  "export": {
            		    "enabled": true
            		  }
            		} );

            		setInterval( randomValue1, 10000 );

            		// set random value
            		function randomValue1() {
            			
            			$.ajax({
            				type:'post',
            				async:true,
            				/* data:$('#commentRegForm').serialize(), */
            				dataType:'json',
            				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            				url:'<%=contextPath%>/getMemoryGraph.do',
            				success:function(data) {
            					
            					var value = data.storageNode.nodeStatAvailVal/data.storageNode.nodeStatTotalVal*100;
                      		  if ( gaugeChart1 ) {
                      		    if ( gaugeChart1.arrows ) {
                      		      if ( gaugeChart1.arrows[ 0 ] ) {
                      		        if ( gaugeChart1.arrows[ 0 ].setValue ) {
                      		          gaugeChart1.arrows[ 0 ].setValue( value.toFixed(2) );
                      		          gaugeChart1.axes[ 0 ].setBottomText( value.toFixed(2) + " %" );
                      		        }
                      		      }
                      		    }
                      		  }	
            				},
            				error:function(data,status,err) {
            				}
            			});
            			
            		}
            
            		var gaugeChart2 = AmCharts.makeChart("diskchart", {
            			  "type": "gauge",
            			  "theme": "light",  "axes": [{
            			    "axisAlpha": 0,
            			    "tickAlpha": 0,
            			    "labelsEnabled": false,
            			    "startValue": 0,
            			    "endValue": 100,
            			    "startAngle": 0,
            			    "endAngle": 270,
            			    "bands": [{
            			      "color": "#eee",
            			      "startValue": 0,
            			      "endValue": 100,
            			      "radius": "100%",
            			      "innerRadius": "85%"
            			    }, {
            			      "color": "#84b761",
            			      "startValue": 0,
            			      "endValue": "<%=mau+uau%>",
            			      "radius": "100%",
            			      "innerRadius": "85%",
            			      "balloonText": "<%=mau+uau%>%"
            			    }, {
            			      "color": "#eee",
            			      "startValue": 0,
            			      "endValue": 100,
            			      "radius": "80%",
            			      "innerRadius": "65%"
            			    }, {
            			      "color": "#fdd400",
            			      "startValue": 0,
            			      "endValue": <%=mau%>,
            			      "radius": "80%",
            			      "innerRadius": "65%",
            			      "balloonText": "<%=mau%>%"
            			    }, {
            			      "color": "#eee",
            			      "startValue": 0,
            			      "endValue": 100,
            			      "radius": "60%",
            			      "innerRadius": "45%"
            			    }, {
            			      "color": "#cc4748",
            			      "startValue": 0,
            			      "endValue": <%=uau%>,
            			      "radius": "60%",
            			      "innerRadius": "45%",
            			      "balloonText": "<%=uau%>%"
            			    }]
            			  }],
            			  "allLabels": [{
            			    "text": "전체 영역",
            			    "x": "49%",
            			    "y": "5%",
            			    "size": 15,
            			    "bold": true,
            			    "color": "#84b761",
            			    "align": "right"
            			  }, {
            			    "text": "분석계 영역",
            			    "x": "49%",
            			    "y": "15%",
            			    "size": 15,
            			    "bold": true,
            			    "color": "#fdd400",
            			    "align": "right"
            			  }, {
            			    "text": "사용자 영역",
            			    "x": "49%",
            			    "y": "24%",
            			    "size": 15,
            			    "bold": true,
            			    "color": "#cc4748",
            			    "align": "right"
            			  }],
            			  "export": {
            			    "enabled": true
            			  }
            			});
             
            		function goEnc(){
                    	
                    	document.location.href = "<%=contextPath%>/ktMainPage11.do";
                    }
            
                	
            		
					function getTotalWorkflow() {
                		
            			$.ajax({
            				type:'get',
            				async:true,
            				dataType:'json',
            				/* contentType: "application/json; charset=UTF-8",  */
            				url:'http://{ndap.management.host}/api/workflow?op=count&userId=',
            				beforeSend : function(xhr){
            		            xhr.setRequestHeader("Authentication", ""); 
            		            xhr.setRequestHeader("Content-type","application/json;charset=UTF-8");
            		        },
            				success:function(data) {
            					//alert(data.value);
            					$("#totalworkflow").val(data.value);
            					
            					
            					
            				},
            				error:function(data,status,err) {
            				}
            			});
                		
                	}
            		
            		
            		
            		
            		
            		
            		
            		
        </script>
    
    
</body>
</html>