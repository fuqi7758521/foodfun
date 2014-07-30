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
<title>菜单管理 | 云游游美食坊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport"/>
<!-- Fonts START -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/pages/admin/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
<!-- Fonts END -->
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet"> 
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.css"  rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/DT_bootstrap.css"  rel="stylesheet" type="text/css" />
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
								菜单
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
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-calendar"></i>菜单
							</div>
							<div class="actions">
								<a id="add_btn" data-toggle="modal" class="btn red" role="button" href="#addMenu"><i class="fa fa-plus"></i> 添加</a>
								<a id="edit_btn" data-toggle="modal" class="btn yellow" role="button" href="javascript:;"><i class="fa fa-pencil"></i> 编辑</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table id="table" class="table table-bordered table-hover">
								<thead>
								<tr>
									<th>
										名称
									</th>
									<th>
										价格
									</th>
									<th>
										图片
									</th>
									<th>
										所属店家
									</th>
									<th>
										添加时间
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
	
	
	<!-- BEGIN ADD MENU-->
	<div id="addMenu" class="modal fade" role="basic" tabindex="-1">
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
									<i class="fa fa-calendar"></i>
									<input type="text" placeholder="菜名" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-cny"></i>
									<input type="text" placeholder="价格" class="form-control" name="price">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-picture-o"></i>
									<span class="btn btn-success fileinput-button">
        								<span>添加图片</span>
        								<input type="file" id="fileupload">
    								</span>
        							<i class="fa fa-picture-o"></i>
        							<input type="text" class="form-control" placeholder="图片" id="imgUrl" name="imgUrl">	
								</div>
							</div>
							<div class="form-group">
								<select name="merchantId" class="form-control">
											<c:forEach items="${merchants}" var="to">
												<option value="${to.id }">${to.name }</option>
											</c:forEach>
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
		<!-- END ADD MENU -->
		
		
		
	<!-- BEGIN EDIT MENU-->
	<div id="editMenu" class="modal fade" role="basic" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h3>编辑</h3>
				</div>
				<form id="editForm" class="form-body" action="#" role="from">
					<div class="modal-body">
							<input type="hidden" id="menuId" name="id">
							<div class="form-group">
								<div class="input-icon">
									<i class="fa fa-calendar"></i>
									<input id="name" type="text" placeholder="菜名" class="form-control" name="name">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-cny"></i>
									<input id="price" type="text" placeholder="价格" class="form-control" name="price">
								</div>
							</div>
							<div class="form-group">
								<div class="input-icon ">
									<i class="fa fa-picture-o"></i>
									<span class="btn btn-success fileinput-button">
        								<span>添加图片</span>
        								<input type="file" id="fileupload2">
    								</span>
        							<i class="fa fa-picture-o"></i>
        							<input type="text" class="form-control" placeholder="图片" id="imgUrl2" name="imgUrl">	
								</div>
							</div>
							<div class="form-group">
								<select id="merchantId" name="merchantId" class="form-control">
											<c:forEach items="${merchants }" var="to">
												<option value="${to.id }">${to.name }</option>
											</c:forEach>
								</select>
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
		<!-- END EDIT MENU -->
	
	
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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/fancybox/source/jquery.fancybox.pack.js"  ></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/jquery-validation/dist/additional-methods.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/table-advanced.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/plugins/datatable/DT_bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/index.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/foodfunUtils.js" type="text/javascript"></script>

<script>
jQuery(document).ready(function() {    
   App.init(); // initlayout and core plugins
   Index.init();
   menusInit();
   $('.fancybox').fancybox();
});

var oTable;
var trData;
function menusInit(){
	
	$("#table tbody tr").live("click",function () {
		$(this).siblings().removeClass("row_selected");
	  		$(this).addClass("row_selected");
	  		trData = oTable.fnGetData(this);
 	}).live("mouseenter",function(){
	 	$(this).siblings().removeClass("row_hover");
  	 	$(this).addClass("row_hover");
 	}).live("mouseleave",function(){
		$(this).removeClass("row_hover");
 	});
	
	oTable = $('#table').dataTable({
		"aLengthMenu":[100,200,300],
		"iDisplayLength":100,
		"bFilter": false, //是否启用客户端过滤器
        "bSort": false, //排序功能
        "bInfo": true,//页脚信息
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "<%=request.getContextPath() %>/admin/menu/listTable.html",
		"sServerMethod": "POST",
		"aoColumns": [
			{ "mData": "name" },
			{ "mData": "price" },
			{ "mDataProp": function(obj) {
				return '<a href="'+obj['imgUrl']+'" class="fancybox"><img width=40px height=40px src="'+obj['imgUrl']+'"></a>';
		  		}
			},
			{ "mData": "merchantName"},
			{ "mData": "createdDateStr"},
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
        errorClass: 'help-inline', // default input error message class
        ajaxFormValidation:true,
		rules: {
			name: {
				required: true,
			},
			price: {
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
				url: '<%=request.getContextPath() %>/admin/menu/addOrUpdate.html',
				type: 'POST',
				data:$("#addForm").serialize(),
				dataType:"text",
				cache : false,
				success: function(json){
					//关闭form表单
					if(json==300){
						toastr.options = {"positionClass": "toast-top-center"};
						toastr["error"]("添加失败");
						return false;
					}else{
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000};
						toastr["success"]("添加成功");
					}
					$('#addMenu').modal('hide');
					$('#addForm input').val('');
					//oTable.fnPageChange('first', true);
					oTable.fnPageChange(oTable_refresh(oTable),true);

				}
			});
            return true;
        },
		messages: {
			name: {
				required: "请填写菜单名"
			},
			price: {
				required: "请填写价格"
			}
		}
	});
	
	
	$("#editForm").validate({
		errorElement: 'span', //default input error message container
        errorClass: 'help-inline', // default input error message class
        ajaxFormValidation:true,
		rules: {
			name: {
				required: true,
			},
			price: {
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
				url: '<%=request.getContextPath() %>/admin/menu/addOrUpdate.html',
				type: 'POST',
				data:$("#editForm").serialize(),
				dataType:"text",
				cache : false,
				success: function(json){
					if(json==300){
						toastr.options = {"positionClass": "toast-top-center"};
						toastr["error"]("", "更新失败");
						return false;
					}else{
						toastr.options = {"positionClass": "toast-top-center", "timeOut": 2000, "closeButton": true};
						toastr["success"]("", "更新成功");
					}
					$('#editMenu').modal('hide');
					$('#editForm input').val('');
					//oTable.fnPageChange('first', true);
					oTable.fnPageChange(oTable_refresh(oTable),true);

				}
			});
            return true;
        },
		messages: {
			name: {
				required: "请填写菜单名"
			},
			price: {
				required: "请填写价格"
			}
		}
	});
	
	
	
	//修改
	$("#edit_btn").click(function () {
		//如果选中，可以弹出修改对话框
        if (trData!=null) {
            $("#editMenu").modal('show');
            $("#menuId").val(trData["id"]);
            $("#name").val(trData["name"]);
            $("#price").val(trData["price"]);
            $("#imgUrl").val(trData["imgUrl"]);
            $("#merchantId").val(trData["merchantId"]);
            $("#status").val(trData["status"]);
        }
	});
}


$(function () {
	var url = '<%=request.getContextPath() %>/admin/menu/uploadImg.html';
	$('#fileupload').fileupload({
	url: url,
	dataType: 'text',
	done: function (e, data) {
		$('#imgUrl').val(data.result);
    }
	});
	
	
	$('#fileupload2').fileupload({
	url: url,
	dataType: 'text',
	done: function (e, data) {
		$('#imgUrl2').val(data.result);
    }
	});
}); 
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>