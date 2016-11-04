<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
%>    
    

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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
        
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
    
    @media screen and (min-width:1400px) {
       .forscreensize {
         font-size: 16px;
       }
      #homeIcon{
      	display : none;
      }
       
     }
    
    
   	 @media screen and (max-width:1400px) {
       .forscreensize {
         font-size: 10px;
       }
      
     }
	
    @media (min-width: 768px) and (max-width: 991px) {
	    .fordisplaynone{
	       	display:none;
	       }
	    .w-68{
	    	width:68px;
	    }
	       
    
    }
    
     
    
    
    
    </style></head> 
  
                      
                <div class="topbar-left" style="border-bottom:none; background-color:#494e50;">
                    <div class="text-center">
                        <a class="logo" href="<%=contextPath%>/bdapPortalMain.do" style="font-size:28px; letter-spacing:-1px;"><span style="margin-left:10px;">BDAP PORTAL</span> </a>
                    </div>
                </div>

                <div class="navbar navbar-default" role="navigation" style=" background-color:#494e50;">
                    <div class="container">
                        <div>
                            <ul class="nav navbar-nav hidden-xs">
                                <!-- <li><a class="waves-effect" href="#">Files</a></li> -->
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="true" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Data Meta System <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage4.do">Schema 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/ktMainPage5.do">적재현황 조회</a></li>
                                  	    <li><a href="<%=contextPath%>/dailyloadstatus.do">일적재현황 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Table Management <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage6.do">Table Management</a></li>
                             	       <!-- <li><a href="components-carousel.html">Query Management</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">암복호화 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 암호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">데이터 복호화 신청</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암복호화 신청 진행 현황</a></li> --%>
	                                    <%-- <li><a href="<%=contextPath%>/ktMainPage11.do">암호화 테이블 보유 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">복호화 권한 보유 현황</a></li> --%>
	                                    <li><a href="<%=contextPath%>/ktMainPage11.do">암호화 신청 및 현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage15.do">복호화 신청 및 현황 조회</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage14.do">암호화 권한 조회</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage16.do">복호화 권한 조회</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown ">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">게시판 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="<%=contextPath%>/ktMainPage10.do">공지사항</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage9.do">Q & A</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage8.do">자료실</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage12.do">비정기 자료연동 진행 현황</a></li>
	                                    <li><a href="<%=contextPath%>/ktMainPage13.do">개발요청 진행현황</a></li>
                                    </ul>
                                </li>
                                 <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">분석계 링크 <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="zmdi zmdi-collection-item-1"></i>&nbsp;&nbsp;NDAP</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-2"></i>&nbsp;&nbsp;R Studio</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-3"></i>&nbsp;&nbsp;Jupyter</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-4"></i>&nbsp;&nbsp;SAS E-Miner</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-5"></i>&nbsp;&nbsp;Tableau</a></li>
	                                    <li><a href="#"><i class="zmdi zmdi-collection-item-6"></i>&nbsp;&nbsp;PMS(Redmine)</a></li>
	                                    <!-- <li><a href="#"><i class="zmdi zmdi-collection-item-7"></i>&nbsp;&nbsp;NDAP HELP</a></li> -->
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle waves-effect forscreensize" role="button" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown" style="">Admin <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
	                                    <li><a href="<%=contextPath%>/ktMainPage7.do">User Query Management</a></li>
                                        <li><a href="<%=contextPath%>/statistics.do">통계</a></li>
	                                    <li><a href="<%=contextPath%>/setup.do">Set Up</a></li>
                                    </ul>
                                </li>
                            </ul>
                            
                            <ul class="nav navbar-nav navbar-right pull-right">

                                <li class="dropdown hidden-xs">
                                    <a class="dropdown-toggle waves-effect waves-light forscreensize" aria-expanded="true" href="#" data-toggle="dropdown" data-target="#">
                                        	관리자 <span class="fordisplaynone">(최종 로그인 : 2016-08-17 11:31)</span> 
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
            
        <!-- END wrapper -->
    
