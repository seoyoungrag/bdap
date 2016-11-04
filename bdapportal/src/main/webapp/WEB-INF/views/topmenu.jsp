<%@page import="com.kt.bdapportal.domain.BdapUser"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
	String contextPath = (String)request.getContextPath();
	BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
%>    
    
<!-- <!DOCTYPE html> -->
<!-- <html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths"> -->
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
		
        <script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
       
        <script src="<%=contextPath%>/resources/kt/js/jquery-3.1.0.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/waves.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
        <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
        
        <link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/ndaum/css/editor.css" charset="utf-8"/>
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
       
       
       <%-- <link rel="stylesheet" href="<%=contextPath%>/resources/kt/images/style.css" type="text/css"> --%>
       <script src="<%=contextPath%>/resources/kt/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="<%=contextPath%>/resources/kt/amcharts/serial.js" type="text/javascript"></script>
	<script>
		function logout(){
			if(confirm('로그아웃 하시겠습니까?')){
				document.location.href = '<%=contextPath%>/logout.do';
			}
		}
	</script>
        
    <style type="text/css">
    	
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
	
	a {
	color : #4c5667;
	}
    
    @media screen and (min-width:1366px) {
       .forscreensize {
         font-size: 16px;
       }
      
       .forminscreen{
	    	display:none;
	    }
     }
    
    
   	 @media screen and (max-width:1366px) {
       .forscreensize {
         font-size: 10px;
       }
       .fordisplaynone{
	       	display:none;
	       }
	    .w-68{
	    	width:68px;
	    }
	    
    	.formaxscreen{
    		display:none;
    	}
     }
	
/*     @media (min-width: 768px) and (max-width: 991px) {
	   
    
    }
     
     */
    
    
    </style></head> 
  
<!-- <body class="fixed-left widescreen"> -->
                       
                <div class="topbar-left" style="border-bottom:none; background-color:#494e50;">
                    <div class="text-center">
                        <a class="logo" href="<%=contextPath%>/mainPage.do" style="font-size:28px; letter-spacing:-1px;"><i class="zmdi zmdi-home forminscreen"></i><span style="margin-left:10px; color:#fff;">BDAP PORTAL</span> </a>
                    </div>
                </div>

                <div class="navbar navbar-default" role="navigation" style=" background-color:#494e50;">
                    <div class="container">
                        <div>
                            <ul class="nav navbar-nav hidden-xs">
                                <!-- <li><a class="waves-effect" href="#">Files</a></li> -->
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="true" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Data Meta System <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/schemaList.do">Schema 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/loadStatusList.do">적재현황 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Table Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/tableManagementList.do">Table Management</a></li>
                             	       <!-- <li><a href="components-carousel.html">Query Management</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">암복호화 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 암호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 복호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암복호화 신청 진행 현황</a></li> --%>
	                                    <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">암호화 테이블 보유 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">복호화 권한 보유 현황</a></li> --%>
	                                    <li><a href="<%=contextPath%>/encList.do">암호화 신청 및 현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/decList.do">복호화 신청 및 현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/encProcessList.do">암호화 처리 조회</a></li>
	                                    <li><a href="<%=contextPath%>/decRoleList.do">복호화 권한 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown ">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">게시판 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/notice/list.do">공지사항</a></li>
                                        <li><a href="<%=contextPath%>/linkage/list.do">자료요청현황</a></li>
                                        <li><a href="<%=contextPath%>/devreq/list.do">개발요청현황</a></li>
	                                    <li><a href="<%=contextPath%>/qna/list.do">Q & A</a></li>
	                                    <li><a href="<%=contextPath%>/reference/list.do">자료실</a></li>
                                    </ul>
                                </li>
                                 <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">분석계 링크 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li>
                                        <a href="#" onclick="javascript:goNdap()" >
											<span class="fa-stack fa-1x"style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x text-icon">N</strong>
											</span>
										&nbsp;&nbsp;NDAP</a>
										</li>
	                                    <li>
	                                    <a href="#" onclick="javascript:goRStudio()" >
		                      	           <span class="fa-stack fa-1x"style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x text-icon">R</strong>
											</span>
	                                    &nbsp;&nbsp;R Studio</a></li>
	                                    <li>
	                                    <a href="#" onclick="javascript:goJupyter()" >
		                        	         <span class="fa-stack fa-1x" style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x text-icon">J</strong>
											</span>
	                                    &nbsp;&nbsp;Jupyter</a></li>
	                                    <li>
	                                    <a href="#" onclick="javascript:GoSas()" >
		                                 	<span class="fa-stack fa-1x" style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x text-icon">S</strong>
											</span>
	                                    &nbsp;&nbsp;SAS E-Miner</a></li>
	                                    <li>
	                                    <a href="#" onclick="javascript:goTableau()" >
		                                 	<span class="fa-stack fa-1x" style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x text-icon">T</strong>
											</span>
	                                    &nbsp;&nbsp;Tableau</a></li>
	                                    <li>
	                                    <a href="#" onclick="javascript:goPms()" >
		                                 	<span class="fa-stack fa-1x"style="cursor:pointer;">
											  <i class="fa fa-square fa-stack-2x"></i>
											  <strong class="fa-stack-1x  text-icon">P</strong>
											</span>
											</span>
	                                    &nbsp;&nbsp;PMS(Redmine)</a></li>
	                                    <!-- <li><a href="#"><i class="zmdi zmdi-collection-item-7"></i>&nbsp;&nbsp;NDAP HELP</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect waves-primary forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Admin <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                    	<li><a href="<%=contextPath%>/dailyloadstatus.do">일적재현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/userQueryManagementList.do">User Query Management</a></li>
                                        <li><a href="<%=contextPath%>/statisticsList.do">통계</a></li>
	                                    <li><a href="<%=contextPath%>/setup.do">Set Up</a></li>
                                    </ul>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right pull-right">

                                <li class="dropdown hidden-xs">
                                    <a class="dropdown-toggle waves-effect waves-light forscreensize" aria-expanded="true" href="#" data-toggle="dropdown" data-target="#">
                                        	<%=bdapUser.getUserNm()%> 
                                    </a>
                                    
                                </li>
                                <li class="hidden-xs">
                                    <a class="waves-effect waves-light" href="javascript:logout();"  style="margin-top:25px; line-height:20px;"><i class="zmdi zmdi-square-right"></i></a>
                                </li>


                            </ul>

                        </div>
                        <!-- /.nav-collapse -->
                    </div>
                </div>
            
        <!-- END wrapper -->
    
<!-- </body> -->
<!-- </html> -->