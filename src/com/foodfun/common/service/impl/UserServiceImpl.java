package com.foodfun.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.criteria.UserCriteriaTO;
import com.foodfun.common.dao.UserDAO;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.UserTO;

/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserTO getUserTOById(Long id) {
		UserTO to = new UserTO();
		to.setId(id);
		return userDAO.getUser(to);
	}

	@Override
	public void update(UserTO to) {
		userDAO.update(to);
	}

	@Override
	public void add(UserTO to) {
		userDAO.add(to);
	}

	@Override
	public UserTO getUserByUsernameAndPassword(String username, String password) {
		UserTO to = new UserTO();
		to.setUsername(username);
		to.setPassword(password);
		return userDAO.getUser(to);
	}

	@Override
	public SearchPagerModel<UserTO> getUsers(UserCriteriaTO criteria) {
		SearchPagerModel<UserTO> pageModel = criteria.getPageModel();
		if(pageModel == null){
			pageModel = new SearchPagerModel<UserTO>();
		}
		Integer count = userDAO.getUsersCnt(criteria);
		if(count != null && count != 0){
			List<UserTO> users = userDAO.getUsers(criteria);
			pageModel.setResultList(users);
			pageModel.setTotal(count);
		}
		return pageModel;
	}

	@Override
	public UserTO getUserByUsername(String username) {
		UserTO to = new UserTO();
		to.setUsername(username);
		return userDAO.getUser(to );
	}

}
