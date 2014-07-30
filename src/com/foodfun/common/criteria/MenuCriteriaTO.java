package com.foodfun.common.criteria;

import com.foodfun.common.to.MenuTO;

/**
 * 菜单查询条件
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-21
 */
public class MenuCriteriaTO extends MenuTO {

	private static final long serialVersionUID = 1L;

	private SearchPagerModel<MenuTO> pageModel;

	//排序类型; 1:表示按订购人数倒序排; 2:按价格升序排: 3:按创建时间降序
	private Integer orderType;

	public SearchPagerModel<MenuTO> getPageModel() {
		return pageModel;
	}

	public void setPageModel(SearchPagerModel<MenuTO> pageModel) {
		this.pageModel = pageModel;
	}

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

}
