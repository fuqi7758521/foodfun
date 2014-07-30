<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="funcs" uri="funcs" %>
<link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css"/>
<!-- BEGIN TOP BAR -->
<div class="pre-header">
	<div class="container">
		<div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
					<ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span>订餐时间截至到${deadline}，预订从速！</span></li>
						<li>
						<a href="<%=request.getContextPath() %>/general/comingSoon.html"><i class="fa fa-android" style="color:#80BD01"></i></a>
						<a href="<%=request.getContextPath() %>/general/comingSoon.html"><i class="fa fa-apple"></i></a>
						</li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
                    	<c:if test="${user != null }">
						    <li>您好,${user.realname}！<a href="<%=request.getContextPath() %>/general/logout.html" >[退出]</a></li>
                    	</c:if>
                        <li><a href="<%=request.getContextPath() %>/general/myAccount.html">我的帐户</a></li>
						<li><a href="<%=request.getContextPath() %>/general/myOrders.html">我的订单</a></li>
						<c:if test="${user == null }">
                        	<li><a href="<%=request.getContextPath() %>/general/login.html">登录</a></li>
						</c:if>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
	</div>        
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
    <div role="navigation" class="navbar header no-margin">
        <div class="container">
            <div class="navbar-header">
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <a href="<%=request.getContextPath() %>/index.html"   class="navbar-brand"><img src="<%=request.getContextPath() %>/pages/general/assets/img/logo.png" ></a><!-- LOGO -->
            </div>
            <!-- BEGIN CART -->
            <div class="cart-block">
                <div class="cart-info">
                    <a href="javascript:void(0);" class="cart-info-count">
					<span id="orderCount" class="badge badge-success">0</span>
					</a>
                    <a id="sumOrderMoney" href="javascript:void(0);" class="cart-info-value">￥0</a>
                </div>
                <i class="fa fa-shopping-cart"></i>
                <!-- BEGIN CART CONTENT -->
                <div class="cart-content-wrapper">
                  <div class="cart-content">
                    <ul id="shoppingCar" class="scroller" style="height: 115px;">
                    	
                    </ul>
                    <div class="text-right">
                      <a href="javascript:;" onclick="doOrder()" class="btn btn-primary">买单</a>
                    </div>
                  </div>
                </div>
                <!-- END CART CONTENT -->
            </div>
            <!-- END CART -->
            <!-- BEGIN NAVIGATION -->
            <div class="collapse navbar-collapse mega-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="product-list.html" href="product-list.html"  >
						<img width="22px" height="22px" style="margin-bottom: 5px" src="<%=request.getContextPath() %>/pages/general/assets/img/store.png">
                                                                            店家
                        <i class="fa fa-angle-down"></i>
                      </a>
                      <!-- BEGIN DROPDOWN MENU -->
                      <ul class="dropdown-menu">
                        <c:forEach items="${funcs:getMerchantsFromMemcache()}" var="merchant">
							<li><a href="<%=request.getContextPath() %>/general/menu/list.html?merchantId=${merchant.id}">${merchant.name}</a></li>
                        </c:forEach>
                      </ul>
                      <!-- END DROPDOWN MENU -->
                    </li>

                </ul>
            </div>
            <!-- END NAVIGATION -->
        </div>
    </div>
<!-- END HEADER -->
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-migrate-1.2.1.min.js"   type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script type="text/javascript">
function getCookie(objName){
	var arrStr = document.cookie.split("; ");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == objName) return unescape(temp[1]);
	}
}

function getCookies(preKey){
	var cookieArr = [];
	var arrStr = document.cookie.split("; ");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0].indexOf(preKey) != -1) {
			cookieArr.push(unescape(temp[1]));
		}
	}
	return cookieArr;
}

function addCookie(objName,objValue,objHours){
	var str = objName + "=" + escape(objValue);
	if(objHours > 0){
		var date = new Date();
		var ms = objHours*3600*1000;
		date.setTime(date.getTime() + ms);
		str += "; expires=" + date.toGMTString()+";path=/foodfun";
	}
	document.cookie = str;
}

function delCookie(name){
	document.cookie = name+"=;expires="+(new Date(0)).toGMTString()+";path=/foodfun";

}

function delCookies(cookieKeyPre){
	var cookieArr = [];
	var arrStr = document.cookie.split(";");
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0].indexOf(cookieKeyPre) != -1) {
			document.cookie = temp[0]+"=;expires="+(new Date(0)).toGMTString()+";path=/foodfun";
		}
	}
}

var shoppingCarPre = "shopping-car:";
var shoppingCarTotalPre = "shopping-car-total";

jQuery(document).ready(function(){
	var cookieArr = getCookies(shoppingCarPre);
    for(var i = 0;i < cookieArr.length;i ++){
   		var v = eval('('+cookieArr[i]+')');
    	var str = '<li menuId="'+v.menuId+'"><strong>('+v.merchantName+')'+v.menuName+'</strong><span class="cart-content-count">'+v.count+'</span>'
	     	+'<em>'+v.price+'</em><a href="javascript:void(0);" onclick="delGoods(this)" class="del-goods"><i class="fa fa-times"></i></a></li>'
	    	$("#shoppingCar").append(str);
    }
    
    var carTotalInfo = getCookie(shoppingCarTotalPre);
    if(carTotalInfo){
	    var carTotalInfoObj = eval('('+carTotalInfo+')');
	    $("#orderCount").html(carTotalInfoObj.totalItem);
		$("#sumOrderMoney").html('￥' + carTotalInfoObj.totalMoney);
    }
});



function delGoods(obj){
	var $this = $(obj);
	$("#orderCount").html(parseInt($("#orderCount").html()) - parseInt($this.parent().find(".cart-content-count").html()));
	$("#sumOrderMoney").html(parseFloat($("#sumOrderMoney").html().replace('￥','')) - parseFloat($this.parent().find("em").html()));
	$this.parent().remove();
	//删除相应的cookie
	var needDeleteCookie = getCookie(shoppingCarPre + $this.parent().attr('menuId'));
	needDeleteCookie = eval('('+needDeleteCookie+')');
	
	var carTotalInfoCookie = getCookie(shoppingCarTotalPre);
	carTotalInfoCookie = eval('('+carTotalInfoCookie+')');
	carTotalInfo = '{"totalItem":' + (parseInt(carTotalInfoCookie.totalItem) - needDeleteCookie.count) + ',"totalMoney":'  + (parseInt(carTotalInfoCookie.totalMoney) - needDeleteCookie.price) + '}';
	addCookie(shoppingCarTotalPre, carTotalInfo, 1);
	delCookie(shoppingCarPre + $this.parent().attr('menuId'));
	
}


var itemCount = 0;
//添加入购物车
function addIntoShoppingCar(obj){
	var $this = $(obj);
	var menuId = $this.attr("menuId");
	var menuName = $this.attr("menuName");
	var merchantName = $this.attr("merchantName");
	var price = $this.attr("price");
	var existedGood = false;
	var totalMoney = 0.0;
	$("#shoppingCar li").each(function(index){
		//如果已经存在相同菜单
		if($(this).attr("menuId") == menuId){
			$(this).find("span").html(parseInt($(this).find("span").html()) + 1);
			$(this).find("em").html(parseFloat($(this).find("em").html()) + parseFloat(price));
			existedGood = true;
		}
	});
	if(!existedGood){
		var str = '<li menuId="'+menuId+'"><strong>('+merchantName+')'+menuName+'</strong><span class="cart-content-count">1</span>'
		     +'<em>'+price+'</em><a href="javascript:void(0);" onclick="delGoods(this)" class="del-goods"><i class="fa fa-times"></i></a></li>'
		$("#shoppingCar").append(str);
	}
	$("#shoppingCar li em").each(function(index){
		totalMoney += parseFloat($(this).html());
	});
	
	var carTotalInfoCookie = getCookie(shoppingCarTotalPre);
	if(carTotalInfoCookie){
		carTotalInfoCookie = eval('('+carTotalInfoCookie+')');
		itemCount = carTotalInfoCookie.totalItem + 1;
	}else{
		itemCount++;
	}
	$("#orderCount").html(itemCount);
	$("#sumOrderMoney").html('￥' + totalMoney);
	
	
	var exCookie = getCookie(shoppingCarPre + menuId);
	var count = 1;
	var itemTotalMoney = price;
	if(exCookie){
		count = eval('('+exCookie+')').count + 1;
		itemTotalMoney = parseFloat(eval('('+exCookie+')').price) + parseFloat(price);
	}
	var cookieValue = '{"menuId":"'+menuId+'","merchantName":"'+merchantName+'","menuName":"'+menuName+'","count":'+count+',"price":'+itemTotalMoney+'}';
	addCookie(shoppingCarPre + menuId, cookieValue, 1);
	
	var carTotalInfo = getCookie(shoppingCarTotalPre);
	if(carTotalInfo){
        var carTotalInfoObj = eval('('+carTotalInfo+')');
    	 carTotalInfo = '{"totalItem":' + (parseInt(carTotalInfoObj.totalItem) + 1) + ',"totalMoney":'  + totalMoney + '}';
	}else{
    	 carTotalInfo = '{"totalItem":' + (itemCount) + ',"totalMoney":'  + totalMoney + '}';
	}
	
	addCookie(shoppingCarTotalPre, carTotalInfo, 1);
	
}

function doOrder(){
	var str = "";
	$('#shoppingCar li').each(function(){
		str += $(this).attr('menuId') + '_' + $(this).find(".cart-content-count").html() + ":";
	});
	if(str == ""){
		toastr["warning"]("餐车暂无食物,请添加!");
		return;		
	}
	str = str.substring(0, str.lastIndexOf(":"));
	var url = '<%=request.getContextPath() %>/general/doOrder.html';
	$.post(url, {orderInfos:str}, function(result){
		if(result == 200){
			toastr["success"]("订餐成功");
			delCookie(shoppingCarTotalPre);
			delCookies(shoppingCarPre);
			window.location.reload();
			//location.reload(true);
		}else if(result == 301){
			toastr["info"]("您尚未登录，请登录！");
		}else if(result == 302){
			toastr["warning"]("您余额不足，请及时充值！");
		}else if(result == 303){
			toastr["warning"]("订餐时间已过！");
		}
	});
}
$(function(){
	toastr.options = {"timeOut": 2000, "closeButton": true};
});
</script>