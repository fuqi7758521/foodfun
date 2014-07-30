package com.foodfun.common.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;


import com.foodfun.common.Constants;
import com.foodfun.common.cache.DeadlineCache;
import com.foodfun.common.cache.MerchantCache;
import com.foodfun.common.cache.memcache.MemcacheClient;
import com.foodfun.common.to.MerchantTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.DES;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

/**
 * @author qi.fu@yunyoyo.cn
 */
public class Funcs implements Constants {
    

    public static UserTO getUserFromMemcache(HttpServletRequest request) {
    	
    	//获得订餐截止时间字符串
    	request.setAttribute("deadline", DeadlineCache.getDeadlineFromCache());
    	//获得店家列表
    	request.setAttribute("merchants", MerchantCache.getMerchantsFromCache());
    	
        String uid = "";
        Cookie[] cookies=request.getCookies();
        if(cookies == null){
        	return null;
        }
        for(Cookie c: cookies) {
            String name=c.getName();
            if(name.equals(FOODFUN_USER_COOKIE)){
                uid = c.getValue();
                break;
            }
        }
        try {
            uid=DES.decode(uid, Constants.USER_ID_KEY);
        } catch(Exception e) {
            e.printStackTrace();
        }
        String userJson=(String)MemcacheClient.get(uid);
        if(StringUtils.isBlank(userJson)){
            return null;
        }else{
            ObjectMapper mapper=new ObjectMapper();
            UserTO user = null;
            try {
                user=mapper.readValue(userJson, UserTO.class);
            } catch(Exception e) {
                e.printStackTrace();
            } 
            request.setAttribute("user", user);
            return user;
        }
    }


    public static String formatDateTime(Date date, String parten) {
        if(null == date) {
            return "";
        }
        SimpleDateFormat format=new SimpleDateFormat(parten);
        return format.format(date);
    }

    public static String getBase64(String str) {
        if(null == str || str.length() == 0) {
            return "";
        }
        return Base64.encode(str.getBytes());
    }
    
    public static List<MerchantTO> getMerchantsFromMemcache(){
    	return MerchantCache.getMerchantsFromCache();
    }
    
    

}
