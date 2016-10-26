<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.kt.bdapportal.domain.BdapTbl"%>
<%
	String contextPath = (String)request.getContextPath();
	String analysisRole = (String)session.getAttribute("ANALYSIS_ROLE"); 
 	long usage = 0L; 
	
 	if((Long)request.getAttribute("usage") != null){
 		usage = (Long)request.getAttribute("usage");
 	}
 	
	int cryptoListSize = 0;  
	if((Integer)request.getAttribute("cryptoListSize") != null){
		cryptoListSize = (Integer)request.getAttribute("cryptoListSize");
	}
		
	int columnCount = 0;
	if((Integer)request.getAttribute("columnCount") != null){
		columnCount = (Integer)request.getAttribute("columnCount");
	}
			
	@SuppressWarnings (value="unchecked")
	List<BdapTbl> tblList = (List<BdapTbl>)request.getAttribute("tblList"); 
	
	
%>    
    
<!-- <!DOCTYPE html> -->
<!-- <html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths"> -->
  
<!-- <body class="fixed-left widescreen"> -->
        
        <!-- Begin page -->
        
                <div class="slimScrollDiv" style="width: auto; height: 312px; overflow: hidden; position: relative;"><div class="sidebar-inner slimscrollleft" style="width: auto; height: 312px; overflow: hidden; background-color:#f5f5f5;">

                    <div class="formaxscreen" id="sidebar-menu" style="background-color:#f5f5f5; padding-top:25px;">
                    		<div class="row">
                  				<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:50px; padding-top:8px; background-color:#f5f5f5; ">
                  				<ul>
		                            <li class="has_sub" style="margin-left:10px;">
		                            	
		                                	<a class="" href="javascript:void(0);" ><i class="zmdi zmdi-alert-polygon"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">분석계 권한 </span></a>
		                            	
		                                 <span class="text-right fordisplaynone" style="margin-left:26px;">
			                                 <%if(analysisRole.contains("NDAP")){ %>
			                                 	<i class="zmdi zmdi-collection-item-1 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <%if(analysisRole.contains("RSTUDIO")){ %>
			                      	           <i class="zmdi zmdi-collection-item-2 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("JUPYTER")){ %>
			                        	         <i class="zmdi zmdi-collection-item-3 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("SAS")){ %>
			                                 	<i class="zmdi zmdi-collection-item-4 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("TABLEAU")){ %>
			                                 	<i class="zmdi zmdi-collection-item-5 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("PMS")){ %>
			                                 	<i class="zmdi zmdi-collection-item-6 zmdi-hc-2x " style="display:inline;"></i>
			                                 <%} %>
                    					</span>
		                                <ul class="list-unstyled">
		                                    <li><div class="col-sm-5 text-right" style="">
				                             <%if(analysisRole.contains("NDAP")){ %>
			                                 	<i class="zmdi zmdi-collection-item-1 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <%if(analysisRole.contains("RSTUDIO")){ %>
			                                 	<i class="zmdi zmdi-collection-item-2 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("JUPYTER")){ %>
			                                 	<i class="zmdi zmdi-collection-item-3 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("SAS")){ %>
			                                 	<i class="zmdi zmdi-collection-item-4 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("TABLEAU")){ %>
			                                 	<i class="zmdi zmdi-collection-item-5 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("PMS")){ %>
			                                 	<i class="zmdi zmdi-collection-item-6 zmdi-hc-2x " style="display:inline;"></i>
			                                 <%} %>
		                    					</div>
		                    				</li>
		                                </ul>
		                            </li>
								</ul>
                   		
                  				</div>
	                          </div>     
	                          
	                          
	                          
	                          <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:80px; background-color:#f5f5f5; ">
                    					<ul>
				                            <li class="has_sub" style="margin-left:10px;">
				                            	
				                                	<a class="" href="javascript:void(0);" ><i class="zmdi zmdi-time-interval"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">사용용량</span></a>
				                            	
				                                 <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;" id="usagePercentLabel">75%</span>
				                                <ul class="list-unstyled">
				                                    <li><div class="col-sm-12 text-right" style="margin-top:10px;">
						                                    <div class="progress progress-lg m-b-5" style="background-color:#f5f5f5; margin-left:0px;">
					                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active"  id="usagePercentGraphN" role="progressbar" aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
					                                               7.5P / 10P
					                                    		</div>
					                                		</div>
				                    					</div>
				                    				</li>
				                                </ul>
				                            </li>
										</ul>

				                            <div class="progress progress-lg m-b-5 fordisplaynone" style="background-color:#fff; margin-left:10px; margin-top:12px; text-align:center;" id="usagePercentText">
	                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"  id="usagePercentGraph"  aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
	                                             <!--   7.5P / 10P -->
	                                    		</div>
	                                		</div>
                    					</div>
	                            </div>
	                          
	                          
	                          
	                            <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:95px; background-color:#f5f5f5; ">
                    					<ul>
				                            <li class="has_sub" style="margin-left:10px;">
			                                	<a class="" href="javascript:void(0);" ><i class="zmdi zmdi-transform"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">복호화 권한</span></a>
				                                <ul class="list-unstyled">
				                                    <li>
				                                    	<div class="row">
				                    					 	<div class="col-sm-6">
				                    							<div class="row">
				                    								<div class="col-sm-2">
				                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
				                    								</div>
				                    								<div class="col-sm-10">
							                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">복호화 권한 테이블 </p>
							                                    	</div>
							                                    </div>
							                                    
					                    					</div>
					                    					<div class="col-sm-5">
							                                    <p class="label label-primary pull-right " style="cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()"><%=cryptoListSize%>개</p>
					                    					</div>
							                            </div>
				                    				</li>
				                    				<li>
				                                    	<div class="row">
				                    					 	<div class="col-sm-6">
				                    							<div class="row">
				                    								<div class="col-sm-2">
				                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
				                    								</div>
				                    								<div class="col-sm-10">
							                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">복호화 권한 컬럼 </p>
							                                    	</div>
							                                    </div>
							                                    
					                    					</div>
					                    					<div class="col-sm-5">
							                                    <p class="label label-primary pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()"><%=columnCount%>개</p>
					                    					</div>
							                            </div>
				                    				</li>
				                                </ul>
				                            </li>
										</ul>
                    				
	                    					 <div class="row" style="margin-top:10px;">
	                    					 	<div class="col-sm-1">
		                    					</div>
	                    						<div class="col-sm-6">
	                    							<div class="row">
	                    								<div class="col-sm-2">
	                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
	                    								</div>
	                    								<div class="col-sm-10">
				                                    		<p class="text-dark text-nowrap fordisplaynone" style="margin-left:-10px; font-size:12px;">복호화 권한 테이블 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer; margin-top:-2px;" onclick="javascript:goEnc()"><%=cryptoListSize%>개</span>
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
				                                    		<p class="text-dark text-nowrap fordisplaynone" style="margin-left:-10px; font-size:12px;">복호화 권한 컬럼 </p>
				                                    	</div>
				                                    </div>
				                                    
		                    					</div>
		                    					<div class="col-sm-5">
				                                    <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer; margin-top:-2px;" onclick="javascript:goEnc()"><%=columnCount%>개</span>
		                    					</div>
				                            </div>
				                            
				                            
				                            
                    					</div>
	                                </div>
	                              
	                            
	                         	  <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:50px; background-color:#f5f5f5;">
                    					<ul>
				                            <li class="has_sub" style="margin-left:10px;">
				                                <a class="" href="javascript:void(0);" ><i class="zmdi zmdi-view-web"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">개인 Workflow</span></a>
				                                 <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;">37건</span>
				                                <ul class="list-unstyled">
				                                    <li>
				                                    	<div class="col-sm-12 text-center" style="height:20px; margin-top:2px;">
							                                <p class="label label-primary pull-center" style="cursor:pointer;" onclick="javascript:goEnc()">37건</p>
							                            </div>
				                    				</li>
				                                </ul>
				                            </li>
										</ul>
                    					
                    					
                    					
	                    				
                    					</div>
	                                </div>
	                                <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:220px;">
                    						<ul>
					                            <li class="has_sub" style="margin-left:10px;">
					                                <a class="" href="javascript:void(0);" ><i class="zmdi zmdi-alarm-check"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">유효기간 만료 정보</span></a>
					                                 <span class="pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;"><i class="zmdi zmdi-plus-circle-o"></i></span>
					                                <ul class="list-unstyled">
					                                   <%
					                                   if(tblList != null){
					                                   for(int i = 0; i < tblList.size(); i++){ %>
					                                    <li>
					                                    <div class="row">
					                    					 	<div class="col-sm-6">
					                    							<div class="row">
					                    								<div class="col-sm-10">
								                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;"><%=tblList.get(i).getTblEngNM()%></p>
								                                    	</div>
								                                    </div>
								                                    
						                    					</div>
						                    					<div class="col-sm-6">
								                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()"><%=tblList.get(i).getTblValidateDate().toString().substring(0, 10)%></p>
						                    					</div>
								                            </div>
					                    				</li>
					                           	<%}
					                                   }
					                                   %> 
					                                </ul>
					                            </li>
											</ul>
                    					
	                                        <table class="table  fordisplaynone">
	                                            <tbody>
	                                            <%
	                                            if(tblList != null){
	                                            for(int i = 0; i < tblList.size(); i++){ %> 
	                                                <tr>
	                                                    <td style="padding:3px;"><p style="margin-left:15px; margin-top:5px; margin-bottom:5px;"><%=tblList.get(i).getTblEngNM()%></p></td>
	                                                    <td style="padding:3px;" class="text-right"><p style="margin-top:8px; margin-bottom:5px; font-size:10px; margin-right:15px;"><%=tblList.get(i).getTblValidateDate().toString().substring(0, 10)%></p></td>
	                                                </tr>
	                                                <%} 
	                                            }
	                                                %> 
	                                                <tr>
	                                                 <td style="padding:3px;"></td>
	                                                 <td></td>
	                                                </tr>
	                                            </tbody>
	                                        </table>
                    					</div>
	                                </div>
	                    
	                                <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:50px; background-color:#f5f5f5; padding-top:0px;">
                    					
                    					<ul>
				                            <li class="has_sub" style="margin-left:10px; margin-top:15px;">
				                                <a class="" href="javascript:void(0);" style="" ><i class="zmdi zmdi-link"></i> <span class="text-dark text-nowrap" style="margin-left:5px; ">Hive Manual</span></a>
				                                 <span class="pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;"><i class="zmdi zmdi-link zmdi-hc-3x pull-right" style="margin-left:-10px; margin-top:-10px; cursor:pointer;"></i></span>
				                                <ul class="list-unstyled">
				                                    <li>
				                                    	<div class="col-sm-12 text-center" style="height:30px; margin-top:2px;">
							                                <i class="zmdi zmdi-link zmdi-hc-3x" style="margin-left:-10px; margin-top:-5px; cursor:pointer;"></i>
							                            </div>
				                    				</li>
				                                </ul>
				                            </li>
										</ul>
                    					
                    					
	                    					
                    					</div>
	                                </div>
                       
                        <div class="clearfix"></div>
                    </div>
                    
                    
                    <div class="forminscreen" id="sidebar-menu" style=" padding-top:0px;">
                    		
                  				<ul>
		                            <li class="has_sub" style="">
		                            	
		                                	<a class="" href="javascript:void(0);" ><i class="zmdi zmdi-alert-polygon"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">분석계 권한 </span></a>
		                            	
		                                 <span class="text-right fordisplaynone" style="margin-left:26px;">
		                                    <i class="zmdi zmdi-collection-item-2 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-3 zmdi-hc-2x" style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-6 zmdi-hc-2x" style="display:inline;"></i>
                    					</span>
		                                <ul class="list-unstyled">
		                                    <li><div class="col-sm-12 text-center"  style="background-color:rgba(255,255,255,1);">
				                                    <i class="zmdi zmdi-collection-item-2 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-3 zmdi-hc-2x" style="display:inline;"></i>&nbsp;&nbsp;<i class="zmdi zmdi-collection-item-6 zmdi-hc-2x" style="display:inline;"></i>
		                    					</div>
		                    				</li>
		                                </ul>
		                            </li>
									
		                            <li class="has_sub" style="">
		                                <a class="" href="javascript:void(0);" ><i class="zmdi zmdi-time-interval"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">사용용량</span></a>
		                                <ul class="list-unstyled">
		                                    <li><div class="col-sm-12 text-right" style="background-color:rgba(255,255,255,1);">
				                                    <div class="progress progress-lg m-b-5" style="background-color:#f5f5f5; margin-left:0px;">
			                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
			                                               7.5P / 10P
			                                    		</div>
			                                		</div>
		                    					</div>
		                    				</li>
		                                </ul>
		                            </li>
		                            <li class="has_sub" style="">
	                                	<a class="" href="javascript:void(0);" ><i class="zmdi zmdi-transform"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">복호화 권한</span></a>
		                                <ul class="list-unstyled">
		                                    <li style="background-color:rgba(255,255,255,1);">
		                                    	<div class="row">
		                    					 	<div class="col-sm-6">
		                    							<div class="row">
		                    								<div class="col-sm-2">
		                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
		                    								</div>
		                    								<div class="col-sm-10">
					                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">복호화 권한 테이블 </p>
					                                    	</div>
					                                    </div>
					                                    
			                    					</div>
			                    					<div class="col-sm-5">
					                                    <p class="label label-primary pull-right " style="cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">10개</p>
			                    					</div>
					                            </div>
		                    				</li>
		                    				<li style="background-color:rgba(255,255,255,1);">
		                                    	<div class="row">
		                    					 	<div class="col-sm-6">
		                    							<div class="row">
		                    								<div class="col-sm-2">
		                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
		                    								</div>
		                    								<div class="col-sm-10">
					                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">복호화 권한 컬럼 </p>
					                                    	</div>
					                                    </div>
					                                    
			                    					</div>
			                    					<div class="col-sm-5">
					                                    <p class="label label-primary pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">5개</p>
			                    					</div>
					                            </div>
		                    				</li>
		                                </ul>
		                            </li>
											
		                            <li class="has_sub" style="">
		                                <a class="" href="javascript:void(0);" ><i class="zmdi zmdi-view-web"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">개인 Workflow</span></a>
		                                 <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;" id="userWorkFlow">37건</span>
		                                <ul class="list-unstyled">
		                                    <li>
		                                    	<div class="col-sm-12 text-center" style="height:20px; padding-top:2px; background-color:rgba(255,255,255,1);">
					                                <p class="label label-primary pull-center" style="cursor:pointer;" onclick="javascript:goEnc()" id="userWorkFlow1">37건</p>
					                            </div>
		                    				</li>
		                                </ul>
		                            </li>
									
			                            <li class="has_sub" style="">
			                                <a class="" href="javascript:void(0);" ><i class="zmdi zmdi-alarm-check"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">유효기간 만료 정보</span></a>
			                                 <span class="pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;"><i class="zmdi zmdi-plus-circle-o"></i></span>
			                                <ul class="list-unstyled">
			                                    <li style="background-color:rgba(255,255,255,1);">
			                                    	<div class="row">
			                    					 	<div class="col-sm-6">
			                    							<div class="row">
			                    								<div class="col-sm-10">
						                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">table_name </p>
						                                    	</div>
						                                    </div>
						                                    
				                    					</div>
				                    					<div class="col-sm-6">
						                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">26/04/2016</p>
				                    					</div>
						                            </div>
			                    				</li>
			                    				<li style="background-color:rgba(255,255,255,1);">
			                                    	<div class="row">
			                    					 	<div class="col-sm-6">
			                    							<div class="row">
			                    								<div class="col-sm-10">
						                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">table_name </p>
						                                    	</div>
						                                    </div>
						                                    
				                    					</div>
				                    					<div class="col-sm-6">
						                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">26/04/2016</p>
				                    					</div>
						                            </div>
			                    				</li>
			                    				<li style="background-color:rgba(255,255,255,1);">
			                                    	<div class="row">
			                    					 	<div class="col-sm-6">
			                    							<div class="row">
			                    								<div class="col-sm-10">
						                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">table_name </p>
						                                    	</div>
						                                    </div>
						                                    
				                    					</div>
				                    					<div class="col-sm-6">
						                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">26/04/2016</p>
				                    					</div>
						                            </div>
			                    				</li>
			                    				<li style="background-color:rgba(255,255,255,1);">
			                                    	<div class="row">
			                    					 	<div class="col-sm-6">
			                    							<div class="row">
			                    								<div class="col-sm-10">
						                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">table_name </p>
						                                    	</div>
						                                    </div>
						                                    
				                    					</div>
				                    					<div class="col-sm-6">
						                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">26/04/2016</p>
				                    					</div>
						                            </div>
			                    				</li>
			                    				<li style="background-color:rgba(255,255,255,1);">
			                                    	<div class="row">
			                    					 	<div class="col-sm-6">
			                    							<div class="row">
			                    								<div class="col-sm-10">
						                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">table_name </p>
						                                    	</div>
						                                    </div>
						                                    
				                    					</div>
				                    					<div class="col-sm-6">
						                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" onclick="javascript:goEnc()">26/04/2016</p>
				                    					</div>
						                            </div>
			                    				</li>
			                                </ul>
			                            </li>
			                            <li class="has_sub" style="">
			                                <a class="" href="javascript:void(0);" style="" ><i class="zmdi zmdi-link"></i> <span class="text-dark text-nowrap" style="margin-left:5px; ">Hive Manual</span></a>
			                                 <span class="pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;" onclick="javascript:goHiveManual();"><i class="zmdi zmdi-link zmdi-hc-3x pull-right" style="margin-left:-10px; margin-top:-10px; cursor:pointer;"></i></span>
			                                <ul class="list-unstyled">
			                                    <li>
			                                    	<div class="col-sm-12 text-center" style="height:30px; padding-top:2px; background-color:rgba(255,255,255,1);">
						                                <i class="zmdi zmdi-link zmdi-hc-3x" style="margin-left:-10px; margin-top:-8px; cursor:pointer;" ></i>
						                            </div>
			                    				</li>
			                                </ul>
			                            </li>
									</ul>
                   					
                    					
	                    					
                    				
                       
                        <div class="clearfix"></div>
                    </div>
                    
                    

                    <div class="clearfix"></div>
                </div><div class="slimScrollBar" style="background: rgb(220, 220, 220); border-radius: 7px; top: 0px; width: 5px; height: 144.21px; right: 1px; display: block; visibility: visible; position: absolute; z-index: 99; opacity: 0.0;"></div><div class="slimScrollRail" style="background: rgb(51, 51, 51); border-radius: 7px; top: 0px; width: 5px; height: 100%; right: 1px; display: none; position: absolute; z-index: 90; opacity: 0.2;"></div></div>
    
<!-- </body> -->

<script src="<%=contextPath%>/resources/kt/js/jquery.min.js"></script>
 <script type="text/javascript">

 
	var storageCapa = 53687091200;
	var storageCapaSize = bytesToSize(53687091200);
	var usage = "<%=usage%>";
	var usageSize = bytesToSize(usage);
	var cal = usage/storageCapa*100; 
 
	function bytesToSize(bytes) {
		   var sizes = ["Bytes", "KB", "MB", "GB", "TB"];
		   if (bytes == 0){
			   return '0 Byte';
		   }
		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		   return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
		};

	$("#usagePercentLabel").html(cal.toFixed(2)+"%");
	if(cal.toFixed(2) <= 50){
		$("#usagePercentGraph").removeClass("progress-bar-warning");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-success");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
	}else if(cal.toFixed(2) > 50 && cal.toFixed(2) <= 75 ){
		$("#usagePercentGraph").removeClass("progress-bar-success");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-warning");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
	}else{
		$("#usagePercentGraph").removeClass("progress-bar-success");
		$("#usagePercentGraph").removeClass("progress-bar-warning");
		$("#usagePercentGraph").addClass("progress-bar-danger");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
	}

	function getUserWorkflow() {
		
		$.ajax({
			type:'get',
			async:true,
			dataType:'json',
			/* contentType: "application/json; charset=UTF-8",  */
			url:'http://{ndap.management.host}/api/workflow?op=count&userId={userId}',
			beforeSend : function(xhr){
	            xhr.setRequestHeader("Authentication", ""); 
	            xhr.setRequestHeader("Content-type","application/json;charset=UTF-8");
	        },
			success:function(data) {
				//alert(data.value);
				$("#userWorkFlow").html(data.value+"건");
				$("#userWorkFlow1").html(data.value+"건");
				
				
			},
			error:function(data,status,err) {
			}
		});
		
	}
 
 	function goHiveManual(){
 		alert("goHiveManual()");
 		
 	}
 
 
 //usagePercentLabel
//usagePercentGraph
</script>

<!-- </html> -->