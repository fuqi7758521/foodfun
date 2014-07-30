package com.foodfun.common.criteria;

import com.foodfun.common.to.OrderDetailTO;

/**
 * 用户查询条件
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-17
 */
public class OrderDetailCriteriaTO extends OrderDetailTO {

	private static final long serialVersionUID = 1L;

	private String startOrderDateStr;

	private String endOrderDateStr;

	private SearchPagerModel<OrderDetailTO> pageModel;

	public SearchPagerModel<OrderDetailTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<OrderDetailTO> pageModel) {
		this.pageModel = pageModel;
	}

	public String getStartOrderDateStr() {
		return startOrderDateStr;
	}

	public void setStartOrderDateStr(String startOrderDateStr) {
		this.startOrderDateStr = startOrderDateStr;
	}

	public String getEndOrderDateStr() {
		return endOrderDateStr;
	}

	public void setEndOrderDateStr(String endOrderDateStr) {
		this.endOrderDateStr = endOrderDateStr;
	}

}
