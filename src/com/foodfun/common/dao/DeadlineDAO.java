package com.foodfun.common.dao;

import java.util.Date;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-04-13
 */
public interface DeadlineDAO {

	void update(String deadline);
	
	Date getDeadline();
}
