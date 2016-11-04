<%@page import="com.kt.bdapportal.domain.BdapUser"%>
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
<%@page import="com.kt.bdapportal.domain.BdapComment"%>    
<%@page import="com.kt.bdapportal.common.util.BbsConstant"%>
 
<%
BdapUser bdapUser = (BdapUser)session.getAttribute("bdapUser");
boolean isAdmin = (Boolean)session.getAttribute("isAdmin");
String fileTempPath = BbsConstant.FILE_TEMP_PATH;
String fileStorePath = BbsConstant.FILE_STORE_PATH;
  BdapBbs bbs = (BdapBbs)request.getAttribute("referenceView");
  String fileName = (String)request.getAttribute("fileName"); 
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  String bbsPostId = (String)request.getAttribute("bbsPostId");
  Long cmtCount = (Long)request.getAttribute("cmtCount");
  ArrayList<BdapComment> bdapCmtList = (ArrayList<BdapComment>) request.getAttribute("bdapCmtList");
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
						<h4 class="m-t-0 header-title" style="padding:10px;"><b>게시물 조회</b></h4>
						
                        <div class="col-sm-12" style="">
                       		<div class="card-box" style="">
                       			<div class="row">
                        				<div class="col-md-6" style="padding-left:20px;">
                        					<form class="form-horizontal" role="form">
                        					<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  placeholder="제목을 입력 하세요." value="<%=bbs.getBbsTitle()%>">
	                                                </div>
	                                            </div>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">업무구분 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"   value="<%=bbs.getBbsCategory()%>">
	                                                </div>
	                                            </div>
	                                            <%}else{ %>
	                                            <div class="form-group" style="margin-bottom:0px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">제목 :</label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"   value="<%=bbs.getBbsTitle()%>">
	                                                </div>
	                                            </div>
	                                            <%} %>
	                                        </form>
                        				</div>

                        				<div class="col-md-6" style="padding-right:20px;">
                        					<form class="form-horizontal" role="form">
											<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
	                                            <div class="form-group" style="margin-bottom:10px;">
	                                                <label class="col-md-3 control-label" style="text-align:left;">자료유형 :  </label>
	                                                <div class="col-md-9">
	                                                    <input class="form-control" type="text"  value="<%=bbs.getBbsCategorySub().equals("func")?"기능":bbs.getBbsCategorySub().equals("must")?"필독":"기타"%>">
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
                                     					<!-- <button class="btn btn-primary waves-effect waves-light" type="button" onclick="javascript:goMod();">수정</button>
	                                                    <button class="btn btn-warning waves-effect waves-light" type="button" >취소</button> -->
	                                                </div>
	                                            </div>
	                                            <%} %>
	                                        </form>
                        				</div>
                        			</div>
                       			<!-- <div id='daum_editor_panel'></div> -->
                     	  		<textarea id='editor_contents_source' style='display:none;'><%= bbs.getBbsContent() %></textarea>
                       			<input type='hidden' id='content' name='content' />
                       			
                       		</div>
                       		<%-- <div class="col-sm-12" style="">
                       				<div class="card-box" style="">
                       				<textarea id='editor_contents_source' style=''><%= bbs.getBbsContent() %></textarea>
                       				</div>
                       			</div>	 --%>
                       		<div class="card-box">
								<div class="" id="" style="border:1px solid #b3b3b3; padding:10px; min-height:150px; max-height:400px; overflow-y:scroll">
										<%= bbs.getBbsContent() %>
									
							    </div>
							</div>	
                       			<%if(!fileName.equals("")){%>
									<div class="card-box">
									<div style="left: -100000px; position: absolute; opacity: 0;" contenteditable="true"><br></div><div class="inline-editor note-air-editor note-editable panel-body" id="note-editor-1" contenteditable="false">
									<%String[]  fileNameArr = fileName.split("\\*");
										for(int i = 0;i < fileNameArr.length; i++ ){ %>
											<form class="" action="../fileDownload?fileName=<%=fileNameArr[i]%>&userId=<%=bbs.getBbsWriterId()%>" method="post" >
											<div class="col-md-6">
												<div class="col-md-6">
	                                				<p><%= fileNameArr[i] %></p>
	                                			</div>
	                                			<div class="col-md-6">
	                                				<input type = "submit" value = "다운로드">
	                                			</div>
                                			</div>
                                		</form>
                                		<%}%>	
								    </div>
									</div>
								<%}%>	
								
							<label class="col-md-3 control-label" style="text-align:left;">댓글(<span id="cmtCount"><%=cmtCount%></span>)</label>	
							<div class="col-sm-9 text-right" style="">
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goList();">목록</button>
								<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
									<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goReply();">답글</button>
								<%} %>
								
								<%if(isAdmin){ %>
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goMod();">수정</button>
								<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="margin-top:-10px;" onclick="javascript:goDelete();">삭제</button>
								<%} %>
							
							</div>
							<div class="col-sm-12" style="border:1px solid #b3b3b3; margin-bottom:20px;">
							</div>	
							<form class="form-horizontal" role="form" id="commentRegForm" method="post" action="<%=contextPath%>/commentReg.do" accept-charset="utf-8">
								<div class="card-box col-sm-12" style="padding-left:20px;">
									<div class="col-sm-11 " id="commentContent" name="commentContent" contenteditable="true" style="border:1px solid #b3b3b3; height:65px; overflow-y:scroll;">
								    </div>
								    <div class="col-sm-1 text-right" style="">
											<button class="btn-lg btn-inverse waves-effect waves-light" type="button" style="height:65px; width:120px;" onclick="javascript:commentReg();">등록</button>
									</div>
								</div>
								<input type='hidden' id='comment' name='comment' />
								<input type='hidden' id='bbsPostId' name='bbsPostId' value="<%=bbsPostId%>" />
								<input type='hidden' id='viewName' name='viewName' value="noticeView" />
							</form>
							
							
							<div class="card-box col-sm-12 p-b-0" style="padding-top:10px;   <%= bdapCmtList.size() == 0 ?"display:none":"" %>" id="commentArea">
								<%if(bdapCmtList.size() > 0){ %>
										<%for(int i = 0; i < bdapCmtList.size(); i++){ %>
											<div class="row" style="margin-left:0px; margin-right:0px; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#f5f5f5;">
												<div class="col-sm-8" style="">
													<label class="control-label" style="text-align:left; display:block; margin-left:0px;"><i class="zmdi zmdi-account"></i>&nbsp;&nbsp;<%=bdapCmtList.get(i).getCmtWriterId()%><span class="m-b-0 text-muted"><small>&nbsp;&nbsp;(<%=bdapCmtList.get(i).getCmtRegDt().toString().substring(0, 19)%>)</small></span></label>
													<div class="col-sm-12" id="<%=bdapCmtList.get(i).getCmtId()%>" style="padding-left:0px;">
														<p><%=bdapCmtList.get(i).getCmtContent()%> </p>
													</div>
												</div>
												
												<div class="col-sm-2 text-right" style="">
												</div>
										    	<div class="col-sm-2 text-right" style="margin-top:12px;">
													<%if(bdapCmtList.get(i).getCmtWriterId().equals(bdapUser.getUserId()) || isAdmin){%>
										    			<button class="btn-sm btn-inverse waves-effect waves-light inline" id="" type="button" value="<%=bdapCmtList.get(i).getCmtId()%>" onclick="javascript:commentMod(this);">수정</button>
														<button class="btn-sm btn-inverse waves-effect waves-light inline" type="button" style="" value="<%=bdapCmtList.get(i).getCmtId()%>" onclick="javascript:commentDel(this);">삭제</button>
										    		<%} %>
										    	</div>
											</div>
										<%} %>
								<%} %>
							</div>
                       			
                        </div>

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
        
        <!-- jqgrid -->
        <script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script> 

        <script type="text/javascript">
        
        var serverName = "";
        var contextroot = "";
            jQuery(document).ready(function($) {
                serverName = '<%= (String)request.getServerName() %>';
                contextroot = '<%=contextPath%>';
            });

    		
			function goList(){
    			
    			document.location.href = "<%=contextPath%>/reference/list.do";
    		}
    		
    		function goReply(){
    			
    			document.location.href = "<%=contextPath%>/reply/reg.do?bbsPostId=<%=bbsPostId%>&bbsType=BO3";
    			
    		}
    		
			function goMod(){
    			
				if(confirm("수정 하시겠습니까?")){
					<%if(bbs.getBbsParentBbsId() == null || bbs.getBbsParentBbsId().equals("")){ %>
						document.location.href = "<%=contextPath%>/reference/mod.do?bbsPostId=<%=bbsPostId%>";
					<%}else{%>
						document.location.href = "<%=contextPath%>/reply/mod.do?bbsParentId=<%=bbs.getBbsParentBbsId()%>&bbsPostId=<%=bbs.getBbsId()%>&bbsType=BO3";
					<%}%>
					}
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
    		
    		
    		function commentUpdate(obj){
    			
    			var commentContent = $("#"+obj.value + "> div > input").val();
    			
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
    						cmtHtml += '<button class="btn-sm btn-inverse waves-effect waves-light" type="button" style="margin-left:3px;" value="'+data.commentId+'" onclick="javascript:commentDel(this);">삭제</button>';
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
    	    
    	    function goDelete(){
				if(confirm("게시물이 삭제 됩니다. 정말 진행 하시겠습니까?")){
	    			document.location.href = "<%=contextPath%>/reference/del.do?bbsPostIdArr=<%=bbsPostId%>";	
				}
    		}
    	    
        </script>
    
    
</body>
</html>