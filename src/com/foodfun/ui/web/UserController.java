package com.foodfun.ui.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foodfun.common.Constants;
import com.foodfun.common.cache.MerchantCache;
import com.foodfun.common.cache.memcache.MemcacheClient;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.criteria.UserCriteriaTO;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.MessageDigestUtil;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;


/**
 * 用户controller
 * @author fuqi7758521@gmail.com
 * @date 2013-04-12
 */

@Controller
public class UserController implements Constants {

    private static Logger logger=Logger.getLogger(UserController.class);
    
    @Autowired
    private UserService userService; 

    //我的帐号
    @RequestMapping("/general/myAccount.html")
    public ModelAndView showMyAccount(HttpServletRequest request){
    	UserTO user=Funcs.getUserFromMemcache(request);
    	if(user == null){
    		 return new ModelAndView(FOODFUN_LOGIN);
    	}
    	user = userService.getUserTOById(user.getId());
    	request.setAttribute("user", user);
    	return new ModelAndView("/pages/general/myAccount.jsp");
    }
    
   //验证原始密码是否一致
    @ResponseBody
    @RequestMapping("/general/validatePassword.html")
    public String userPassword(HttpServletRequest request,String oldPassword){
    	UserTO user=Funcs.getUserFromMemcache(request);
    	if(oldPassword!=null){
    		oldPassword=MessageDigestUtil.getMD5(oldPassword + Constants.PASSWORD_SALT_KEY);
    		UserTO userNew=userService.getUserTOById(user.getId());
			return userNew.getPassword().equals(oldPassword) ? "ok" : "error";
		}else{
    		return "error";
    	}
    }
    
    //更改密码
    @RequestMapping("/general/changePassword.html")
    @ResponseBody
    public Integer changePassword(HttpServletRequest request){
    	UserTO user=Funcs.getUserFromMemcache(request);
    	if(user != null){
    		String password = RequestUtil.getString(request, "newPassword");
    		password = MessageDigestUtil.getMD5(password + PASSWORD_SALT_KEY);
    		UserTO to = new UserTO();
    		to.setId(user.getId());
    		to.setPassword(password);
    		try{
    			userService.update(to);
    		}catch (Exception e) {
    			return STATUS_ERROR;
			}
			return STATUS_OK;
    	}else{
    		return NOT_YET_LOGIN;
    	}
    	
    }
    
    //用户页面
    @RequestMapping("/admin/user/listPage.html")
    public ModelAndView userPage(HttpServletRequest request){
		UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
    	request.setAttribute("menuLocal", "user");
    	return new ModelAndView("/pages/admin/user.jsp");
    }
    
    //用户数据列表
    @RequestMapping("/admin/user/listTable.html")
    @ResponseBody
    public Map<String, Object> userTable(HttpServletRequest request, int iDisplayLength, int iDisplayStart){
    	String realname = RequestUtil.getString(request, "realname");
    	Integer status = RequestUtil.getInteger(request, "status");
		SearchPagerModel<UserTO> pageModel = new SearchPagerModel<UserTO>(iDisplayStart, iDisplayLength);
    	UserCriteriaTO criteria = new UserCriteriaTO();
    	criteria.setStatus(status);
    	criteria.setRealname(realname);
    	criteria.setPageModel(pageModel);
		pageModel = userService.getUsers(criteria );
		
		Map<String, Object> data=new HashMap<String, Object>();
        data.put("aaData", pageModel.getResultList()==null ? "" : pageModel.getResultList());
        data.put("iTotalDisplayRecords", pageModel.getTotal());
        data.put("iTotalRecords", pageModel.getTotal());
        return data;
    }
   
    
    //添加用户或更新用户
    @RequestMapping("/admin/user/addOrUpdate.html")
    @ResponseBody
    public Integer addUser(HttpServletRequest request){
    	Long id = RequestUtil.getLong(request, "id");
    	String username = RequestUtil.getString(request, "username");
    	String realname = RequestUtil.getString(request, "realname");
    	String email = RequestUtil.getString(request, "email");
    	String password = RequestUtil.getString(request, "password");
    	Float balance = RequestUtil.getFloat(request, "balance");
    	Integer status = RequestUtil.getInteger(request, "status");
    	Integer isAdmin = RequestUtil.getInteger(request, "isAdmin");
    	//判断该用户名是否已经存在
    	if(id == null && userService.getUserByUsername(username) != null){
    		return USER_ALREADY_EXISTED;
    	}
    	UserTO to = new UserTO();
    	if(StringUtils.isNotEmpty(password)){
    		password=MessageDigestUtil.getMD5(password + Constants.PASSWORD_SALT_KEY);
    		to.setPassword(password);
    	}
    	if(balance !=null && balance!= 0){
    		to.setBalance(balance);
    	}
    	if(status != null){
    		to.setStatus(status);
    	}
    	to.setUsername(username);
    	to.setRealname(realname);
    	to.setEmail(email);
    	try{
    		if(id != null){
    			to.setId(id);
    			to.setIsAdmin(isAdmin);
    			userService.update(to);
    			MemcacheClient.delete(id.toString());
    		}else{
    			userService.add(to);
    		}
    	}catch (Exception e) {
			return STATUS_ERROR;
		}
    	return STATUS_OK;
    }

}
