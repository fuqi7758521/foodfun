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
<title>订单管理 | 云游游美食坊</title>
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
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.css"  rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/DT_bootstrap.css"  rel="stylesheet" type="text/css" />
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
							<a href="<%=request.getContextPath() %>/admin/index.html"  >
								首页
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a href="#">
								订单管理
							</a>
						</li>
				
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>
			<!-- END PAGE HEADER-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN SAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-shopping-cart"></i>订单
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table id="ordersTable" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										订单号
									</th>
									<th>
										实名
									</th>
									<th>
										详情
									</th>
									<th>
										总价
									</th>
									<th>
										 下单时间
									</th>
									<th>
										 状态
									</th>
								</tr>
								</thead>
								<tbody>
								</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- END SAMPLE TABLE PORTLET-->
				</div>
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
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN DATATABLE -->
   	<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
   	<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/table-advanced.js" type="text/javascript"></script>
   	<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/DT_bootstrap.js" type="text/javascript"></script>
<!-- END DATATABLE -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/index.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/foodfunUtils.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   Index.init();
   ordersInit();
});

var oTable;
function ordersInit(){
	
	jQuery('#ordersTable .group-checkable').change(function () {
		var set = jQuery(this).attr("data-set");
		var checked = jQuery(this).is(":checked");
		jQuery(set).each(function () {
		if (checked) {
		$(this).attr("checked", true);
		$(this).parents('tr').addClass("active");
		} else {
		$(this).attr("checked", false);
		$(this).parents('tr').removeClass("active");
		}
		});
		jQuery.uniform.update(set);
		}); 
	
	 jQuery('#ordersTable').on('change', 'tbody tr .checkboxes', function(){
		 $(this).parents('tr').toggleClass("active");
		 }); 
	
	oTable = $('#ordersTable').dataTable({
		"aLengthMenu":[50,100,200],
		"iDisplayLength":50,
		"bFilter": false, //是否启用客户端过滤器
        "bSort": false, //排序功能
        "bInfo": true,//页脚信息
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "<%=request.getContextPath() %>/admin/order/orderTable.html",
		"sServerMethod": "POST",
		"aoColumns": [
			{ "mData": "id"},
			{ "mData": "userRealname"},
			{ "mData": "des"},
			{ "mData": "money"},
			{ "mData": "createdDateStr"},
			{ "mDataProp": function(obj) {
				if(obj['status'] == 0){
					return '<i class="fa fa-exclamation-triangle" style="color:#FFB848"></i> <a orderId="'+obj['id']+'" onclick="orderPass(this)" href="javascript:;">通过</a><a orderId="'+obj['id']+'" onclick="orderNotPass(this)" href="javascript:;"> 取消</a>';
				}else if(obj['status'] == 1){
					return '<i class="fa fa-times-circle" style="color:#D84A38"></i> 无效';
				}else{
					return '<i class="fa fa-check-circle" style="color:#35AA47"></i> 已确认';
				}
		  		}
			}
		],
		"fnServerParams": function (aoData) {
		},
		"fnServerData": function ( sSource, aoData, fnCallback) {
			$.post(sSource, aoData, function (json) {
				if(json=="timeout\r\n"){
					window.location.reload();
				}else if(json=="no\r\n"){
					var data={ iTotalDisplayRecords:0, iTotalRecords:0, aaData:""};
					fnCallback(data);
				}else{
					fnCallback(json);
				}
			});
		 },
		 "oLanguage": {                          //汉化   
	            "sLengthMenu": "每页显示 _MENU_ 条记录",   
	            "sZeroRecords": "没有充值记录",   
	            "sInfo": "数据为从第 _START_ 到第 _END_ 条数据；总共有 _TOTAL_ 条记录",   
	            "sInfoEmtpy": "没有数据",   
	            "sProcessing": "正在加载数据...",   
	            "oPaginate": 
	            {   
	                "sFirst": "第一页",   
	                "sPrevious": "上一页",   
	                "sNext": "下一页",   
	                "sLast": "最后一页"  
	            }   
	        }
	});
	
	//checkbox选择
	$("#orderCheckd").click(function(){
        $("input[name='orderIds']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    });
}

function orderPass(obj){
	var $this = $(obj);
	var orderId = $this.attr('orderId');
	var url = "<%=request.getContextPath() %>/admin/order/update.html";
	$.post(url, {id:orderId, status:2}, function(result){
		if(result == 200){
			toastr.options = {"timeOut": 2000, "closeButton": true};
			toastr["success"]("操作成功！");
			//oTable.fnPageChange('first', true);
			oTable.fnPageChange(oTable_refresh(oTable),true);
		}else if(result == 305){
			toastr.options = {"timeOut": 2000, "closeButton": true};
			toastr["warning"]("订单已取消！");
			//oTable.fnPageChange('first', true);
			oTable.fnPageChange(oTable_refresh(oTable),true);
		}
	});
}

function orderNotPass(obj){
	var $this = $(obj);
	var orderId = $this.attr('orderId');
	var url = "<%=request.getContextPath() %>/admin/order/update.html";
	$.post(url, {id:orderId, status:1}, function(result){
		if(result == 200){
			toastr.options = {"timeOut": 2000, "closeButton": true};
			toastr["success"]("操作成功");
			//oTable.fnPageChange('first', true);
			oTable.fnPageChange(oTable_refresh(oTable),true);
		}
	});
}

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>