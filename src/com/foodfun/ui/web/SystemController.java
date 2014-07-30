package com.foodfun.ui.web;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodfun.common.Constants;
import com.foodfun.common.cache.memcache.MemcacheClient;
import com.foodfun.common.service.DeadlineService;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.DES;
import com.foodfun.common.util.DateUtil;
import com.foodfun.common.util.MessageDigestUtil;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;

@Controller
public class SystemController implements Constants {
	
	private static Logger logger = Logger.getLogger(SystemController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private DeadlineService deadlineService;

	private static final String USER_LOGIN = "/pages/general/login.jsp";

	private static final String ADMIN_LOGIN = "/pages/admin/login.jsp";

	// 用户登录页面
	@RequestMapping("/general/login.html")
	public ModelAndView login(HttpServletRequest request) {
		return new ModelAndView(USER_LOGIN);
	}

	// 用户登录
	@RequestMapping("/general/dologin.html")
	public ModelAndView doLogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String username = RequestUtil.getString(request, "username");
		String password = RequestUtil.getString(request, "password");
		password = MessageDigestUtil.getMD5(password
				+ Constants.PASSWORD_SALT_KEY);
		Map<String, Object> model = new HashMap<String, Object>();
		UserTO user = userService.getUserByUsernameAndPassword(username,
				password);
		if (user != null && user.getStatus() == Constants.USER_STATUS_VALID) {
			addUserInfo2Memcache(response, user);
		} else if (user != null
				&& user.getStatus() == Constants.USER_STATUS_INVALID) {
			model.put("loginErrInfo", "该用户已失效");
			model.put("loginStatus", STATUS_ERROR);
			return new ModelAndView(USER_LOGIN, "model", model);
		} else {
			model.put("loginErrInfo", "您的用户名和密码不匹配");
			model.put("loginStatus", STATUS_ERROR);
			return new ModelAndView(USER_LOGIN, "model", model);
		}
		return new ModelAndView(
				new RedirectView(request.getContextPath() + "/"), "model", null);
	}

	// 用户退出
	@RequestMapping("/general/logout.html")
	public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response) {
		String uid = "";
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			String name = c.getName();
			if (name.equals(Constants.FOODFUN_USER_COOKIE)) {
				uid = c.getValue();
				break;
			}
		}
		try {
			uid = DES.decode(uid, Constants.USER_ID_KEY);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MemcacheClient.delete(uid);
		return new ModelAndView(
				new RedirectView(request.getContextPath() + "/"), "model", null);
	}
	
	
	// 安卓、ios版即将开发
	@RequestMapping("/general/comingSoon.html")
	public ModelAndView comingSoon(HttpServletRequest request) {
		return new ModelAndView("/pages/general/comingSoon.jsp");
	}

	private void addUserInfo2Memcache(HttpServletResponse response, UserTO user)
			throws Exception {
		Cookie cookie = new Cookie(Constants.FOODFUN_USER_COOKIE, DES.encode(
				user.getId().toString(), Constants.USER_ID_KEY));
		cookie.setMaxAge(Constants.LOGIN_USER_EXP);
		cookie.setPath("/foodfun");
		response.addCookie(cookie);

		ObjectMapper mapper = new ObjectMapper();
		String userJson = mapper.writeValueAsString(user);
		MemcacheClient.set(user.getId().toString(), userJson,
				Constants.LOGIN_USER_EXP);
	}

	// 管理员登录页面
	@RequestMapping("/admin/login.html")
	public ModelAndView adminLogin(HttpServletRequest request) {
		return new ModelAndView(ADMIN_LOGIN);
	}

	// 登录后台
	@RequestMapping("/admin/doLogin.html")
	public ModelAndView adminDoLogin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String username = RequestUtil.getString(request, "username");
		String password = RequestUtil.getString(request, "password");
		password = MessageDigestUtil.getMD5(password
				+ Constants.PASSWORD_SALT_KEY);
		Map<String, Object> model = new HashMap<String, Object>();
		UserTO user = userService.getUserByUsernameAndPassword(username,
				password);
		if (user != null && user.getStatus() == Constants.USER_STATUS_VALID
				&& user.getIsAdmin().equals(Constants.STATUS_VALID)) {
			addUserInfo2Memcache(response, user);
		} else if (user != null
				&& (user.getStatus() == Constants.USER_STATUS_INVALID || user
						.getIsAdmin().equals(Constants.STATUS_INVALID))) {
			model.put("loginErrInfo", "该用户已失效 或者不是管理员");
			model.put("loginStatus", STATUS_ERROR);
			return new ModelAndView(ADMIN_LOGIN, "model", model);
		} else {
			model.put("loginErrInfo", "您的用户名和密码不匹配");
			model.put("loginStatus", STATUS_ERROR);
			return new ModelAndView(ADMIN_LOGIN, "model", model);
		}
		return new ModelAndView(new RedirectView(request.getContextPath()
				+ "/admin/index.html"), "model", null);

	}
	
	// 管理员退出
		@RequestMapping("/admin/logout.html")
		public ModelAndView adminLogout(HttpServletRequest request,
				HttpServletResponse response) {
			String uid = "";
			Cookie[] cookies = request.getCookies();
			for (Cookie c : cookies) {
				String name = c.getName();
				if (name.equals(Constants.FOODFUN_USER_COOKIE)) {
					uid = c.getValue();
					break;
				}
			}
			try {
				uid = DES.decode(uid, Constants.USER_ID_KEY);
			} catch (Exception e) {
				e.printStackTrace();
			}
			MemcacheClient.delete(uid);
			return new ModelAndView(
					new RedirectView(request.getContextPath() + "/admin/login.html"), "model", null);
		}


	@RequestMapping("/admin/goDeadlinePage.html")
	public ModelAndView goOrderDeadlinePage(HttpServletRequest request) {
		UserTO user = Funcs.getUserFromMemcache(request);
		if (user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)) {
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
		request.setAttribute("menuLocal", "system");
		Date deadline = deadlineService.getDeadline();
		request.setAttribute("deadline",
				DateUtil.formatDateTime(deadline, DateUtil.LONG_TIME_FORMAT));
		return new ModelAndView("/pages/admin/deadline.jsp");
	}

	//更新截止时间
	@RequestMapping("/admin/updateDeadline.html")
	@ResponseBody
	public Integer updateDeadline(HttpServletRequest request) {
		String deadlineStr = RequestUtil.getString(request, "deadline");
		try{
			deadlineService.update(deadlineStr);
		}catch (Exception e) {
			logger.error("更新订餐截止时间失败",e);
			return STATUS_ERROR;
		}
		return STATUS_OK;
	}

}
