<%@page import="com.kt.bdapportal.domain.BdapRoleUser"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="com.kt.bdapportal.domain.BdapTbl"%>
<%
	BdapRoleUser bdapRoleUser = (BdapRoleUser)session.getAttribute("bdapRoleUser");
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
			
	List<BdapTbl> tblList = (List<BdapTbl>)request.getAttribute("tblList"); 
%>    
    
<!-- <!DOCTYPE html> -->
<!-- <html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths"> -->
  
<!-- <body class="fixed-left widescreen"> -->
        
        <!-- Begin page -->
        
                <div class="slimScrollDiv" style="width: auto; height: 312px; overflow: hidden; position: relative;"><div class="sidebar-inner slimscrollleft" style="width: auto; height: 312px; overflow: hidden; background-color:#f5f5f5;">

                    <div class="formaxscreen" id="sidebar-menu" style="background-color:#f5f5f5; padding-top:25px;">
                    	<div class="row" style="margin-left:12px; height:40px;">
                    		<a class="" style="margin-left:10px;" href="javascript:void(0);" ><i class="zmdi zmdi-alert-polygon"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">분석계 권한 </span></a>
                    	</div>
                    		<div class="row">
                  				<div class="page-title-box col-lg-11 w-68" style="width:110%; padding-top:5px; padding-bottom:10px;background-color:#f5f5f5; ">
                  				<ul>
		                            <li class="has_sub" style="margin-left:10px;">
		                                 <span class="fordisplaynone" style="margin-left:26px;">
			                                 <%if(analysisRole.contains("NDAP") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
												<span class="fa-stack fa-1x" onclick="javascript:goNdap()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x text-icon">N</strong>
												</span>
			                                 <%}%>
			                                 <%if(analysisRole.contains("RSTUDIO") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                      	           <span class="fa-stack fa-1x" onclick="javascript:goRStudio()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x text-icon">R</strong>
												</span>
			                                 <%}%>
			                                 <% if(analysisRole.contains("JUPYTER") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                        	         <span class="fa-stack fa-1x" onclick="javascript:goJupyter()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x text-icon">J</strong>
												</span>
			                                 <%}%>
			                                 <% if(analysisRole.contains("SAS") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<span class="fa-stack fa-1x" onclick="javascript:GoSas()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x text-icon">S</strong>
												</span>
			                                 <%}%>
			                                 <% if(analysisRole.contains("TABLEAU") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<span class="fa-stack fa-1x" onclick="javascript:goTableau()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x text-icon">T</strong>
												</span>
			                                 <%}%>
			                                 <% if(analysisRole.contains("PMS") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<span class="fa-stack fa-1x" onclick="javascript:goPms()" style="cursor:pointer;">
												  <i class="fa fa-square fa-stack-2x"></i>
												  <strong class="fa-stack-1x  text-icon">P</strong>
												</span>
			                                 <%} %>
                    					</span>
		                                <ul class="list-unstyled">
		                                    <li><div class="col-sm-5 text-right" style="">
				                             <%if(analysisRole.contains("NDAP") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<i class="zmdi zmdi-collection-item-1 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <%if(analysisRole.contains("RSTUDIO") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<i class="zmdi zmdi-collection-item-2 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("JUPYTER") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<i class="zmdi zmdi-collection-item-3 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("SAS") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<i class="zmdi zmdi-collection-item-4 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("TABLEAU") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
			                                 	<i class="zmdi zmdi-collection-item-5 zmdi-hc-2x " style="display:inline;"></i>&nbsp;&nbsp;
			                                 <%}%>
			                                 <% if(analysisRole.contains("PMS") || analysisRole.contains("ANALYSISROLE_ALL")){ %>
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
				                            	
				                                	<i class="zmdi zmdi-time-interval"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">사용용량</span>
				                            	
				                                 <span class="label label-primary pull-right fordisplaynone" style="margin-left:-10px;" id="usagePercentLabel"></span>
				                                <ul class="list-unstyled">
				                                    <li><div class="col-sm-12 text-right" style="margin-top:10px;">
						                                    <div class="progress progress-lg m-b-5" style="background-color:#f5f5f5; margin-left:0px;">
					                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active"  id="usagePercentGraphN" role="progressbar" aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" >
					                                    		</div>
					                                		</div>
				                    					</div>
				                    				</li>
				                                </ul>
				                            </li>
										</ul>

				                            <div class="progress progress-lg m-b-5 fordisplaynone" style="background-color:#fff; margin-left:10px; margin-top:12px; text-align:center;" id="usagePercentText">
	                                 			<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"  id="usagePercentGraph"  aria-valuenow="96" aria-valuemin="0" aria-valuemax="100" >
	                                    		</div>
	                                    		<div id="usagePercentGraphText">
	                                    		</div>
	                                		</div>
                    					</div>
	                            </div>
	                          
	                          
	                          
	                            <div class="row">
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:95px; background-color:#f5f5f5; ">
                    					<ul>
				                            <li class="has_sub" style="margin-left:10px;">
			                                	<i class="zmdi zmdi-transform"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">복호화 권한</span>
				                                <ul class="list-unstyled">
				                                    <li>
				                                    	<div class="row">
				                    					 	<div class="col-sm-6">
				                    							<div class="row">
				                    								<div class="col-sm-2">
				                    									<!-- <i class="zmdi zmdi-view-web" style="margin-left:-10px;"></i> -->
				                    								</div>
				                    								<div class="col-sm-10">
							                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">테이블 </p>
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
							                                    		<p class="text-dark text-nowrap " style="margin-top:5px; margin-left:5px; font-size:12px;">컬럼 </p>
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
				                                    		<p class="text-dark text-nowrap fordisplaynone" style="margin-left:-10px; font-size:12px;">테이블 </p>
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
				                                    		<p class="text-dark text-nowrap fordisplaynone" style="margin-left:-10px; font-size:12px;">컬럼 </p>
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
				                                <i class="zmdi zmdi-view-web"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">개인 Workflow</span>
				                                 <span class="label label-primary pull-right fordisplaynone userWorkFlow" style="margin-left:-10px;"></span>
				                                <ul class="list-unstyled">
				                                    <li>
				                                    	<div class="col-sm-12 text-center" style="height:20px; margin-top:2px;">
							                                <p class="label label-primary pull-center userWorkFlow1" style="cursor:pointer;"></p>
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
					                            <li class="has_sub" style="margin-left:10px;padding-bottom: 8px;">
					                                <i class="zmdi zmdi-alarm-check"></i> <span class="text-dark text-nowrap" style="margin-left:5px;">유효기간 만료 정보</span>
					                                 <span class="pull-right fordisplaynone" style="margin-left:-10px; cursor:pointer;" onclick="javascript:goTableManagement()"><i class="zmdi zmdi-plus-circle-o"></i></span>
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
								                                    <p class="pull-right " style=" cursor:pointer; margin-top:5px;" ><%=tblList.get(i).getTblValidateDate().toString().substring(0, 10)%></p>
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
	                                                    <td style="padding:3px;">
	                                                    	<div style="text-overflow: ellipsis; overflow: hidden; font-size:12px; white-space: nowrap; width: 150px;"><%=tblList.get(i).getTblEngNM()%></div>
	                                                    </td>
	                                                    <td style="padding:3px;" class="text-right" >
	                                                    	<p style="margin-top:8px; margin-bottom:5px; font-size:10px; margin-right:15px;"><%=tblList.get(i).getTblValidateDate().toString().substring(0, 10)%></p>
	                                                   	</td>
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
                    					<div class="page-title-box col-lg-11 w-68" style="margin-left:12px; height:45px; background-color:#f5f5f5; padding-top:0px;">
	                    					<ul>
					                            <li class="has_sub" style="margin-left:10px; margin-top:8px;">
					                                <i class="zmdi zmdi-link"></i> 
					                                	<span class="text-dark text-nowrap" style="margin-left:5px; ">Hive Manual</span>
														<button type="button" class="btn btn-default btn-sm" onclick="javascript:goHiveManual()" style="margin-left:25px;">
												          <span class="glyphicon glyphicon-download-alt"></span> Download
												        </button>					                            
												</li>
											</ul>
                    					</div>
	                                </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="clearfix"></div>
                </div><div class="slimScrollBar" style="background: rgb(220, 220, 220); border-radius: 7px; top: 0px; width: 5px; height: 144.21px; right: 1px; display: block; visibility: visible; position: absolute; z-index: 99; opacity: 0.0;"></div><div class="slimScrollRail" style="background: rgb(51, 51, 51); border-radius: 7px; top: 0px; width: 5px; height: 100%; right: 1px; display: none; position: absolute; z-index: 90; opacity: 0.2;"></div></div>
    
<!-- </body> -->


<script src="<%=contextPath%>/resources/kt/js/jquery.min.js"></script>
 <script type="text/javascript">
	 jQuery(document).ready(function($) {
		 getUserWorkflow()	 
	 });
 	var eachStorage = 1099511627776;
	<%
	String roleId = "ETC";
	try{
	roleId = bdapRoleUser.getRoleId().getRoleId();
	}catch(Exception e){
	}
	if(roleId.equals("ADMIN")){
		%>
		eachStorage = 989560464998400;
		<%
	}else if(roleId.equals("BDC")){
		%>
		eachStorage = 3298534883328;
		<%
	}else if(roleId.equals("CIC")){
		%>
		eachStorage = 1649267441664;
		<%
	}else if(roleId.equals("ITO")){
		%>
		eachStorage = 3298534883328;
		<%
	}else{
		%>
		eachStorage = 1099511627776;
		<%
	}
	%>
	
	var storageCapa = eachStorage;
	var storageCapaSize = bytesToSize(eachStorage);
	var usage = "<%=usage%>";
	var usageSize = bytesToSize(usage);
	var cal = usage/storageCapa*100; 
 
	function bytesToSize(bytes) {
		   var sizes = ["Bytes", "KB", "MB", "GB", "TB"];
		   if (bytes == 0){
			   return '0 Byte';
		   }
		   var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		   return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
		};

	$("#usagePercentLabel").html(cal.toFixed(2)+"%");
	if(cal.toFixed(2) <= 38){
		$("#usagePercentGraph").removeClass("progress-bar-warning");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-success");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraphText").html(usageSize+ " / "+storageCapaSize);
	}else if(cal.toFixed(2) > 38 && cal.toFixed(2) <= 50){
		$("#usagePercentGraph").removeClass("progress-bar-warning");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-success");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
		$("#usagePercentGraphText").html('');
		$("#usagePercentGraph").css("color","#fff");
	}else if(cal.toFixed(2) > 50 && cal.toFixed(2) <= 75 ){
		$("#usagePercentGraph").removeClass("progress-bar-success");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-warning");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraphText").html('');
		$("#usagePercentGraph").css("color","#fff");
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
	}else if(cal.toFixed(2) > 75 && cal.toFixed(2) <= 100 ){
		$("#usagePercentGraph").removeClass("progress-bar-success");
		$("#usagePercentGraph").removeClass("progress-bar-danger");
		$("#usagePercentGraph").addClass("progress-bar-warning");
		$("#usagePercentGraph").css("width",cal.toFixed(2)+"%");
		$("#usagePercentGraphText").html('');
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
		$("#usagePercentGraph").css("color","#fff");
	}else if(cal.toFixed(2) > 100 ){
		$("#usagePercentGraph").removeClass("progress-bar-success");
		$("#usagePercentGraph").removeClass("progress-bar-warning");
		$("#usagePercentGraph").addClass("progress-bar-danger");
		$("#usagePercentGraph").css("width","100%");
		$("#usagePercentGraphText").html('');
		$("#usagePercentGraph").html(usageSize+ " / "+storageCapaSize);
		$("#usagePercentGraph").css("color","#fff");
	}

	function getUserWorkflow() {
		
		$.ajax({
			type:'get',
			async:true,
			dataType:'json',
			url:'<%=contextPath%>/ndap/workflowEach',
			success:function(data) {
				$(".userWorkFlow").html(data.myWorkflowCnt+"건");
				$(".userWorkFlow1").html(data.myWorkflowCnt+"건");
			},
			error:function(data,status,err) {
			}
		});
		
	}
 
 	function goHiveManual(){
 		alert("goHiveManual()");
 		
 	}
</script>

<!-- </html> -->