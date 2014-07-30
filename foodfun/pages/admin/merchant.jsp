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
<title>店家管理 | 云游游美食坊</title>
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
								店家
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
					<div class="portlet box purple">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-truck"></i>店家
							</div>
							<div class="actions">
								<a id="add_btn" data-toggle="modal" class="btn green" role="button" href="#addMerchant"><i class="fa fa-plus"></i> 添加</a>
								<a id="edit_btn" data-toggle="modal" class="btn yellow" role="button" href="javascript:;"><i class="fa fa-pencil"></i> 编辑</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table id="merchantTable" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										ID
									</th>
									<th>
										名称
									</th>
									<th>
										电话
									</th>
									<th>
										 网站
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
	
	
	<!-- BEGIN ADD USER-->
	<div id="addMerchant" class="modal fade" role="basic" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3>添加</h3>
				</div>
				<form id="addForm" class="form-body" action="#" role="from">
					<div class="modal-body">
							<div class="form-group">
								<div class="input-icon">
									<i class="fa fa-truck"></i>
									<input type="text" placeholder="名称" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-building-o"></i>
									<input type="text" placeholder="地址" class="form-control" name="address">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-rss-square"></i>
									<input type="text" placeholder="网址" class="form-control" name="website">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-phone"></i>
									<input type="text" placeholder="电话" class="form-control" name="phone">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa  fa-bell-o"></i>
									<input type="text" placeholder="公告" class="form-control" name="remark">
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
		<!-- END ADD USER -->
		
		
		
	<!-- BEGIN EDIT USER-->
	<div id="editMerchant" class="modal fade" role="basic" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3>编辑</h3>
				</div>
				<form id="editForm" class="form-body" action="#" role="from">
					<div class="modal-body">
							<input type="hidden" id="merchantId" name="id">
							<div class="form-group">
								<div class="input-icon">
									<i class="fa fa-truck"></i>
									<input id="name" type="text" placeholder="名称" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-male"></i>
									<input id="address" type="text" placeholder="地址" class="form-control" name="address">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-envelope"></i>
									<input id="website" type="text" placeholder="网站" class="form-control" name="website">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon">
									<i class="fa fa-phone"></i>
									<input id="phone" type="text" placeholder="电话" class="form-control" name="phone">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon">
									<i class="fa  fa-bell-o"></i>
									<input id="remark" type="text" placeholder="公告" class="form-control" name="remark">
								</div>
							</div>
							<div class="form-group">
								<select id="status" name="status" class="form-control">
											<option value="1">有效</option>
											<option value="0">无效</option>
								</select>
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
		<!-- END EDIT USER -->
	
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
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/additional-methods.min.js" type="text/javascript"></script>
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
   merchantInit();
});


var oTable;
var trData;
function merchantInit(){
	
	$("#merchantTable tbody tr").live("click",function () {
		$(this).siblings().removeClass("row_selected");
	  		$(this).addClass("row_selected");
	  		trData = oTable.fnGetData(this);
 	}).live("mouseenter",function(){
	 	$(this).siblings().removeClass("row_hover");
  	 	$(this).addClass("row_hover");
 	}).live("mouseleave",function(){
		$(this).removeClass("row_hover");
 	});
	
	oTable = $('#merchantTable').dataTable({
		"aLengthMenu":[100,200,300],
		"iDisplayLength":100,
		"bFilter": false, //是否启用客户端过滤器
        "bSort": false, //排序功能
        "bInfo": true,//页脚信息
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "<%=request.getContextPath() %>/admin/merchant/listTable.html",
		"sServerMethod": "POST",
		"aoColumns": [
			{ "mData": "id" },
			{ "mData": "name" },
			{ "mData": "phone" },
			{ "mData": "website" },
			{ "mDataProp": function(obj) {
				if(obj['status'] == 0){
					return '<i class="fa fa-times-circle" style="color:#D84A38"></i> 无效';
				}else{
					return '<i class="fa fa-check-circle" style="color:#35AA47"></i> 有效';
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
	
	
	$("#addForm").validate({
		errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        ajaxFormValidation:true,
        rules: {
        	name: {
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
				url: '<%=request.getContextPath() %>/admin/merchant/addOrUpdate.html',
				type: 'POST',
				data:$("#addForm").serialize(),
				dataType:"text",
				cache : false,
				success: function(json){
					//关闭form表单
					if(json==300){
						toastr.options = {"positionClass": "toast-top-center"};
						toastr["error"]("", "添加失败");
						return false;
					}else{
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000};
						toastr["success"]("", "添加成功");
					}
					$('#addMerchant').modal('hide');
					$('#addForm input').val('');
					//oTable.fnPageChange('first', true);
					oTable.fnPageChange(oTable_refresh(oTable),true);
				}
			});
            return true;
        },
		messages: {
			name: {
				required: "请填写店名"
			}
		}
	});
	
	
	$("#editForm").validate({
		errorElement: 'span', //default input error message container
        errorClass: 'help-block', // default input error message class
        ajaxFormValidation:true,
        rules: {
        	name: {
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
		submitHandler:function (form) {
			$.ajax({
				url: '<%=request.getContextPath() %>/admin/merchant/addOrUpdate.html',
				type: 'POST',
				data:$("#editForm").serialize(),
				dataType:"text",
				cache : false,
				success: function(json){
					//关闭form表单
					if(json==300){
						toastr.options = {"positionClass": "toast-top-center"};
						toastr["error"]("", "更新失败");
						return false;
					}else{
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000};
						toastr["success"]("", "更新成功");
					}
					$('#editMerchant').modal('hide');
					$('#editForm input').val('');
					//oTable.fnPageChange('first', true);
					oTable.fnPageChange(oTable_refresh(oTable),true);
				}
			});
            return true;
        },
		messages: {
			name: {
				required: "请填写店名"
			}
		}
	});
	
	
	
	//修改
	$("#edit_btn").click(function () {
		//如果选中，可以弹出修改对话框
        if (trData!=null) {
            $("#editMerchant").modal('show');
            $("#merchantId").val(trData["id"]);
            $("#name").val(trData["name"]);
            $("#phone").val(trData["phone"]);
            $("#address").val(trData["address"]);
            $("#website").val(trData["website"]);
            $("#remark").val(trData["remark"]);
            $("#status").val(trData["status"]);
        }
	});
}

</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>