package com.foodfun.common.dao;

import java.util.List;

import com.foodfun.common.criteria.UserCriteriaTO;
import com.foodfun.common.to.UserTO;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-04-13
 */
public interface UserDAO {

	void update(UserTO to);

	void add(UserTO to);

	UserTO getUser(UserTO to);

	List<UserTO> getUsers(UserCriteriaTO criteria);

	Integer getUsersCnt(UserCriteriaTO criteria);

}
