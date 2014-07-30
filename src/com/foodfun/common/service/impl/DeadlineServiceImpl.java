package com.foodfun.common.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.dao.DeadlineDAO;
import com.foodfun.common.service.DeadlineService;

/**
 * @author fuqi7758521@gmail.com
 * @date 2014-03-26
 */
@Service
public class DeadlineServiceImpl implements DeadlineService {

	@Autowired
	private DeadlineDAO deadlineDAO;

	@Override
	public void update(String deadline) {
		deadlineDAO.update(deadline);
	}

	@Override
	public Date getDeadline() {
		return deadlineDAO.getDeadline();
	}


}
