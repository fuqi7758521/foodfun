package com.foodfun.common.to;

import java.io.Serializable;
import java.util.Date;

import com.foodfun.common.util.DateUtil;

/**
 * 菜单
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
public class MenuTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	// 店家ID
	private Long merchantId;

	// 店家名称
	private String merchantName;

	// 菜名
	private String name;

	// 菜单价格
	private Float price;

	// 图片地址
	private String imgUrl;

	private Integer status;

	private Long countOfComment;

	private Long countOfOrder;

	private Date createdDate;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(Long merchantId) {
		this.merchantId = merchantId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getImgUrl() {
		if (this.imgUrl == null || this.imgUrl.replaceAll(" ", "") == "") {
			return "http://192.168.5.244/foodfun/assets/temp/products/default_food_img.png";
		}
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getCountOfComment() {
		return countOfComment;
	}

	public void setCountOfComment(Long countOfComment) {
		this.countOfComment = countOfComment;
	}

	public Long getCountOfOrder() {
		return countOfOrder;
	}

	public void setCountOfOrder(Long countOfOrder) {
		this.countOfOrder = countOfOrder;
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

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public Integer getNewMenu() {
		if(new Date().getDate() == this.createdDate.getDate()){
			return 1;
		}else{
			return 0;
		}
	}

}
