package com.foodfun.common.to;

import java.io.Serializable;
import java.net.URLEncoder;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.foodfun.common.Constants;
import com.foodfun.common.util.DES;
import com.foodfun.common.util.DateUtil;

/**
 * 用户
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-13
 */
public class UserTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private String username;

	private String realname;

	private String email;

	private String password;

	// 余额
	private Float balance;

	private Integer status;

	private Date registeredDate;
	
	private String registeredDateStr;

	private Date lastLoginedDate;
	
	private Integer isAdmin;

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Float getBalance() {
		return balance;
	}

	public void setBalance(Float balance) {
		this.balance = balance;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	public String getRegisteredDateStr(){
		return DateUtil.formatDateTime(this.registeredDate, DateUtil.FORMAT_ONE);
	}

	public void setRegisteredDateStr(String registeredDateStr) {
		this.registeredDateStr = registeredDateStr;
	}

	public Date getLastLoginedDate() {
		return lastLoginedDate;
	}

	public void setLastLoginedDate(Date lastLoginedDate) {
		this.lastLoginedDate = lastLoginedDate;
	}

	public Integer getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Integer isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	

}
