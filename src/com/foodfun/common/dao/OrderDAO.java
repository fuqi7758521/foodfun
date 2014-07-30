package com.foodfun.common.dao;

import java.util.List;

import com.foodfun.common.criteria.OrderDetailCriteriaTO;
import com.foodfun.common.criteria.OrderOverallCriteriaTO;
import com.foodfun.common.to.OrderDetailTO;
import com.foodfun.common.to.OrderOverallTO;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
public interface OrderDAO {

	List<OrderOverallTO> getOrderOverallList(OrderOverallCriteriaTO criteria);
	
	Integer getOrderOverallsCnt(OrderOverallCriteriaTO criteria);
	
	List<OrderDetailTO> getOrderDetails(OrderDetailCriteriaTO criteria);
	
	Integer getOrderDetailsCnt(OrderDetailCriteriaTO criteria);
	
	List<OrderDetailTO> getTodayOrderDetailOverview(OrderDetailCriteriaTO criteria);
	
	void updateOrderOverall(OrderOverallTO to);
	
	void updateOrderDetail(OrderDetailTO to);
	
	void addOrderOverall(OrderOverallTO to);
	
	void addOrderDetail(OrderDetailTO to);

	OrderOverallTO getOrderOverallTOById(Long id);
	
}
