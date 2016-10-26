<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	String test = (String) request.getAttribute("test");
	String contextPath = (String) request.getContextPath();

	String type = (String) request.getAttribute("type");

	if (type == null) {
		type = "";
	}
	String tblId = (String) request.getAttribute("tblId");
	if(tblId == null){
		tblId = "";
	}
%>

<!DOCTYPE html>
<html
	class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="description"
	content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
<meta name="author" content="Coderthemes">

<link href="assets/images/favicon_1.ico" rel="shortcut icon">


<title>컬럼 정보 관리</title>

<link
	href="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.css"
	rel="stylesheet">
<link
	href="<%=contextPath%>/resources/kt/plugins/jquery-circliful/css/jquery.circliful.css"
	rel="stylesheet" type="text/css">

<link href="<%=contextPath%>/resources/kt/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/core.css" rel="stylesheet"
	type="text/css">
<link href="<%=contextPath%>/resources/kt/css/icons.css"
	rel="stylesheet" type="text/css">

<link
	href="<%=contextPath%>/resources/kt/css/material-design-iconic-font.css"
	rel="stylesheet" type="text/css">

<link href="<%=contextPath%>/resources/kt/css/components.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/pages.css"
	rel="stylesheet" type="text/css">
<link href="<%=contextPath%>/resources/kt/css/menu.css" rel="stylesheet"
	type="text/css">
<link href="<%=contextPath%>/resources/kt/css/responsive.css"
	rel="stylesheet" type="text/css">

<script src="//www.google-analytics.com/analytics.js" async=""></script>
<script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>


<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />




<script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-72255993-1', 'auto');
            ga('send', 'pageview');
        </script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>


<%-- <link rel="stylesheet" href="<%=contextPath%>/resources/kt/images/style.css" type="text/css"> --%>
<script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="<%=contextPath%>/resources/kt/amcharts/serial.js"
	type="text/javascript"></script>


<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}

#curve_chart {
	overflow-x: scroll;
	overflow-y: hidden;
	/* width: 100%; */
	height: 220px;
}

#chartdiv {
	overflow-x: scroll;
	overflow-y: hidden;
	/* width: 100%; */
	height: 247px;
}

#chartdiv1 {
	height: 280px;
}
</style>
</head>



<body class="fixed-left widescreen">

	<!-- Begin page -->
	<div id="wrapper">

		<div class="">
			<!-- Start content -->
			<div class="content" style="">
				<div class="container"
					style="padding-left: 0px; padding-right: 0px;">

					<h4 class="m-t-0 header-title"
						style="padding: 10px; padding-top: 15px; margin-bottom: 0px;">
						<i class="zmdi zmdi-transform"></i> <span>컬럼 정보 관리</span>
					</h4>

					<div class="col-lg-12" style="margin-bottom: 10px;" id="etcManage">
						<div class="card-box">
							<div class="table-responsive" style="">
								<table id="columninfo" style="width: 100%;"></table>
								<div id="jqGridPager3"></div>
							</div>
							<div class="text-right">
								<button class="btn btn-default waves-light">
									<span>엑셀 업로드</span>
								</button>
								<button class="btn btn-default waves-light"
									style="display: none;">
									<span>입력 완료</span>
								</button>
								<button class="btn btn-default waves-light" onclick="javascript:winclose();">
									<span>닫기</span>
								</button>
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
		<div class="side-bar right-bar">
			<div tabindex="5001" class="nicescroll"
				style="position: relative; -ms-overflow-x: hidden; -ms-overflow-y: hidden; -ms-touch-action: none;">
				<ul class="nav nav-tabs tabs" style="width: 100%;">
					<li class="active tab" style="width: 33.33%;"><a
						class="active" aria-expanded="false" href="#home-2"
						data-toggle="tab"> <span class="visible-xs"><i
								class="fa fa-home"></i></span> <span class="hidden-xs">Activity</span>
					</a></li>
					<li class="tab" style="width: 33.33%;"><a
						aria-expanded="false" href="#profile-2" data-toggle="tab"> <span
							class="visible-xs"><i class="fa fa-user"></i></span> <span
							class="hidden-xs">Chat</span>
					</a></li>
					<li class="tab" style="width: 33.33%;"><a aria-expanded="true"
						href="#messages-2" data-toggle="tab"> <span class="visible-xs"><i
								class="fa fa-envelope-o"></i></span> <span class="hidden-xs">Settings</span>
					</a></li>
					<div class="indicator" style="left: 0px; right: 180px;"></div>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade in active" id="home-2">
						<div class="timeline-2">
							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">5 minutes ago</small>
									<p>
										<strong><a class="text-info" href="#">John Doe</a></strong>
										Uploaded a photo <strong>"DSC000586.jpg"</strong>
									</p>
								</div>
							</div>

							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">30 minutes ago</small>
									<p>
										<a class="text-info" href="">Lorem</a> commented your post.
									</p>
									<p>
										<em>"Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Aliquam laoreet tellus ut tincidunt euismod. "</em>
									</p>
								</div>
							</div>

							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">59 minutes ago</small>
									<p>
										<a class="text-info" href="">Jessi</a> attended a meeting with<a
											class="text-success" href="#">John Doe</a>.
									</p>
									<p>
										<em>"Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Aliquam laoreet tellus ut tincidunt euismod. "</em>
									</p>
								</div>
							</div>

							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">1 hour ago</small>
									<p>
										<strong><a class="text-info" href="#">John Doe</a></strong>Uploaded
										2 new photos
									</p>
								</div>
							</div>

							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">3 hours ago</small>
									<p>
										<a class="text-info" href="">Lorem</a> commented your post.
									</p>
									<p>
										<em>"Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Aliquam laoreet tellus ut tincidunt euismod. "</em>
									</p>
								</div>
							</div>

							<div class="time-item">
								<div class="item-info">
									<small class="text-muted">5 hours ago</small>
									<p>
										<a class="text-info" href="">Jessi</a> attended a meeting with<a
											class="text-success" href="#">John Doe</a>.
									</p>
									<p>
										<em>"Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Aliquam laoreet tellus ut tincidunt euismod. "</em>
									</p>
								</div>
							</div>
						</div>
					</div>



					<div class="tab-pane fade" id="profile-2" style="display: none;">
						<div tabindex="5002" class="contact-list nicescroll"
							style="-ms-overflow-x: hidden; -ms-overflow-y: hidden; -ms-touch-action: none;">
							<ul class="list-group contacts-list">
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-1.jpg">
										</div> <span class="name">Chadengle</span> <i
										class="fa fa-circle online"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-2.jpg">
										</div> <span class="name">Tomaslau</span> <i
										class="fa fa-circle online"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-3.jpg">
										</div> <span class="name">Stillnotdavid</span> <i
										class="fa fa-circle online"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-4.jpg">
										</div> <span class="name">Kurafire</span> <i
										class="fa fa-circle online"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-5.jpg">
										</div> <span class="name">Shahedk</span> <i
										class="fa fa-circle away"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-6.jpg">
										</div> <span class="name">Adhamdannaway</span> <i
										class="fa fa-circle away"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-7.jpg">
										</div> <span class="name">Ok</span> <i class="fa fa-circle away"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-8.jpg">
										</div> <span class="name">Arashasghari</span> <i
										class="fa fa-circle offline"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#">
										<div class="avatar">
											<img alt=""
												src="<%=contextPath%>/resources/kt/images/users/avatar-9.jpg">
										</div> <span class="name">Joshaustin</span> <i
										class="fa fa-circle offline"></i>
								</a> <span class="clearfix"></span></li>
								<li class="list-group-item"><a href="#"> <%-- <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-10.jpg">
                                            </div> --%> <span
										class="name">Sortino</span> <i class="fa fa-circle offline"></i>
								</a> <span class="clearfix"></span></li>
							</ul>
						</div>
					</div>



					<div class="tab-pane fade" id="messages-2" style="display: none;">

						<div class="row m-t-20">
							<div class="col-xs-8">
								<h5 class="m-0">Notifications</h5>
								<p class="text-muted m-b-0">
									<small>Do you need them?</small>
								</p>
							</div>
							<div class="col-xs-4 text-right">
								<input style="display: none;" type="checkbox" checked=""
									data-size="small" data-color="#3bafda" data-plugin="switchery"
									data-switchery="true"><span
									class="switchery switchery-small"
									style="border-color: rgb(59, 175, 218); transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small
									style="transition: background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
							</div>
						</div>

						<div class="row m-t-20">
							<div class="col-xs-8">
								<h5 class="m-0">API Access</h5>
								<p class="m-b-0 text-muted">
									<small>Enable/Disable access</small>
								</p>
							</div>
							<div class="col-xs-4 text-right">
								<input style="display: none;" type="checkbox" checked=""
									data-size="small" data-color="#3bafda" data-plugin="switchery"
									data-switchery="true"><span
									class="switchery switchery-small"
									style="border-color: rgb(59, 175, 218); transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small
									style="transition: background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
							</div>
						</div>

						<div class="row m-t-20">
							<div class="col-xs-8">
								<h5 class="m-0">Auto Updates</h5>
								<p class="m-b-0 text-muted">
									<small>Keep up to date</small>
								</p>
							</div>
							<div class="col-xs-4 text-right">
								<input style="display: none;" type="checkbox" checked=""
									data-size="small" data-color="#3bafda" data-plugin="switchery"
									data-switchery="true"><span
									class="switchery switchery-small"
									style="border-color: rgb(59, 175, 218); transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small
									style="transition: background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
							</div>
						</div>

						<div class="row m-t-20">
							<div class="col-xs-8">
								<h5 class="m-0">Online Status</h5>
								<p class="m-b-0 text-muted">
									<small>Show your status to all</small>
								</p>
							</div>
							<div class="col-xs-4 text-right">
								<input style="display: none;" type="checkbox" checked=""
									data-size="small" data-color="#3bafda" data-plugin="switchery"
									data-switchery="true"><span
									class="switchery switchery-small"
									style="border-color: rgb(59, 175, 218); transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; box-shadow: inset 0px 0px 0px 0px #3bafda; background-color: rgb(59, 175, 218);"><small
									style="transition: background-color 0.4s, left 0.2s; left: 13px; background-color: rgb(255, 255, 255);"></small></span>
							</div>
						</div>

					</div>
				</div>
				<div class="nicescroll-rails" id="ascrail2002"
					style="left: -1702px; top: -70px; width: 8px; height: 100px; display: none; position: absolute; z-index: 99; cursor: default; -ms-touch-action: none;">
					<div
						style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 6px; height: 0px; float: right; position: relative; -ms-touch-action: none; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div>
				</div>
				<div class="nicescroll-rails" id="ascrail2002-hr"
					style="left: -1694px; top: 22px; height: 8px; display: none; position: absolute; z-index: 99; cursor: default;">
					<div
						style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 0px; height: 6px; position: relative; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div>
				</div>
			</div>
			<div class="nicescroll-rails" id="ascrail2001"
				style="left: 262px; top: 0px; width: 8px; height: 388px; position: absolute; z-index: 99; cursor: default; opacity: 0; -ms-touch-action: none;">
				<div
					style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 6px; height: 174px; float: right; position: relative; -ms-touch-action: none; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div>
			</div>
			<div class="nicescroll-rails" id="ascrail2001-hr"
				style="left: 0px; top: 380px; width: 262px; height: 8px; display: none; position: absolute; z-index: 99; cursor: default; opacity: 0;">
				<div
					style="border-radius: 5px; border: 1px solid rgb(255, 255, 255); border-image: none; top: 0px; width: 270px; height: 6px; position: relative; background-clip: padding-box; background-color: rgb(152, 166, 173);"></div>
			</div>
		</div>
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
	<script
		src="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/bootstrap-treeview.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/dropzone.js"></script>




	<script src="<%=contextPath%>/resources/kt/js/moment.js"></script>
	<script
		src="<%=contextPath%>/resources/kt/js/bootstrap-datetimepicker.min.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/bootstrap-select.js"></script>



	<!-- Counter Up  -->
	<script src="<%=contextPath%>/resources/kt/lib/jquery.waypoints.js"></script>
	<script
		src="<%=contextPath%>/resources/kt/plugins/counterup/jquery.counterup.min.js"></script>

	<!-- circliful Chart -->
	<script
		src="<%=contextPath%>/resources/kt/plugins/jquery-circliful/js/jquery.circliful.min.js"></script>
	<script
		src="<%=contextPath%>/resources/kt/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>

	<!-- skycons -->
	<script
		src="<%=contextPath%>/resources/kt/plugins/skyicons/skycons.min.js"
		type="text/javascript"></script>

	<!-- Page js  -->
	<script src="<%=contextPath%>/resources/kt/pages/jquery.dashboard.js"></script>

	<!-- Custom main Js -->
	<script src="<%=contextPath%>/resources/kt/js/jquery.core.js"></script>
	<script src="<%=contextPath%>/resources/kt/js/jquery.app.js"></script>

	<script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js"
		type="text/ecmascript"></script>
	<script
		src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js"
		type="text/ecmascript"></script>
	<script src="<%=contextPath%>/resources/js/jquery-ui.js"
		type="text/javascript"></script>

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
     			$("#columninfo").jqGrid({  
     				url:'<%=contextPath%>/getColumnByTblId.do?id=<%=tblId%>',
     				loadtext : '로딩중..',
     				datatype: "json",
     				styleUI : 'Bootstrap',
     			   	colNames:['컬럼ID','영문컬럼명','한글컬럼명','데이터 타입','설명','개인정보 여부','NULL 체크','TYPE 체크', 'TYPE 체크 FORMAT'],
     			   	colModel:[
     			   		{name:'id',align: "center", hidden:true},
     			   		{name:'colEngNm', index:'colEngNm', editable:false, align: "left"},
     			   		{name:'colKorNm', editable:true, align: "left"},
     			   		{name:'dataType', editable:false, align: "center"},
     			   		{name:'desc', editable:true, align: "left"},
     			   		{name:'isEnc',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'isChkNull',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'isChkType',align: "center",edittype:'checkbox', editable:true, editoptions: { value:"Y:N"}, formatter: "checkbox", formatoptions: {disabled : false}},
     			   		{name:'chkTypeFormat', editable:true, align: "ceter"},
     			   	],
     			   viewrecords: true, 
                   rowNum : 1000,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true,          
                   cellEdit: true,                          
                   cellsubmit:'remote',                    
                   cellurl:'<%=contextPath%>/updateCellColInfo.do', 
                   gridview:true,
                   beforeSubmitCell : function(rowid, cellName, cellValue) { 
	                   return {"id":rowid, "cellName":cellName, "cellValue": cellValue}
                   },
                   afterSubmitCell : function(serverStatus, aPostData) {
                	   var response = serverStatus.responseText;
                	   return [response=='SUCCESS'? true : false,response];
               	   },
               	   afterEditCell: function(rowid, cellname, value, iRow, iCol){
                       if(cellname == 'isEnc' || cellname == 'isChkNull' || cellname == 'isChkType'){
                            var id = $("#columninfo").getCell(rowid,'id');
	           				var saveInfo = 'id='+id+'&cellName='+cellname+'&cellValue='+ value;
	           				 $.ajax({
	           				 type: "POST",
	           				 url:'<%=contextPath%>/updateCellColInfo.do',
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
                   }
     			});

				$(document).delegate('#columninfo .jqgrow td input', 'click', function () {
		            var iRow = $("#columninfo").getInd($(this).parent('td').parent('tr').attr('id'));
		            var iCol = $(this).parent('td').parent('tr').find('td').index($(this).parent('td'));
			            //if($(this).parent('td').hasClass('edit-cell')){
		                	$(this).prop('checked',!($(this).attr('checked')));
	                        jQuery("#columninfo").editCell(iRow,iCol,true);
			            //}
				});

    		});
    		function winclose(){
    			self.close();
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
    	    
    	    $(window).load(function(){
   	    		
  	    		 $(".bootstrap-select").css("width","100%"); 
  	    	});
        </script>


</body>
</html>