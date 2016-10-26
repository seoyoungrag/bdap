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
<%@ page import="com.kt.bdapportal.domain.BdapBbsCategory"%>
<%@page import="com.kt.bdapportal.common.util.BbsConstant"%>   
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  
  ArrayList<BdapBbsCategory> bdapBbsCategory = (ArrayList<BdapBbsCategory>) request.getAttribute("bdapBbsCategory");
  ArrayList<BdapBbsCategory> bdapBbsCategorySub = (ArrayList<BdapBbsCategory>) request.getAttribute("bdapBbsCategorySub");
 
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
                    <form class="form-horizontal" role="form" id="qnaRegForm" name="qnaRegForm" method="post" action="<%=contextPath%>/qna/insert.do" accept-charset="utf-8">
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>Q & A 등록</b></h4>
						
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
	                                                <label class="col-md-3 control-label" style="text-align:left;">답변 담당자 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text" id="responsibility" name="responsibility" placeholder="담당자를 입력 하세요.">
	                                                </div>
	                                            </div>
                        				</div>

                        				<div class="col-md-6" style="padding-right:20px;">
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-2 control-label" style="text-align:right;">질문분류 :  </label>
		                                                <div class="col-md-2">
			                                                <select class="selectpicker" name="category" onchange="seleceCategorySub(this.value)">
			                                                <%for(int i = 0; i < bdapBbsCategory.size(); i++){ %>
			                                              	  <option value="<%=bdapBbsCategory.get(i).getCateId()%>"><%=bdapBbsCategory.get(i).getCateName()%></option>
			                                                <%} %>
															</select>
		                                                </div>
	                                                    <label class="col-md-4 control-label" style="text-align:right;">질문세부분류 :  </label>
		                                                <div class="col-md-4">
			                                                <select class="selectpicker" name="categorySub" id="categorySub" onchange="selectResponser(this.value)">
				                                               <%for(int i = 0; i < bdapBbsCategorySub.size(); i++){ %>
				                                              	  <option id="<%=bdapBbsCategorySub.get(i).getCateId()%>" value="<%=bdapBbsCategorySub.get(i).getCateId()%>"><%=bdapBbsCategorySub.get(i).getCateName()%></option>
				                                                <%} %>
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
                                     					<button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:qnaInsert();">등록</button>
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
    			document.location.href = "<%=contextPath%>/notice/reg.do";
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
        		document.location.href = "<%=contextPath%>/qna/list.do";
        	}
    		
    		function qnaInsert(){
    			
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
    		  		$('#qnaRegForm').submit();	
    			}
    			
    		}
    		
    		function seleceCategorySub(value){
    			
    			$.ajax({
    				type:'post',
    				async:true,
    				/* data:value, */
    				dataType:'json',
    				url:'<%=contextPath%>/getQnaSubCategory.do?subCategory='+value,
    				success:function(data) {
    					
    				 $("#categorySub").empty();
    					
    				var categorySubContent = "";
    					for(var i = 0; i < data.cateList.length; i++){
    						categorySubContent += '<option id='+data.cateList[i].cateId+' value='+data.cateList[i].cateId+' responsor='+data.cateList[i].cateResponserName+'>'+data.cateList[i].cateName+'</option>';
    					}
    					$("#categorySub").html(categorySubContent);
    					$('.selectpicker').selectpicker('refresh');
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    		}
    		
    		function selectResponser(val){
    			
    			var responser = $("#"+val).attr("responsor");
    			$("#responsibility").val(responser);
    			
    			
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
    	    
    	    
    	    $(window).load(function(){
   	    		
	    		 $(".bootstrap-select").css("width","100%"); 
	    	});
    	    
			function goEnc(){
            	
            	document.location.href = "<%=contextPath%>/ktMainPage11.do";
            }
    	    
        </script>
    
    
</body>
</html>