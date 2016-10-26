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

        <title>BDAP PORTAL</title>

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

        <script src="//www.google-analytics.com/analytics.js" async=""></script><script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
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
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
       
       
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
	 height: 236px;
	}
    
    #cpuchart {
 	height:280px;     
 
	}
    
    #memchart {
 	height:280px;     
 
	}
	
	#diskchart {
 	height:280px;     
 
	}
    
    </style></head>
  
  
  
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
        
            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left" style="border-bottom:none; background-color:#494e50;">
                    <div class="text-center">
                        <a class="logo" href="<%=contextPath%>/bdapPortalMain.do" style="font-size:28px; letter-spacing:-1px;"><span>BDAP PORTAL</span> </a>
                    </div>
                </div>

                <!-- Navbar -->
                <div class="navbar navbar-default" role="navigation" style=" background-color:#494e50;">
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
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">Data Meta System <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage4.do">Schema Management</a></li>
                                  	    <li><a href="<%=contextPath%>/ktMainPage5.do">적재현황 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/dailyloadstatus.do">일적재현황 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">My Job Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage6.do">Table Management</a></li>
                             	       <!-- <li><a href="components-carousel.html">Query Management</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">암복호화 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 암호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 복호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암복호화 신청 진행 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암호화 테이블 보유 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">복호화 권한 보유 현황</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">게시판 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage10.do">공지사항</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage9.do">Q & A</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage8.do">자료실</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage12.do">비정기 자료연동 진행 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage13.do">개발요청 진행현황</a></li>
                                    </ul>
                                </li>
                                 <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">분석계 링크 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="zmdi zmdi-collection-item-1"></i>&nbsp;&nbsp;NDAP</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-2"></i>&nbsp;&nbsp;R Studio</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-3"></i>&nbsp;&nbsp;Jupyter</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-4"></i>&nbsp;&nbsp;SAS E-Miner</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-5"></i>&nbsp;&nbsp;Tableau</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-6"></i>&nbsp;&nbsp;PMS(Redmine)</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown">Administration <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
	                                    <li><a href="<%=contextPath%>/ktMainPage7.do">User Query Management</a></li>
                                        <li><a href="<%=contextPath%>/statistics.do">통계</a></li>
	                                    <li><a href="<%=contextPath%>/setup.do">Set Up</a></li>
                                    </ul>
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

                    <div id="sidebar-menu" style="background-color:#f5f5f5;">
                    		<div class="row">
                    			<div class="page-title-box col-lg-11" style="margin-left:12px;">
                    				 <div class="row" style="margin-bottom : 5px; margin-left:2px;">
                    				  	<div class="col-sm-3">
	                    				  	<!-- <div class="dropdown">
						                        <a class="dropdown-toggle profile" aria-expanded="true" href="" data-toggle="dropdown"> -->
						                            <img class="img-circle" alt="user-img" src="<%=contextPath%>/resources/kt/images/users/user.png" style="border-radius:0; width:auto; height:85px;">
						                        <!-- </a>
						                        <ul class="dropdown-menu">
						                            <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> 프로필</a></li>
						                            <li><a href="javascript:void(0)"><i class="md md-settings"></i> 설정</a></li>
						                            <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> 로그아웃</a></li>
						                        </ul> -->
						                    <!-- </div> -->
                    				 	</div>
                    				 	 <div class="col-sm-7" style="margin-top:5px; margin-left:25px;">
		                                	<div class="dropdown">
		                                		<a class="text-dark dropdown-toggle waves-effect" aria-expanded="false" aria-haspopup="false" href="#" >관리자 <span class="caret"></span></a>
						                        <!-- <a class="dropdown-toggle waves-effect" aria-expanded="false" href="" data-toggle="dropdown">
						                            <p style=" margin-top:10px; margin-bottom:10px;">관리자(Admin)</p>
						                        </a> -->
						                        <ul class="dropdown-menu" style="position:absolute;">
						                            <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> 프로필</a></li>
						                            <li><a href="javascript:void(0)"><i class="md md-settings"></i> 설정</a></li>
						                            <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> 로그아웃</a></li>
						                        </ul>
						                    </div>
		                                	
		                                    <!-- <p style=" margin-top:10px; margin-bottom:10px;">관리자(Admin)</p> -->
		                                    
		                                    
		                                    
		                                    <p class="text-muted font-7" style=" margin-top:10px; margin-bottom:10px;">해외 사업부</p>
		                                    <p style=" margin-top:10px;  display:block;"><i class="zmdi zmdi-collection-item-2 " style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-3" style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-6" style="display:inline;"></i></p>
		                                    <!-- <p class="label label-success" style="width:100px; margin-top:15px; background-color:#5cb85c;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1T / 10P &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> -->
		                                    <!-- <div class="progress" style="width:80%;">
	        									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%;"><span class="text-dark">10%T</span></div>
	      									</div> -->
                    				 	 </div>
                    				 
                    				 </div>
                    				<p class="label label-success" style="width:100px; margin-top:15px; margin-left:6px; background-color:#5cb85c;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1T / 10P &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                                </div>
	                          </div>
	                          <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:50px; background-color:#f5f5f5; ">
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i>
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;">복호화 권한 개수 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right" style="margin-left:-10px; cursor:pointer;" onclick="javascript:goEnc()">10T5C</span>
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
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;"> 개인 Workflow </p>
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
                        <!-- <ul>
                            <li class="text-muted menu-title">Menu</li>
                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-palette"></i> <span> Data Meta System </span>
                                 <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="ui-buttons.html">Schema Management</a></li>
                                    <li><a href="ui-panels.html">적재현황 조회</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-invert-colors-on"></i><span> My Job Management </span> <span class="label label-success pull-right"></span> </a>
                                <ul class="list-unstyled">
                                    <li><a href="components-grid.html">Table Management</a></li>
                                    <li><a href="components-carousel.html">Query Management</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-redeem"></i>
                                    <span> 암복호화 </span> <span class="menu-arrow"></span> </a>
                                <ul class="list-unstyled">
                                    <li><a href="icons-glyphicons.html">데이터 암호화 신청</a></li>
                                    <li><a href="icons-materialdesign.html">데이터 복호화 신청</a></li>
                                    <li><a href="icons-themifyicon.html">암복호화 신청 진행 현황</a></li>
                                    <li><a href="icons-ionicons.html">암호화 테이블 보유 현황</a></li>
                                    <li><a href="icons-fontawesome.html">복호화 권한 보유 현황</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-now-widgets"></i><span> 게시판 </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="form-elements.html">공지사항</a></li>
                                    <li><a href="form-advanced.html">Q & A</a></li>
                                    <li><a href="form-validation.html">자료실</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-view-list"></i><span> Administration </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="tables-basic.html">Data Quality Management</a></li>
                                    <li><a href="tables-datatable.html">User Query Management</a></li>
                                    <li><a href="tables-editable.html">Set Up</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-poll"></i><span> 분석계 링크 </span> <span class="menu-arrow"></span> </a>
                                <ul class="list-unstyled">
                                    <li><a href="chart-flot.html">NDAP</a></li>
                                    <li><a href="chart-morris.html">R Studio</a></li>
                                    <li><a href="chart-chartist.html">Jupyter</a></li>
                                    <li><a href="chart-nvd3.html">SAS E-Miner</a></li>
                                    <li><a href="chart-chartjs.html">Tableau</a></li>
                                    <li><a href="chart-peity.html">PMS(Redmine)</a></li>
                                </ul>
                            </li>
							
                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-place"></i><span> Maps </span><span class="label label-primary pull-right">2</span></a>
                                <ul class="list-unstyled">
                                    <li><a href="map-google.html"> Google Map</a></li>
                                    <li><a href="map-vector.html"> Vector Map</a></li>
                                </ul>
                            </li>

                            <li class="text-muted menu-title">More</li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-mail"></i><span> Mail </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="mail-inbox.html">Inbox</a></li>
                                    <li><a href="mail-compose.html">Compose Mail</a></li>
                                    <li><a href="mail-read.html">View Mail</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-pages"></i><span> Pages </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="pages-blank.html">Blank Page</a></li>
                                    <li><a href="pages-login.html">Login</a></li>
                                    <li><a href="pages-register.html">Register</a></li>
                                    <li><a href="pages-recoverpw.html">Recover Password</a></li>
                                    <li><a href="pages-lock-screen.html">Lock Screen</a></li>
                                    <li><a href="pages-404.html">404 Error</a></li>
                                    <li><a href="pages-500.html">500 Error</a></li>
                                </ul>
                            </li>

                            <li class="has_sub">
                                <a class="waves-effect waves-primary" href="javascript:void(0);"><i class="md md-layers"></i><span> Extras </span> <span class="menu-arrow"></span></a>
                                <ul class="list-unstyled">
                                    <li><a href="extras-timeline.html">Timeline</a></li>
                                    <li><a href="extras-invoice.html">Invoice</a></li>
                                    <li><a href="extras-calendar.html"> Calendar</a></li>
                                    <li><a href="extras-email-template.html">Email template</a></li>
                                    <li><a href="extras-maintenance.html">Maintenance</a></li>
                                    <li><a href="extras-coming-soon.html">Coming-soon</a></li>
                                    <li><a href="extras-gallery.html"> Gallery</a></li>
                                </ul>
                            </li>

                        </ul> -->
                        <div class="row">
                    					<div class="page-title-box col-lg-11" style="margin-left:12px; height:50px; background-color:#f5f5f5; padding-top:0px;">
	                    					 <div class="row">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<i class="zmdi zmdi-link" style="margin-left:-10px; margin-top:17px;"></i>
	                    								</div>
	                    								<div class="col-sm-10" style="margin-top:17px;">
				                                    		<p class="text-dark text-nowrap" style="margin-left:-10px;"> Hive Manual </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <i class="zmdi zmdi-link zmdi-hc-3x pull-right" style="margin-left:-10px; margin-top:5px; cursor:pointer;"></i>
		                    					</div>
				                            </div>
                    					</div>
	                                </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="clearfix"></div>
                </div><div class="slimScrollBar" style="background: rgb(220, 220, 220); border-radius: 7px; top: 0px; width: 5px; height: 144.21px; right: 1px; display: block; visibility: visible; position: absolute; z-index: 99; opacity: 0.0;"></div><div class="slimScrollRail" style="background: rgb(51, 51, 51); border-radius: 7px; top: 0px; width: 5px; height: 100%; right: 1px; display: none; position: absolute; z-index: 90; opacity: 0.2;"></div></div>

                <%-- <div class="user-detail">
                    <div class="dropup">
                        <a class="dropdown-toggle profile" aria-expanded="true" href="" data-toggle="dropdown">
                            <img class="img-circle" alt="user-img" src="<%=contextPath%>/resources/kt/images/users/avatar-2.jpg">
                            <span class="user-info-span">
                                <h5 class="m-t-0 m-b-0">John Deo</h5>
                                <p class="text-muted m-b-0">
                                    <small><i class="fa fa-circle text-success"></i> <span>Online</span></small>
                                </p>
                            </span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> Profile</a></li>
                            <li><a href="javascript:void(0)"><i class="md md-settings"></i> Settings</a></li>
                            <li><a href="javascript:void(0)"><i class="md md-lock"></i> Lock screen</a></li>
                            <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> Logout</a></li>
                        </ul>

                    </div>
                </div> --%>
            </div>
            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">

                        <!-- Page-Title -->
                        <%-- <div class="row">
                            <div class="col-sm-12">
                            	<div class="col-sm-1">
	                                <div class="page-title-box">
	                                    <!-- <ol class="breadcrumb pull-right"> -->
					                    <div class="dropdown">
					                        <a class="dropdown-toggle profile" aria-expanded="true" href="" data-toggle="dropdown">
					                            <img class="img-circle" alt="user-img" src="<%=contextPath%>/resources/kt/images/users/user.png" style="border-radius:0; width:auto; height:85px;">
					                        </a>
					                        <ul class="dropdown-menu">
					                            <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> 프로필</a></li>
					                            <li><a href="javascript:void(0)"><i class="md md-settings"></i> 설정</a></li>
					                            <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> 로그아웃</a></li>
					                        </ul>
					                    </div>
										<!-- <p>Dashboard</p> -->
	                                    <!-- </ol> -->
	                                    <!-- <h4 class="page-title">사용자 정보 1</h4> -->
	                                </div>
                                </div>
                                <div class="col-sm-2">
	                                <div class="page-title-box" style="margin-left:-40px; height:125px;">
	                                	<p class="text-muted text-nowrap text-left">사용자 정보</p>
	                                    <p style=" margin-top:5px; margin-bottom:5px;">관리자 (Analizer_y)</p>
	                                    <!-- <p>20 workflow / day</p> -->
	                                    <p class="label label-success" style="width:200px; background-color:#5cb85c;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1T / 10P &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	                                    
	                                    <!-- <div class="progress" style="width:80%;">
        									<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 10%;"><span class="text-dark">10%T</span></div>
      									</div> -->
	                                    
	                                    
	                                </div>
                                </div>
                                
                                
                                
                                <div class="col-sm-3">
	                                 <div class="page-title-box">
	                                    <!-- <ol class="breadcrumb pull-right"> -->
	                                       <p class="text-muted text-nowrap text-left">query / workflow</p>
	                                       <p style=" margin-top:5px; margin-bottom:5px;">Total : 32,602 query</p>
	                                       <p>20 workflow / day</p>
	                                    <!-- </ol> -->
	                                    <!-- <h4 class="page-title">사용자 정보 1</h4> -->
	                                </div>
                                </div>
                                <div class="col-sm-3">
	                                 <div class="page-title-box">
	                                    <!-- <ol class="breadcrumb pull-right"> -->
	                                       <p class="text-muted text-nowrap text-left">유효기간</p>
	                                       <p style=" margin-top:5px; margin-bottom:5px;">caller 테이블 유효기간 만료</p>
	                                       <p>sailer 테이블 유효기간 만료</p>
	                                    <!-- </ol> -->
	                                    <!-- <h4 class="page-title">사용자 정보 1</h4> -->
	                                </div>
                                </div>
                                <div class="col-sm-3">
	                                 <div class="page-title-box">
	                                    <!-- <ol class="breadcrumb pull-right"> -->
	                                       <p class="text-muted text-nowrap text-left">복호화</p>
	                                       <p style=" margin-top:5px; margin-bottom:5px;">~ 2016.8.16 caller.regino </p>
	                                       <p>~ 2016.8.16 caller.regino </p>
	                                    <!-- </ol> -->
	                                    <!-- <h4 class="page-title">사용자 정보 1</h4> -->
	                                </div>
                                </div>
                            
                            </div>
                            
                        </div>  --%>

						<div class="row" style="margin-left:0px; padding:0px;">
							<div class="col-sm-6 col-lg-1" style="width:12%">
									<div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: rgb(59, 175, 218); height:35px; border-radius:5px 5px 0 0;">
											<div style="border:none;">
												<p class="text-white text-nowrap text-center" style="padding-top:7px;">쿼리 실행수</p>
											</div>
										</div>
			                            <div class="row">
	                            			<div class="col-lg-4 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-floppy zmdi-hc-3x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-8 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter">35</span>건</h3>
			                                </div>
			                            </div>
			                         </div>
			                         <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
									
										<div style="background-color: rgb(59, 175, 218); height:35px; border-radius:5px 5px 0 0;">
												<p class="text-white text-nowrap text-center" style="padding-top:7px;">Workflow 생성수</p>	
										</div>
			                            <div class="row">
	                            			<div class="col-lg-4 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> --> 
			                                   <i class="zmdi zmdi-border-color zmdi-hc-3x" style="margin-top:4px;"></i>
			                                   
			                                </div>
			                                <div class="col-lg-8 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter">10</span>건</h3>
			                                </div>
			                            </div>
			                         </div>
			                         <div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
									
										<div style="background-color: rgb(59, 175, 218); height:35px; border-radius:5px 5px 0 0;">
											<p class="text-white text-nowrap text-center" style="padding-top:7px;">일 적재 현황</p>											
										</div>
			                            <div class="row">
	                            			<div class="col-lg-4 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-disc-full zmdi-hc-3x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-8 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                    <h3 class="text-pink"><span class="counter">18</span>건</h3>
			                                </div>
			                            </div>
			                         </div>
			                         
			                         
			                        <!--  <div class="widget-simple-chart text-right card-box">
	                                    <div class="row">
	                            			<div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <p class="text-muted text-nowrap">Workflow 생성수</p>
			                                   
			                                </div>
			                                <div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-pink"><span class="counter">10</span>건</h3>
			                                </div>
			                            </div>
	                                </div>
			                        <div class="widget-simple-chart text-right card-box">
	                                    <div class="row">
	                            			<div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <p class="text-muted text-nowrap">일 적재 현황</p>
			                                   
			                                </div>
			                                <div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-pink"><span class="counter">18</span>건</h3>
			                                </div>
			                            </div>
	                                </div> -->
							</div>


							<!-- <div class="col-sm-6 col-lg-10 widget-simple-chart text-right card-box" id="curve_chart"> -->
							<div class="col-sm-6 col-lg-5 widget-simple-chart card-box" style="padding:0px; margin-bottom:10px; width:43%; height:282px;">
								<h4 class="text-dark  header-title m-t-20" style="margin-left:20px;">게시판</h4>
                        		
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
                                <div class="tab-content" style="padding-top:5px;">
                                    <div class="tab-pane active" id="home-12">
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
                                    <div class="tab-pane" id="profile-12" style="display: none;">
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
                                    <div class="tab-pane" id="messages-12" style="display: none;">
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
                                    <div class="tab-pane" id="settings-12" style="display: none;">
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
                                            </tbody>
                                        </table>
                                    </div>

                                    </div>
                                    <div class="tab-pane" id="test-12" style="display: none;">
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
                                               

                                              

                                            </tbody>
                                        </table>
                                    </div>

                                    </div>
                                    
                                </div>
                            
                        		
							</div>
							
							<div class="col-sm-6 col-lg-5 widget-simple-chart card-box" style="padding:0px; margin-bottom:10px; width:43.5%; margin-left:10px;">
								<h4 class="text-dark  header-title m-t-20" style="margin-left:20px;">테이블별 일 적재 현황</h4>
                        		<div id="chartdiv"></div>
                        		
							</div>
							
						</div>
	                        <!-- <div class="row">
	                            <div class="col-sm-6 col-lg-2">
			                        <div class="widget-simple-chart text-right card-box">
			                            <div class="row">
	                            			<div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <p class="text-muted text-nowrap">쿼리 실행수</p>
			                                   
			                                </div>
			                                <div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-pink"><span class="counter">35</span>건</h3>
			                                </div>
			                            </div>
			                         </div>
			                     </div>
								<div class="col-sm-6 col-lg-2">
	                                <div class="widget-simple-chart text-right card-box">
	                                    <div class="row">
	                            			<div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <p class="text-muted text-nowrap">Workflow 생성수</p>
			                                   
			                                </div>
			                                <div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-pink"><span class="counter">10</span>건</h3>
			                                </div>
			                            </div>
	                                </div>
	                            </div>
	                            <div class="col-sm-6 col-lg-2">
	                                <div class="widget-simple-chart text-right card-box">
	                                    <div class="row">
	                            			<div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <p class="text-muted text-nowrap">일 적재 현황</p>
			                                   
			                                </div>
			                                <div class="col-lg-6">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-pink"><span class="counter">18</span>건</h3>
			                                </div>
			                            </div>
	                                </div>
	                            </div>
	                            
	
	                            <div class="col-sm-6 col-lg-2">
	                                <div class="widget-simple-chart text-right card-box">
			                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div>
			                                    <h3 class="text-dark text-center">분석계 링크</h3>
	                                </div>
	                            </div>
	  							<div class="col-sm-6 col-lg-2" style="width:20%">
	                                <div class="widget-simple-chart text-right card-box">
	                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#98a6ad" data-percent="49" data-fontsize="14" data-width="5" data-text="49%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">49%</span></div>
	                                    <p class="text-muted text-nowrap">유선상품 일 적재 현황</p>
	                                    <h3 class="text-pink"><span class="counter">49</span>건</h3>
	                                </div>
	                            </div>
	                            <div class="col-sm-6 col-lg-2" style="width:20%">
	                                <div class="widget-simple-chart text-right card-box">
	                                    <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#f76397" data-percent="58" data-fontsize="14" data-width="5" data-text="58%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">58%</span></div>
	                                    <p class="text-muted text-nowrap">무선상품 일 적재 현황</p>
	                                    <h3 class="text-pink"><span class="counter">12</span>건</h3>
	                                </div>
	                            </div>
	
	                          
	                        </div> -->
                        
                        
                        
                        
                        
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

        
        
        
              <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
            <script src="https://www.amcharts.com/lib/3/gauge.js"></script>
            <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
            <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
            <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
        
        
        
        
        
        
        
        
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

            
                      
            
            var chart;
            var graph;
            var graph2;

            var chartData = [
                {
                    "year": "1901",
                    "value": -0.307,
                    "value2": -0.207
                },
                {
                    "year": "1902",
                    "value": -0.168,
                    "value2": -0.207
                },
                {
                    "year": "1903",
                    "value": -0.073,
                    "value2": -0.407
                },
                {
                    "year": "1904",
                    "value": -0.027,	
                    "value2": -0.427
                },
                {
                    "year": "1905",
                    "value": -0.117,	
                    "value2": -0.207
                },
                {
                    "year": "1906",
                    "value": -0.592,	
                    "value2": -0.192
                },
                {
                    "year": "1907",
                    "value": -0.512,	
                    "value2": -0.105
                },
                {
                    "year": "1908",
                    "value": -0.910,	
                    "value2": -0.123
                },
                {
                    "year": "1909",
                    "value": -0.858,	
                    "value2": -0.307
                },
                {
                    "year": "1910",
                    "value": -0.819,	
                    "value2": -0.212
                }
            ];



            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();

                chart.dataProvider = chartData;
                chart.marginLeft = 10;
                chart.categoryField = "year";
                chart.dataDateFormat = "YYYY";

                // listen for "dataUpdated" event (fired when chart is inited) and call zoomChart method when it happens
                chart.addListener("dataUpdated", zoomChart);

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.parseDates = true; // as our data is date-based, we set parseDates to true
                categoryAxis.minPeriod = "YYYY"; // our data is yearly, so we set minPeriod to YYYY
                categoryAxis.dashLength = 3;
                categoryAxis.minorGridEnabled = true;
                categoryAxis.minorGridAlpha = 0.1;

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                valueAxis.inside = true;
                valueAxis.dashLength = 3;
                chart.addValueAxis(valueAxis);

                // GRAPH
                graph = new AmCharts.AmGraph();
                graph.type = "smoothedLine"; // this line makes the graph smoothed line.
                graph.lineColor = "#d1655d";
                graph.negativeLineColor = "#637bb6"; // this line makes the graph to change color when it drops below 0
                graph.bullet = "round";
                graph.bulletSize = 8;
                graph.bulletBorderColor = "#FFFFFF";
                graph.bulletBorderAlpha = 1;
                graph.bulletBorderThickness = 2;
                graph.lineThickness = 2;
                graph.valueField = "value";
                graph.balloonText = "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>";
                chart.addGraph(graph);

                // GRAPH
                graph2 = new AmCharts.AmGraph();
                graph2.type = "smoothedLine"; // this line makes the graph smoothed line.
                graph2.lineColor = "#ff0000";
                graph2.negativeLineColor = "#637ee6"; // this line makes the graph to change color when it drops below 0
                graph2.bullet = "round";
                graph2.bulletSize = 8;
                graph2.bulletBorderColor = "#FFFFFF";
                graph2.bulletBorderAlpha = 1;
                graph2.bulletBorderThickness = 2;
                graph2.lineThickness = 2;
                graph2.valueField = "value2";
                graph2.balloonText = "[[category]]<br><b><span style='font-size:14px;'>[[value]]</span></b>";
                chart.addGraph(graph2);
                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.cursorPosition = "mouse";
                chartCursor.categoryBalloonDateFormat = "YYYY";
                chart.addChartCursor(chartCursor);

                // SCROLLBAR
                var chartScrollbar = new AmCharts.ChartScrollbar();
                chart.addChartScrollbar(chartScrollbar);

                chart.creditsPosition = "bottom-right";

                // WRITE
                chart.write("chartdiv");
            });

            // this method is called when chart is first inited as we listen for "dataUpdated" event
            function zoomChart() {
                // different zoom methods can be used - zoomToIndexes, zoomToDates, zoomToCategoryValues
                chart.zoomToDates(new Date(1901, 0), new Date(1910, 0));
            }
            
      
            
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
            	    "bottomText": "0 km/h",
            	    "bottomTextYOffset": -20,
            	    "endValue": 100
            	  } ],
            	  "arrows": [ {} ],
            	  "export": {
            	    "enabled": true
            	  }
            	} );

            	setInterval( randomValue, 2000 );

            	// set random value
            	function randomValue() {
            	  var value = Math.round( Math.random() * 100 );
            	  if ( gaugeChart ) {
            	    if ( gaugeChart.arrows ) {
            	      if ( gaugeChart.arrows[ 0 ] ) {
            	        if ( gaugeChart.arrows[ 0 ].setValue ) {
            	          gaugeChart.arrows[ 0 ].setValue( value );
            	          gaugeChart.axes[ 0 ].setBottomText( value + " %" );
            	        }
            	      }
            	    }
            	  }
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
            		    "bottomText": "0 km/h",
            		    "bottomTextYOffset": -20,
            		    "endValue": 100
            		  } ],
            		  "arrows": [ {} ],
            		  "export": {
            		    "enabled": true
            		  }
            		} );

            		setInterval( randomValue1, 2000 );

            		// set random value
            		function randomValue1() {
            		  var value = Math.round( Math.random() * 100 );
            		  if ( gaugeChart1 ) {
            		    if ( gaugeChart1.arrows ) {
            		      if ( gaugeChart1.arrows[ 0 ] ) {
            		        if ( gaugeChart1.arrows[ 0 ].setValue ) {
            		          gaugeChart1.arrows[ 0 ].setValue( value );
            		          gaugeChart1.axes[ 0 ].setBottomText( value + " %" );
            		        }
            		      }
            		    }
            		  }
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
            			      "endValue": 80,
            			      "radius": "100%",
            			      "innerRadius": "85%",
            			      "balloonText": "90%"
            			    }, {
            			      "color": "#eee",
            			      "startValue": 0,
            			      "endValue": 100,
            			      "radius": "80%",
            			      "innerRadius": "65%"
            			    }, {
            			      "color": "#fdd400",
            			      "startValue": 0,
            			      "endValue": 35,
            			      "radius": "80%",
            			      "innerRadius": "65%",
            			      "balloonText": "35%"
            			    }, {
            			      "color": "#eee",
            			      "startValue": 0,
            			      "endValue": 100,
            			      "radius": "60%",
            			      "innerRadius": "45%"
            			    }, {
            			      "color": "#cc4748",
            			      "startValue": 0,
            			      "endValue": 92,
            			      "radius": "60%",
            			      "innerRadius": "45%",
            			      "balloonText": "92%"
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
            
        </script>
    
    
</body>
</html>