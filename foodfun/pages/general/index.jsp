<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>首页 | 云游游美食坊</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta content="fuqi7758521@gmail.com" name="author">
  <link href="<%=request.getContextPath() %>/pages/general/assets/img/favicon1.ico" rel="SHORTCUT ICON" type="image/ico">

  <!-- Fonts START -->
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Open+Sans.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/PT+Sans+Narrow.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/font/Source+Sans+Pro.css" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/font-awesome/css/font-awesome.min.css"   rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap/css/bootstrap.css"   rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">              
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/pages/general/assets/plugins/layerslider/css/layerslider.css" rel="stylesheet"  type="text/css">
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


    <div class="main">
      <div class="container">
        <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SALE PRODUCT -->
          <div class="col-md-12 sale-product">
            <h2>火爆菜品</h2>
            <div class="bxslider-wrapper">
              <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="15">
                <c:forEach items="${hotMenus}" var="menu">
	                <li>
	                  <div class="product-item">
	                    <div class="pi-img-wrapper">
	                      <img style="height:250px;" src="${menu.imgUrl}"   class="img-responsive" alt="${menu.name }">
	                      <div>
	                        <a href="${menu.imgUrl}" class="btn btn-default fancybox-button"><i class="fa fa-search-plus"></i></a>
	                      </div>
	                    </div>
	                    <h3><a href="javascript:;"  title="${menu.name }">${menu.name }</a>
						<a href="<%=request.getContextPath() %>/general/menu/list.html?merchantId=${menu.merchantId}"  class="float_right">${menu.merchantName }</a></h3>
	                    <div class="pi-price">￥${menu.price }</div>
	                    <a class="btn btn-default add2cart" href="javascript:;" menuName="${menu.name }" menuId="${menu.id }" merchantName="${menu.merchantName }" price="${menu.price }" onclick="addIntoShoppingCar(this)">加入餐车</a>
	                    <div class="sticker sticker-hot"></div>
	                    <c:if test="${menu.newMenu == 1 }">
		                  <div class="sticker sticker-new"></div>
	                    </c:if>
	                  </div>
	                </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <!-- END SALE PRODUCT -->
        </div>
        <!-- END SALE PRODUCT & NEW ARRIVALS -->
		
		<ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li class="active">全部</li>
        </ul>

		<!-- begin products list -->
		<div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-7">
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="#"><i class="fa fa-th-large"></i></a>
                <a href="#"><i class="fa fa-th-list"></i></a>
              </div>
              <form action="<%=request.getContextPath() %>/general/menu/list.html" method="post">
              <div class="col-md-10 col-sm-10">
			  	<div class="pull-right">
                  <button class="btn btn-success" type="submit">GO</button>
                </div>
                <div class="pull-right">
                  <label class="control-label">每页:</label>
                  <select class="form-control input-sm" name="pageSize">
                    <option selected="selected" value="24">20</option>
                    <option value="32">32</option>
                    <option value="40">40</option>
                    <option value="48">48</option>
                  </select>
                </div>
                <div class="pull-right">
                  <label class="control-label">排序:</label>
                  <select class="form-control input-sm" name="sortType">
                    <option selected="selected" value="1">人气</option>
                    <option value="2">价格</option>
                    <option value="3">上架时间</option>
                  </select>
                </div>
				<div class="pull-right">
                  <label class="control-label">店家:</label>
                  <select class="form-control input-sm" name="merchantId">
				  	<option selected="selected" value="">全部</option>
				  	<c:forEach items="${merchants }" var="merchant">
	                    <option value="${merchant.id }">${merchant.name }</option>
				  	</c:forEach>
                  </select>
                </div>

              </div>
              </form>
              
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
              <c:forEach items="${menus }" var="menu">
	              <!-- PRODUCT ITEM START -->
	              <div class="col-md-3 col-sm-6 col-xs-12">
	                <div class="product-item">
	                  <div class="pi-img-wrapper">
	                    <img style="width:240px;height:230px;" class="img-responsive" src="${menu.imgUrl }">
	                    <div>
	                      <a class="btn btn-default fancybox-button"  href="${menu.imgUrl }"><i class="fa fa-search-plus"></i></a>
	                      <!-- <a class="btn btn-default fancybox-fast-view" href="#product-pop-up">详细</a> -->
	                    </div>
	                  </div>
	                  <h3>
					  <a href="javascript:;" title="${menu.name }">${menu.name }</a>
					  <a href="item.html" class="float_right">${menu.merchantName }</a>
					  </h3>
	                  <div class="pi-price">￥${menu.price }</div>
	                  <a class="btn btn-default add2cart" href="javascript:;" menuName="${menu.name }" menuId="${menu.id }" merchantName="${menu.merchantName }" price="${menu.price }" onclick="addIntoShoppingCar(this)">加入餐车</a>
	                  <c:if test="${menu.newMenu == 1 }">
		                  <div class="sticker sticker-new"></div>
	                  </c:if>
	                </div>
	              </div>
	              <!-- PRODUCT ITEM END -->
              </c:forEach>
            </div>
            <!-- END PRODUCT LIST -->
            
            <!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-4 col-sm-4 items-info"></div>
              <div class="col-md-8 col-sm-8">
                <ul class="pagination pull-right">
                <pg:pager maxIndexPages="10" maxPageItems="20" export="currentPageNumber=pageNumber" items="${totalItems }">
	                <pg:index>
	                	<pg:first>
	                		<li><a href="<%=request.getContextPath() %>/index.html">首页</a></li>
	                	</pg:first>
	                	<pg:prev ifnull="true">
	                	    <c:choose>
	                	    	<c:when test="${pageNum == 1}"></c:when>
	                	    	<c:otherwise>
									<li><a href="<%=request.getContextPath() %>/index.html?pageNum=${pageNum - 1}">«</a></li>
	                	    	</c:otherwise>
	                	    </c:choose>
 						</pg:prev>
 						<pg:pages>
	 						<c:choose>
	 							<c:when test="${pageNumber eq pageNum}">
	 							<li><span>${pageNumber}</span></li>
	 							</c:when>
	 							<c:otherwise>
	 							<li><a href="<%=request.getContextPath() %>/index.html?pageNum=${pageNumber}">${pageNumber}</a></li>
	 							</c:otherwise>
	 						</c:choose>
 						</pg:pages>
 						<pg:next ifnull="true">
 						    <c:choose>
 						    	<c:when test="${pageNum == pageItems}"></c:when>
 						    	<c:otherwise>
		                       		<li><a href="<%=request.getContextPath() %>/index.html?pageNum=${pageNum + 1 }">»</a></li>
 						    	</c:otherwise>
 						    </c:choose>
                        </pg:next>	
                        <pg:last>
                        	<li><a href="<%=request.getContextPath() %>/index.html?pageNum=${pageItems}">尾页</a></li>
                        </pg:last>
	                </pg:index>
                </pg:pager>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        </div>
		<!-- end products list -->      
          
      </div>
    </div>

    <!-- BEGIN FOOTER -->
		<jsp:include page="footer.jsp"/>
	<!-- END FOOTER -->
<input type="hidden" value="<%=request.getContextPath() %>/pages/general/assets/img/up.png" id="upImgLoc">
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jquery-migrate-1.2.1.min.js"   type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/back-to-top.js"  type="text/javascript" ></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"  type="text/javascript" ></script>

    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/fancybox/source/jquery.fancybox.pack.js"  type="text/javascript" ></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bxslider/jquery.bxslider.min.js"  type="text/javascript" ></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/zoom/jquery.zoom.min.js"  type="text/javascript" ></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"   type="text/javascript"></script><!-- Quantity -->
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/layerslider/jQuery/jquery-easing-1.3.js"   type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/layerslider/jQuery/jquery-transit-modified.js"   type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/layerslider/js/layerslider.transitions.js"   type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js"   type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/scripts/app.js"  type="text/javascript" ></script>
    <script src="<%=request.getContextPath() %>/pages/general/assets/scripts/index.js"  type="text/javascript" ></script>
    <script type="text/javascript">

        jQuery(document).ready(function() {
            App.init();    
            App.initBxSlider();
            Index.initLayerSlider();
            App.initImageZoom();
            App.initTouchspin();
        });
        
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>