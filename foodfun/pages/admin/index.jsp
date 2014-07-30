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
<title>后台管理 | 云游游美食坊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<!-- Fonts START -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
<!-- Fonts END -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style-metronic.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/plugins.css"  rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/print.css"   rel="stylesheet" type="text/css" media="print"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
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
							<a href="index.html"  >
								首页
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								今日订餐
							</a>
						</li>
				
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<!-- BEGIN DASHBOARD STATS -->
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="dashboard-stat blue">
						<div class="visual">
							<i class="fa fa-cny"></i>
						</div>
						<div class="details">
							<div class="number">
								 ${totalMoneyOfToday}
							</div>
							<div class="desc">
								今日订餐总金额
							</div>
						</div>
						<a class="more" href="<%=request.getContextPath() %>/admin/order/listPage.html">
							详情 <i class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="dashboard-stat green">
						<div class="visual">
							<i class="fa fa-shopping-cart"></i>
						</div>
						<div class="details">
							<div class="number">
								  ${totalOrderCountOfToday}
							</div>
							<div class="desc">
								今日总订单数
							</div>
						</div>
						<a class="more" href="<%=request.getContextPath() %>/admin/order/listPage.html">
							详情 <i class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="dashboard-stat purple">
						<div class="visual">
							<i class="fa fa-globe"></i>
						</div>
						<div class="details">
							<div class="number">
								 ${totalChargeOfToday}
							</div>
							<div class="desc">
								今日充值
							</div>
						</div>
						<a class="more" href="<%=request.getContextPath() %>/admin/charge/listPage.html">
							详情<i class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="dashboard-stat yellow">
						<div class="visual">
							<i class="fa fa-bar-chart-o"></i>
						</div>
						<div class="details">
							<div class="number">
								  ${totalBalance}
							</div>
							<div class="desc">
								总余额
							</div>
						</div>
						<a class="more" href="<%=request.getContextPath() %>/admin/user/listPage.html">
							详情 <i class="m-icon-swapright m-icon-white"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- END DASHBOARD STATS -->
			<div class="clearfix">
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-shopping-cart"></i>今日订单统计
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 店家
									</th>
									<th>
										 菜品
									</th>
									<th>
										 单价(元)
									</th>
									<th>
										 份数
									</th>
									<th>
										 总计(元)
									</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${todayOrderDetailOverview }" var="to" varStatus="vars">
									<tr class="${showType[vars.index % 4]}">
										<td>
											 ${vars.index + 1 }
										</td>
										<td>
											${to.merchantName }
										</td>
										<td>
											${to.menuName }
										</td>
										<td>
											 ${to.price }
										</td>
										<td>
											 ${to.count }
										</td>
										<td>
											 ${to.sumMoney }
										</td>
									</tr>
								</c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END DASHBOARD STATS -->
			<div class="clearfix">
			</div>
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box purple">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>今日充值
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										实名
									</th>
									<th>
										 金额(元)
									</th>
									<th>
										 充值时间
									</th>
									<th>
										 状态
									</th>
								</tr>
								</thead>
								<tbody>
								<c:if test="${totalAllChargeOfToday != null }">
									<c:forEach items="${totalAllChargeOfToday }" var="to" varStatus="vars">
										<tr class="${showType[vars.index % 4]}">
											<td>
											  ${vars.index + 1 }
											</td>
											<td>
												${to.userRealname }
											</td>
											<td>
												${to.money }
											</td>
											<td>
												 ${to.chargedDateStr }
											</td>
											<td>
											  <c:if test="${to.status == 0 }"><i class="fa fa-exclamation-triangle" style="color:#FFB848"></i>
											  <a href="javascript:;" chargeLogId="${to.id}" status="2" onclick="confirmCharge(this)"> 通过</a>
											  <a href="javascript:;" chargeLogId="${to.id}" status="1" onclick="confirmCharge(this)"> 不通过</a>
											  </c:if>
											  <c:if test="${to.status == 1 }"><i class="fa fa-times-circle" style="color:#D84A38"></i> 无效</c:if>
											  <c:if test="${to.status == 2 }"><i class="fa fa-check-circle" style="color:#35AA47"></i> 已确认</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
			</div>
			<!-- END DASHBOARD STATS -->
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
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/index.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   Index.init();
   
});

function confirmCharge(obj){
	var $this = $(obj);
	var chargeLogId = $this.attr("chargeLogId");
	var status = $this.attr("status");
	
	bootbox.confirm("确定提交?", function(result) {
		   if(result == true){
		   	var url = "<%=request.getContextPath() %>/admin/charge/update.html";
		   	$.post(url, {chargeLogId:chargeLogId, status:status},function(data){
		   		location.href="<%=request.getContextPath() %>/admin/index.html";
		   	});
		   }
    });
}

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>