package com.foodfun.common.criteria;

import com.foodfun.common.to.ChargeLogTO;

/**
 * 充值记录查询条件
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
public class ChargeLogCriteriaTO extends ChargeLogTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<ChargeLogTO> pageModel;

	private String chargedStartDate;

	private String chargedEndDate;

	public SearchPagerModel<ChargeLogTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<ChargeLogTO> pageModel) {
		this.pageModel = pageModel;
	}

	public String getChargedStartDate() {
		return chargedStartDate;
	}

	public void setChargedStartDate(String chargedStartDate) {
		this.chargedStartDate = chargedStartDate;
	}

	public String getChargedEndDate() {
		return chargedEndDate;
	}

	public void setChargedEndDate(String chargedEndDate) {
		this.chargedEndDate = chargedEndDate;
	}

}
