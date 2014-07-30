package com.foodfun.common.cache;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.foodfun.common.criteria.MerchantCriteriaTO;
import com.foodfun.common.dao.MerchantDAO;
import com.foodfun.common.to.MerchantTO;

/**
 * 店家缓存
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
@Component
public class MerchantCache extends AbstractCache {

    private static List<MerchantTO> container=new ArrayList<MerchantTO>();

    @Resource
    private MerchantDAO merchantDAO;

    @Override
    public void updateCache() {
        	MerchantCriteriaTO criteria=new MerchantCriteriaTO();
        	criteria.setStatus(1);
        	container=merchantDAO.getMerchants(criteria);
    }
    
    public static List<MerchantTO> getMerchantsFromCache(){
    	return container;
    }

}
