package com.foodfun.common.criteria;

import com.foodfun.common.to.MerchantTO;

/**
 * 店家查询条件
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-17
 */
public class MerchantCriteriaTO extends MerchantTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<MerchantTO> pageModel;


	public SearchPagerModel<MerchantTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<MerchantTO> pageModel) {
		this.pageModel = pageModel;
	}

}
