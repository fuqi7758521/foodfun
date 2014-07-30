package com.foodfun.common.web;

import java.util.Map;

/**
 * @author qi.fu@yunyoyo.cn
 * @date 2013-04-08
 */
public class JSONBody {

    private Map<String, Object> data;

    private Integer status;

    private String msg;

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data=data;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status=status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg=msg;
    }

}
