package com.foodfun.common.cache;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.foodfun.common.Constants;
import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.dao.MenuDAO;
import com.foodfun.common.to.MenuTO;

/**
 * 店家缓存
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
@Component
public class MenuHotCache extends AbstractCache {

	private static List<MenuTO> hotMenuContainer = new ArrayList<MenuTO>();

	@Resource
	private MenuDAO menuDAO;

	@Override
	public void updateCache() {
		MenuCriteriaTO criteria = new MenuCriteriaTO();
		criteria.setOrderType(Constants.MENU_ORDER_TYPE_HOT);
		// 有效菜单
		criteria.setStatus(1);

		// 最热菜单8个，用于首页显示
		SearchPagerModel<MenuTO> pageModel = new SearchPagerModel<MenuTO>(1, 8);
		criteria.setPageModel(pageModel);
		hotMenuContainer = menuDAO.getMenus(criteria);
	}

	public static List<MenuTO> getHotMenusFromCache() {
		return hotMenuContainer;
	}

}
