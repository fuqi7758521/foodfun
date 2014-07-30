package com.foodfun.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.criteria.MerchantCriteriaTO;
import com.foodfun.common.dao.MerchantDAO;
import com.foodfun.common.service.MerchantService;
import com.foodfun.common.to.MerchantTO;


/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-17
 */
@Service
public class MerchantServiceImpl implements MerchantService {
	
	@Autowired
	private MerchantDAO merchantDAO;
 
	@Override
	public void add(MerchantTO to) {
		merchantDAO.add(to);
	}

	@Override
	public void update(MerchantTO to) {
		merchantDAO.update(to);
	}

	@Override
	public void delete(Long id) {
		merchantDAO.delete(id);
	}

	@Override
	public List<MerchantTO> getMerchants(MerchantCriteriaTO criteria) {
		return merchantDAO.getMerchants(criteria);
	}

	@Override
	public MerchantTO getById(Long id) {
		return merchantDAO.getById(id);
	}

}
