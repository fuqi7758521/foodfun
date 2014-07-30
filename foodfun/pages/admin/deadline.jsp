<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset=UTF-8"utf-8"/>
<title>订餐截止时间设置 | 云游游美食坊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<!-- Fonts START -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
<!-- Fonts END -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.css"  rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style-metronic.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/plugins.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/print.css"   rel="stylesheet" type="text/css" media="print"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/pages/admin/assets/img/favicon1.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<jsp:include page="header.jsp"/>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<jsp:include page="sidebar.jsp"/>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<ul class="page-breadcrumb breadcrumb">
						<li>
							<i class="fa fa-home"></i>
							<a href="<%=request.getContextPath() %>/admin/index.html"  >
								首页
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								订餐截止时间设置
							</a>
						</li>
				
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12 ">
					<!-- BEGIN SAMPLE FORM PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>
							</div>
							<div class="tools">
								<a class="collapse" href="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form id="editForm" role="form" action="#">
								<div class="form-body">
									<div class="form-group">
										<label>截止时间</label>
										<div class="input-icon">
											<i class="fa fa-bell-o"></i>
											<input name="deadline" type="text" class="form-control" value="${ deadline}">
										</div>
									</div>
								</div>
								<div class="form-actions">
									<button class="btn blue" type="submit">更新</button>
									<button class="btn default" type="button">取消</button>
								</div>
							</form>
						</div>
					</div>
					<!-- END SAMPLE FORM PORTLET-->
			</div>
			<div class="clearfix">
			</div>
			
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/respond.min.js"  ></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/excanvas.min.js"  ></script> 
<![endif]-->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/additional-methods.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/index.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   Index.init();
   
   $("#editForm").validate({
	   errorElement: 'span', //default input error message container
       errorClass: 'help-block', // default input error message class
       ajaxFormValidation:true,
		rules: {
			deadline: {
				required: true,
			}
		},
		highlight: function (element) { // hightlight error inputs
           $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
       },

       unhighlight: function (element) { // revert the change done by hightlight
           $(element)
               .closest('.form-group').removeClass('has-error'); // set error class to the control group
       },
		submitHandler: function (form) {
			$.ajax({
				url: '<%=request.getContextPath() %>/admin/updateDeadline.html',
				type: 'POST',
				data:$("#editForm").serialize(),
				dataType:"text",
				cache : false,
				success: function(json){
					if(json==300){
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000, "closeButton": true};
						toastr["error"]("", "更新失败");
					}else{
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000, "closeButton": true};
						toastr["success"]("", "更新成功");
					}
				}
			});
           return true;
       },
		messages: {
			deadline: {
				required: "不能为空"
			}
		}
	});
});
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>