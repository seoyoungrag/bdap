<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils"%>
<%@ page import="org.springframework.web.util.WebUtils"%>     
<%@page import="com.kt.bdapportal.domain.BdapBbs"%>
<%@page import="com.kt.bdapportal.domain.BdapFile"%>
<%@page import="com.kt.bdapportal.domain.BdapComment"%>  
<%@page import="com.kt.bdapportal.common.util.BbsConstant"%>
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%> 
<%

	String fileTempPath = BbsConstant.FILE_TEMP_PATH;
	String fileStorePath = BbsConstant.FILE_STORE_PATH;

  BdapBbs bbs = (BdapBbs)request.getAttribute("noticeView");
  String fileName = (String)request.getAttribute("fileName"); 
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  String bbsPostId = (String)request.getAttribute("bbsPostId");
  String bbsType = (String)request.getAttribute("bbsType");
 
  SearchVO searchVO = (SearchVO)request.getAttribute("searchVO");
  
  Long cmtCount = (Long)request.getAttribute("cmtCount");
  ArrayList<BdapComment> bdapCmtList = (ArrayList<BdapComment>) request.getAttribute("bdapCmtList");
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  
  
  
  
<body class="fixed-left widescreen" style="">
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>답글 등록</b></h4>
                        <div class="col-sm-12" style="">
                        	<form class="form-horizontal" role="form" id="noticeReplyRegForm" name="noticeReplyRegForm" method="post" action="<%=contextPath%>/reply/insert.do" accept-charset="utf-8">
	                       		<div class="card-box" style="">
	                       			<div class="row">
	                       				<div class="col-md-3" style="padding-left:20px;">
		                                    <div class="form-group" style="margin-bottom:0px;">
		                                        <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
		                                        <div class="col-md-9">
		                                            <input class="form-control" type="text" id="replyTitle" name="replyTitle" placeholder="제목을 입력 하세요." value="<%=bbs.getBbsTitle()%>의 답변">
		                                        </div>
		                                    </div>
	                       				</div>
	                       				<%if(bbsType.equals("BO2")){ %>
	                       				<div class="col-md-3" style="">
		                                    <div class="radio radio-default radio-inline">
                               					<input name="qnaStatus" id="inlineRadio1" type="radio" checked="" <%=searchVO.getProcessStatus()=='P'?"checked":"" %> value="P"/>
                               						<label for="inlineRadio1"> 처리중 </label>
                           					</div>
                           					<div class="radio radio-default radio-inline">
                               					<input name="qnaStatus" id="inlineRadio2" type="radio"  value="S"  <%=searchVO.getProcessStatus()=='S'?"checked":"" %>/>
                               						<label for="inlineRadio2"> 처리완료 </label>
                           					</div>
                           					<div class="radio radio-default radio-inline">
                               					<input name="qnaStatus" id="inlineRadio3" type="radio" value="R" <%=searchVO.getProcessStatus()=='R'?"checked":"" %>/>
                               						<label for="inlineRadio3"> 보완요청 </label>
                           					</div>
	                       				</div>
	                       				<div class="col-md-3" style="">
	                       					<div class="form-group" style="margin-bottom:5px;">
												<label class="col-md-3 control-label" style="text-align:center;">답변예정일 : </label>
													<div class='col-md-4'>
														<div class="form-group">
															<div class='input-group date' id='datetimepicker'>
																<input type='text' class="form-control" name="expectDate" id="expectDate" />
																<span class="input-group-addon">
																	<span class="glyphicon glyphicon-calendar">
																</span>
															</span>
															</div>
														</div>
													</div>
												</div>
										</div>
										
										<div class="col-md-2" style="">
											<div class="col-md-7 text-right" style="padding-right:0px;">
		                        				<button class="btn btn-inverse waves-effect waves-light" type="button" onclick="javascript:noticeReplyInsert();" >등록</button>
		                                        <button class="btn btn-default waves-effect waves-light" onclick="javascript:goList();" type="button" >취소</button>
	                        				</div>
	                       				</div>
	                       			</div>
	                       				
	                       				
	                       				<%}else{ %>
	                       				<div class="col-md-6" style="">
											<div class="col-md-12 text-right" style="padding-right:0px;">
		                        				<button class="btn btn-inverse waves-effect waves-light" type="button" onclick="javascript:noticeReplyInsert();" >등록</button>
		                                        <button class="btn btn-default waves-effect waves-light" onclick="javascript:goList();" type="button" >취소</button>
	                        				</div>
	                       				</div>
	                       				<%} %>
	                       			</div>
	                       		</div>
	                       		<div class="card-box">
	                       			<div id='daum_editor_panel'></div>
	                       			<textarea id='editor_contents_source' style='display:none;'><%= bbs.getBbsContent() %></textarea>
		                       		<input type='hidden' id='replyContent' name='replyContent' value=''/>
		                       		<input type='hidden' id='replyFileList' name='replyFileList' value=''/>
		                       		<input type='hidden' id='parentPostId' name='parentPostId' value='<%=bbsPostId%>'/>
		                       		<input type='hidden' id='bbsType' name='bbsType' value='<%=bbsType%>'/>
								</div>
							</form>
							
                            <div class="m-b-30">
                                <form class="dropzone dz-clickable" id="dropzone" action="../fileUpload" name="dropzone" method="post" enctype="multipart/form-data">
                                	<div class="dz-default dz-message"><span>file upload</span>
                                	</div>
                                </form>
                            </div>
	                        <input class="dz-hidden-input" style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;" type="file" multiple="multiple">	
								
							
                        </div>

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
            	<%if(bbsType.equals("BO2")){ %>
            	$('#datetimepicker').datetimepicker({
		        	format: 'YYYY/MM/DD',
		            defaultDate: moment().add(7, 'days'),
		            useCurrent: false
		        });
            	<%}%>
                serverName = '<%= (String)request.getServerName() %>';
                contextroot = '<%=contextPath%>';
            });
            
            daumEditor = new DaumEditor('BBS');
        	daumEditor.create();
        	daumEditor.setContent(); 
    		
    		function goList(){
    			
    			var bbsType="<%=bbsType%>";
    			
    			if(bbsType == "BO1"){
    				document.location.href = "<%=contextPath%>/notice/list.do";	
    			}else if(bbsType == "BO2"){
    				document.location.href = "<%=contextPath%>/qna/list.do";	
    			}else if(bbsType == "BO3"){
    				document.location.href = "<%=contextPath%>/reference/list.do";	
    			}else if(bbsType == "BO4"){
    				document.location.href = "<%=contextPath%>/linkage/list.do";	
    			}else if(bbsType == "BO5"){
    				document.location.href = "<%=contextPath%>/devreq/list.do";	
    			}
        	}
        	
    		function goReg(){
    			
    			document.location.href = "<%=contextPath%>/noticeReg.do?bbsPostId=<%=bbsPostId%>";
    			
    		}
    		
    		function commentMod(obj){
    		
    			var commentContent = $("#"+obj.value + " > p").html();
    			
    			var commentHtml = '<div style="height:30px; padding:0px; margin:0px;"><input type="text" style="width:100%; margin-top:-3px; margin-left:-2px;" value="'+commentContent+'"/></div>';
    			
    			$("#"+obj.value).html(commentHtml);
    			
    			$(obj).removeClass("btn-primary");
    			$(obj).addClass("btn-warning");
    			$(obj).html("확인");
    			$(obj).attr("onClick","javascript:commentUpdate(this);");
    			
    		}
    		
        	function validation(){
        		
        		var check = false;
        		var	content = daumEditor.getContent();
        		$("#replyContent").val(content);
        		
        		if($("#replyTitle").val()==""){
        			alert("제목이 입력 되지 않았습니다.");
        			check = false;
        		}else if($("#replyContent").val()=="<p><br></p>"){
        			alert("본문이 입력 되지 않았습니다.");
        			check = false;
        		}else{
        			check = true;
        		}    		
        		
        		return check; 
        	}	
    		
    		function noticeReplyInsert(){

  	   			 if(validation()){
  					var getFileName = $(".dz-filename > span");
  	    			
  	    			var	content = daumEditor.getContent();
  	    			$("#replyContent").val(content);
  	    			
  	    			if(getFileName.length != 0){
  	    				var fileList = "";
  	        			$('.dz-filename > span').each(function(idx) {
  	        				fileList += $(this).html() + "*";
  	        			});	
  	        			$("#replyFileList").val(fileList);
  	    			}
  	    	 	  	$('#noticeReplyRegForm').submit(); 	
  	   			} 
    		}
    		
    		function commentUpdate(obj){
    			
    			var commentContent = $("#"+obj.value + " > div > input").val();
    			
    			var param = "&bbsPostId=<%=bbsPostId%>&commentId="+ obj.value + "&commentContent="+commentContent+"&viewName=notice";
    			$.ajax({
    				type:'post',
    				async:true,
    				/* data:$('#commentRegForm').serialize(), */
    				dataType:'json',
    				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    				url:'<%=contextPath%>/commentUpdate.do?'+param,
    				success:function(data) {
    					var commentHtml = '<p>'+data.commentContent+'</p>';
    					$("#"+data.commentId).html(commentHtml)
    					$(obj).removeClass("btn-warning");
    	    			$(obj).addClass("btn-primary");
    	    			$(obj).html("수정");
    	    			$(obj).attr("onClick","javascript:commentMod(this);");
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    		}
    		
    		function commentReg(){

    			$("#comment").val($("#commentContent").html());
    			
    			$.ajax({
    				type:'post',
    				async:true,
    				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    				data:$('#commentRegForm').serialize(),
    				dataType:'json',
    				url:'<%=contextPath%>/commentReg.do',
    				success:function(data) {
    					data.commentContent
    					data.commentId
    					data.commentWriterId
    					data.commentRegDt
    					
    					var date = new Date(data.commentRegDt.time);
    					var formattedDate = moment(date).format('YYYY-MM-DD HH:mm:ss');
						var firstChild = false;    					
    					if($("#commentArea").children().size()==0){
    						firstChild = true;
    					}
    					var cmtHtml = ""
    					
						if(firstChild){
							cmtHtml = '<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">'
						}else{
							cmtHtml = '<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">'
						}
							
    						cmtHtml += '<div class="col-sm-8" style="">';
    						cmtHtml += '<label class="control-label" style="text-align:left; display:block; margin-left:0px;"><i class="zmdi zmdi-account"></i>&nbsp;&nbsp;'+data.commentWriterId+'<span class="m-b-0 text-muted"><small>&nbsp;&nbsp;('+formattedDate+')</small></span></label>'; 
    						cmtHtml += '<div class="col-sm-12" id="'+data.commentId+'" style="padding-left:0px;">';
    						cmtHtml += '<p>'+data.commentContent+'</p>';
    						cmtHtml += '</div>';
    						cmtHtml += '</div>';
    						cmtHtml += '<div class="col-sm-2 text-right" style="">';
    						cmtHtml += '</div>';
    						cmtHtml += '<div class="col-sm-2 text-right" style="margin-top:12px;">'; 
    						cmtHtml += '<button class="btn-sm btn-inverse waves-effect waves-light" id="" style:"" type="button" value="'+data.commentId+'" onclick="javascript:commentMod(this);">수정</button>';
    						cmtHtml += '<button class="btn-sm btn-inverse waves-effect waves-light" type="button" style="margin-left:4px;" value="'+data.commentId+'" onclick="javascript:commentDel(this);">삭제</button>';
    						cmtHtml += '</div>';
    						cmtHtml += '</div>';
    						
    					if($("#commentArea").css("display") == 'none'){
    						$("#commentArea").css("display",'block');
    					}
    						
    					var temp = $("#commentArea").html();
    					$("#commentArea").html(cmtHtml+temp);
    					$("#commentContent").empty();
    					$("#cmtCount").html(data.cmtCount);
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    			//$("#comment").val($("#commentContent").html());
    			//$("#commentRegForm").submit();
    			
    		}
    		
    		function commentDel(obj){
    			
    			if(confirm("댓글을 삭제 하시겠습니까?")){
	    			var param = "&bbsPostId=<%=bbsPostId%>&commentId="+obj.value;
	    			$.ajax({
	    				type:'post',
	    				async:true,
	    				/* data:$('#commentRegForm').serialize(), */
	    				dataType:'json',
	    				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    				url:'<%=contextPath%>/commentDelete.do?'+param,
	    				success:function(data) {
	    					
	    	    			$(obj).parent().parent().remove();
	    	    			if($("#commentArea").children().size()==0){
	    	    				$("#commentArea").css("display","none");
	    	    			}
	    	    			
	    	    			$("#cmtCount").html(data.cmtCount);
	    	    			
	    				},
	    				error:function(data,status,err) {
	    				}
	    			});
    			}
    			
    			
    			
    		}
    		
    		
    		function goReply(){
    			
    			document.location.href = "<%=contextPath%>/notice/replyReg.do?bbsPostId=<%=bbsPostId%>";
    			
    		}
    		
    		
    		
    		function emer(value, options, rowObject){
  			   var radioHtml = '<p class="label label-danger" style="width:100px; margin-top:15px; margin-left:0px; text-align:left">긴급</p>&nbsp;&nbsp;&nbsp;'+value;
  			   return radioHtml;
  			}
    		
    		
    		function question(value, options, rowObject){
 			   var radioHtml = '<p class="label label-success" style="width:100px; margin-top:15px; margin-left:0px; background-color:#5cb85c; text-align:left">질문</p>&nbsp;&nbsp;&nbsp;'+value;
 			   return radioHtml;
 			}
    		
			function goMod(){
    			
    			document.location.href = "<%=contextPath%>/noticeMod.do?bbsPostId=<%=bbsPostId%>";
    			
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
    
<input class="dz-hidden-input" style="left: 0px; top: 0px; width: 0px; height: 0px; visibility: hidden; position: absolute;" type="file" multiple="multiple">
</body>
</html>