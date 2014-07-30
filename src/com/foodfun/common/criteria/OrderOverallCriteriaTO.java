package com.foodfun.common.criteria;

import com.foodfun.common.to.OrderOverallTO;

/**
 * 订餐订单查询条件
 * 
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-17
 */
public class OrderOverallCriteriaTO extends OrderOverallTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<OrderOverallTO> pageModel;

	private String startTime;

	private String endTime;

	public SearchPagerModel<OrderOverallTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<OrderOverallTO> pageModel) {
		this.pageModel = pageModel;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
