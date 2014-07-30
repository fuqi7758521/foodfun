package com.foodfun.common.criteria;

import com.foodfun.common.to.UserTO;

/**
 * 用户查询条件
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-17
 */
public class UserCriteriaTO extends UserTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<UserTO> pageModel;

	private String registeredStartDate;

	private String registeredEndDate;

	public SearchPagerModel<UserTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<UserTO> pageModel) {
		this.pageModel = pageModel;
	}

	public String getRegisteredStartDate() {
		return registeredStartDate;
	}

	public void setRegisteredStartDate(String registeredStartDate) {
		this.registeredStartDate = registeredStartDate;
	}

	public String getRegisteredEndDate() {
		return registeredEndDate;
	}

	public void setRegisteredEndDate(String registeredEndDate) {
		this.registeredEndDate = registeredEndDate;
	}

}
