--ebook电子图书管理系统
--创建用户
conn system/123456
grant connect,resource to ebook identified by 123456;

--登录
conn ebook/123456

--创建用户表
CREATE TABLE Users
(
	UserName		NVARCHAR2(50) NOT NULL,	--用户名
	Password		NVARCHAR2(50) NOT NULL,	--密码
	Email			NVARCHAR2(50) NOT NULL,	--邮箱
	CONSTRAINT PK_Users PRIMARY KEY(UserName)
);

--创建图书表
CREATE TABLE Books
(
	Id				NUMBER NOT NULL,			--图书编号
	Name			NVARCHAR2(50) NOT NULL,	--图书名称
	Price			NUMBER(9,2) NOT NULL,	--单价
	Image			NVARCHAR2(100) NOT NULL,	--图书图片路径
	Stock			NUMBER NOT NULL,			--库存数量
	CONSTRAINT PK_Books PRIMARY KEY(Id)
);

--创建订单表
CREATE TABLE Orders
(
	Id				NUMBER,			--订单编号
	UserName		NVARCHAR2(50) NOT NULL,	--订单人
	CONSTRAINT PK_Orders PRIMARY KEY(Id),
	CONSTRAINT FK_Orders_Users FOREIGN KEY(UserName) REFERENCES Users(UserName)
);

--创建订单明细表
CREATE TABLE OrderDetails
(
	Id				NUMBER,			--订单明细号
	OrderId			NUMBER NOT NULL,			--订单编号
	BookId			NUMBER NOT NULL,			--图书编号
	CreateDate		DATE NOT NULL,		--下单日期
	Count			NUMBER NOT NULL,			--购买数量
	Price			NUMBER(9,2) NOT NULL,	--单价
	Amount			NUMBER(9,2) NOT NULL,	--金额
	CONSTRAINT PK_OrderDetails PRIMARY KEY(Id),
	CONSTRAINT FK_OrdersDetails_Orders FOREIGN KEY(OrderId) REFERENCES Orders(Id),
	CONSTRAINT FK_OrdersDetails_Books FOREIGN KEY(BookId) REFERENCES Books(Id)
);

--创建序列
CREATE SEQUENCE seq_ebook
START WITH 1
NOCYCLE;


--向Users表中添加记录
INSERT INTO Users(UserName,Password,Email) VALUES('admin','1','admin@163.com');
INSERT INTO Users(UserName,Password,Email) VALUES('tom','1','tom@163.com');
INSERT INTO Users(UserName,Password,Email) VALUES('bill','1','bill@microsoft.com');

--向Books表中添加记录
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(1,'泰戈尔诗集',18,999,'book_01.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(2,'痕记',22.8,999,'book_02.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(3,'天堂之旅',25,999,'book_03.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(4,'钱钟书集（全10册）',332.5,999,'book_04.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(5,'赵俪生高昭—夫妻回忆录',38,999,'book_05.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(6,'无聊斋（张绍刚首部随笔杂文作品）',28,999,'book_06.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(7,'一颗热土豆是一张温馨的床',38,999,'book_07.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(8,'李戡戡乱记',22,999,'book_08.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(9,'生生世世未了缘',17.5,999,'book_09.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(10,'一生有多少爱',17.5,999,'book_10.gif');

INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(11,'泰戈尔诗集2',18,999,'book_01.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(12,'痕记2',22.8,999,'book_02.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(13,'天堂之旅2',25,999,'book_03.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(14,'钱钟书集（全10册）2',332.5,999,'book_04.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(15,'赵俪生高昭—夫妻回忆录2',38,999,'book_05.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(16,'无聊斋（张绍刚首部随笔杂文作品）2',28,999,'book_06.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(17,'一颗热土豆是一张温馨的床2',38,999,'book_07.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(18,'李戡戡乱记2',22,999,'book_08.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(19,'生生世世未了缘2',17.5,999,'book_09.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(20,'一生有多少爱2',17.5,999,'book_10.gif');

INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(21,'泰戈尔诗集3',18,999,'book_01.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(22,'痕记3',22.8,999,'book_02.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(23,'天堂之旅3',25,999,'book_03.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(24,'钱钟书集（全10册）3',332.5,999,'book_04.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(25,'赵俪生高昭—夫妻回忆录3',38,999,'book_05.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(26,'无聊斋（张绍刚首部随笔杂文作品）3',28,999,'book_06.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(27,'一颗热土豆是一张温馨的床3',38,999,'book_07.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(28,'李戡戡乱记3',22,999,'book_08.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(29,'生生世世未了缘3',17.5,999,'book_09.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(30,'一生有多少爱3',17.5,999,'book_10.gif');

INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(31,'泰戈尔诗集4',18,999,'book_01.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(32,'痕记4',22.8,999,'book_02.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(33,'天堂之旅4',25,999,'book_03.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(34,'钱钟书集（全10册）4',332.5,999,'book_04.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(35,'赵俪生高昭—夫妻回忆录4',38,999,'book_05.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(36,'无聊斋（张绍刚首部随笔杂文作品）4',28,999,'book_06.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(37,'一颗热土豆是一张温馨的床4',38,999,'book_07.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(38,'李戡戡乱记4',22,999,'book_08.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(39,'生生世世未了缘4',17.5,999,'book_09.gif');
INSERT INTO Books(Id,Name,Price,Stock,Image) VALUES(40,'一生有多少爱4',17.5,999,'book_10.gif');
