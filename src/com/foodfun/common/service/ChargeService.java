package com.foodfun.common.service;


import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.to.ChargeLogTO;


/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public interface ChargeService {
	
	void saveChargeLog(ChargeLogTO to);
    
    void updateChargeLog(ChargeLogTO to);
	
	SearchPagerModel<ChargeLogTO> getChargeLogs(ChargeLogCriteriaTO criteria);

	ChargeLogTO getChargeById(Long chargeLogId);
}
