package com.foodfun.common.to;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单详情
 * 
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public class OrderDetailTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private Long orderOverallId;

	private Long menuId;

	private String menuName;

	private Long merchantId;

	private String merchantName;

	private Float price;

	private Integer count;

	private Date createdDate;

	private Integer status;
	
	private Float sumMoney;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOrderOverallId() {
		return orderOverallId;
	}

	public void setOrderOverallId(Long orderOverallId) {
		this.orderOverallId = orderOverallId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(Long merchantId) {
		this.merchantId = merchantId;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}
	
	public float getSumMoney(){
		if(count != null && price != null){
			return this.price * this.count;
		}
		return 0.0f;
	}

	public void setSumMoney(Float sumMoney) {
		this.sumMoney = sumMoney;
	}
	
	

}
