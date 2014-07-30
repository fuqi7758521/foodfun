package com.foodfun.ui.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.foodfun.common.Constants;
import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.criteria.MerchantCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.service.ChargeService;
import com.foodfun.common.service.MerchantService;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.ChargeLogTO;
import com.foodfun.common.to.MerchantTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;

/**
 * 店家controller
 * 
 * @author fuqi7758521@gmail.com
 * @date 2014-03-25
 */

@Controller
public class MerchantController implements Constants {

	private static Logger logger = Logger.getLogger(MerchantController.class);
	
	@Autowired
	private MerchantService merchantService;
	
	//店家列表
	@RequestMapping("/admin/merchant/listPage.html")
	public ModelAndView listPage(HttpServletRequest request){
		UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
		request.setAttribute("menuLocal", "merchant");
		return new ModelAndView("/pages/admin/merchant.jsp");
	}
	
	//店家数据
	@RequestMapping("/admin/merchant/listTable.html")
	@ResponseBody
	public Map<String, Object> listTable(HttpServletRequest request, int iDisplayStart , int iDisplayLength){
		MerchantCriteriaTO criteria = new MerchantCriteriaTO();
		List<MerchantTO> merchants = merchantService.getMerchants(criteria );
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put(
				"aaData",
				merchants);
		data.put("iTotalDisplayRecords", merchants.size());
		data.put("iTotalRecords", merchants.size());
		return data;
	}
	
	
	//添加或更新店家
	@RequestMapping("/admin/merchant/addOrUpdate.html")
	@ResponseBody
	public Integer addOrUpdateMerchant(HttpServletRequest request){
		Long id = RequestUtil.getLong(request, "id");
		String name = RequestUtil.getString(request, "name");
		String address = RequestUtil.getString(request, "address");
		String website = RequestUtil.getString(request, "website");
		String phone = RequestUtil.getString(request, "phone");
		String remark = RequestUtil.getString(request, "remark");
		Integer status = RequestUtil.getInteger(request, "status");
		MerchantTO merchant = new MerchantTO();
		merchant.setAddress(address);
		merchant.setName(name);
		merchant.setPhone(phone);
		merchant.setRemark(remark);
		merchant.setWebsite(website);
		try{
			if(id != null){
				merchant.setId(id);
				merchant.setStatus(status);
				merchantService.update(merchant);
			}else{
				merchantService.add(merchant);
			}
		}catch (Exception e) {
			return STATUS_ERROR;
			
		}
		return STATUS_OK;
	}
	
}
