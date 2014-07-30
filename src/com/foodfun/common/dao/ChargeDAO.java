package com.foodfun.common.dao;

import java.util.List;

import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.to.ChargeLogTO;



/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-04-13
 */
public interface ChargeDAO {

    void addChargeLog(ChargeLogTO to);
    
    void updateChargeLog(ChargeLogTO to);
    
    List<ChargeLogTO> getChargeLogs(ChargeLogCriteriaTO criteria);
    
    Integer getChargeLogsCnt(ChargeLogCriteriaTO criteria);

	ChargeLogTO getChargeById(Long id);
    
}
