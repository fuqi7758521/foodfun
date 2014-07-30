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
<title>即将发布 | 云游游美食坊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<%=request.getContextPath() %>/pages/general/assets/font/Open+Sans.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/font-awesome/css/font-awesome.min.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/css/bootstrap.min.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/uniform/css/uniform.default.css"   rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style-metronic.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/style-responsive.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/plugins.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/pages/coming-soon.css"   rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/themes/default.css"   rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=request.getContextPath() %>/pages/general/assets/css/custom.css"   rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/pages/general/assets/img/favicon1.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
<div class="container">
	<div class="row">
		<div class="col-md-12 coming-soon-header">
			<a class="brand" href="<%=request.getContextPath() %>/index.html"  >
				<img src="<%=request.getContextPath() %>/pages/general/assets/img/logo.png"   alt="logo"/>
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 coming-soon-content">
			<i class="fa fa-android icon-size" style="color:#80BD01;"></i>
			<i class="fa fa-apple icon-size" style="margin-left:10px;"></i>
			<h1>即将火爆发布!</h1>
			
			<br>
			
			<ul class="social-icons margin-top-20">
				
			</ul>
		</div>
		<div class="col-md-6 coming-soon-countdown">
			<div id="defaultCountdown">
			</div>
		</div>
	</div>
	<!--/end row-->
	<div class="row">
		<div class="col-md-12 coming-soon-footer">
			 2014 &copy; 云游游 ALL Rights Reserved. 
		</div>
	</div>
</div>
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/respond.min.js"  ></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/excanvas.min.js"  ></script> 
<![endif]-->
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-1.10.2.min.js"   type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/countdown/jquery.countdown.min.js"   type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/backstretch/jquery.backstretch.min.js"   type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath() %>/pages/general/assets/scripts/custom/coming-soon.js"   type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {
  ComingSoon.init();
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>