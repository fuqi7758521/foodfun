<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>我的订单 | 云游游美食坊</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link href="<%=request.getContextPath() %>/pages/general/assets/img/favicon1.ico" rel="SHORTCUT ICON" type="image/ico">

<!-- Fonts START -->
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/font-awesome/css/font-awesome.min.css"   rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/css/bootstrap.css"   rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/admin/assets/plugins/bootstrap-toastr/toastr.min.css"  rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/datatable/DT_bootstrap.css"  rel="stylesheet" type="text/css" />
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style-metronic.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/style-responsive.css" rel="stylesheet" type="text/css">  
  <link href="<%=request.getContextPath() %>/pages/general/assets/css/custom.css"   rel="stylesheet" type="text/css">
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
    
    <!-- BEGIN HEADER-->
    	<jsp:include page="header.jsp"/>
	<!-- END HEADER-->

	<!-- BEGIN MAIN -->
	<div class="main">
      <div class="container">
        <ul class="breadcrumb">
            <li><a href="<%=request.getContextPath() %>/index.html">首页</a></li>
            
            <li class="active">我的订单</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-3">
            <ul class="list-group margin-bottom-25 sidebar-menu">
              <li class="list-group-item clearfix "><a href="<%=request.getContextPath() %>/general/myAccount.html"><i class="fa fa-user"></i> 我的账户</a></li>
              <li class="list-group-item clearfix active"><a href="<%=request.getContextPath() %>/general/myOrders.html"><i class="fa fa-shopping-cart"></i> 我的订单</a></li>
              <li class="list-group-item clearfix"><a href="<%=request.getContextPath() %>/general/myCharges.html"><i class="fa fa-cny"></i> 我的充值</a></li>
              
            </ul>
          </div>
          <!-- END SIDEBAR -->

          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-9">
            <div class="content-form-page">
              <div class="row">
                <div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-shopping-cart"></i>我的订单
							</div>
							
						</div>
						<div class="portlet-body flip-scroll" style="display: block;">
							<table id="myOrdersTable" class="table table-bordered table-striped table-condensed flip-content">
							<thead class="flip-content">
							<tr>
								<th width="10%">
									 订单号
								</th>
								<th width="20%">
									 下单时间
								</th>
								<th>
									 详情
								</th>
								<th width="10%" class="numeric">
									 总价
								</th>
								<th width="10%">
									 操作
								</th>
							</tr>
							</thead>
							<tbody>
							</tbody>
							</table>
						</div>
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

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/datatable/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/datatable/table-advanced.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/datatable/DT_bootstrap.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/admin/assets/scripts/custom/foodfunUtils.js" type="text/javascript"></script>

    <script type="text/javascript">
        jQuery(document).ready(function() {
            myOrdersInit();
        });
        
        var oTable;
        function myOrdersInit(){
        	
        	oTable = $('#myOrdersTable').dataTable({
    			"aLengthMenu":[10,20,30],
    			"bFilter": false, //是否启用客户端过滤器
                "bSort": false, //排序功能
                "bInfo": true,//页脚信息
    			"bProcessing": true,
    			"bServerSide": true,
    			"sAjaxSource": "<%=request.getContextPath() %>/general/myOrdersTable.html",
    			"sServerMethod": "POST",
    			"aoColumns": [
    				{ "mData": "id" },
    				{ "mData": "createdDateStr" },
    				{ "mData": "des" },
    				{ "mData": "money" },
    				{ "mDataProp": function(obj) {
    					if(obj['status'] == 0){
    						return '<i class="fa fa-exclamation-triangle" style="color:#FFB848"></i> <a orderId="'+obj['id']+'"href="javascript:;" onclick="undoOrder(this)">取消</a>';
    					}else if(obj['status'] == 1){
    						return '<i class="fa fa-times-circle" style="color:#D84A38"></i> 无效';
    					}else{
    						return '<i class="fa fa-check-circle" style="color:#35AA47"></i> 已完成';
    					}
    			  		}
    				}
    			],
    			"fnServerParams": function (aoData) {
    				aoData.push( { "name": "userId","value": $('#userId').val()} );
    			},
    			"fnServerData": function ( sSource, aoData, fnCallback) {
    				$.post(sSource, aoData, function (json) {
    					if(json=="timeout\r\n"){
    						window.location.reload();
    					}else if(json=="no\r\n"){
    						$("#timeOut").modal("show");
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
    	}
        
        function undoOrder(obj){
        	var $this = $(obj);
        	var orderId = $this.attr('orderId');
        	var url = "<%=request.getContextPath() %>/general/undoOrder.html";
        	$.post(url,{id:orderId},function(result){
        		if(result == 200){
        			toastr["success"]("取消成功！");
        			oTable.fnPageChange(oTable_refresh(oTable),true);
        			//window.location.reload();
        		}else if(result == 304){
        			toastr["warning"]("已经下单不能取消！");
        		}else if(result == 1){
        			toastr["warning"]("已经被取消！");
        		}else if(result == 300){
        			toastr["error"]("取消失败！");
        		}
        	});
        }
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>