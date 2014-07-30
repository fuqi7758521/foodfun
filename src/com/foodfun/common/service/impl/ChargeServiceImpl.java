package com.foodfun.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.dao.ChargeDAO;
import com.foodfun.common.service.ChargeService;
import com.foodfun.common.to.ChargeLogTO;

/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-20
 */
@Service
public class ChargeServiceImpl implements ChargeService {

	@Autowired
	private ChargeDAO chargeDAO;

	@Override
	public void saveChargeLog(ChargeLogTO to) {
		chargeDAO.addChargeLog(to);
	}

	@Override
	public void updateChargeLog(ChargeLogTO to) {
		chargeDAO.updateChargeLog(to);
	}

	@Override
	public SearchPagerModel<ChargeLogTO> getChargeLogs(
			ChargeLogCriteriaTO criteria) {
		SearchPagerModel<ChargeLogTO> pager = criteria.getPageModel();
		Integer count = chargeDAO.getChargeLogsCnt(criteria);
		if (null != count && count.intValue() > 0) {
			List<ChargeLogTO> result = chargeDAO.getChargeLogs(criteria);
			pager.setResultList(result);
			pager.setTotal(count);
		}
		return pager;
	}

	@Override
	public ChargeLogTO getChargeById(Long chargeLogId) {
		return chargeDAO.getChargeById(chargeLogId);
	}

}
