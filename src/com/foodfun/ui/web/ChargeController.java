package com.foodfun.ui.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodfun.common.Constants;
import com.foodfun.common.criteria.ChargeLogCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.service.ChargeService;
import com.foodfun.common.service.UserService;
import com.foodfun.common.to.ChargeLogTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;

/**
 * 充值controller
 * 
 * @author fuqi7758521@gmail.com
 * @date 2013-04-12
 */

@Controller
public class ChargeController implements Constants {

	private static Logger logger = Logger.getLogger(ChargeController.class);

	@Autowired
	private ChargeService chargeService;

	@Autowired
	private UserService userService;

	// 用户充值
	@RequestMapping("/general/doCharge.html")
	public ModelAndView charge(HttpServletRequest request) {
		UserTO user = Funcs.getUserFromMemcache(request);
		if (user == null) {
			return new ModelAndView(FOODFUN_LOGIN);
		}

		Float money = RequestUtil.getFloat(request, "money");

		ChargeLogTO to = new ChargeLogTO();
		to.setMoney(money);
		to.setUserId(user.getId());
		chargeService.saveChargeLog(to);

		return new ModelAndView(new RedirectView(request.getContextPath()
				+ "/general/myCharges.html"), "model", null);
	}

	// 用户取消充值
	@RequestMapping("/undoCharge.html")
	public ModelAndView undoCharge(HttpServletRequest request) {
		UserTO user = Funcs.getUserFromMemcache(request);
		if (user == null) {
			return new ModelAndView(FOODFUN_LOGIN);
		}
		Long id = RequestUtil.getLong(request, "id");
		ChargeLogTO to = new ChargeLogTO();
		to.setId(id);
		to.setStatus(Constants.CHARGE_STATUS_UNDO);
		chargeService.updateChargeLog(to);
		return null;
	}

	@RequestMapping("/general/myCharges.html")
	public ModelAndView myChargePage(HttpServletRequest request) {
		UserTO user = Funcs.getUserFromMemcache(request);
		if (user == null) {
			return new ModelAndView(FOODFUN_LOGIN);
		}
		return new ModelAndView("/pages/general/myCharges.jsp");
	}

	// 我的充值记录
	@RequestMapping("/general/myChargesTable.html")
	@ResponseBody
	public Map<String, Object> getChargeTable(HttpServletRequest request,
			int iDisplayLength, int iDisplayStart) {

		ChargeLogCriteriaTO criteria = new ChargeLogCriteriaTO();
		criteria.setUserId(RequestUtil.getLong(request, "userId"));
		SearchPagerModel<ChargeLogTO> searchPagerModel = new SearchPagerModel<ChargeLogTO>(
				iDisplayStart, iDisplayLength);
		criteria.setPageModel(searchPagerModel);
		searchPagerModel = chargeService.getChargeLogs(criteria);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("aaData", searchPagerModel.getResultList() == null ? ""
				: searchPagerModel.getResultList());
		data.put("iTotalDisplayRecords", searchPagerModel.getTotal());
		data.put("iTotalRecords", searchPagerModel.getTotal());
		return data;
	}

	// 管理员确认充值
	@RequestMapping("/admin/charge/update.html")
	@ResponseBody
	public Integer chargeConfirm(HttpServletRequest request) {
		Long chargeLogId = RequestUtil.getLong(request, "chargeLogId");
		Integer status = RequestUtil.getInteger(request, "status");
		ChargeLogTO to = chargeService.getChargeById(chargeLogId);
		to.setId(chargeLogId);
		to.setStatus(status);
		try {
			chargeService.updateChargeLog(to);
			if(status.equals(CHARGE_STATUS_CONFIRMED)){
				UserTO user = userService.getUserTOById(to.getUserId());
				UserTO tmp = new UserTO();
				tmp.setId(user.getId());
				tmp.setBalance(user.getBalance() + to.getMoney());
				userService.update(tmp);
			}
		} catch (Exception e) {
			return STATUS_ERROR;
		}
		return STATUS_OK;
	}

	@RequestMapping("/admin/charge/listPage.html")
	public ModelAndView chargePage(HttpServletRequest request) {
		UserTO user=Funcs.getUserFromMemcache(request);
		if(user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)){
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
		request.setAttribute("menuLocal", "charge");
		return new ModelAndView("/pages/admin/charge.jsp");
	}

	@RequestMapping("/admin/charge/chargeTable.html")
	@ResponseBody
	public Map<String, Object> chargeTable(HttpServletRequest request,
			int iDisplayLength, int iDisplayStart) {
		String startChargeDateStr = RequestUtil.getString(request,
				"startChargeDate");
		String endChargeDateStr = RequestUtil.getString(request,
				"endChargeDate");
		Integer status = RequestUtil.getInteger(request, "status");

		ChargeLogCriteriaTO criteria = new ChargeLogCriteriaTO();
		criteria.setChargedStartDate(startChargeDateStr);
		criteria.setChargedEndDate(endChargeDateStr);
		SearchPagerModel<ChargeLogTO> pageModel = new SearchPagerModel<ChargeLogTO>(
				iDisplayStart, iDisplayLength);
		criteria.setPageModel(pageModel);
		criteria.setStatus(status);
		pageModel = chargeService.getChargeLogs(criteria);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put(
				"aaData",
				pageModel.getResultList() == null ? "" : pageModel
						.getResultList());
		data.put("iTotalDisplayRecords", pageModel.getTotal());
		data.put("iTotalRecords", pageModel.getTotal());
		return data;
	}
}
