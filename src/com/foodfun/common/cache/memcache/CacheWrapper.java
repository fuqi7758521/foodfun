package com.foodfun.common.cache.memcache;

import java.io.Serializable;

/**
 * 存储在memcache中的对象
 * @author qi.fu@yunyoyo.cn
 * @date 2013-04-28
 *
 */
public class CacheWrapper implements Serializable {

    private static final long serialVersionUID=1L;

    private Object cacheObject;

    public CacheWrapper() {

    }

    public Object getCacheObject() {
        return cacheObject;
    }

    public void setCacheObject(Object cacheObject) {
        this.cacheObject=cacheObject;
    }

}
