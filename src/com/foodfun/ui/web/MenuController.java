package com.foodfun.ui.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodfun.common.Constants;
import com.foodfun.common.cache.MerchantCache;
import com.foodfun.common.criteria.MenuCriteriaTO;
import com.foodfun.common.criteria.SearchPagerModel;
import com.foodfun.common.service.MenuService;
import com.foodfun.common.service.MerchantService;
import com.foodfun.common.to.MenuTO;
import com.foodfun.common.to.UserTO;
import com.foodfun.common.util.DateUtil;
import com.foodfun.common.util.PropUtil;
import com.foodfun.common.util.RequestUtil;
import com.foodfun.common.web.Funcs;

/**
 * 菜单controller
 * 
 * @author fuqi7758521@gamil.com
 * @date 2014-03-20
 */

@Controller
public class MenuController implements Constants {

	private static Logger logger = Logger.getLogger(MenuController.class);
	
	private static Integer PAGE_SIZE = 20;
	
	private static String MENU_CATEGORY = "/pages/general/category.jsp"; 
	
	 private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	 private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	 private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	 
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MerchantService merchantService;
	
	//菜单列表
	@RequestMapping("/general/menu/list.html")
	public ModelAndView listMenus(HttpServletRequest request){
		Funcs.getUserFromMemcache(request);
		
		Long merchantId = RequestUtil.getLong(request, "merchantId");
		Integer sortType = RequestUtil.getInteger(request, "sortType");
		Integer pageNum = RequestUtil.getInteger(request, "pageNum") == null ? 1 : RequestUtil.getInteger(request, "pageNum");
		Integer pageSize  = RequestUtil.getInteger(request, "pageSize") == null ? PAGE_SIZE : RequestUtil.getInteger(request, "pageSize");
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("merchantId", merchantId);
		MenuCriteriaTO criteria = new MenuCriteriaTO();
		criteria.setStatus(STATUS_VALID);
		criteria.setMerchantId(merchantId);
		criteria.setOrderType(sortType);
		SearchPagerModel<MenuTO> pagerModel = new SearchPagerModel<MenuTO>((pageNum - 1) * pageSize, pageSize);
		criteria.setPageModel(pagerModel);
		pagerModel = menuService.getMenus(criteria );
		request.setAttribute("menus", pagerModel.getResultList());
		int totalItems = pagerModel.getTotal();
		request.setAttribute("totalItems", totalItems);
		int pageItems = 0;
		if(totalItems % pageSize != 0){
			pageItems = totalItems / pageSize + 1;
		}else{
			pageItems = totalItems / pageSize;
		}
		request.setAttribute("pageItems", pageItems);
		String merchantName = "全部";
		String remark = "";
		if(merchantId != null){
			merchantName = merchantService.getById(merchantId).getName();
			remark = merchantService.getById(merchantId).getRemark();
		}
		request.setAttribute("merchantName", merchantName);
		request.setAttribute("merchantRemark", remark);
		return new ModelAndView(MENU_CATEGORY);
		
	}

	// 菜单页面
	@RequestMapping("/admin/menu/listPage.html")
	public ModelAndView menuPage(HttpServletRequest request) {
		UserTO user = Funcs.getUserFromMemcache(request);
		if (user == null || user.getIsAdmin().equals(ADMIN_STATUS_INVALID)) {
			return new ModelAndView(FOODFUN_ADMIN_LOGIN);
		}
		request.setAttribute("menuLocal", "menu");
		return new ModelAndView("/pages/admin/menu.jsp");
	}

	// 菜单数据
	@RequestMapping("/admin/menu/listTable.html")
	@ResponseBody
	public Map<String, Object> listTable(HttpServletRequest request,
			int iDisplayStart, int iDisplayLength) {
		MenuCriteriaTO criteria = new MenuCriteriaTO();
		criteria.setOrderType(MENU_ORDER_TYPE_CREATED_DATE);
		SearchPagerModel<MenuTO> pageModel = new SearchPagerModel<MenuTO>(
				iDisplayStart, iDisplayLength);
		criteria.setPageModel(pageModel);
		pageModel = menuService.getMenus(criteria);

		Map<String, Object> data = new HashMap<String, Object>();
		data.put(
				"aaData",
				pageModel.getResultList() == null ? "" : pageModel
						.getResultList());
		data.put("iTotalDisplayRecords", pageModel.getTotal());
		data.put("iTotalRecords", pageModel.getTotal());
		return data;
	}

	// 添加或更新菜单
	@RequestMapping("/admin/menu/addOrUpdate.html")
	@ResponseBody
	public Integer addOrUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long id = RequestUtil.getLong(request, "id");
		String imgUrl = RequestUtil.getString(request, "imgUrl");
		String name = RequestUtil.getString(request, "name");
		Float price = RequestUtil.getFloat(request, "price");
		Long merchantId = RequestUtil.getLong(request, "merchantId");
		Integer status = RequestUtil.getInteger(request, "status");
		MenuTO to = new MenuTO();
		to.setName(name);
		to.setPrice(price);
		to.setImgUrl(imgUrl);
		to.setMerchantId(merchantId);
		try {
			if (id != null) {
				to.setId(id);
				to.setStatus(status);
				menuService.update(to);
			} else {
				menuService.add(to);
				
				menuService.addMenuDynamic(to.getId());
			}
		} catch (Exception e) {
			logger.error("保存菜单失败", e);
			return STATUS_ERROR;
		}
		return STATUS_OK;
	}

	// 上传图片
	@RequestMapping("/admin/menu/uploadImg.html")
	@ResponseBody
	public String uploadMenuImg(HttpServletRequest request) {
		if (!ServletFileUpload.isMultipartContent(request)) {
            return "上传失败";
        }
		
		String imgUrl = PropUtil.get("menu.img.url.prefix");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String uploadPath = PropUtil.get("menu.img.dir");
		File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
 
        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);
 
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                    	String oriName = new File(item.getName()).getName();
                        String fileName = DateUtil.formatDateTime(new Date(), DateUtil.FORMAT_FOUR) + oriName.substring(oriName.lastIndexOf("."));
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);
                        item.write(storeFile);
                        imgUrl += fileName;
                    }
                }
            }
        } catch (Exception ex) {
            logger.error("上传图片失败", ex);
            return "上传失败";
        }
        return imgUrl;
	}

}
