<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
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
							<div class="col-sm-6 col-lg-2" style="">
									<div class="widget-simple-chart text-right card-box" style="padding:0px; margin-bottom:10px;">
										<div style="background-color: rgb(59, 175, 218); height:35px; border-radius:5px 5px 0 0;">
											<div style="border:none;">
												<p class="text-white text-nowrap text-center" style="padding-top:7px;">쿼리 실행수</p>
											</div>
										</div>
			                            <div class="row">
	                            			<div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-floppy zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
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
	                            			<div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> --> 
			                                   <i class="zmdi zmdi-border-color zmdi-hc-3x" style="margin-top:4px;"></i>
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
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
	                            			<div class="col-lg-6 text-center">
			                                    <!-- <div class="circliful-chart circliful" style="width: 90px;" data-bgcolor="#ebeff2" data-fgcolor="#5fbeaa" data-percent="35" data-fontsize="14" data-width="5" data-text="35%" data-dimension="90"><span class="circle-text" style="line-height: 90px; font-size: 14px;">35%</span></div> -->
			                                   <i class="zmdi zmdi-disc-full zmdi-hc-4x"></i> 
			                                   
			                                </div>
			                                <div class="col-lg-6 text-center">
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
							<div class="col-sm-6 col-lg-10 widget-simple-chart card-box" style="padding:0px; margin-bottom:10px; width:82.5%">
								<h4 class="text-dark  header-title m-t-20" style="margin-left:20px;">테이블별 일 적재 현황</h4>
                        		<div id="curve_chart"></div>
                        		
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

                        <div class="row" style="margin-left:10px; margin-top:-10px; margin-bottom:0px;">
                            <div class="col-lg-8 card-box" style="margin-bottom:10px;" >
                        	<h4 class="text-dark  header-title m-t-0" style="margin-left:10px;">cpu,memory 점유율</h4>
                        	<div id="columnchart_material"></div>
                        		<!-- <div class="card-box" id="columnchart_material"> -->
                        			<!-- <h4 class="text-dark  header-title m-t-0 m-b-30">CPU 부하율</h4>

                        			<div class="widget-chart text-center">
                                        <div id="sparkline1"><canvas width="416" height="165" style="width: 416px; height: 165px; vertical-align: top; display: inline-block;"></canvas></div>
                                        <div id="sparkline4"><canvas width="205" height="165" style="width: 205px; height: 165px; vertical-align: top; display: inline-block;"></canvas></div>
	                                	<ul class="list-inline m-t-15">
	                                		<li>
	                                			<h5 class="text-muted m-t-20">CPU 1</h5>
	                                			<h4 class="m-b-0">13%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">CPU 2</h5>
	                                			<h4 class="m-b-0">25%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">CPU 3</h5>
	                                			<h4 class="m-b-0">15%</h4>
	                                		</li>
	                                	</ul>
                                	</div>
 -->                        	<!-- 	</div> -->

                            </div>

                        <!--     <div class="col-lg-4">
                        		<div class="card-box">
                        			<h4 class="text-dark  header-title m-t-0 m-b-30">디스크 사용량</h4>

                        			<div class="widget-chart text-center">
                                        <div id="sparkline2"><canvas width="205" height="165" style="width: 205px; height: 165px; vertical-align: top; display: inline-block;"></canvas></div>
	                                	<ul class="list-inline m-t-15">
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 1</h5>
	                                			<h4 class="m-b-0">36%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 2</h5>
	                                			<h4 class="m-b-0">55%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 3</h5>
	                                			<h4 class="m-b-0">27%</h4>
	                                		</li>
	                                	</ul>
                                	</div>
                        		</div>

                            </div> -->

                            <div class="col-lg-4" style="">
                        		<div class="card-box" style="margin-bottom:10px;">
                        			<h4 class="text-dark  header-title m-t-0 m-b-30">디스크 사용량</h4>

                        			<div class="widget-chart text-center">
                                        <div id="sparkline2"><canvas width="205" height="165" style="width: 205px; height: 165px; vertical-align: top; display: inline-block;"></canvas></div>
	                                	<ul class="list-inline m-t-15">
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 1</h5>
	                                			<h4 class="m-b-0">36%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 2</h5>
	                                			<h4 class="m-b-0">55%</h4>
	                                		</li>
	                                		<li>
	                                			<h5 class="text-muted m-t-20">DISK 3</h5>
	                                			<h4 class="m-b-0">27%</h4>
	                                		</li>
	                                	</ul>
                                	</div>
                        		</div>

                            </div>

                        </div>
                        <!-- end row -->



                        <!-- <div class="row">
                            <div class="col-lg-6">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <div class="row">
                                                <div class="col-xs-6 text-center">
                                                    <canvas width="100" height="100" id="partly-cloudy-day"></canvas>
                                                </div>
                                                <div class="col-xs-6">
                                                    <h2 class="m-t-0 text-muted"><b>32°</b></h2>
                                                    <p class="text-muted">Partly cloudy</p>
                                                    <p class="text-muted">15km/h - 37%</p>
                                                </div>
                                            </div>End row
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="row">
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">SAT</h4>
                                                    <canvas width="35" height="35" id="cloudy"></canvas>
                                                    <h4 class="text-muted">30<i class="wi wi-degrees"></i></h4>
                                                </div>
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">SUN</h4>
                                                    <canvas width="35" height="35" id="wind"></canvas>
                                                    <h4 class="text-muted">28<i class="wi wi-degrees"></i></h4>
                                                </div>
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">MON</h4>
                                                    <canvas width="35" height="35" id="clear-day"></canvas>
                                                    <h4 class="text-muted">33<i class="wi wi-degrees"></i></h4>
                                                </div>
                                            </div>end row
                                        </div>
                                    </div>end row
                                </div>
                            </div> end col

                            <div class="col-lg-6">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-7">
                                            <div>
                                                <div class="row">
                                                    <div class="col-xs-6 text-center">
                                                        <canvas width="100" height="100" id="snow"></canvas>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <h2 class="m-t-0 text-muted"><b> 23°</b></h2>
                                                        <p class="text-muted">Partly cloudy</p>
                                                        <p class="text-muted">15km/h - 37%</p>
                                                    </div>
                                                </div>end row
                                            </div>weather-widget
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="row">
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">SAT</h4>
                                                    <canvas width="35" height="35" id="sleet"></canvas>
                                                    <h4 class="text-muted">30<i class="wi wi-degrees"></i></h4>
                                                </div>
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">SUN</h4>
                                                    <canvas width="35" height="35" id="fog"></canvas>
                                                    <h4 class="text-muted">28<i class="wi wi-degrees"></i></h4>
                                                </div>
                                                <div class="col-xs-4 text-center">
                                                    <h4 class="text-muted m-t-0">MON</h4>
                                                    <canvas width="35" height="35" id="partly-cloudy-night"></canvas>
                                                    <h4 class="text-muted">33<i class="wi wi-degrees"></i></h4>
                                                </div>
                                            </div>End row
                                        </div> col
                                    </div>End row
                                </div>
                            </div> end col
                        </div> -->
                        <!--end row/ WEATHER -->

						<div class="row" style="margin-left:0px;">
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

                            <%-- <div class="col-lg-4">
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

                            </div> --%>

                        </div>

                        <div class="row" style="margin-left:0px;">
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

                            <%-- <div class="col-lg-4">
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

                            </div> --%>

                        </div>
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
                                            <div class="avatar">
                                                <img alt="" src="<%=contextPath%>/resources/kt/images/users/avatar-10.jpg">
                                            </div>
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

             
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart1);

            function drawChart1() {
              var data = google.visualization.arrayToDataTable([
                ['일자', 'IPTV', 'WIFI'],
                ['2016/08/06',  1000,      400],
                ['2016/08/07',  1170,      460],
                ['2016/08/08',  660,       1120],
                ['2016/08/09',  1030,      540],
                ['2016/08/10',  1000,      400],
                ['2016/08/11',  1170,      460],
                ['2016/08/12',  660,       1120],
                ['2016/08/13',  1030,      540],
                ['2016/08/14',  1000,      400],
                ['2016/08/15',  1170,      460],
                ['2016/08/16',  660,       1120],
                ['2016/08/17',  1030,      540],
                ['2016/08/18',  1000,      400],
                ['2016/08/19',  1170,      460],
                ['2016/08/20',  660,       1120],
                ['2016/08/21',  1030,      540]
              ]);

              var options1 = {
                curveType: 'function',
                legend: { position: 'bottom' },
                width: data.getNumberOfRows() * 130,
                bar: {groupWidth: 90},
                chartArea: {left: 0}

              };

              var chart1 = new google.visualization.LineChart(document.getElementById('curve_chart'));

              chart1.draw(data, options1);
            }
             
            
            google.load("visualization", "1", {packages:["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
                ['NODE', 'CPU', 'MEMORY'],
                ['NODE1', 28, 42],
                ['NODE2', 55, 76],
                ['NODE3', 88, 89],
                ['NODE4', 14, 65],
                ['NODE5', 55, 76],
                ['NODE6', 88, 89],
                ['NODE7', 55, 76],
                ['NODE8', 88, 89],
                ['NODE9', 55, 76],
                ['NODE10', 88, 89],
                ['NODE11', 55, 76],
                ['NODE12', 88, 89],
                ['NODE13', 55, 76],
                ['NODE14', 88, 89]
              ]);

              var options = {
                chart: {
                  title: '시스템 사용률 통계',
                  subtitle: 'CPU, MEMEORY 통계',
                width: data.getNumberOfRows() * 130,
                bar: {groupWidth: 90},
                chartArea: {left: 0}
                }
              };

              var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));

              chart.draw(data, options);
            }
            
			function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
            
            
        </script>
    
    
</body>
</html>