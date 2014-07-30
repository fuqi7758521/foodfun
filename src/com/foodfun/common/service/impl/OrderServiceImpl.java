package com.foodfun.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.Constants;
import com.foodfun.common.criteria.OrderDetailCriteriaTO;
import com.foodfun.common.criteria.OrderOverallCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.dao.OrderDAO;
import com.foodfun.common.dao.UserDAO;
import com.foodfun.common.service.OrderService;
import com.foodfun.common.to.OrderDetailTO;
import com.foodfun.common.to.OrderOverallTO;
import com.foodfun.common.to.UserTO;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private UserDAO userDAO;

	@Override
	public void delOrder(Long orderId) {
		// 把订单详情状态置为0，表示无效
		OrderDetailTO detail = new OrderDetailTO();
		detail.setOrderOverallId(orderId);
		detail.setStatus(Constants.STATUS_INVALID);
		orderDAO.updateOrderDetail(detail);

		// 把订单状态置为0，表示无效
		OrderOverallTO overall = new OrderOverallTO();
		overall.setId(orderId);
		overall.setStatus(Constants.ORDER_STATUS_UNDO);

		// 退回用户金额
		OrderOverallCriteriaTO criteria = new OrderOverallCriteriaTO();
		criteria.setId(orderId);
		OrderOverallTO orderOverallTO = orderDAO.getOrderOverallList(criteria)
				.get(0);
		orderDAO.updateOrderOverall(overall);
		Float money = orderOverallTO.getMoney();

		UserTO to = new UserTO();
		to.setId(orderOverallTO.getUserId());
		to = userDAO.getUser(to);
		to.setBalance(to.getBalance() + money);
		userDAO.update(to);
	}

	@Override
	public void addOrderDetailTO(OrderDetailTO detail) {
		orderDAO.addOrderDetail(detail);
	}

	@Override
	public void addOrderOverallTO(OrderOverallTO overall) {
		orderDAO.addOrderOverall(overall);
	}

	@Override
	public SearchPagerModel<OrderOverallTO> getOrderOveralls(
			OrderOverallCriteriaTO criteria) {
		SearchPagerModel<OrderOverallTO> pager = criteria.getPageModel();
		Integer count = orderDAO.getOrderOverallsCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<OrderOverallTO> result = orderDAO
					.getOrderOverallList(criteria);
			for (OrderOverallTO to : result) {
				StringBuilder sb = new StringBuilder();
				OrderDetailCriteriaTO detailCriteria = new OrderDetailCriteriaTO();
				detailCriteria.setOrderOverallId(to.getId());
				List<OrderDetailTO> orderDetails = orderDAO
						.getOrderDetails(detailCriteria);
				for (OrderDetailTO detail : orderDetails) {
					sb.append("(").append(detail.getMerchantName()).append(")")
							.append(detail.getMenuName()).append("*")
							.append(detail.getCount()).append(" ");
				}
				to.setDes(sb.toString());
			}
			pager.setResultList(result);
			pager.setTotal(count);
		}
		return pager;
	}

	@Override
	public SearchPagerModel<OrderDetailTO> getOrderDetails(
			OrderDetailCriteriaTO criteria) {
		SearchPagerModel<OrderDetailTO> pager = criteria.getPageModel();
		if(pager == null){
			pager = new SearchPagerModel<OrderDetailTO>();
		}
		Integer count = orderDAO.getOrderDetailsCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<OrderDetailTO> result = orderDAO.getOrderDetails(criteria);
			pager.setResultList(result);
			pager.setTotal(count);
		}
		
		return pager;
	}

	@Override
	public List<OrderDetailTO> getTodayOrderDetailOverview(
			OrderDetailCriteriaTO criteria) {
		return orderDAO.getTodayOrderDetailOverview(criteria);
	}

	@Override
	public void updateOrderOverall(OrderOverallTO overall) {
		orderDAO.updateOrderOverall(overall);
	}

	@Override
	public OrderOverallTO getOrderOverallTOById(Long id) {
		return orderDAO.getOrderOverallTOById(id);
	}
	
	

}
