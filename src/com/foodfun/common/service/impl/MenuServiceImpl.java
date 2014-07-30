package com.foodfun.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.dao.MenuDAO;
import com.foodfun.common.service.MenuService;
import com.foodfun.common.to.MenuTO;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDAO menuDAO;

	@Override
	public void add(MenuTO to) {
		menuDAO.add(to);
	}

	@Override
	public void update(MenuTO to) {
		menuDAO.update(to);
	}

	@Override
	public SearchPagerModel<MenuTO> getMenus(MenuCriteriaTO criteria) {
		SearchPagerModel<MenuTO> pager = criteria.getPageModel();
		if(pager == null){
			pager = new SearchPagerModel<MenuTO>();
		}
		Integer count = menuDAO.getMenusCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<MenuTO> result = menuDAO.getMenus(criteria);
			pager.setResultList(result);
			pager.setTotal(count);
		}
		return pager;
	}

	@Override
	public MenuTO getMenuById(Long id) {
		return menuDAO.getMenuById(id);
	}

	@Override
	public void updateMenuDynamic(Map<String, Object> params) {
		menuDAO.updateMenuDynamic(params);
	}

	@Override
	public void addMenuDynamic(Long menuId) {
		menuDAO.addMenuDynamic(menuId);
	}

}
