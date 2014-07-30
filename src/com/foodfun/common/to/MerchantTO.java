package com.foodfun.common.to;

import java.io.Serializable;

/**
 * 店家
 * 
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public class MerchantTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private String name;

	private String address;

	private String phone;

	private Integer status;

	private String remark;

	private String website;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

}
