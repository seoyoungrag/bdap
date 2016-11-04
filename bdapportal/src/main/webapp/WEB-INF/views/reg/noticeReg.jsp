<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
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
                		<form class="form-horizontal" role="form" id="noticeRegForm" name="noticeRegForm" method="post" action="<%=contextPath%>/notice/insert.do" accept-charset="utf-8">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>공지사항 등록</b></h4>
						<input name="category" type="hidden" value="BDAP" />
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                                           <div class="form-group" style="margin-bottom:10px;">
                                               <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
                                               <div class="col-md-9">
                                                   <input class="form-control" id="title" name="title" type="text" placeholder="제목을 입력 하세요.">
                                               </div>
                                           </div>
                                           <div class="form-group" style="margin-bottom:10px;">
                                               <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
                                               <div class="col-md-9">
                                                   <select class="selectpicker" name="categorySub">
													<option value="normal">일반</option>
													<option value="data">데이터</option>
													<option value="work">작업</option>
													</select>
                                               </div>
                                           </div>
                        				</div>
                        				<div class="col-md-6" style="padding-right:20px;">
                                           <!--  <div class="form-group" style="margin-bottom:10px;">
                                                <label class="col-md-3 control-label" style="text-align:left;">시스템 명 :  </label>
                                                <div class="col-md-9">
                                                    <input class="form-control" id="systemName" name="systemName" type="text" placeholder="시스템명를 입력 하세요.">
                                               	   <select class="selectpicker" name="category">
													  <option value="BDAP">BDAP</option>
													  <option value="KDAP">KDAP</option>
													  <option value="BIDW">BIDW</option>
													</select>
                                                </div>
                                            </div> -->
                                            <div class="form-group" style="margin-bottom:17px;">
                                                <label class="col-md-3 control-label" style="text-align:left;">긴급여부 : </label>
                                                <div class="col-md-6">
                                                    <div class="radio radio-default radio-inline">
                                       					<input name="emerYN" id="emerY" type="radio" checked="" value="emerY">
                                       						<label for="emerY"> 예 </label>
                                   					</div>
                                   					<div class="radio radio-default radio-inline">
                                       					<input name="emerYN" id="emerN" type="radio" value="emerN">
                                       						<label for="emerN"> 아니오 </label>
                                   					</div>
                                                </div>
                                                <div class="col-md-3 text-right">
                                    				<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:noticeInsert();" >등록</button>
                                                    <button class="btn btn-warning waves-effect waves-light" onclick="javascript:goList();" type="button" >취소</button>
                                                </div>
                                            </div>
                        				</div>
                        			</div>
                       			<div id='daum_editor_panel'></div>
                       			<input type='hidden' id='content' name='content' value=''/>
                       			<input type='hidden' id='fileList' name='fileList' value=''/>
                       			
                       		</div>
                        </div>
                        </form>
                        <div class="col-md-12 portlets">
                            <div class="m-b-30">
                                <form class="dropzone dz-clickable" id="dropzone" action="../fileUpload" name="dropzone" method="post" enctype="multipart/form-data">
                                	<div class="dz-default dz-message"><span>file upload</span>
                                	</div>
                                </form>
                            </div>
                        </div>       
                        <input class="dz-hidden-input" style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;" type="file" multiple="multiple">              

						<!-- <form action="fileUpload" method="post" enctype="multipart/form-data"> 
			              <input type="file" name="file" /> 
			              <input type="submit" value="upload" /> 
			            </form> --> 

                    </div>
                    
                    <!-- end container -->
                </div>
                <!-- end content -->

                <!-- <footer class="footer text-right">
                  
                </footer> -->

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
            
            daumEditor = new DaumEditor('BBS');
        	daumEditor.create();
    		
    	function validation(){
    		
    		var check = false;
    		var	content = daumEditor.getContent();
    		$("#content").val(content);
    		
    		if($("#title").val()==""){
    			alert("제목이 입력 되지 않았습니다.");
    			check = false;
    		}else if($("#content").val()=="<p><br></p>"){
    			alert("본문이 입력 되지 않았습니다.");
    			check = false;
    		}else{
    			check = true;
    		}    		
    		
    		return check; 
    	}	
    		
    	function goList(){
    		document.location.href = "<%=contextPath%>/notice/list.do";
    		
    	}
    		
    		
   		function noticeInsert(){

   			 if(validation()){
				var getFileName = $(".dz-filename > span");
    			
    			var	content = daumEditor.getContent();
    			$("#content").val(content);
    			
    			if(getFileName.length != 0){
    				var fileList = "";
        			$('.dz-filename > span').each(function(idx) {
        				fileList += $(this).html() + "*";
        			});	
        			$("#fileList").val(fileList);
    			}
    	 	  	$('#noticeRegForm').submit(); 	
   			} 
   			
    	}
        </script>

</body>
</html>