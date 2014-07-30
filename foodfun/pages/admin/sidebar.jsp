<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-sidebar-wrapper">
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
			<li class="sidebar-toggler-wrapper">
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				<div class="sidebar-toggler hidden-phone">
				</div>
				<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
			</li>
			<li class="sidebar-search-wrapper">
			</li>
			<li class="start <c:if test='${menuLocal == "index"}'>active</c:if>">
				<a href="<%=request.getContextPath() %>/admin/index.html"  >
					<i class="fa fa-home"></i>
					<span class="title">
						今日订餐
					</span>
					<c:if test="${menuLocal == 'index'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'index'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
			</li>
			<li <c:if test="${menuLocal == 'order'}">class="active"</c:if>>
				<a href="javascript:;">
					<i class="fa fa-shopping-cart"></i>
					<span class="title">
						订单管理
					</span>
					<c:if test="${menuLocal == 'order'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'order'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
				<ul class="sub-menu">
					<li <c:if test="${menuLocal == 'order'}">class="active"</c:if>>
						<a href="<%=request.getContextPath() %>/admin/order/listPage.html"  >
							订单查询
						</a>
					</li>
				</ul>
			</li>
			<li <c:if test="${menuLocal == 'user'}">class="active"</c:if> >
				<a href="javascript:;">
					<i class="fa fa-user"></i>
					<span class="title">
						用户管理
					</span>
					<c:if test="${menuLocal == 'user' }">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'user'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
				<ul class="sub-menu">
					<li <c:if test="${menuLocal == 'user'}">class="active"</c:if>>
						<a href="<%=request.getContextPath() %>/admin/user/listPage.html"  >
							用户查询
						</a>
					</li>
				</ul>
			</li>
			<li <c:if test="${menuLocal == 'merchant'}">class="active"</c:if>>
				<a href="javascript:;">
					<i class="fa fa-truck"></i>
					<span class="title">
						店家管理
					</span>
					<c:if test="${menuLocal == 'merchant'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'merchant'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
				<ul class="sub-menu">
					<li <c:if test="${menuLocal == 'merchant'}">class="active"</c:if>>
						<a href="<%=request.getContextPath() %>/admin/merchant/listPage.html"  >
							店家查询
						</a>
					</li>
				</ul>
			</li>
			<li <c:if test="${menuLocal == 'menu'}">class="active"</c:if>>
				<a href="javascript:;">
					<i class="fa fa-file-text"></i>
					<span class="title">
						菜单管理
					</span>
					<c:if test="${menuLocal == 'menu'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'menu'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
				<ul class="sub-menu">
					<li <c:if test="${menuLocal == 'menu'}">class="active"</c:if>>
						<a href="<%=request.getContextPath() %>/admin/menu/listPage.html"  >
							菜单查询
						</a>
					</li>
				</ul>
			</li>
			<li <c:if test="${menuLocal == 'charge'}">class="active"</c:if>>
				<a href="javascript:;">
					<i class="fa fa-cny"></i>
					<span class="title">
						充值管理
					</span>
					<c:if test="${menuLocal == 'charge'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'charge'}">
						<span class="arrow">
						</span>
					</c:if>
				</a>
				<ul class="sub-menu">
					<li <c:if test="${menuLocal == 'charge'}">class="active"</c:if>>
						<a href="<%=request.getContextPath() %>/admin/charge/listPage.html"  >
							充值查询
						</a>
					</li>
				</ul>
			</li>
			<li class="last <c:if test='${menuLocal == "system"}'>active</c:if>">
					<a href="javascript:;">
						<i class="fa fa-cogs"></i>
						<span class="title">
							系统设置
						</span>
					<c:if test="${menuLocal == 'system'}">
						<span class="selected">
						</span>
						<span class="arrow open">
						</span>
					</c:if>
					<c:if test="${menuLocal != 'system'}">
						<span class="arrow">
						</span>
					</c:if>
					</a>
					<ul class="sub-menu">
						<li <c:if test="${menuLocal == 'system'}">class="active"</c:if>>
							<a href="<%=request.getContextPath() %>/admin/goDeadlinePage.html"  >
								订餐截止时间设置
							</a>
						</li>
					</ul>
			</li>

		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>