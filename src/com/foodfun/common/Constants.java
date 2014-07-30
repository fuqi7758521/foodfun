package com.foodfun.common;

/**
 * @author qi.fu@yunyoyo.cn
 * @date 2014-03-13
 */
public interface Constants {

	String PASSWORD_SALT_KEY = "Salt.foodfun.com.2014"; // md5(用户密码+PASSWORD_SALT_KEY)保存到数据库中。

	Integer STATUS_OK = 200;

	Integer STATUS_ERROR = 300;

	String FOODFUN_USER_COOKIE = "foodfun_user_cookie_key";

	String JSON_ROOT = "JSON_ROOT";

	int LOGIN_USER_EXP = 1000 * 60 * 30;

	String USER_ID_KEY = "UWQsJfszayY=";

	// 充值订单状态, 0:初始状态; 1:无效状态; 2:通过有效状态
	int CHARGE_STATUS_DEFAULT = 0, CHARGE_STATUS_UNDO = 1,
			CHARGE_STATUS_CONFIRMED = 2;

	// 用户状态，0:无效; 1:有效
	int USER_STATUS_VALID = 1, USER_STATUS_INVALID = 0;

	// 管理员标志, 0:非管理员; 1:管理员
	int ADMIN_STATUS_VALID = 1, ADMIN_STATUS_INVALID = 0;

	// 菜单排列类型; 1:订购人数降序;2:价格升序;3:创建时间降序;
	int MENU_ORDER_TYPE_HOT = 1, MENU_ORDER_TYPE_PRICE = 2,
			MENU_ORDER_TYPE_CREATED_DATE = 3;

	int STATUS_VALID = 1, STATUS_INVALID = 0;

	// 订餐订单状态, 0:初始状态，可以取消; 1:无效状态，已被取消; 2:已经通过，不能被取消
	int ORDER_STATUS_DEFAULT = 0, ORDER_STATUS_UNDO = 1,
			ORDER_STATUS_CONFIRMED = 2;

	String FOODFUN_INDEX = "/pages/general/index.jsp";
	
	String FOODFUN_LOGIN = "/pages/general/login.jsp";

	String FOODFUN_ADMIN_INDEX = "/pages/admin/index.jsp";

	String FOODFUN_ADMIN_LOGIN = "/pages/admin/login.jsp";
	
	Integer NOT_YET_LOGIN = 301;
	
	Integer ORDER_MONEY_NOT_ENOUGH = 302;
	
	Integer OVER_DEADLINE = 303;
	
	Integer ORDER_ALREADY_CONFIRMED = 304;
	
	Integer ORDER_ALREADY_UNDO = 305;
	
	Integer USER_ALREADY_EXISTED = 306;
	
}
