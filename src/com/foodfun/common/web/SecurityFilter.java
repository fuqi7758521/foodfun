package com.foodfun.common.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.foodfun.common.Constants;
import com.foodfun.common.cache.memcache.MemcacheClient;
import com.foodfun.common.util.DES;
import com.foodfun.common.util.RequestUtil;

/**
 * 登陆验证
 */
public class SecurityFilter implements Filter {

    private static String redirectUrl="/login.html";

    private static final List<String> ignoreUrlList=new ArrayList<String>();

    public void init(FilterConfig filterConfig) throws ServletException {
        String temp=filterConfig.getInitParameter("ignoreUrl");
        if(null != temp && !"".equals(temp)) {
            String[] ts=temp.split(";");
            for(String t: ts) {
                ignoreUrlList.add(t);
            }
        }
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException,
        ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        String servletPath=request.getServletPath();

        if(null != request.getPathInfo()) {
            servletPath+=request.getPathInfo();
        }

        if(ignoreUrlList.contains(servletPath)) {
            chain.doFilter(request, response);
            return;
        }
        
        String uid = "";
        Cookie[] cookies=request.getCookies();
        if(cookies != null){
            for(Cookie c: cookies) {
                String name=c.getName();
                if(name.equals(Constants.FOODFUN_USER_COOKIE)){
                    uid = c.getValue();
                    c.setPath("/yunyoyoadmin");
                    c.setMaxAge(Constants.LOGIN_USER_EXP);
                    response.addCookie(c);
                    break;
                }
            }
        }
        try {
            uid=DES.decode(uid, Constants.USER_ID_KEY);
        } catch(Exception e) {
            e.printStackTrace();
        }
        String userJson=(String)MemcacheClient.get(uid);
        
        if(StringUtils.isBlank(userJson)) {
            if(RequestUtil.isAjax(request)) {
                PrintWriter out=response.getWriter();
                response.setContentType("application/json; charset=UTF-8");
                out.println("testff");
            } else {
                response.sendRedirect(request.getContextPath() + redirectUrl);
            }
            return;
        }
        //更新memcahe
        MemcacheClient.set(uid, userJson, Constants.LOGIN_USER_EXP);
        chain.doFilter(request, response);
    }

}
