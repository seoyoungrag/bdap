<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="org.springframework.web.util.WebUtils"%>     
<%@ page import="com.kt.bdapportal.domain.BdapBbs"%>
<%@page import="com.kt.bdapportal.common.util.BbsConstant"%>
<%
String fileTempPath = BbsConstant.FILE_TEMP_PATH;
String fileStorePath = BbsConstant.FILE_STORE_PATH;
String fileName = (String)request.getAttribute("fileName");
BdapBbs bbs = (BdapBbs)request.getAttribute("linkageView");
String test = (String)request.getAttribute("test");
String contextPath = (String)request.getContextPath();
String bbsPostId = (String)request.getAttribute("bbsPostId");
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  
  
  
  
<body class="fixed-left widescreen">
<form name="tx_editor_form" id="tx_editor_form" action="" method="post" accept-charset="utf-8"></form>
        <!-- Begin page -->
        <div id="wrapper">
        
                <!-- Top Bar Start -->
            <div class="topbar">
				<jsp:include page="/WEB-INF/views/topmenu.jsp" flush="true"/>                    
            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <%-- <div class="left side-menu">
               <jsp:include page="/WEB-INF/views/leftmenu.jsp" flush="true"/>
            </div> --%>
            <!-- Left Sidebar End --> 



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->                      
            <div class="content-page">
                <!-- Start content -->
                <div class="content" style="margin-top:60px;">
                    <div class="container">
                    <form class="form-horizontal" role="form" id="linkageUpdateForm" name="linkageUpdateForm" method="post" action="<%=contextPath%>/linkage/update.do" accept-charset="utf-8">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>비정기자료 연동 진행현황 수정 </b></h4>
						
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                        					
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." id="title" name="title" value="<%=bbs.getBbsTitle()%>">
	                                                </div>
	                                            </div>
	                                           <%--  <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsCategory()%>">
	                                                </div>
	                                            </div> --%>
	                                            <!-- <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label">컬럼 한글명 :</label>
	                                                <div class="col-md-9">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="검색어를 입력 하세요.">
	                                                </div>
	                                            </div> -->
	                                            
	                                        
                        				</div>

                        				<div class="col-md-6" style="padding-right:20px;">
                        					

	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">자료유형 :  </label>
	                                                <div class="col-md-9">
	                                                    <%-- <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsCategory()%>"> --%>
	                                                    <select class="selectpicker"  name="referenceType">
														  <option value="func" <%=bbs.getBbsCategorySub().equals("func")?"selected":"" %>>기능</option>
														  <option value="must" <%=bbs.getBbsCategorySub().equals("must")?"selected":"" %>>필독</option>
														  <option value="etc" <%=bbs.getBbsCategorySub().equals("etc")?"selected":"" %>>기타</option>
														</select>
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:17px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;"></label>
	                                                <div class="col-md-6">
	                                                    <!-- <div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio1" type="radio" checked="" value="option1">
                                        						<label for="inlineRadio1"> 예 </label>
                                    					</div>
                                    					<div class="radio radio-default radio-inline">
                                        					<input name="radioInline" id="inlineRadio2" type="radio" value="option1">
                                        						<label for="inlineRadio2"> 아니요 </label>
                                    					</div> -->
	                                                </div>
	                                                <div class="col-md-3 text-right">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goMod();">수정</button>
	                                                    <button class="btn btn-warning waves-effect waves-light" type="button" >취소</button>
	                                                </div>
	                                            </div>
	                                        
                        				</div>
                        			</div>
                       			<div id='daum_editor_panel'></div>
                       			<textarea id='editor_contents_source' style='display:none;'><%= bbs.getBbsContent() %></textarea>
                       			<input type='hidden' id='content' name='content' />
                       			<input type='hidden' id='bbsPostId' name='bbsPostId' />
                       			<input type='hidden' id='fileList' name='fileList' value=''/>
                       		</div>
                        </div>
                        </form>
                        <%if(!fileName.equals("")){%>
                        			<div class="col-md-12 portlets" id="forFileExist">
										<div class="card-box">
											<div class="row">
											<%String[]  fileNameArr = fileName.split("\\*");
												for(int i = 0;i < fileNameArr.length; i++ ){ %>
													<form class="forgetFileName" action="fileDelete?fileName=<%=fileNameArr[i]%>" method="post">
														<div class="col-md-3">
			                                				<p><%= fileNameArr[i] %></p>
			                                			</div>
			                                			<div class="col-md-3">
			                                				<button class="btn btn-warning waves-effect waves-light" type="button" onclick="javascript:fileDel(this);" >삭제</button>
			                                			</div>
		                                			</form>
		                                		<%}%>
		                                	</div>	
									    </div>
									</div>
								<%}%>
                        <div class="col-md-12 portlets">
                                <!-- Your awesome content goes here -->
                                <div class="m-b-30">
                                    <form class="dropzone dz-clickable" id="dropzone" action="../fileUpload" name="dropzone" method="post" enctype="multipart/form-data">
                                    	<div class="dz-default dz-message"><span>file upload</span>
                                    	</div>
                                    </form>
                                </div>
                        </div>  
                        <input class="dz-hidden-input" style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;" type="file" multiple="multiple">                   
                        

                    </div>
                    <!-- end container -->
                </div>
                <!-- end content -->
            </div>
        </div>
        <!-- END wrapper -->
        <link rel="stylesheet" href="<%=contextPath%>/resources/kt/css/dropzone.css" />
        
		<!-- jqeury  -->
        <script src="<%=contextPath%>/resources/kt/js/jquery.min.js"></script>
        <script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script>

        <!-- jqeury Custom main Js -->
        <script src="<%=contextPath%>/resources/kt/js/jquery.core.js"></script>
        
        <!-- bootstrap -->
        <script src="<%=contextPath%>/resources/kt/js/bootstrap.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/moment.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-select.js"></script>
        
        <!-- Dropzone js -->
        <script src="<%=contextPath%>/resources/kt/js/dropzone.js"></script>
        
        <!-- daum editor -->
        <script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/editor_loader.js?environment=production" charset="utf-8"></script>
		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/jquery.browser.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/jquery.webkitresize.js" charset="utf-8"></script>
		<script type="text/javascript" src="<%=contextPath%>/resources/kt/ndaum/js/daumeditor.js" charset="utf-8"></script>

        <script type="text/javascript">
        
        var serverName = "";
        var contextroot = "";
            jQuery(document).ready(function($) {
                serverName = '<%= (String)request.getServerName() %>';
                contextroot = '<%=contextPath%>';
            });

            daumEditor = new DaumEditor('BBS');
        	daumEditor.create();
        	daumEditor.setContent();
            


			function goMod(){
    				
				var getFileName = $(".dz-filename > span");
				var forgetFileName = $(".forgetFileName > div > p");
			 	
    			var	content = daumEditor.getContent();
    			$("#content").val(content);
   				var fileList = "";
    			if(getFileName.length != 0){
        			$('.dz-filename > span').each(function(idx) {
        				fileList += $(this).html() + "*";
        			});	
    			}
    			if(forgetFileName.length != 0){
        			$('.forgetFileName > div > p').each(function(idx) {
        				fileList += $(this).html() + "*";
        			});	
    			}
    			
    			$("#fileList").val(fileList);
		  		$("#bbsPostId").val("<%=bbsPostId%>");
			  	$('#linkageUpdateForm').submit();
			  	
    		}
    		
			function fileDel(obj){
    			
				$(obj).parent().parent().remove();
				var forgetFileName = $(".forgetFileName > div > p");
    			if(forgetFileName.length == 0){
    				$("#forFileExist").remove();
    			}
    			
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