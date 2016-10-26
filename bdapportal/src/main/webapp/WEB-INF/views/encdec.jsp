<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="com.kt.bdapportal.domain.MgmtTblStat"%>
<%@ page import="java.util.*"%>    
<%@ page import="com.kt.bdapportal.common.util.SearchVO"%> 
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
  
  String type = (String)request.getAttribute("type");

	 SearchVO searchVO = (SearchVO)request.getAttribute("searchVO");
	
  if(type == null){
	  type = "";
  }
  
%>    
    
<!DOCTYPE html>
<html class=" js flexbox no-flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg no-smil svgclippaths">
  <head>
        
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link href="assets/images/favicon_1.ico" rel="shortcut icon">

<%if(type.equals("enc")){ %>
        <title>암호화</title>
<% }else{%>
		<title>복호화</title>
<% }%>

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

        <script src="//www.google-analytics.com/analytics.js" async=""></script><script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        
        
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/css/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="<%=contextPath%>/resources/jqgrid/css/ui.jqgrid-bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="<%=contextPath%>/resources/kt/css/bootstrap-select.css" />
	
	
	
	
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-72255993-1', 'auto');
            ga('send', 'pageview');
        </script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
       
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
       
       
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
	 height: 247px;
	}
    
    #chartdiv1 {
 	height:280px;     
 
        
	}
    
    
    </style></head>
  
  
  
<body class="fixed-left widescreen">
        
        <!-- Begin page -->
        <div id="wrapper">
        
               <div class="">
                <!-- Start content -->
                <div class="content" style="">
                    <div class="container" style="padding-left:0px; padding-right:0px;">
		
					<%if(type.equals("enc")){ %>
        				<h4 class="m-t-0 header-title" style="padding:10px; padding-top:15px; margin-bottom:0px;"><i class="zmdi zmdi-transform"></i> <span>암호화 신청</span></h4>
					<% }else{%>
						<h4 class="m-t-0 header-title" style="padding:10px; padding-top:15px; margin-bottom:0px;"><i class="zmdi zmdi-transform"></i><span>복호화 신청</span></h4>
					<% }%>	
						   <div class="col-lg-12" style="margin-bottom:10px;">
								 <div class="card-box" style="padding-bottom:10px; padding-top:10px;">
										<form class="form-horizontal" role="form" id="encDecRegForm" name="encDecRegForm" method="post" action="<%=contextPath%>/encDecinsert.do?type=<%=type%>" accept-charset="utf-8">
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:5px;"><i class="zmdi zmdi-flare"></i>&nbsp;Schema</label>
													<div class="col-sm-8" style="float:right;">
														<!-- <input class="form-control" required="" type="text" placeholder="Type something"> -->
														<select class="selectpicker form-control"  name="schema" id="schema" onchange="goSelectTable(this.value)">
															<option value="">Schema 선택</option>
														</select>
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;Table</label>
													<div class="col-sm-8" style="float:right;">
														<!-- <input class="form-control" id="pass2" required="" type="password" placeholder="Password" data-parsley-id="36"> -->
														<select class="selectpicker" name="tableList" id="tableList" onchange="javascript:selectTable(this.value);" >
															  <option>Schema를 선택 하세요</option>
														</select>
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-5 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;법률검토완료여부</label>
													<div class="col-sm-8" style="float:right;">
														<!-- <input class="form-control" required="" type="email" placeholder="Enter a valid e-mail" parsley-type="email" data-parsley-id="40"> -->
														<select class="selectpicker" id="lawReview" name="lawReview">
														  <option value="Y">완료</option>
														  <option value="N">미완료</option>
														</select>
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;Column</label>
													<div class="col-sm-8" style="float:right;">
														<input class="form-control" type="text" id="selectedColumn" name="selectedColumn" placeholder="" required="" onclick="javascript:selectColumn();">
														<input class="form-control" type="hidden" id="selectedColumnId" name="selectedColumnId" />
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;암호화 테이블명</label>
													<div class="col-sm-8" style="float:right;">
														<input class="form-control"  placeholder="테이블 명을 입력 하세요" id="tableNm" name="tableNm" required="" >
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;프로젝트명</label>
													<div class="col-sm-8" style="float:right;">
														<input class="form-control" required=""  placeholder="프로젝트 명을 입력 하세요" id="prjNm" name="prjNm" required="" >
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-6 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;신청사유</label>
													<div class="col-sm-6" style="float:right;">
														<input class="form-control" required="" type="text" placeholder="신청 사유를 입력 하세요" id="reason" name="reason" required="" >
													</div>
												</div>
												<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-5 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;내부결재문서번호</label>
													<div class="col-sm-7" style="float:right;">
														<input class="form-control" required="" type="text" placeholder="내부결재 문서 번호를 입력 하세요" id="docNumber" name="docNumber" required="">
													</div>
												</div>
												<input type="hidden" id="fileList" name="fileList" />
													<div class="form-group" style="padding-bottom:10px; padding-right:10px;border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
													<label class="col-sm-4 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;암호화 만료일자</label>
										            <div class='col-sm-4 input-group date' id='datetimepicker6' style="float:right;width:40%">
										                <input type='text' class="form-control" name="validateDate" id="validateDate" value="" />
										                <span class="input-group-addon">
										                    <span class="glyphicon glyphicon-calendar"></span>
										                </span>
										            </div>
									            </div>
									            <input type="hidden"  id="colTblNm" name="colTblNm"/>
												</form>	
												<form class="form-horizontal group-border-dashed" id="fileUploadForm" action="fileUpload" name="fileUploadForm" method="post" enctype="multipart/form-data" >
													<div class="form-group" style="padding-bottom:10px; border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:#ddd; margin-bottom:10px;">
														<label class="col-sm-6 control-label" style="float:left; margin-top:7px;"><i class="zmdi zmdi-flare"></i>&nbsp;법률검토결과</label>
											            <div class="input-group" style="margin-right:10px;">
											                <input type="text" class="form-control" readonly>
											                <label class="input-group-btn">
											                    <span class="btn btn-default">
											                        	찾아보기<!-- &hellip; --> <input type="file" id="fileArr"  name="fileArr"  style="display: none;" multiple="multiple" onchange="javascript:fileUpLoad(this);" />
											                    </span>
											                </label>
											            </div>
													</div>
												</form>
												<div class="form-group" style="margin-bottom:0px;">
													<div class="col-sm-offset-3 col-sm-9 text-right">
														<button class="btn btn-primary waves-effect waves-light" onclick="javascirpt:insertEncDec()">
															확인
														</button>
														<button class="btn btn-default waves-effect m-l-5" type="reset" onclick="javascript:winclose();">
															취소
														</button>
													</div>
												</div>
											
								</div>
                       			<input type="hidden"  id="colTblId" name="colTblId"/>
                       	</div>
                       
                       

                    </div>
                </div>
            </div>
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
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-treeview.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/dropzone.js"></script>
        
        <script src="<%=contextPath%>/resources/kt/js/jquery.form.min.js"></script>
        
       <script src="<%=contextPath%>/resources/kt/js/moment.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-datetimepicker.min.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/bootstrap-select.js"></script>
        
        
        
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

		<script src="<%=contextPath%>/resources/jqgrid/js/jquery.jqGrid.min.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/jqgrid/js/i18n/grid.locale-kr.js" type="text/ecmascript"></script>
		<script src="<%=contextPath%>/resources/js/jquery-ui.js" type="text/javascript"></script>

        <script type="text/javascript">
            jQuery(document).ready(function($) {

    	        $('#datetimepicker6').datetimepicker({
    	        	format: 'YYYY/MM/DD'
    	        });
    	        
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                $('.circliful-chart').circliful();

				$.ajax({
				 type: "POST",
				 url:'<%=contextPath%>/getSchemaManageDbNmList.do', 
				 contentType: "application/json; charset=utf-8",
				 dataType: "json",
				 success: function(data) {
		    			$.each(data.rows, function (index, text) {
		    			    $('select#schema').append($('<option>', {
		    			        value: data.rows[index].dbNm,
		    			        text : data.rows[index].dbNm 
		    			    }));
		    			});

		    			$('select#schema').selectpicker('refresh');
				 }
				 });
				
				
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


			function fileUpLoad(fileObj){
				if(fileObj.files.length>2){
					alert('파일 첨부는 2개까지 가능합니다.');
					return false;
				}
				
				var formData = new FormData($('#fileUploadForm')[0]);
				 //var formData = $('#fileUploadForm').serialize();
			       	 $.ajax({
			       	    url: '<%=contextPath%>/fileUpload',
			       	    processData: false,
			    	    	contentType: false,
			       	    data: formData,
			       	    type: 'POST',
			       	    success: function(result){
			       	    }
			       	});
				   	 
				var fileName = "";
		       	for(var i = 0; i < fileObj.files.length; i++){
		    	   	fileName += fileObj.files.item(i).name+"*";   		
		       	}
			       	 
				$("#fileList").val(fileName);
			
			}
    		
    		function winclose(){
    			self.close();
    		}
    		
    		function goSelectTable(value){
    			
    			$.ajax({
    				type:'post',
    				async:true,
    				/* data:value, */
    				dataType:'json',
    				url:'<%=contextPath%>/getTableList.do?schema='+value,
    				success:function(data) {
    				
    				  $("#tableList").empty();
    					
    				var tableListContent = ""; 
    					
    					/* categorySubContent += '<div class="col-md-3" name="categorySub" id="categorySub">';
    					categorySubContent += '<select class="selectpicker">'; */
    					 for(var i = 0; i < data.tblList.length; i++){
    						 tableListContent += '<option id='+data.tblList[i].tblId+' value='+data.tblList[i].tblId+'>'+data.tblList[i].tblEngNM+'</option>';
    					} 
    					
    					 $("#tableList").html(tableListContent);
    					$('.selectpicker').selectpicker('refresh'); 
    					 //$(".bootstrap-select").css("width","100%"); 
    				},
    				error:function(data,status,err) {
    				}
    			});
    			
    			
    		}
    		
    		function selectTable(id){
    			$("#colTblId").val(id);
    			$("#colTblNm").val( $("#tableList option:selected").text());
    		}
    		
    		function insertEncDec(){
    			
    			/* type */	
    			
    			$("#encDecRegForm").submit();
    			
    		}
    		
    		
    		
    		function enc(){
    			
    			window.open("<%=contextPath%>/encdec.do?type=enc","암호화 신청","width=500,height=500");
    		}
    		
    		function dec(){
    			window.open("<%=contextPath%>/encdec.do?type=decc","복호화 신청","width=500,height=500");
    		}
    		
    		function process(value, options, rowObject){				//처리
    			   var radioHtml = '<p class="label label-primary" style="width:100px; margin-top:15px; cursor:pointer;">승인</p>'+'/'+'<p class="label label-pink" style="width:100px; margin-top:15px; cursor:pointer;">반려</p>';
    			   return radioHtml;
    			}
    		
    		function reapplication(value, options, rowObject){			//재신청
    			   var radioHtml = '<p class="label label-inverse" style="width:100px; margin-top:15px; cursor:pointer;">재신청</p>';
    			   return radioHtml;
    			}
        		
    		function download(value, options, rowObject){				//다운로드
   			   var radioHtml = '<i class="zmdi zmdi-download" style="cursor:pointer;"></i>';
   			   return radioHtml;
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
    	    
    	    function selectColumn(){
    	    	
    	    	var popWidth = 300;
        		var popHeight = 300;
        		var width = screen.width;
    			var height = screen.height;

        			var left = (screen.width/2)-(popWidth/2);
        			var top = (screen.height/2)-(popHeight/2);
        			
        			var param = "width="+popWidth+",height="+popHeight+",left="+left+",top="+top;
        			
        			var colTblId = $("#colTblId").val();
        			
        			
        			window.open("<%=contextPath%>/selectcolumn.do?colTblId="+colTblId,"컬럼 선택",param);
        		
    	    }
    	    
    	    function setData(str,id){
    	    	
    	    	$("#selectedColumn").val(str);
    	    	$("#selectedColumnId").val(id);
    	    	
    	    }
    	    
    	    $(window).load(function(){
   	    		
  	    		 $(".bootstrap-select").css("width","100%"); 
  	    	});
    	    
    	    
    	    $(function() {

    	    	  // We can attach the `fileselect` event to all file inputs on the page
    	    	  $(document).on('change', ':file', function() {
    	    	    var input = $(this),
    	    	        numFiles = input.get(0).files ? input.get(0).files.length : 1,
    	    	        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    	    	    input.trigger('fileselect', [numFiles, label]);
    	    	  });

    	    	  // We can watch for our custom `fileselect` event like this
    	    	  $(document).ready( function() {
    	    	      $(':file').on('fileselect', function(event, numFiles, label) {
							if(numFiles>2){
								return false;
							}
    	    	          var input = $(this).parents('.input-group').find(':text'),
    	    	              log = numFiles > 1 ? numFiles + '개 파일이 선택 되었습니다.' : label;

    	    	          if( input.length ) {
    	    	              input.val(log);
    	    	          } else {
    	    	              if( log ) alert(log);
    	    	          }

    	    	      });
    	    	  });
    	    	  
    	    	});
    	    
    	    
        </script>
    
    
</body>
</html>