
<%@page import="com.kt.bdapportal.domain.MgmtComputingStat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.kt.bdapportal.domain.BdapBbs"%>
<%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>
<%@page import="com.kt.bdapportal.domain.MgmtNodeStat"%>
<%@page import="com.kt.bdapportal.domain.MgmtComputingStat"%>
<%@ page import="java.util.*"%>
<%
	String test = (String) request.getAttribute("test");
	String contextPath = (String) request.getContextPath();
	DecimalFormat formatter = new DecimalFormat("#,###");

	@SuppressWarnings(value = "unchecked")
	List<BdapBbs> noticeList = (List<BdapBbs>) request.getAttribute("noticeList");

	@SuppressWarnings(value = "unchecked")
	List<BdapBbs> qnaList = (List<BdapBbs>) request.getAttribute("qnaList");

	@SuppressWarnings(value = "unchecked")
	List<BdapBbs> referenceList = (List<BdapBbs>) request.getAttribute("referenceList");

	@SuppressWarnings(value = "unchecked")
	List<BdapBbs> linkageList = (List<BdapBbs>) request.getAttribute("linkageList");

	@SuppressWarnings(value = "unchecked")
	List<BdapBbs> devreqList = (List<BdapBbs>) request.getAttribute("devreqList");	

	@SuppressWarnings(value = "unchecked")
	List<MgmtTblStat> mgmtTblStatList = (List<MgmtTblStat>) request.getAttribute("mgmtTblStat");

	@SuppressWarnings(value = "unchecked")
	List<String> dashTblList = (List<String>) request.getAttribute("dashTblList");
	
	MgmtNodeStat storageNode = (MgmtNodeStat) request.getAttribute("storageNode");
	MgmtComputingStat computingNode = (MgmtComputingStat) request.getAttribute("computingNode");

	Long managedAreaUsage = (Long) request.getAttribute("managedAreaUsage");
	if (managedAreaUsage == null) {
		managedAreaUsage = 0L;
	}
	Long userAreaUsage = (Long) request.getAttribute("userAreaUsage");
	if (userAreaUsage == null) {
		userAreaUsage = 0L;
	}

	Long accumulateQueryCount = request.getAttribute("accumulateQueryCount") == null
			? 0L
			: (Long) request.getAttribute("accumulateQueryCount");
	Long weekQueryCount = request.getAttribute("weekQueryCount") == null
			? 0L
			: (Long) request.getAttribute("weekQueryCount");
	Long dailyQueryLoadCount = request.getAttribute("dailyQueryLoadCount") == null
			? 0L
			: (Long) request.getAttribute("dailyQueryLoadCount");
	Long qnaCount = request.getAttribute("qnaCount") == null ? 0L : (Long) request.getAttribute("qnaCount");

	Long mau = 0L;
	Long uau = 0L;
	Long statTotal = 0L;
	if (storageNode != null) {
		statTotal = storageNode.getNodeStatTotalVal();
	}
	mau = (long)((managedAreaUsage.doubleValue()*2) / statTotal.doubleValue()*100);
	//mau = (long)((managedAreaUsage.doubleValue()*2) / 989560464998400*100);
	uau = (long)((userAreaUsage.doubleValue()*2) / statTotal.doubleValue()*100);
	//mau = (long)((managedAreaUsage.doubleValue()*2) / 329853488332800*100);
	mau = mau==0?1:mau;
	uau = uau==0?1:uau;
%>
<!DOCTYPE html>
<html
	class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">



<body class="fixed-left widescreen">

	<!-- Begin page -->
	<div id="wrapper">

		<!-- Top Bar Start -->
		<div class="topbar">
			<jsp:include page="/WEB-INF/views/topmenu.jsp" flush="true" />
		</div>
		<!-- Top Bar End -->


		<!-- ========== Left Sidebar Start ========== -->
		<div class="left side-menu">
			<jsp:include page="/WEB-INF/views/leftmenu.jsp" flush="true" />
		</div>
		<!-- Left Sidebar End -->


		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page" style="margin-left: 240px;">
			<!-- Start content -->
			<div class="content" style="margin-top: 60px; margin-bottom:0px;">
				<div class="container">
					<div class="row" style="margin-left: 0px;">
						<div class="col-lg-5">
							<div class="card-box"
								style="padding-bottom: 4px; margin-bottom: 10px; min-height: 301px;">
								<h4 class="text-dark  header-title m-t-0 m-b-0" style="">게시판</h4>

								<ul class="nav nav-tabs tabs" style="width: 100%;">
									<li class="active tab" style="width: 20%;"><a
										class="active" aria-expanded="false" href="#home-12"
										data-toggle="tab"> <span class="visible-xs"><i
												class="fa fa-home"></i></span> <span class="hidden-xs">공지사항</span>
									</a></li>
									<li class="tab" style="width: 20%;"><a
										aria-expanded="false" href="#settings-12" data-toggle="tab">
											<span class="visible-xs"><i class="fa fa-cog"></i></span> <span
											class="hidden-xs">자료요청현황</span>
									</a></li>

									<li class="tab" style="width: 20%;"><a
										aria-expanded="false" href="#test-12" data-toggle="tab"> <span
											class="visible-xs"><i class="fa fa-cog"></i></span> <span
											class="hidden-xs">개발요청현황</span>
									</a></li>
									<li class="tab" style="width: 20%;"><a
										aria-expanded="false" href="#profile-12" data-toggle="tab">
											<span class="visible-xs"><i class="fa fa-user"></i></span> <span
											class="hidden-xs">Q & A</span>
									</a></li>
									<li class="tab" style="width: 20%;"><a
										aria-expanded="true" href="#messages-12" data-toggle="tab">
											<span class="visible-xs"><i class="fa fa-envelope-o"></i></span>
											<span class="hidden-xs">자료실</span>
									</a></li>
									<div class="indicator" style="left: 0px; right: 584px;"></div>
								</ul>
								<div class="tab-content" style="padding-top: 5px; padding: 0px;">
									<div class="tab-pane active" id="home-12">
										<div class="table-responsive" style="overflow-x:hidden;">
											<table class="table" style="margin-bottom: 5px;">
												<thead>
													<tr>
														<th style="width: 60%;text-align: center;">제목</th>
														<th style="width: 20%;text-align: center;">작성일</th>
														<th style="width: 20%;text-align: center;">작성자</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (noticeList != null) {
															for (int i = 0; i < noticeList.size(); i++) {
													%>
													<tr>
														<td style="width: 60%; cursor: pointer; " onclick="javascript:goPostView('BO1','<%=noticeList.get(i).getBbsId()%>')">
															<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 350px;">
																<%if(noticeList.get(i).getBbsEmergencyYn()=='Y'){ %>
																	<span class="label label-danger" style="padding-top:4px;margin-right:5px;float:left; width:33px; height:20px; text-align:center">긴급</span>&nbsp;&nbsp;&nbsp;
																<%} %>
																<div style="float:left;height:20px; vertical-align:middle; ">
																	<%=noticeList.get(i).getBbsTitle()%>
																</div>
															</div>
														</td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis; text-align:center;"><%=noticeList.get(i).getBbsRegDt().toString().substring(0, 10)%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;"><%=noticeList.get(i).getBbsWriterNm()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="profile-12" style="display: none;">
										<div class="table-responsive"  style="overflow-x:hidden;">
											<table class="table" style="margin-bottom: 5px;">
												<thead>
													<tr>
														<th style="width: 60%;text-align: center;">제목</th>
														<th style="width: 20%;text-align: center;">작성일</th>
														<th style="width: 20%;text-align: center;">작성자</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (qnaList != null) {
															for (int i = 0; i < qnaList.size(); i++) {
													%>
													<tr>
														<td
															style="width: 60%; white-space: nowrap; cursor: pointer; text-overflow: ellipsis; overflow: hidden;"
															onclick="javascript:goPostView('BO2','<%=qnaList.get(i).getBbsId()%>')">
															<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 350px;"><%=qnaList.get(i).getBbsTitle()%></div>
														</td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;  text-align:center;"><%=qnaList.get(i).getBbsRegDt().toString().substring(0, 10)%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;"><%=qnaList.get(i).getBbsWriterNm()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="messages-12" style="display: none;">
										<div class="table-responsive"  style="overflow-x:hidden;">
											<table class="table" style="margin-bottom: 5px;">
												<thead>
													<tr>
														<th style="width: 60%;text-align: center;">제목</th>
														<th style="width: 20%;text-align: center;">작성일</th>
														<th style="width: 20%;text-align: center;">작성자</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (referenceList != null) {
															for (int i = 0; i < referenceList.size(); i++) {
													%>
													<tr>
														<td
															style="width: 60%; white-space: nowrap; cursor: pointer; text-overflow: ellipsis; overflow: hidden;"
															onclick="javascript:goPostView('BO3','<%=referenceList.get(i).getBbsId()%>')">
															<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 350px;"><%=referenceList.get(i).getBbsTitle()%></div>
														</td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis; text-align:center;"><%=referenceList.get(i).getBbsRegDt().toString().substring(0, 10)%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;"><%=referenceList.get(i).getBbsWriterNm()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="settings-12" style="display: none;">
										<div class="table-responsive"  style="overflow-x:hidden;">
											<table class="table" style="margin-bottom: 5px;">
												<thead>
													<tr>
														<th style="width: 60%;text-align: center;">제목</th>
														<th style="width: 20%;text-align: center;">작성일</th>
														<th style="width: 20%;text-align: center;">작성자</th>

													</tr>
												</thead>
												<tbody>
													<%
														if (linkageList != null) {
															for (int i = 0; i < linkageList.size(); i++) {
													%>
													<tr>
														<td style="width: 60%; white-space: nowrap; cursor: pointer; text-overflow: ellipsis; overflow: hidden;"
															onclick="javascript:goPostView('BO4','<%=linkageList.get(i).getBbsId()%>')">
															<div style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 350px;"><%=linkageList.get(i).getBbsTitle()%></div>
														</td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis; text-align:center;"><%=linkageList.get(i).getBbsRegDt().toString().substring(0, 10)%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;"><%=linkageList.get(i).getBbsWriterNm()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>

									</div>
									<div class="tab-pane" id="test-12" style="display: none;">
										<div class="table-responsive"  style="overflow-x:hidden;">
											<table class="table" style="margin-bottom: 5px;">
												<thead>
													<tr>
														<th style="width: 60%;text-align: center;">제목</th>
														<th style="width: 20%;text-align: center;">작성일</th>
														<th style="width: 20%;text-align: center;">작성자</th>
													</tr>
												</thead>
												<tbody>
													<%
														if (devreqList != null) {
															for (int i = 0; i < devreqList.size(); i++) {
													%>
													<tr>
														<td style="width: 60%; white-space: nowrap; cursor: pointer; text-overflow: ellipsis;"
															onclick="javascript:goPostView('BO5','<%=devreqList.get(i).getBbsId()%>')"><%=devreqList.get(i).getBbsTitle()%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis; text-align:center;"><%=devreqList.get(i).getBbsRegDt().toString().substring(0, 10)%></td>
														<td style="width: 20%; white-space: nowrap; text-overflow: ellipsis;"><%=devreqList.get(i).getBbsWriterNm()%></td>
													</tr>
													<%
														}
														}
													%>
												</tbody>
											</table>
										</div>

									</div>

								</div>

							</div>
						</div>
						<div tabindex="-1" class="modal fade bs-example-modal-sm"
							role="dialog" aria-hidden="true"
							aria-labelledby="mySmallModalLabel" style="display: none;">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button class="close" aria-hidden="true" type="button"
											data-dismiss="modal">×</button>
										<h4 class="modal-title" id="mySmallModalLabel">그래프 선택</h4>
									</div>
									<div class="modal-body"
										style="padding-top: 0px; padding-bottom: 0px;">
										<div class="table-responsive text-center">
											<table class="table m-0">

												<tbody>
													<tr>
														<td style="cursor: pointer;">OTV</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">WIFI</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">인터넷</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">SMS</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">3G_VC</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">LTE_VC</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">LTAS</td>
													</tr>
													<tr>
														<td style="cursor: pointer;">S1-AP</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<div class="col-lg-5" style="padding-left: 0px;">
							<div class="card-box" style="margin-bottom: 10px;">
								<h4 class="text-dark  header-title m-t-0" style="float: left;">일 적재 현황</h4>
								<!-- <button class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-sm" style="margin-top:-10px; margin-right:18px; float:right;">그래프 선택</button> -->
								<div id="chartdiv" style="clear: both;"></div>
							</div>
						</div>
						<div class="col-lg-2" style="padding-left: 0px;">
							<div class="card-box"
								style="margin-bottom: 10px; height: 302px; overflow-x: hidden; overflow-y: scroll;">
								<h4 class="text-dark  header-title m-t-0">일 적재 통계</h4>
								<div class="table-responsive">
									<table class="table m-0">
										<thead>

										</thead>
										<tbody>
											<tr>
												<td>전체</td>
												<td style="text-align: right;" id="totalValue"></td>
											</tr>
											<tr>
												<td id="load1"></td>
												<td style="text-align: right;" id="value1"></td>
											</tr>
											<tr>
												<td id="load2"></td>
												<td style="text-align: right;" id="value2"></td>
											</tr>
											<tr>
												<td id="load3"></td>
												<td style="text-align: right;" id="value3"></td>
											</tr>
											<tr>
												<td id="load4"></td>
												<td style="text-align: right;" id="value4"></td>
											</tr>
											<tr>
												<td id="load5"></td>
												<td style="text-align: right;" id="value5"></td>
											</tr>
											<tr>
												<td id="load6"></td>
												<td style="text-align: right;" id="value6"></td>
											</tr>
											<tr>
												<td id="load7"></td>
												<td style="text-align: right;" id="value7"></td>
											</tr>
											<tr>
												<td id="load8"></td>
												<td style="text-align: right;" id="value8"></td>
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

					<div class="row" style="margin-left: 0px;">
						<div class="row" style="margin-left: 0px;">
							<div class="col-lg-8" style="margin: 0px; padding-right: 0px;">
								<div class="col-lg-6" style="padding-left: 0px;">
									<div class="card-box" style="margin-bottom: 10px;">
										<h4 class="text-dark  header-title m-t-0"
											style="margin-left: 10px;">COMPUTING<span style="float:right;font-size:14px; color:#4a4848;text-align: right;" id="computingNum"></span></h4>
										<div id="cpuchart"></div>
									</div>
								</div>
								<div class="col-lg-6"
									style="padding-left: 0px; padding-right: 3px;">
									<div class="card-box" style="margin-bottom: 10px;">
										<h4 class="text-dark  header-title m-t-0"
											style="margin-left: 10px;">STORAGE<span style="float:right;font-size:14px; color:#4a4848;" id="storageNum"></span></h4>
										<div id="memchart"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-4"
								style="padding-left: 6px; padding-right: 20px;">
								<div class="card-box" style="margin-bottom: 10px;">
									<h4 class="text-dark  header-title m-t-0"
										style="margin-left: 10px;">USEAGE</h4>
									<div id="diskchart"></div>
								</div>
							</div>
						</div>

					</div>





					<div class="row" style="margin-left: 0px;">
						<div class="col-sm-6 col-lg-2"
							style="width: 20%">
							<div class="widget-simple-chart text-right card-box"
								style="padding: 0px; margin-bottom: 10px;">
								<div
									style="background-color: #494e50; height: 35px; border-radius: 5px 5px 0 0;">
									<div style="border: none;">
										<p class="text-white text-nowrap text-center"
											style="padding-top: 7px;">주간 쿼리 건수</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 text-center" style="margin-top: 5px;">
										<i class="glyphicon glyphicon-align-justify"
											style="font-size: 30px;"></i>
									</div>
									<div class="col-lg-9 text-center" style="padding-right: 20px;">
										<h3 class="text-pink" style="text-align: right;">
											<span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(weekQueryCount)))%></span>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-8 col-lg-2" style="width: 20%">
							<div class="widget-simple-chart text-right card-box"
								style="padding: 0px; margin-bottom: 10px;">
								<div
									style="background-color: #494e50; height: 35px; border-radius: 5px 5px 0 0;">
									<div style="border: none;">
										<p class="text-white text-nowrap text-center"
											style="padding-top: 7px;">누적 쿼리 건수</p>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 text-center" style="margin-top: 5px;">
										<i class="glyphicon glyphicon-align-justify"
											style="font-size: 30px;"></i>
									</div>
									<div class="col-lg-9 text-center" style="padding-right: 20px;">
										<h3 class="text-pink" style="text-align: right;">
											<span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(accumulateQueryCount)))%></span>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-2" style="width: 20%">
							<div class="widget-simple-chart text-right card-box"
								style="padding: 0px; margin-bottom: 10px;">

								<div
									style="background-color: #494e50; height: 35px; border-radius: 5px 5px 0 0;">
									<p class="text-white text-nowrap text-center"
										style="padding-top: 7px;">누적 일 적재 건수</p>
								</div>
								<div class="row">
									<div class="col-lg-3 text-center" style="margin-top: 5px;">
										<i class="glyphicon glyphicon-align-justify"
											style="font-size: 30px;"></i>
									</div>
									<div class="col-lg-9 text-center" style="padding-right: 20px;">
										<h3 class="text-pink" style="text-align: right;">
											<span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(dailyQueryLoadCount)))%></span>
										</h3>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-lg-2" style="width: 20%">
							<div class="widget-simple-chart text-right card-box"
								style="padding: 0px; margin-bottom: 10px;">

								<div
									style="background-color: #494e50; height: 35px; border-radius: 5px 5px 0 0;">
									<p class="text-white text-nowrap text-center"
										style="padding-top: 7px;">Workflow 건수</p>
								</div>
								<div class="row">
									<div class="col-lg-3 text-center" style="margin-top: 5px;">
										<i class="glyphicon glyphicon-align-justify"
											style="font-size: 30px;"></i>
									</div>
									<div class="col-lg-9 text-center" style="padding-right: 20px;">
										<h3 class="text-pink" style="text-align: right;">
											<span class="counter" id="totalworkflow"></span>
										</h3>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-6 col-lg-2" style="width: 20%">
							<div class="widget-simple-chart text-right card-box"
								style="padding: 0px; margin-bottom: 10px;">

								<div
									style="background-color: #494e50; height: 35px; border-radius: 5px 5px 0 0;">
									<p class="text-white text-nowrap text-center"
										style="padding-top: 7px;">Q & A 건수</p>
								</div>
								<div class="row">
									<div class="col-lg-3 text-center" style="margin-top: 5px;">
										<i class="glyphicon glyphicon-align-justify"
											style="font-size: 30px;"></i>
									</div>
									<div class="col-lg-9 text-center" style="padding-right: 20px;">
										<h3 class="text-pink" style="text-align: right;">
											<span class="counter"><%=formatter.format(Double.parseDouble(Long.toString(qnaCount)))%></span>
										</h3>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
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
        <script src="<%=contextPath%>/resources/kt/amcharts/themes/light.js" type="text/javascript"></script>

		<!-- custom -->
		<script src="<%=contextPath%>/resources/kt/js/common.js" type="text/javascript"></script> 
		<script type="text/javascript">
            jQuery(document).ready(function($) {
                randomValue();;
                randomValue1();
            });

            $(function(){
     			$("#sourcreamList").jqGrid({  
     				url:'<%=contextPath%>/ktlist.do',
     				loadtext : '로딩중..',
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
     			getTotalWorkflow();
     		});         
            
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "25";
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
    	    	<%
    	    	if (!dashTblList.isEmpty()) {
	    	    	 for (int i = 0; i < dashTblList.size(); i++) {
	    	    	 	if (i == 0) {
	    	    	 	%>
	    	    	 		graph.push({"bullet": "diamond" , "id": "<%=dashTblList.get(i)%>" ,"title": "<%=dashTblList.get(i)%>","type": "smoothedLine","valueField": "<%=dashTblList.get(i)%>"});
	    	    	 	<%} else {%>
	    	    	 		graph.push({"bullet": "diamond" , "id": "<%=dashTblList.get(i)%>" ,"title": "<%=dashTblList.get(i)%>","type": "smoothedLine","valueField": "<%=dashTblList.get(i)%>","hidden": true});
	    	    	 	<%
	    	    	 	}
    	    	 	}
    	    	 }
    	    	 %>
    	    	 return graph;
    	     }
    	     
    	     function makeValues(){
    	    	 var values = [];
    	    	 <%
    	    	 if (!mgmtTblStatList.isEmpty()) {
				StringBuffer values = new StringBuffer();
				int totalCnt = 0;
				int i = 1;
				int j = 1;
				String etlYmdTemp = "";
				String lastDate = mgmtTblStatList.get(mgmtTblStatList.size()-1).getEtlYmd();
				for(MgmtTblStat stat : mgmtTblStatList){
					if(!etlYmdTemp.equals(stat.getEtlYmd())){
						if(!etlYmdTemp.equals("")){
						%>
		    	    	 values.push({<%=values.toString()%>});
		    	    	<%
						}
						values = new StringBuffer();
						etlYmdTemp = stat.getEtlYmd(); 
						values.append("\"category\": \"" + stat.getEtlYmd() + "\"");
					}
					values.append(",\"" + stat.getTblName() + "\": " + stat.getTblCnt() + "");
							if(stat.getEtlYmd().equals(lastDate)){
							//마지막 일자 일때만 totalCnt를 증가
							try {
								totalCnt += stat.getTblCnt();
							} catch (Exception e) {
								e.printStackTrace();
								totalCnt += 0;
							}
							%>
							//마지막 일자 일때만 표 입력
		    	    	 	 $("#load<%=j%>").html("<%=stat.getTblName()%>");
		    	    	 	 $("#value<%=j%>").html(Number("<%=stat.getTblCnt()%>").toLocaleString('en'));
			    	    	 //$("#value<%=j%>").html(Format.tblCntToString(Number("<%=stat.getTblCnt()%>").toLocaleString('en')));
			    	    	 <%
			    	    	 j++;
							}
	    	    	 //for문 처음에서 날짜변동여부로 js의 values로 push하고 있기 때문에 마지막 날짜는 일단 별도로 처리
	    	    	 i++;
	    	    	 if(i>mgmtTblStatList.size()){
						%>
		    	    	 values.push({<%=values.toString()%>});
		    	    	<%
	    	    	 }
					}
	    	    	 %>
	    	    	 $("#totalValue").html(Number("<%=totalCnt%>").toLocaleString('en'));
    	    	<%
    	    	}
    	    	%>
    	    	 return values;
    	     }
    	     
    	     
    	     AmCharts.makeChart("chartdiv",
    	   				{
    	   					"type": "serial",
    	   					"categoryField": "category",
    	   					"columnSpacing": 15,
    	   					"columnWidth": 0,
    	   					"maxSelectedSeries": 100,
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
            	  "arrows": [ {} ]
            	} );

            	setInterval( randomValue, 1000 );

            	function randomValue() {
            		
        			$.ajax({
        				type:'post',
        				async:true,
        				dataType:'json',
        				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        				url:'<%=contextPath%>/getComputingGraph.do',
        				success:function(data) {
        					//var value = ((data.computingNode.nodeStatTotalVal-data.computingNode.nodeStatAvailVal)/data.computingNode.nodeStatTotalVal)*100;
        					var value = ((data.computingNode.totalVirtualCores-data.computingNode.availableVirtualCores)/data.computingNode.totalVirtualCores)*100;
        	            	  if ( gaugeChart ) {
        	            	    if ( gaugeChart.arrows ) {
        	            	      if ( gaugeChart.arrows[ 0 ] ) {
        	            	        if ( gaugeChart.arrows[ 0 ].setValue ) {
        	            	          gaugeChart.arrows[ 0 ].setValue( value.toFixed(2) );
        	            	          gaugeChart.axes[ 0 ].setBottomText( value.toFixed(2) + " %" );
        	            	          
        	            	          //$('#computingNum').html((data.computingNode.nodeStatTotalVal-data.computingNode.nodeStatAvailVal).toLocaleString()+'/'+data.computingNode.nodeStatTotalVal.toLocaleString()+' (mb)');
        	            	          $('#computingNum').html(
        	            	        		  (data.computingNode.totalVirtualCores-data.computingNode.availableVirtualCores).toLocaleString()+'/'+data.computingNode.totalVirtualCores.toLocaleString()+' (cores)'
        	            	        		  +'</br>'+
        	            	        		  data.computingNode.activeNodes.toLocaleString()+'/'+data.computingNode.totalNodes.toLocaleString()+' (nodes)'
        	            	        		  +'</br>'+
        	            	        		  (data.computingNode.totalMB-data.computingNode.availableMB).toLocaleString()+'/'+data.computingNode.totalMB.toLocaleString()+' (mb)'
        	            	        		  
        	            	          );
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
            		  "arrows": [ {} ]
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
            					var value = (data.storageNode.nodeStatTotalVal-data.storageNode.nodeStatAvailVal)/data.storageNode.nodeStatTotalVal*100;
                      		  if ( gaugeChart1 ) {
                      		    if ( gaugeChart1.arrows ) {
                      		      if ( gaugeChart1.arrows[ 0 ] ) {
                      		        if ( gaugeChart1.arrows[ 0 ].setValue ) {
                      		          gaugeChart1.arrows[ 0 ].setValue( value.toFixed(2) );
                      		          gaugeChart1.axes[ 0 ].setBottomText( value.toFixed(2) + " %" );
                      		          
                      		          $('#storageNum').html((data.storageNode.nodeStatTotalVal-data.storageNode.nodeStatAvailVal).toLocaleString()+'/'+data.storageNode.nodeStatTotalVal.toLocaleString()+' (Byte)');
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
            			      "endValue": "<%=mau + uau%>",
            			      "radius": "100%",
            			      "innerRadius": "85%",
            			      "balloonText": "<%=mau + uau%>%"
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
            			  }]
            			});
             

            		function goEnc(){
                    	document.location.href = "<%=contextPath%>/decList.do";
                    }
            		function goTableManagement(){
            			document.location.href = "<%=contextPath%>/tableManagementList.do";
            		}
            		function goHiveManual(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "test.html";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function goNdap(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://bdap.kt.com:8080";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function goRStudio(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://bdap.kt.com:8787";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function goJupyter(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://10.220.235.21";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function GoSas(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://10.220.235.13:7980/SASEnterpriseMinerJWS/Status";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function goTableau(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://10.220.235.18";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
            		function goPms(){
           			    var width = window.outerWidth-(window.outerWidth-window.innerWidth);
           			    var height = window.outerHeight-(window.outerHeight-window.innerHeight);
            			var popUrl = "http://10.220.235.20/redmine/";
            			var popOption = "width="+width+", height="+height+", resizable=yes, scrollbars=no, status=no;"; 
            				window.open(popUrl,"",popOption);
           			}
					
					function getTotalWorkflow() {
            			$.ajax({
            				type:'get',
            				async:true,
            				dataType:'json',
            				url:'<%=contextPath%>/ndap/workflowAll',
				success : function(data) {
					$("#totalworkflow").html(data.workflowAllCnt);
				},
				error : function(data, status, err) {
				}
			});
		}
	</script>
</body>
</html>