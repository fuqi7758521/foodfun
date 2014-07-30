package com.foodfun.common.service;

import java.util.List;

import com.foodfun.common.criteria.OrderDetailCriteriaTO;
import com.foodfun.common.criteria.OrderOverallCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.to.OrderDetailTO;
import com.foodfun.common.to.OrderOverallTO;



/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
public interface OrderService {
	
	void addOrderDetailTO(OrderDetailTO detail);
	
	void addOrderOverallTO(OrderOverallTO overall);
	
	OrderOverallTO getOrderOverallTOById(Long id);
	
	void delOrder(Long orderId);
	
	SearchPagerModel<OrderOverallTO> getOrderOveralls(OrderOverallCriteriaTO criteria);
	
	SearchPagerModel<OrderDetailTO> getOrderDetails(OrderDetailCriteriaTO criteria);
	
	List<OrderDetailTO> getTodayOrderDetailOverview(OrderDetailCriteriaTO criteria);
	
	void updateOrderOverall(OrderOverallTO overall);
	
}
