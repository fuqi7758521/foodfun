package com.foodfun.common.to;

import java.io.Serializable;
import java.util.Date;

import com.foodfun.common.util.DateUtil;

/**
 * 充值记录
 * 
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public class ChargeLogTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private Long userId;
	
	private String userRealname;

	private Float money;

	private Date chargedDate;

	private Date confirmedDate;

	private Integer status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Date getChargedDate() {
		return chargedDate;
	}
	
	public String getChargedDateStr() {
		return DateUtil.formatDateTime(this.chargedDate, DateUtil.FORMAT_ONE);
	}

	public void setChargedDate(Date chargedDate) {
		this.chargedDate = chargedDate;
	}

	public Date getConfirmedDate() {
		return confirmedDate;
	}
	
	public String getConfirmedDateStr(){
		return DateUtil.formatDateTime(this.confirmedDate, DateUtil.FORMAT_ONE);
	}

	public void setConfirmedDate(Date confirmedDate) {
		this.confirmedDate = confirmedDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}
	
	

}
