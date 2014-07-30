<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>登录 | 云游游美食坊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<%=request.getContextPath() %>/pages/general/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/pages/general/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/pages/general/assets/plugins/select2/select2-metronic.css"  />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-toastr/toastr.min.css"  />
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style-metronic.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style-responsive.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/plugins.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/themes/default.css"  rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link href="<%=request.getContextPath() %>/pages/general/assets/img/favicon1.ico" rel="SHORTCUT ICON" type="image/ico">
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="<%=request.getContextPath() %>/index.html" >
		<img src="<%=request.getContextPath() %>/pages/general/assets/img/logo.png" alt=""/>
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="login-form" action="<%=request.getContextPath() %>/general/dologin.html" method="post">
		<h3 class="form-title">登录您的帐号</h3>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
				 请输入用户名和密码
			</span>
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">用户名</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">密码</label>
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
			</div>
		</div>
		<div class="form-actions">
			<button type="submit" class="btn blue pull-right">
			登录 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
	</form>
	<!-- END LOGIN FORM -->
	<input type="hidden" id="loginStatus" value="${model.loginStatus}">
	<input type="hidden" id="loginErrInfo" value="${model.loginErrInfo}">
	
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
	 2014 &copy; 云游游 ALL Rights Reserved
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
	<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/respond.min.js" ></script>
	<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/excanvas.min.js" ></script> 
	<![endif]-->
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/uniform/jquery.uniform.min.js"  type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-validation/dist/jquery.validate.min.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/select2/select2.min.js" ></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-toastr/toastr.min.js" ></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath() %>/pages/general/assets/scripts/core/app.js"  type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/scripts/custom/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
		jQuery(document).ready(function() {     
		  App.init();
		  Login.init();
		  var loginStatus = $("#loginStatus").val();
		  var loginErrInfo = $("#loginErrInfo").val();
		  if(loginStatus == 300){
			  toastr.options = {"positionClass": "toast-top-center"};
			  toastr["error"]("", loginErrInfo);
		  }
		});
	</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>