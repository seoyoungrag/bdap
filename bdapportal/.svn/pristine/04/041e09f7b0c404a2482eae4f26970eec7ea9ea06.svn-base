<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
  String test = (String)request.getAttribute("test");
  String contextPath = (String)request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
        <meta name="author" content="Coderthemes">

        <link rel="shortcut icon" href="<%=contextPath%>/resources/kt/images/favicon_1.ico">

        <title>Minton - Responsive Admin Dashboard Template</title>

        <link href="<%=contextPath%>/resources/kt/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/core.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/icons.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/components.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/pages.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/menu.css" rel="stylesheet" type="text/css">
        <link href="<%=contextPath%>/resources/kt/css/responsive.css" rel="stylesheet" type="text/css">

        <script src="<%=contextPath%>/resources/kt/js/modernizr.min.js"></script>
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-72255993-1', 'auto');
            ga('send', 'pageview');
        </script>

        <script type="text/javascript">
	    function doLogin(){
	    	var loginId = $("#loginId").val();
	    	var loginPassword = $("#loginPassword").val();
	    	
	    	if(loginId == ''){
	    		alert('아이디를 입력해 주세요.');
	    		$("#loginId").focus();
	    	}
	    	if(loginPassword == ''){
	    		alert('비밀번호를 입력해 주세요.');
	    		$("#loginPassword").focus();
	    	}
	    	
   			$.ajax({
   				type:'post',
   				async:true,
   				dataType:'json',
   				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
   				url:'<%=contextPath%>/login.do?loginId='+loginId+'&loginPassword='+loginPassword,
   				success:function(data) {
   					if(data.result == '1'){
   						location.href='<%=contextPath%>/mainPage.do';
   					}else if(data.result == '-1'){
   						alert('NDAP 인증이 실패하였습니다.');
   					}else if(data.result == '-2'){
   						alert('NDAP 인증키가 존재하지 않습니다.');
   					}else if(data.result == '-3'){
   						alert('BDAP 포털 세션 데이터 생성 중 오류가 발생하였습니다.');
   					}
   				},
   				error:function(data,status,err) {
   					alert('BDAP 포털 로그인 중 알 수 없는 오류가 발생하였습니다.');
   				}
   			});
		}
    </script>
    </head>
    <body>


        <div class="wrapper-page">

            <div class="text-center">
                <a href="index.html" class="logo logo-lg"><i class="md md-equalizer"></i> <span>Minton</span> </a>
            </div>

            <form class="form-horizontal m-t-20" onsubmit="doLogin(); return false;">

                <div class="form-group">
                    <div class="col-xs-12">
                        <input class="form-control" type="text" required="" id="loginId" placeholder="Username">
                        <i class="md md-account-circle form-control-feedback l-h-34"></i>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <input class="form-control" type="password" required="" id="loginPassword" placeholder="Password">
                        <i class="md md-vpn-key form-control-feedback l-h-34"></i>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <div class="checkbox checkbox-primary">
                            <input id="checkbox-signup" type="checkbox">
                            <label for="checkbox-signup">
                                Remember me
                            </label>
                        </div>

                    </div>
                </div>

                <div class="form-group text-right m-t-20">
                    <div class="col-xs-12">
                        <button class="btn btn-primary btn-custom w-md waves-effect waves-light" type="submit">Log In
                        </button>
                    </div>
                </div>

                <div class="form-group m-t-30">
                    <div class="col-sm-7">
                        <a href="pages-recoverpw.html" class="text-muted"><i class="fa fa-lock m-r-5"></i> Forgot your
                            password?</a>
                    </div>
                    <div class="col-sm-5 text-right">
                        <a href="pages-register.html" class="text-muted">Create an account</a>
                    </div>
                </div>
            </form>
        </div>

        
    	<script>
            var resizefunc = [];
        </script>

        <!-- Main  -->
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

        <!-- Custom main Js -->
        <script src="<%=contextPath%>/resources/kt/js/jquery.core.js"></script>
        <script src="<%=contextPath%>/resources/kt/js/jquery.app.js"></script>
	
	</body>
</html>