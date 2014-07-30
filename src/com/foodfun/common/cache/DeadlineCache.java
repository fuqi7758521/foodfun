package com.foodfun.common.cache;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.foodfun.common.dao.DeadlineDAO;
import com.foodfun.common.util.DateUtil;

/**
 * 订餐截止时间缓存
 * @author fuqi7758521@gmail.com
 * @date 2014-03-20
 */
@Component
public class DeadlineCache extends AbstractCache {

    private static String deadlineStr= "";

    @Resource
    private DeadlineDAO deadlineDAO;

    @Override
    public void updateCache() {
    		Date deadline = deadlineDAO.getDeadline();
    		deadlineStr = DateUtil.formatDateTime(deadline, DateUtil.LONG_TIME_FORMAT);
    }
    
    public static String getDeadlineFromCache(){
    	return deadlineStr;
    }

}
