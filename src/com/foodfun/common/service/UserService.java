package com.foodfun.common.service;

import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.criteria.UserCriteriaTO;
import com.foodfun.common.to.UserTO;


/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public interface UserService {
	
	UserTO getUserTOById(Long id);
	
	void update(UserTO to);
	
	void add(UserTO to);
	
	UserTO getUserByUsernameAndPassword(String username, String password);
	
	SearchPagerModel<UserTO> getUsers(UserCriteriaTO criteria);

	UserTO getUserByUsername(String username);

}
