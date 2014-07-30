package com.foodfun.common.service;

import java.util.Map;

import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.to.MenuTO;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
public interface MenuService {
	
	void add(MenuTO to);

	void update(MenuTO to);
	
	SearchPagerModel<MenuTO> getMenus(MenuCriteriaTO criteria);
	
	MenuTO getMenuById(Long id);
	
	void updateMenuDynamic(Map<String, Object> params);
	
	void addMenuDynamic(Long menuId);
	
}
