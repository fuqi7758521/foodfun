package com.foodfun.common.dao;

import java.util.List;
import java.util.Map;

import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.to.MenuTO;



/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-04-13
 */
public interface MenuDAO {
	
	void add(MenuTO to);
	
	void update(MenuTO to);
	
	List<MenuTO> getMenus(MenuCriteriaTO criteria);
	
	Integer getMenusCnt(MenuCriteriaTO criteria);
	
	MenuTO getMenuById(Long id);
	
	void updateMenuDynamic(Map<String, Object> params);

	void addMenuDynamic(Long menuId);
    
}
