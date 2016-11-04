<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  <head>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link href="assets/images/favicon_1.ico" rel="shortcut icon">

        <title>공지사항 등록</title>

        <link href="<%=contextPath%>/resources/kt/plugins/switchery/switchery.min.css" rel="stylesheet">
        <link href="<%=contextPath%>/resources/kt/plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css">

        <link href="<%=contextPath%>/resources/kt/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/core.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/icons.css" rel="stylesheet" type="text/css">
        
        <link href="<%=contextPath%>/resources/kt/css/material-design-iconic-font.css" rel="stylesheet" type="text/css">
        
        <link href="<%=contextPath%>/resources/kt/css/components.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/pages.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/menu.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/responsive.css" rel="stylesheet" type="text/css">

        <script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        
        
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
	
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/ndaum/css/editor.css" charset="utf-8"/>
		
	
       
       <%-- <link rel="stylesheet" href="<%=contextPath%>/resources/kt/images/style.css" type="text/css"> --%>
       <script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js" type="text/javascript"></script>
       <script src="<%=contextPath%>/resources/kt/amcharts/serial.js" type="text/javascript"></script>

        
    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}
    	
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
 	height:280px;     
 
        
	}
    
    
    </style></head>
  
  
  
<body class="fixed-left widescreen">
<form name="tx_editor_form" id="tx_editor_form" action="" method="post" accept-charset="utf-8"></form>
        <!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <div class="text-center">
                        <a class="logo" href="<%=contextPath%>/bdapPortalMain.do" style="font-size:28px; letter-spacing:-1px;"><span>BDAP PORTAL</span> </a>
                    </div>
                </div>

                <!-- Navbar -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div>
                            <!-- <div class="pull-left">
                                <button class="button-menu-mobile open-left waves-effect">
                                    <i class="md md-menu"></i>
                                </button>
                                <span class="clearfix"></span>
                            </div> -->

                            <ul class="nav navbar-nav hidden-xs">
                                <!-- <li><a class="waves-effect" href="#">Files</a></li> -->
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="true" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">Data Meta System <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage4.do">Schema 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/ktMainPage5.do">적재현황 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/dailyloadstatus.do">일적재현황 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">Table Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage6.do">Table Management</a></li>
                             	       <!-- <li><a href="components-carousel.html">Query Management</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">암복호화 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 암호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 복호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암복호화 신청 진행 현황</a></li> --%>
	                                    <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">암호화 테이블 보유 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">복호화 권한 보유 현황</a></li> --%>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암복호화 신청 및 현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage14.do">암복호화 권한 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">게시판 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage10.do">공지사항</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage9.do">Q & A</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage8.do">자료실</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage12.do">비정기 자료연동 진행 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage13.do">개발요청 진행현황</a></li>
                                    </ul>
                                </li>
                                 <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">분석계 링크 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="zmdi zmdi-collection-item-1"></i>&nbsp;&nbsp;NDAP</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-2"></i>&nbsp;&nbsp;R Studio</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-3"></i>&nbsp;&nbsp;Jupyter</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-4"></i>&nbsp;&nbsp;SAS E-Miner</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-5"></i>&nbsp;&nbsp;Tableau</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-6"></i>&nbsp;&nbsp;PMS(Redmine)</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-7"></i>&nbsp;&nbsp;NDAP HELP</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="font-size:16px;">Administration <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
	                                    <li><a href="<%=contextPath%>/ktMainPage7.do">User Query Management</a></li>
                                        <li><a href="<%=contextPath%>/statistics.do">통계</a></li>
	                                    <li><a href="<%=contextPath%>/setup.do">Set Up</a></li>
                                    </ul>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right pull-right">

                                <li class="dropdown hidden-xs">
                                    <a class="dropdown-toggle waves-effect waves-light" aria-expanded="true" href="#" data-toggle="dropdown" data-target="#">
                                        	관리자 (최종 로그인 : 2016-08-17 11:31)
                                    </a>
                                    
                                </li>
                                <li class="hidden-xs">
                                    <a class="waves-effect waves-light" href="#"  style="margin-top:25px; line-height:20px;"><i class="zmdi zmdi-square-right"></i></a>
                                </li>

                            </ul>

                        </div>
                        <!-- /.nav-collapse -->
                    </div>
                </div>
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu" style="width:260px; background-color:#f5f5f5;">
                <div class="slimScrollDiv" style="width: auto; height: 312px; overflow: hidden; position: relative;"><div class="sidebar-inner slimscrollleft" style="width: auto; height: 312px; overflow: hidden; background-color:#f5f5f5;">

                    <div id="sidebar-menu" style="background-color:#f5f5f5; padding-top:25px;">
                    		<div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:50px; background-color:#f5f5f5; ">
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-alert-polygon" style="margin-left:-10px;"></i>
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;">분석계 권한 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5 text-right">
				                                    <i class="zmdi zmdi-collection-item-2 " style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-3" style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-6" style="display:inline;"></i>
		                    					</div>
				                            </div>
                    					</div>
	                                </div>     
	                          
	                          
	                          
	                          <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:80px; background-color:#f5f5f5; ">
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i>
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;">사용용량 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right" style="margin-left:-10px; cursor:pointer;">75%</span>
		                    					</div>
				                            </div>
				                            <div class="progress progress-lg m-b-5" style="background-color:#fff; margin-left:10px;">
	                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
	                                               7.5P / 10P
	                                    		</div>
	                                		</div>
                    					</div>
	                            </div>
	                   		  <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:95px; background-color:#f5f5f5; ">
                    					<div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i>
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;">복호화 권한 </p>
				                                    	</div>
				                                    </div>
		                    					</div>
				                            </div>
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px; font-size:12px;">복호화 권한 테이블 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right" style="margin-left:-10px; cursor:pointer; margin-top:-2px;" onclick="javascript:goEnc()">10개</span>
		                    					</div>
				                            </div>
				                            <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px; font-size:12px;">복호화 권한 컬럼 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right" style="margin-left:-10px; cursor:pointer; margin-top:-2px;" onclick="javascript:goEnc()">5개</span>
		                    					</div>
				                            </div>
                    					</div>
	                                </div>
	                            
	                         	  <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:50px; background-color:#f5f5f5;">
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i>
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;">개인 Workflow </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right" style="margin-left:-10px;">37건</span>
		                    					</div>
				                            </div>
                    					</div>
	                                </div>
	                                <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:230px;">
                    						<div class="row">
	                    					 	
	                    						<div class="col-sm-8" style="margin-left:10px;">
	                    							<div class="row">
	                    								<!-- <div class="col-sm-2">
	                    									<i class="md md-palette"></i>
	                    								</div> -->
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:3px;">유효기간 만료 정보 </p>
				                                    	</div>
				                                    </div>
		                    					</div>
		                    					<div class="col-sm-2"></div>
		                    					<div class="col-sm-2  pull-right">
				                                    <span><!-- <i class="md md-plus-one"></i> -->
				                                    <i class="zmdi zmdi-plus-circle-o"></i>
				                                    </span>
		                    					</div>
				                            </div>
                    						
                    						<!-- <p class="text-dark text-nowrap">유효기간 만료 정보<span><i class="md md-plus-one"></i></span></p> -->
                    						
                    						
	                                        <table class="table">
	                                            <tbody>
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;">table_name</p></td>
	                                                    <td style="padding:3px;"><p style="padding-left:50px; margin-top:8px; margin-bottom:5px; font-size:10px;">26/04/2016</p></td>
	                                                </tr>
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;">table_name</p></td>
	                                                    <td style="padding:3px;"><p style="margin-left:50px; margin-top:8px; margin-bottom:5px; font-size:10px;">26/04/2016</p></td>
	                                                </tr>
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;">table_name</p></td>
	                                                    <td style="padding:3px;"><p style="margin-left:50px; margin-top:8px; margin-bottom:5px; font-size:10px; ">26/04/2016</p></td>
	                                                </tr>
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;">table_name</p></td>
	                                                    <td style="padding:3px;"><p style="margin-left:50px; margin-top:8px; margin-bottom:5px; font-size:10px;">26/04/2016</p></td>
	                                                </tr>
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;">table_name</p></td>
	                                                    <td style="padding:3px;"><p style="margin-left:50px; margin-top:8px; margin-bottom:5px; font-size:10px;">26/04/2016</p></td>
	                                                </tr>
	                                                <tr>
	                                                 <td style="padding:3px;"></td>
	                                                 <td></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
                    					</div>
	                                </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="clearfix"></div>
                </div>
                <div class="slimScrollBar" style="background: rgb(220, 220, 220); border-radius: 7px; top: 0px; width: 5px; height: 144.21px; right: 1px; display: block; visibility: visible; position: absolute; z-index: 99; opacity: 0.0;"></div><div class="slimScrollRail" style="background: rgb(51, 51, 51); border-radius: 7px; top: 0px; width: 5px; height: 100%; right: 1px; display: none; position: absolute; z-index: 90; opacity: 0.2;">
                </div></div>

               
            </div>
            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>공지사항 등록</b></h4>
						
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                        					<form class="form-horizontal" role="form">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="제목을 입력 하세요.">
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="업무구분을 입력 하세요.">
	                                                </div>
	                                            </div>
	                                            <!-- <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label">컬럼 한글명 :</label>
	                                                <div class="col-md-9">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="검색어를 입력 하세요.">
	                                                </div>
	                                            </div> -->
	                                            
	                                        </form>
                        				</div>

                        				<div class="col-md-6" style="padding-right:20px;">
                        					<form class="form-horizontal" role="form">

	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">시스템 명 :  </label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="시스템명를 입력 하세요.">
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:17px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">공지여부 : </label>
	                                                <div class="col-md-6">
	                                                    <div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio1" type="radio" checked="" value="option1">
                                        						<label for="inlineRadio1"> 예 </label>
                                    					</div>
                                    					<div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio2" type="radio" value="option1">
                                        						<label for="inlineRadio2"> 아니요 </label>
                                    					</div>
	                                                </div>
	                                                <div class="col-md-3 text-right">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" >등록</button>
	                                                    <button class="btn btn-warning waves-effect waves-light" type="button" >취소</button>
	                                                </div>
	                                            </div>
	                                        </form>
                        				</div>
                        			</div>
                       			<div id='daum_editor_panel'></div>
                       		
                       			
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





        <script type="text/javascript">
        
        var serverName = "";
        var contextroot = "";
            jQuery(document).ready(function($) {
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                $('.circliful-chart').circliful();
                serverName = '<%= (String)request.getServerName() %>';
                contextroot = '<%=contextPath%>';
            });

            
            daumEditor = new DaumEditor('BBS');
        	daumEditor.create();
            
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
     			$("#sourcreamList").jqGrid({  
     				//ajax 호출할 페이지
     				url:'<%=contextPath%>/ktlist6.do',
     				 /* url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders', */

     				//로딩중일때 출력시킬 로딩내용
     				loadtext : '로딩중..',
     				//응답값
     				datatype: "json",
     				styleUI : 'Bootstrap',
     				multiselect: true,
     			   	colNames:['시스템명','업무구분','제목', '공지여부',   '등록일'],
     			   	colModel:[
    					/* {name:'row',align: "center", key: true,formatter:'checkbox', editable: true, edittype: 'checkbox', editoptions: { value: "True:False" }, formatoptions: { disabled: false},width:"30"}, */
     			   		/* {name:'row', index:'CheckResult',align: "center", width:"50"}, */
     			   		{name:'1', index:'CheckResult',align: "center", width:"100"},
     			   		{name:'2',align: "center", width:"100"},
     			   		{name:'3',align: "left", width:"400",formatter:emer},
     			   		{name:'4',align: "center",width:"100"},
     			   		{name:'5',align: "center",width:"100"}
     			   	],
     			   viewrecords: true, 
                   pager: "#jqGridPager",
                   rowNum : 15,
                   height : 'auto',
                   autowidth : true,
                   shrinkToFit:true, 
                   /* shrinkToFit : false, */
    			   viewrecords: true
    			   /* rownumbers:true,
    			   rownumWidth:40 */

     			});
     		});         
     
    		
    		function goReg(){
    			
    			document.location.href = "<%=contextPath%>/noticeReg.do";
    			
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
    	    
function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>