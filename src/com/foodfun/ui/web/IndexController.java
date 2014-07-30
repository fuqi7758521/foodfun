package com.foodfun.ui.web;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.foodfun.common.Constants;
import com.foodfun.common.cache.MenuHotCache;
import com.foodfun.common.cache.MerchantCache;
import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.OrderDetailCriteriaTO;
import com.foodfun.common.criteria.OrderOverallCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.criteria.UserCriteriaTO;
import com.foodfun.common.service.ChargeService;
import com.foodfun.common.service.MenuService;
import com.foodfun.common.service.OrderService;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.ChargeLogTO;
import com.foodfun.common.to.MenuTO;
import com.foodfun.common.to.MerchantTO;
import com.foodfun.common.to.OrderDetailTO;
import com.foodfun.common.to.OrderOverallTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.DateUtil;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;

/**
 * 首页controller
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */

@Controller
public class IndexController implements Constants {
	
	private static Logger logger=Logger.getLogger(IndexController.class);
	
	private static Integer PAGE_SIZE = 20;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private ChargeService chargeService;
	
	//首页
	@RequestMapping("/index.html")
	public ModelAndView index(HttpServletRequest request){
		UserTO user=Funcs.getUserFromMemcache(request);
		if(user != null){
			request.setAttribute("user", user);
		}
		
		//最热菜品8个
		List<MenuTO> hotMenus = MenuHotCache.getHotMenusFromCache();
		request.setAttribute("hotMenus", hotMenus);
		
		//菜单列表
		Integer pageNum = RequestUtil.getInteger(request, "pageNum") == null ? 1 : RequestUtil.getInteger(request, "pageNum");
		request.setAttribute("pageNum", pageNum);
		Integer pageSize = RequestUtil.getInteger(request, "pageSize") == null ? PAGE_SIZE : RequestUtil.getInteger(request, "pageSize");
		request.setAttribute("pageSize", pageSize);
		Long merchantId = RequestUtil.getLong(request, "merchantId");
		Integer orderType = RequestUtil.getInteger(request, "orderType") == null ? MENU_ORDER_TYPE_HOT : RequestUtil.getInteger(request, "orderType");
		MenuCriteriaTO criteria = new MenuCriteriaTO();
		SearchPagerModel<MenuTO> pagerModel = new SearchPagerModel<MenuTO>((pageNum - 1) * pageSize, pageSize);
		criteria.setStatus(1);
		criteria.setMerchantId(merchantId);
		criteria.setOrderType(orderType);
		criteria.setPageModel(pagerModel);
		SearchPagerModel<MenuTO> menus = menuService.getMenus(criteria);
		request.setAttribute("menus", menus.getResultList());
		int totalItems = menus.getTotal();
		request.setAttribute("totalItems", totalItems);
		int pageItems = 0;
		if(totalItems % pageSize != 0){
			pageItems = totalItems / pageSize + 1;
		}else{
			pageItems = totalItems / pageSize;
		}
		request.setAttribute("pageItems", pageItems);
		return new ModelAndView(FOODFUN_INDEX);
	}
	
	//后台首页
	@RequestMapping("/admin/index.html")
	public ModelAndView indexAdmin(HttpServletRequest request){
		UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
		request.setAttribute("menuLocal", "index");
		
		//表格显示样式
		RequestUtil.setTableShowType(request);
		
		//今日订餐总金额
		float totalMoneyOfToday = 0.0f;
		//今日总订单数
		int totalOrderCountOfToday = 0;
		
		OrderOverallCriteriaTO criteria = new OrderOverallCriteriaTO();
		Date now = new Date();
		String startTime = DateUtil.formatDateTime(DateUtil.getStartOfDay(now));
		String endTime = DateUtil.formatDateTime(DateUtil.getEndOfDay(now));
		criteria.setStartTime(startTime);
		criteria.setEndTime(endTime);
		criteria.setStatus(ORDER_STATUS_CONFIRMED);
		SearchPagerModel<OrderOverallTO> orderOveralls = new SearchPagerModel<OrderOverallTO>();
		criteria.setPageModel(orderOveralls);
		orderOveralls = orderService.getOrderOveralls(criteria);
		if(orderOveralls != null && orderOveralls.getResultList() != null && orderOveralls.getTotal() > 0){
			totalOrderCountOfToday = orderOveralls.getTotal();
			List<OrderOverallTO> list = orderOveralls.getResultList();
			for(OrderOverallTO to : list){
				totalMoneyOfToday += to.getMoney();
			}
		}
		request.setAttribute("totalMoneyOfToday", totalMoneyOfToday);
		request.setAttribute("totalOrderCountOfToday", totalOrderCountOfToday);
		
		//今日实充金额
		SearchPagerModel<ChargeLogTO> chargeLogs = todayConfirmedCharge(
				request, startTime, endTime);
		
		
		//总余额
		leftTotalMoney(request);
		
		//今日订单统计
		todayOrderOverview(request, startTime, endTime);
		
		//今日所有充值
		todayAllCharge(request, startTime, endTime);
		
		return new ModelAndView(FOODFUN_ADMIN_INDEX);
	}

	private void todayAllCharge(HttpServletRequest request, String startTime,
			String endTime) {
		ChargeLogCriteriaTO chargeAllCriteria = new ChargeLogCriteriaTO();
		chargeAllCriteria.setChargedStartDate(startTime);
		chargeAllCriteria.setChargedEndDate(endTime);
		SearchPagerModel<ChargeLogTO> chargeAllLogs = new SearchPagerModel<ChargeLogTO>();
		chargeAllCriteria.setPageModel(chargeAllLogs);
		chargeAllLogs = chargeService.getChargeLogs(chargeAllCriteria );
		if(chargeAllLogs != null && chargeAllLogs.getResultList() != null && chargeAllLogs.getTotal() > 0){
			List<ChargeLogTO> list = chargeAllLogs.getResultList();
			request.setAttribute("totalAllChargeOfToday", list);
		}
	}

	private void todayOrderOverview(HttpServletRequest request,
			String startTime, String endTime) {
		OrderDetailCriteriaTO orderDetailCriteria = new OrderDetailCriteriaTO();
		orderDetailCriteria.setStartOrderDateStr(startTime);
		orderDetailCriteria.setEndOrderDateStr(endTime);
		List<OrderDetailTO> todayOrderDetailOverview = orderService.getTodayOrderDetailOverview(orderDetailCriteria );
		request.setAttribute("todayOrderDetailOverview", todayOrderDetailOverview);
	}

	private SearchPagerModel<ChargeLogTO> todayConfirmedCharge(
			HttpServletRequest request, String startTime, String endTime) {
		float totalChargeOfToday = 0.0f;
		ChargeLogCriteriaTO chargeCriteria = new ChargeLogCriteriaTO();
		chargeCriteria.setChargedStartDate(startTime);
		chargeCriteria.setChargedEndDate(endTime);
		chargeCriteria.setStatus(CHARGE_STATUS_CONFIRMED);
		SearchPagerModel<ChargeLogTO> chargeLogs = new SearchPagerModel<ChargeLogTO>();
		chargeCriteria.setPageModel(chargeLogs);
		chargeLogs = chargeService.getChargeLogs(chargeCriteria );
		if(chargeLogs != null && chargeLogs.getResultList() != null && chargeLogs.getTotal() > 0){
			List<ChargeLogTO> list = chargeLogs.getResultList();
			for(ChargeLogTO to : list){
				totalChargeOfToday += to.getMoney();
			}
		}
		request.setAttribute("totalChargeOfToday", totalChargeOfToday);
		return chargeLogs;
	}

	private void leftTotalMoney(HttpServletRequest request) {
		float totalBalance = 0.0f;
		UserCriteriaTO userCriteria = new UserCriteriaTO();
		userCriteria.setStatus(STATUS_VALID);
		//SearchPagerModel<UserTO> pageModel = new SearchPagerModel<UserTO>();
		//userCriteria.setPageModel(pageModel);
		SearchPagerModel<UserTO> users = userService.getUsers(userCriteria);
		if(users != null && users.getResultList() != null && users.getTotal() > 0){
			List<UserTO> list = users.getResultList();
			for(UserTO to : list){
				totalBalance += to.getBalance();
			}
		}
		request.setAttribute("totalBalance", totalBalance);
	}
	
}
