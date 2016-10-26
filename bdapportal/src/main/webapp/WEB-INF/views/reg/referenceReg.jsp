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
                    <form class="form-horizontal" role="form" id="referenceRegForm" name="referenceRegForm" method="post" action="<%=contextPath%>/reference/insert.do" accept-charset="utf-8">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>게시물 등록</b></h4>
						
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                        					
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력 하세요.">
	                                                </div>
	                                            </div>
	                                            <!-- <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" value="업무구분을 입력 하세요.">
	                                                </div>
	                                            </div> -->
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
	                                                <div class="col-md-6">
	                                                    <select class="selectpicker"  name="referenceType">
														  <option value="func">기능</option>
														  <option value="must">필독</option>
														  <option value="etc">기타</option>
														</select>
	                                                </div>
	                                                <div class="col-md-3 text-right">
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:referenceInsert();" >등록</button>
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
                                <form class="dropzone dz-clickable" id="dropzone" action="fileUpload" name="dropzone" method="post" enctype="multipart/form-data">
                                	<div class="dz-default dz-message"><span>file upload</span>
                                	</div>
                                </form>
                            </div>
                        </div>       
                        <input class="dz-hidden-input" style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;" type="file" multiple="multiple">

                    </div>
                    <!-- end container -->
                </div>
            </div>

        </div>
		
        <!-- END wrapper -->
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
            
     
    		
    		function goReg(){
    			
    			document.location.href = "<%=contextPath%>/reference/reg.do";
    			
    		}
    		
    		
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
        		document.location.href = "<%=contextPath%>/reference/list.do";
        		
        	}
    		
    		function referenceInsert(){
    			
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
        		  	$('#referenceRegForm').submit();		
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
    		
    		
    	    function ItemCheckInfo(cellValue, options, rowObject) {
    	    	 var checkResult = "";
    	    	 checkResult = "<img src='C:/Users/sourcream/Desktop/요구사항/image/"+cellValue+"'/>";
    	         return checkResult;

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