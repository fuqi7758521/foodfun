<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>我的账户 | 云游游美食坊</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta content="fuqi7758521@gmail.com" name="author">
  <link href="<%=request.getContextPath() %>/pages/general/assets/img/favicon1.ico" rel="SHORTCUT ICON" type="image/ico">

  <!-- Fonts START -->
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
  <!-- Fonts END -->
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style-responsive.css" rel="stylesheet" type="text/css">  
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/custom.css" rel="stylesheet" type="text/css">
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
    
   	<!-- BEGIN HEADER-->
    	<jsp:include page="header.jsp"/>
	<!-- END HEADER-->

	<!-- BEGIN MAIN -->
	<div class="main">
      <div class="container" style="margin-bottom: 145px;">
        <ul class="breadcrumb">
            <li><a href="<%=request.getContextPath() %>/index.html">首页</a></li>
            
            <li class="active">我的账户</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix active"><a href="<%=request.getContextPath() %>/general/myAccount.html"><i class="fa fa-user"></i> 我的账户</a></li>
              <li class="list-group-item clearfix"><a href="<%=request.getContextPath() %>/general/myOrders.html"><i class="fa fa-shopping-cart"></i> 我的订单</a></li>
              <li class="list-group-item clearfix"><a href="<%=request.getContextPath() %>/general/myCharges.html"><i class="fa fa-cny"></i> 我的充值</a></li>
              
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            
            <div class="content-form-page">
              <div class="row">
                <div class="col-md-7 col-sm-7">
                  <form role="form" class="form-horizontal form-without-legend">
                    <div class="form-group">
                      <label class="col-lg-4 control-label" >用户名 </label>
                      <div class="col-lg-8">
                        <input type="text" id="email" readonly class="form-control" value="${user.username }">
                      </div>
                    </div>
                    <div class="form-group">
                      <label class="col-lg-4 control-label" >实名 </label>
                      <div class="col-lg-8">
                        <input type="text" id="password" readonly class="form-control" value="${user.realname }">
                      </div>
                    </div>
					<div class="form-group">
                      <label class="col-lg-4 control-label" >余额 </label>
                      <div class="col-lg-8">
                        <input type="text" id="password" readonly  class="form-control" value="${user.balance }">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-offset-4 padding-left-0">
                        <span style="margin-right:36px;"><i class="fa fa-cny" style="margin-right:3px;color:#CC3304;"></i><a href="#chargeModal" data-toggle="modal">充值</a></span>
						<span><i class="fa fa-lock" style="margin-right:3px;color:#CC3304;"></i><a href="#changePassword" data-toggle="modal">修改密码</a></span>
                      </div>
                    </div>
                  </form>
                </div>
           
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>
	<!-- END MAIN -->
    

    <!-- BEGIN FOOTER -->
		<input type="hidden" id="userId" value="${user.id}">
	<!-- END FOOTER -->

   <!-- BEGIN CHARGE MODAL -->
    <div aria-hidden="true" role="dialog" tabindex="-1" id="chargeModal" class="modal fade bs-modal-sm" style="display: none;">
				<form action="<%=request.getContextPath() %>/general/doCharge.html" method="post">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button aria-hidden="true" data-dismiss="modal" class="close" type="button"></button>
							<h4 class="modal-title">充值</h4>
						</div>
						<div class="modal-body input-icon">
							  <i class="fa fa-cny"></i>
							  <input class="form-control input-medium" name="money" placeholder="充值金额">
						</div>
						<div class="modal-footer">
							<button data-dismiss="modal" class="btn default" type="button">关闭</button>
							<button class="btn blue" type="submit">提交</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			 </form>
			<!-- /.modal-dialog -->
	</div>
 	<!-- END CHARGE MODAL -->
 	
 	
 	<!-- BEGIN EDIT MENU-->
	<div id="changePassword" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3>修改密码</h3>
				</div>
				<form id="changePassForm" class="form-body" action="#" role="from">
					<div class="modal-body">
							<div class="form-group">
								<div class="input-icon">
									<i class="fa fa-key"></i>
									<input id="oldPassword" type="password" placeholder="原密码" class="form-control" name="oldPassword">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-key"></i>
									<input id="newPassword" type="password" placeholder="新密码" class="form-control" name="newPassword">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-key"></i>
									<input id="confirmPassword" type="password" placeholder="确认密码" class="form-control" name="confirmPassword">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">提交</button>
							<button type="button" class="btn" data-dismiss="modal">取消</button>
						</div>
				</form>
			</div>
		</div>
	</div>
		<!-- END EDIT MENU -->
	
	<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js"  type="text/javascript"></script>  
    <script type="text/javascript">
        jQuery(document).ready(function() {
            
            $("#changePassForm").validate({
    			errorElement: 'span', //default input error message container
                errorClass: 'help-block', // default input error message class
                ajaxFormValidation:true,
    			rules: {
    					oldPassword: {
    						required: true,
    						remote: {
    							type: "post",
    							url: "<%=request.getContextPath() %>/general/validatePassword.html",
    							data: {
	    							password: function() {
	    							return $("#oldPassword").val();
	    						}
    						},
    						dataType: "text",
    						dataFilter: function(data, type) {
    						if (data == "ok")
    						    return true;
    						else
    						    return false;
    						}
    					}
    				},
	    				newPassword: {
	    					required: true
	    				},
	    				confirmPassword: {
	    					required:true,
	    					equalTo: "#newPassword"
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
    					url: '<%=request.getContextPath() %>/general/changePassword.html',
    					type: 'POST',
    					data:$("#changePassForm").serialize(),
    					dataType:"text",
    					cache : false,
    					success: function(result){
    						if(result == 200){
    							toastr["success"]("修改成功！");
    						}else if(result == 301){
    							toastr["warning"]("您尚未登录，请登录！");
    						}else{
    							toastr["error"]("修改失败！");
    						}
    						$("#changePassForm input").val("");//清空表单
    						$('#changePassword').modal('toggle');
    					}
    				});
                    return true;
                },
    			messages: {
                	oldPassword: {
    					required: "需要填写",
    					remote: "密码错误"
    				},
    				newPassword:{
    					required:"需要填写"
    				},
    				confirmPassword:{
    					required: "需要填写",
    					equalTo: "必须一致"
    				}
    			}
    		});
            
        });
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>