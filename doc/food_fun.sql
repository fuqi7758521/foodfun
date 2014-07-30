#共8张表

#用户表
create table user(
	id int AUTO_INCREMENT,
	username varchar(100) not null,
	realname varchar(100) not null,
	email varchar(100),
	password varchar(255) not null,
	balance float default 0.0,
	status tinyint default 1 not null,
	registered_date datetime not null,
	last_logined_date datetime,
	is_admin tinyint default 0,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;


#商家
create table merchant(
	id int AUTO_INCREMENT,
	name varchar(255) not null,
	address varchar(255),
	website varchar(255),
	phone varchar(255),
	status tinyint default 1,
	remark varchar(255),
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#菜单
create table menu(
	id int AUTO_INCREMENT,
	name varchar(100) not null,
	price float not null,
	imgUrl varchar(255),
	status tinyint default 1,
	merchant_id int,
	created_date datetime not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#菜单其他动态信息
create table menu_dynamic(
	id int AUTO_INCREMENT,
	menu_id int,
	count_of_comment int default 0,
	count_of_order int default 0,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#评价
create table comment(
	id int AUTO_INCREMENT,
	menu_id int not null,
	user_id int not null,
	content varchar(500),
	star int,
	status tinyint default 1,
	created_date datetime not null,
	updated_date datetime not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#订单
create table order_overall(
	id int AUTO_INCREMENT,
	user_id int not null,
	money float,
	status tinyint default 1 not null,
	created_date datetime not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#订单详情
create table order_detail(
	id int AUTO_INCREMENT,
	order_id int,
	menu_id int,
	menu_name varchar(100),
	merchant_id int,
	merchant_name varchar(100),
	price float,
	count int,
	created_date datetime not null,
	status tinyint default 1 not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#充值记录，status,0:表示充值的初始状态，待确认；1:表示充值被取消；2:表示充值被确认，通过。
create table charge_log(
	id int AUTO_INCREMENT,
	user_id int not null,
	money float not null,
	charged_date datetime not null,
	confirmed_date datetime,
	status tinyint default 0 not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

#订餐最后时间
create table deadline(
	id int AUTO_INCREMENT,
	deadline time not null,
	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;


