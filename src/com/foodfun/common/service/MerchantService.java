package com.foodfun.common.service;

import java.util.List;

import com.foodfun.common.criteria.MerchantCriteriaTO;
import com.foodfun.common.to.MerchantTO;


/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public interface MerchantService {
	
	void add(MerchantTO to);
	
	void update(MerchantTO to);
	
	void delete(Long id);
	
	List<MerchantTO> getMerchants(MerchantCriteriaTO criteria);
	
	MerchantTO getById(Long id);
}
