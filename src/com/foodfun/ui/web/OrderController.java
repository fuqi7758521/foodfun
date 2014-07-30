package com.foodfun.ui.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foodfun.common.Constants;
import com.foodfun.common.cache.DeadlineCache;
import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.OrderDetailCriteriaTO;
import com.foodfun.common.criteria.OrderOverallCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.service.MenuService;
import com.foodfun.common.service.OrderService;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.MenuTO;
import com.foodfun.common.to.OrderDetailTO;
import com.foodfun.common.to.OrderOverallTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.DateUtil;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;


/**
 * 订餐controller
 * @author fuqi7758521@gmail.com
 * @date 2013-04-12
 */

@Controller
public class OrderController implements Constants {

    private static Logger logger=Logger.getLogger(OrderController.class);
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private MenuService menuService;
    
    @Autowired
    private UserService userService; 
    
    //订购
    @RequestMapping("/general/doOrder.html")
    @ResponseBody
    public Integer order(HttpServletRequest request){
    	UserTO user = Funcs.getUserFromMemcache(request);
    	if(user == null){
    		return NOT_YET_LOGIN;
    	}
    	Date deadlineDate = DateUtil.toDate(DateUtil.formatDateTime(new Date(), DateUtil.LONG_DATE_FORMAT) + " " + DeadlineCache.getDeadlineFromCache(), DateUtil.FORMAT_ONE);
    	if((deadlineDate.getTime() - new Date().getTime()) < 0){
    		return OVER_DEADLINE;
    	}
		
    	String orderInfos = RequestUtil.getString(request, "orderInfos");
    	String[] menuIdCountArr = orderInfos.split(":");
    	Float total = 0.0F;
    	List<OrderDetailTO> list = new ArrayList<OrderDetailTO>();
    	for(String menuIdCount : menuIdCountArr){
    		String[] split = menuIdCount.split("_");
    		Long menuId = Long.valueOf(split[0]);
    		Integer count = Integer.valueOf(split[1]);
    		MenuCriteriaTO criteria = new MenuCriteriaTO();
    		criteria.setId(menuId);
			MenuTO menuTO = menuService.getMenus(criteria).getResultList().get(0);
			Float price = menuTO.getPrice();
			total += count * price;
			OrderDetailTO detail = new OrderDetailTO();
			detail.setMenuId(menuId);
			detail.setCount(count);
			detail.setPrice(price);
			detail.setMenuName(menuTO.getName());
			list.add(detail);
    	}
    	
    	
    	//扣除金额
		UserTO userFromDB = userService.getUserTOById(user.getId());
		if(userFromDB.getBalance() < total){//如果金额不够，则不生成订单
			return ORDER_MONEY_NOT_ENOUGH;
		}
		userFromDB.setBalance(userFromDB.getBalance() - total);
		userService.update(userFromDB);
		
		
    	OrderOverallTO overall = new OrderOverallTO();
    	overall.setMoney(total);
    	overall.setUserId(user.getId());
		orderService.addOrderOverallTO(overall);
		
		//保存订单的详情
		Long orderOverallId = overall.getId();
		for(OrderDetailTO detail : list){
			detail.setOrderOverallId(orderOverallId);
			orderService.addOrderDetailTO(detail);
		}
		
    	return STATUS_OK;
    }
    
    //用户取消订单
    @RequestMapping("/general/undoOrder.html")
    @ResponseBody
    public Integer undoOrder(HttpServletRequest request){
    	Long id = RequestUtil.getLong(request, "id");
    	OrderOverallTO to = orderService.getOrderOverallTOById(id);
    	if(to.getStatus().equals(ORDER_STATUS_CONFIRMED)){
    		return ORDER_ALREADY_CONFIRMED;
    	}else if(to.getStatus().equals(ORDER_STATUS_UNDO)){
    		return ORDER_ALREADY_UNDO;
    	}else{
    		try{
    			orderService.delOrder(id);
    		}catch (Exception e) {
				logger.error("取消订单失败！", e);
				return STATUS_ERROR;
			}
    	}
    	return STATUS_OK;
    }
    

    //我的订单
    @RequestMapping("/general/myOrders.html")
    public ModelAndView myOrders(HttpServletRequest request){
    	UserTO user=Funcs.getUserFromMemcache(request);
    	if(user == null){
    		 return new ModelAndView(FOODFUN_LOGIN);
    	}
        return new ModelAndView("/pages/general/myOrders.jsp");
    }
    
    
    //我的订单
    @RequestMapping("/general/myOrdersTable.html")
    @ResponseBody
    public Map<String, Object> myOrdersTable(HttpServletRequest request, int iDisplayLength, int iDisplayStart){
    	OrderOverallCriteriaTO criteria = new OrderOverallCriteriaTO();
		criteria.setUserId(RequestUtil.getLong(request, "userId"));
		SearchPagerModel<OrderOverallTO> searchPagerModel = new SearchPagerModel<OrderOverallTO>(
				iDisplayStart, iDisplayLength);
		criteria.setPageModel(searchPagerModel);
		searchPagerModel = orderService.getOrderOveralls(criteria);
		
		Map<String, Object> data=new HashMap<String, Object>();
        data.put("aaData", searchPagerModel.getResultList()==null ? "" : searchPagerModel.getResultList());
        data.put("iTotalDisplayRecords", searchPagerModel.getTotal());
        data.put("iTotalRecords", searchPagerModel.getTotal());
        return data;
    }
    
    //后台管理订单页面
    @RequestMapping("/admin/order/listPage.html")
    public ModelAndView orderPage(HttpServletRequest request){
    	UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
    	request.setAttribute("menuLocal", "order");
    	return new ModelAndView("/pages/admin/order.jsp");
    }
    
    //后台管理订单数据
    @RequestMapping("/admin/order/orderTable.html")
    @ResponseBody
    public Map<String, Object> orderTable(HttpServletRequest request, int iDisplayLength, int iDisplayStart){
    	OrderOverallCriteriaTO criteria = new OrderOverallCriteriaTO();
		SearchPagerModel<OrderOverallTO> searchPagerModel = new SearchPagerModel<OrderOverallTO>(
				iDisplayStart, iDisplayLength);
		criteria.setPageModel(searchPagerModel);
		searchPagerModel = orderService.getOrderOveralls(criteria);
		
		Map<String, Object> data=new HashMap<String, Object>();
        data.put("aaData", searchPagerModel.getResultList()==null ? "" : searchPagerModel.getResultList());
        data.put("iTotalDisplayRecords", searchPagerModel.getTotal());
        data.put("iTotalRecords", searchPagerModel.getTotal());
        return data;
    }
    
    //后台管理更新订单状态
    @RequestMapping("/admin/order/update.html")
    @ResponseBody
    public Integer updateOrderStatus(HttpServletRequest request){
    	UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return NOT_YET_LOGIN;
		}
    	Integer status = RequestUtil.getInteger(request, "status");
    	Long orderId = RequestUtil.getLong(request, "id");
    	if(status.equals(ORDER_STATUS_UNDO)){
    		orderService.delOrder(orderId);
    	}else{
    		OrderOverallTO tmpOrderOverall = orderService.getOrderOverallTOById(orderId);
    		if(tmpOrderOverall.getStatus().equals(ORDER_STATUS_UNDO)){
    			return ORDER_ALREADY_UNDO;
    		}
    		OrderOverallTO overall = new OrderOverallTO();
    		overall.setId(orderId);
    		overall.setStatus(ORDER_STATUS_CONFIRMED);
			orderService.updateOrderOverall(overall );
			
			
			//更新菜单的订购次数
			OrderDetailCriteriaTO detailCriteria = new OrderDetailCriteriaTO();
			detailCriteria.setOrderOverallId(orderId);
			SearchPagerModel<OrderDetailTO> orderDetails = orderService.getOrderDetails(detailCriteria);
			if(orderDetails != null && orderDetails.getResultList() != null && orderDetails.getTotal() > 0){
				for(OrderDetailTO to : orderDetails.getResultList()){
					Long menuId = to.getMenuId();
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("menuId", menuId);
					params.put("addOrderCount", true);
					menuService.updateMenuDynamic(params);
				}
			}
			
    	}
    	return STATUS_OK;
    }
    
}
