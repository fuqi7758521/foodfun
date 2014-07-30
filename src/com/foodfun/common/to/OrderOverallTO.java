package com.foodfun.common.to;

import java.io.Serializable;
import java.util.Date;

import com.foodfun.common.util.DateUtil;

/**
 * 订单概括
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
public class OrderOverallTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private Long userId;

	private String userRealname;

	private Float money;

	private String des;

	private Integer status;

	private Date createdDate;

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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public String getCreatedDateStr() {
		return DateUtil.formatDateTime(this.createdDate, DateUtil.FORMAT_ONE);
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

}
