/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jspm07528xywmxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-04-12 21:07:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2021-04-12 20:32:49');

-- ----------------------------
-- Table structure for `diancan`
-- ----------------------------
DROP TABLE IF EXISTS `diancan`;
CREATE TABLE `diancan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpinid` int(10) unsigned NOT NULL COMMENT '商品id',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(255) NOT NULL COMMENT '商品名称',
  `shangpintupian` varchar(255) NOT NULL COMMENT '商品图片',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `songcanfei` decimal(18,2) NOT NULL COMMENT '送餐费',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `diancan_shangpinid_index` (`shangpinid`),
  KEY `diancan_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='点餐';

-- ----------------------------
-- Records of diancan
-- ----------------------------

-- ----------------------------
-- Table structure for `dingdan`
-- ----------------------------
DROP TABLE IF EXISTS `dingdan`;
CREATE TABLE `dingdan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanbianhao` varchar(50) NOT NULL COMMENT '订单编号',
  `dingdanxinxi` text NOT NULL COMMENT '订单信息',
  `dingdanjine` decimal(18,2) NOT NULL COMMENT '订单金额',
  `shouhuodizhi` int(10) unsigned NOT NULL COMMENT '收货地址ID',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `beizhu` text NOT NULL COMMENT '备注',
  `zhuangtai` varchar(50) NOT NULL COMMENT '状态',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `iszf` varchar(10) NOT NULL DEFAULT '否' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  KEY `dingdan_shouhuodizhi_index` (`shouhuodizhi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of dingdan
-- ----------------------------
INSERT INTO `dingdan` VALUES ('1', '04122029018184', '\r\n                                    <table class=\"table\">\r\n                                        <thead>\r\n                                        <tr>\r\n                                            <td>商品编号</td>\r\n                                            <td>商品名称</td>\r\n                                            <td>商品图片</td>\r\n                                            <td>分类</td>\r\n                                            <td>价格</td>\r\n                                            <td>购买数量</td>\r\n                                            <td>送餐费</td>\r\n                                            <td>小计</td>\r\n                                            <td>购买人</td>\r\n                                        </tr>\r\n                                        </thead>\r\n                                        <tbody>\r\n                                        <tr>\r\n                                            <td>2101131630153\r\n                                            </td>\r\n                                            <td>大盘鸡\r\n                                            </td>\r\n                                            <td><img width=\"100\" src=\"upload/a4ed04611fd266de072536a1bc0b7a70.png\"></td>\r\n                                            <td>特色菜\r\n                                            </td>\r\n                                            <td>38.00\r\n                                            </td>\r\n                                            <td>2\r\n                                            </td>\r\n                                            <td>5.00\r\n                                            </td>\r\n                                            <td>81.00\r\n                                            </td>\r\n                                            <td>001\r\n                                            </td>\r\n                                        </tr>\r\n                                        </tbody>\r\n                                        \r\n                                    </table>\r\n                                ', '81.00', '1', '张三', '15933214569', 'xxx街道xxx号', '福仕达福仕达', '已签收', '001', '2021-04-12 20:29:07', '是');

-- ----------------------------
-- Table structure for `dingdan_dingdanxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `dingdan_dingdanxinxi`;
CREATE TABLE `dingdan_dingdanxinxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) unsigned NOT NULL COMMENT '关联表【dingdan】中字段id',
  `shangpinid` int(10) unsigned NOT NULL COMMENT '关联表【shangpin】中字段id',
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(255) NOT NULL COMMENT '商品名称',
  `shangpintupian` varchar(255) NOT NULL COMMENT '商品图片',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `goumaishuliang` int(11) NOT NULL COMMENT '购买数量',
  `songcanfei` decimal(18,2) NOT NULL COMMENT '送餐费',
  `xiaoji` decimal(18,2) NOT NULL COMMENT '小计',
  `goumairen` varchar(50) NOT NULL COMMENT '购买人',
  PRIMARY KEY (`id`),
  KEY `dingdan_dingdanxinxi_fenlei_index` (`fenlei`),
  KEY `dingdan_dingdanxinxi_dingdanid_index` (`dingdanid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单_订单信息';

-- ----------------------------
-- Records of dingdan_dingdanxinxi
-- ----------------------------
INSERT INTO `dingdan_dingdanxinxi` VALUES ('1', '1', '14', '2101131630153', '大盘鸡', 'upload/a4ed04611fd266de072536a1bc0b7a70.png', '8', '38.00', '2', '5.00', '81.00', '001');
INSERT INTO `dingdan_dingdanxinxi` VALUES ('2', '2', '16', '04122052001129', '测试菜单', 'upload/1618231932540.png', '9', '56.00', '9', '6.00', '510.00', '002');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('5', '1', 'upload/2f704abfdcf2dc4958e60cd8aebcb1eb.png', '#', '2021-04-12 21:13:55');
INSERT INTO `lunbotu` VALUES ('6', '2', 'upload/b8a22be38edc10f79d07270d3a123297.png', '#', '2021-04-12 21:35:34');
INSERT INTO `lunbotu` VALUES ('7', '3', 'upload/344f2e08e6dfe5579c66193431c5f6a8.png', '#', '2021-04-12 21:23:27');

-- ----------------------------
-- Table structure for `paisong`
-- ----------------------------
DROP TABLE IF EXISTS `paisong`;
CREATE TABLE `paisong` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) unsigned NOT NULL COMMENT '订单id',
  `dingdanbianhao` varchar(50) NOT NULL COMMENT '订单编号',
  `dingdanjine` decimal(18,2) NOT NULL COMMENT '订单金额',
  `xiadanren` varchar(50) NOT NULL COMMENT '下单人',
  `shouhuodizhi` int(10) unsigned NOT NULL COMMENT '收货地址ID',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `paisongxingming` varchar(50) NOT NULL COMMENT '派送姓名',
  `paisongdianhua` varchar(50) NOT NULL COMMENT '派送电话',
  `paisongren` varchar(50) NOT NULL COMMENT '派送人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `paisong_dingdanid_index` (`dingdanid`),
  KEY `paisong_shouhuodizhi_index` (`shouhuodizhi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='派送';

-- ----------------------------
-- Records of paisong
-- ----------------------------
INSERT INTO `paisong` VALUES ('1', '1', '04122029018184', '81.00', '001', '1', '张三', '15933214569', 'xxx街道xxx号', '刘俊杰', '15986873654', '111', '2021-04-12 20:43:02');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', 'shangpin', '16', '测试菜单', '1', '地革檡楞在在 丧权辱国 霜', '002', '2021-04-12 21:01:48');

-- ----------------------------
-- Table structure for `qianshou`
-- ----------------------------
DROP TABLE IF EXISTS `qianshou`;
CREATE TABLE `qianshou` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dingdanid` int(10) unsigned NOT NULL COMMENT '订单id',
  `dingdanbianhao` varchar(50) NOT NULL COMMENT '订单编号',
  `dingdanjine` decimal(18,2) NOT NULL COMMENT '订单金额',
  `shouhuodizhi` int(10) unsigned NOT NULL COMMENT '收货地址ID',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `beizhu` text NOT NULL COMMENT '备注',
  `qianshouren` varchar(50) NOT NULL COMMENT '签收人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `qianshou_dingdanid_index` (`dingdanid`),
  KEY `qianshou_shouhuodizhi_index` (`shouhuodizhi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='签收';

-- ----------------------------
-- Records of qianshou
-- ----------------------------
INSERT INTO `qianshou` VALUES ('1', '1', '04122029018184', '81.00', '1', '张三', '15933214569', 'xxx街道xxx号', '我已收到', '001', '2021-04-12 20:45:43');

-- ----------------------------
-- Table structure for `qishi`
-- ----------------------------
DROP TABLE IF EXISTS `qishi`;
CREATE TABLE `qishi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='骑士';

-- ----------------------------
-- Records of qishi
-- ----------------------------
INSERT INTO `qishi` VALUES ('1', '111', '111', '刘俊杰', '女', '15986873654', 'upload/1618231040113.png', '2021-04-12 20:37:25');

-- ----------------------------
-- Table structure for `shangpin`
-- ----------------------------
DROP TABLE IF EXISTS `shangpin`;
CREATE TABLE `shangpin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shangpinbianhao` varchar(50) NOT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(255) NOT NULL COMMENT '商品名称',
  `shangpintupian` varchar(255) NOT NULL COMMENT '商品图片',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `kucun` int(11) NOT NULL COMMENT '库存',
  `songcanfei` decimal(18,2) NOT NULL COMMENT '送餐费',
  `jiage` decimal(18,2) NOT NULL COMMENT '价格',
  `xiaoliang` int(11) NOT NULL COMMENT '销量',
  `neirong` longtext NOT NULL COMMENT '内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `shangpin_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of shangpin
-- ----------------------------
INSERT INTO `shangpin` VALUES ('8', '2101131612140', '白切鸡', 'upload/6d810ff13bdb0bb5fc168a3541125a4e.png', '5', '100', '5.00', '56.00', '0', '<p>白斩鸡又叫<a href=\"https://baike.baidu.com/item/%E7%99%BD%E5%88%87%E9%B8%A1/1071350\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1071350\">白切鸡</a><sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_50996\"></a>  ，是一道中华民族特色<a href=\"https://baike.baidu.com/item/%E8%8F%9C%E8%82%B4/10897939\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"10897939\">菜肴</a>，起源于<a href=\"https://baike.baidu.com/item/%E5%B9%BF%E4%B8%9C/207811\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"207811\">广东</a>，在南方菜系中普遍存在。形状美观，皮黄肉白，肥嫩鲜美，滋味异常鲜美，十分可口。<sup class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\"> [2]</sup><a class=\"sup-anchor\" name=\"ref_%5B2%5D_50996\"></a>  肉色洁白皮带黄油，具有<a href=\"https://baike.baidu.com/item/%E8%91%B1%E6%B2%B9/7226274\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"7226274\">葱油</a>香味，葱段打花镶边，食时佐以<a href=\"https://baike.baidu.com/item/%E5%A7%9C%E8%93%89/17480197\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"17480197\">姜蓉</a>、酱油，保持了鸡肉的鲜美、<a href=\"https://baike.baidu.com/item/%E5%8E%9F%E6%B1%81%E5%8E%9F%E5%91%B3/757943\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"757943\">原汁原味</a>，食之别有<a href=\"https://baike.baidu.com/item/%E9%A3%8E%E5%91%B3\" target=\"_blank\" rel=\"noopener\">风味</a>。</p>\n<div class=\"para\">白斩鸡是<a href=\"https://baike.baidu.com/item/%E5%86%B7%E7%9B%98\" target=\"_blank\" rel=\"noopener\">冷盘</a>，始于清代的民间酒店，因烹鸡时不加调味白煮而成，食用时随吃随斩，故称“白斩鸡”又叫“<a href=\"https://baike.baidu.com/item/%E7%99%BD%E5%88%87%E9%B8%A1\" target=\"_blank\" rel=\"noopener\">白切鸡</a>”。又因其用料，广东省清远市阳山县出品的<a href=\"https://baike.baidu.com/item/%E4%B8%89%E9%BB%84%E9%B8%A1/6679382\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"6679382\">三黄鸡</a>(脚黄、皮黄、嘴黄)，故又称三黄油鸡。后来广东各饭店和熟食店都经营“白斩鸡”，不仅用料精细，而且还用熬熟的“虾子酱油”同鸡一起上桌蘸食。此菜色泽金黄，皮脆肉嫩，滋味异常鲜美，久吃不厌。<sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_50996\"></a> </div>\n<div class=\"para\">清人<a href=\"https://baike.baidu.com/item/%E8%A2%81%E6%9E%9A\" target=\"_blank\" rel=\"noopener\">袁枚</a>《<a href=\"https://baike.baidu.com/item/%E9%9A%8F%E5%9B%AD%E9%A3%9F%E5%8D%95\" target=\"_blank\" rel=\"noopener\">随园食单</a>》称之为白片鸡。他说：“鸡功最巨，诸菜赖之， 故令羽族之首，而以他禽附之，作羽族单。”单上列鸡菜数十款，用于<a href=\"https://baike.baidu.com/item/%E8%92%B8/5039827\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"5039827\">蒸</a>、<a href=\"https://baike.baidu.com/item/%E7%82%AE/2357716\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2357716\">炮</a>、<a href=\"https://baike.baidu.com/item/%E7%85%A8/16294950\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"16294950\">煨</a>、<a href=\"https://baike.baidu.com/item/%E5%8D%A4/19514784\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"19514784\">卤</a>、糟的都有，列以首位就是白片鸡，说它有\"太羹元酒之味\"。如今，<a href=\"https://baike.baidu.com/item/%E7%B2%A4%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">粤菜</a>厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的却属白斩鸡，原汁原味，皮爽肉滑，大筵小席皆宜，逢年过节必备，深受食家及普通百姓青睐。</div>\n<div class=\"para\"> </div>\n<div class=\"para\">1. 白斩鸡又称<a href=\"https://baike.baidu.com/item/%E7%99%BD%E5%88%87%E9%B8%A1\" target=\"_blank\" rel=\"noopener\">白切鸡</a>、三黄油鸡，是<a href=\"https://baike.baidu.com/item/%E7%B2%A4%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">粤菜</a>传统名菜，多作为宴席冷盘，供佐酒之用。白斩鸡始于清代的民间酒店，因烹鸡时不加调味白煮而成，食用时随吃随斩，故称“白斩鸡”。又因其用料，广东省<a href=\"https://baike.baidu.com/item/%E6%B8%85%E8%BF%9C/907691\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"907691\">清远</a>市阳山县出品的三黄鸡(脚黄、皮黄、嘴黄)，故又称三黄油鸡。后来广东各饭店和熟食店都经营“白斩鸡”，不仅用料精细，而且还用熬熟的“<a href=\"https://baike.baidu.com/item/%E8%99%BE%E5%AD%90%E9%85%B1%E6%B2%B9/162124\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"162124\">虾子酱油</a>”同鸡一起上桌蘸食。此菜色泽金黄，皮脆肉嫩，滋味异常鲜美，久吃不厌<sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_50996\"></a>  </div>', '2021-04-12 22:52:56');
INSERT INTO `shangpin` VALUES ('9', '2101131615241', '烤羊排', 'upload/f2d4c1ee23cebf8c3e25016d99f1a1d8.png', '5', '100', '6.00', '70.00', '0', '<div class=\"para\">烤羊排制作原料有羊排，洋葱、鸡蛋、小麦面粉等。外焦里嫩，肉烂味香，具有补血、补虚养身、补阳等功效。</div>\n<div class=\"para\">2018年9月，被评为“中国菜”之西藏十大经典名菜</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<h2 class=\"title-text\">菜品特色</h2>\n<div class=\"para\">菜品名称：烤羊排</div>\n<div class=\"para\">功效：补血食谱，<a href=\"https://baike.baidu.com/item/%E9%98%B3%E7%97%BF\" target=\"_blank\" rel=\"noopener\">阳痿</a>早泄食谱，补虚养身食谱，补阳食谱</div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"><span class=\"description\">烤羊排</span></div>\n口味：咸鲜味</div>\n<div class=\"para\">工艺：烤</div>\n<div class=\"para\">新鲜羊排→注入嫩化剂→注入保水剂→腌制→预煮→烤制→抗氧化处理→真空包装→成品</div>\n<div class=\"para\">（1） 原料预处理 将羊排分割成大小均匀的块，每块约（7-9）㎝×（9-11）㎝，剔除脂肪。</div>\n<div class=\"para\">（2） 注入嫩化剂 将处理好的羊排称重，剔除骨头，注入嫩化剂。</div>\n<div class=\"para\">（3） 注入保水剂 将处理好的羊排称重，剔除骨头，注入保水剂。</div>\n<div class=\"para\">（4） 将已注入嫩化剂，保水剂的羊排放入配制好的腌制液中，腌制 24h。</div>\n<div class=\"para\">（5） 腌制好的羊排置于配好的调料水中，煮 40min。</div>\n<div class=\"para\">（6） 将煮好的羊排捞出，控干水分后置于烤箱中进行烤制。</div>\n<div class=\"para\">（7） 烤好的羊排冷却后，在羊排表面涂抹一层抗氧化剂，真空包装即为成品。<sup class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\"> [2]</sup> </div>\n<div class=\"para\">烧烤食品已跻身世界卫生组织所公布的全球十大垃圾食品，吃一个烤鸡腿等同于吸60支烟的毒性。而吃烧烤的女性，患乳腺癌的危险性要比不爱吃烧烤食品的女性高出2倍。</div>\n<div class=\"para\">专家介绍，烧烤食物由于肉直接在高温下进行烧烤，产生一种叫苯并芘的高度致癌物质，附着于食物表面。市民如果经常吃烧烤肉类食品，致癌物质会在体内蓄积，有诱发胃癌、肠癌的危险。同时，烧烤食品还容易产生亚硝胺类物质、容易存在感染寄生虫的危险，市民应尽量不吃或少吃烧烤类食物。</div>\n</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">主料：羊排骨1扇。</div>\n<div class=\"para\">辅料：酱油100克，料酒50克，葱头150克，胡椒面2.5克，孜然粉1.5克，花椒5克，味精5克，鸡蛋1个，面粉25克。制作方法：</div>\n<div class=\"para\">（1）选用新鲜羊排骨，修整边缘，使排骨整齐。将排骨放入沸水锅中，焯煮一下，捞出后用清水洗去血污，沥去水分。</div>\n<div class=\"para\">（2）锅上放水，加上酱油、胡椒面、花椒、料酒、孜然和切碎的葱头，再加入羊排骨。大火煮沸后，改用小火煮至八成熟。</div>\n<div class=\"para\">（3）煮好的羊排出锅，沥去汤汁，稍晾片刻。鸡蛋打入碗内，加上面粉，调成稀糊，涂抹在煮好的羊排骨上。</div>\n<div class=\"para\">（4）挂好糊的羊排骨放入烤盘，送入烤炉内，烤制20分钟左右。取出后，装盘，撒上孜然粉，即为成品。上桌时带刀，切开食用。</div>\n</div>', '2021-04-12 22:07:36');
INSERT INTO `shangpin` VALUES ('10', '2101131616571', '啤酒鸭', 'upload/6a8145c9a3bb9b749886898954ac276d.png', '6', '100', '7.00', '100.00', '0', '<p>啤酒鸭是一道风味独特的特色佳肴，是深受广大食客喜爱的菜肴。据传起源于<a href=\"https://baike.baidu.com/item/%E6%B8%85%E4%BB%A3/752212\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"752212\">清代</a>。啤酒鸭的做法有很多种。其主料为<a href=\"https://baike.baidu.com/item/%E9%B8%AD%E5%AD%90/1797\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1797\">鸭子</a>、<a href=\"https://baike.baidu.com/item/%E5%95%A4%E9%85%92/134984\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"134984\">啤酒</a>。将鸭肉与啤酒一同炖煮成菜，使滋补的鸭肉味道更加浓厚，鸭肉不仅入口鲜香，还带有一股啤酒清香</p>\n<div class=\"para-title level-3\">\n<h3 class=\"title-text\">传统做法</h3>\n</div>\n<div class=\"para\"><strong>食材准备</strong></div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"><span class=\"description\">啤酒鸭原料</span></div>\n<strong><a href=\"https://baike.baidu.com/item/%E9%BA%BB%E9%B8%AD\" target=\"_blank\" rel=\"noopener\">麻鸭</a></strong>一只，<a href=\"https://baike.baidu.com/item/%E5%9C%9F%E8%B1%86/33722\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"33722\">土豆</a>一个，水发香菇六个，<a href=\"https://baike.baidu.com/item/%E5%95%A4%E9%85%92/134984\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"134984\">啤酒</a>一瓶<a href=\"https://baike.baidu.com/item/%E5%85%AB%E8%A7%92\" target=\"_blank\" rel=\"noopener\">八角</a>，桂皮各一个，姜片两片，<a href=\"https://baike.baidu.com/item/%E8%80%81%E5%A7%9C/710298\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"710298\">老姜</a>一小块拍碎，<a href=\"https://baike.baidu.com/item/%E8%92%9C%E7%93%A3/7050867\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"7050867\">蒜瓣</a>两个，青葱一把，葱白切段，葱叶切末，花椒。</div>\n<div class=\"para\"><strong>制作步骤</strong></div>\n<div class=\"para\">1、鸭子剁块，洗 净血水（冷冻鸭要先用冷水泡至化冻）。上锅加满冷水，加拍碎的老姜，大火煮开将鸭块倒出沥水，挑出老姜，洗净锅，擦干。</div>\n<div class=\"para\">2、锅内放油烧热，放入蒜瓣、葱白段、八角、桂皮、姜片煸炒，倒入鸭块加少许<a href=\"https://baike.baidu.com/item/%E9%85%B1%E6%B2%B9/1246\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1246\">酱油</a>翻炒。倒入整瓶啤酒，一点点<a href=\"https://baike.baidu.com/item/%E9%86%8B/319503\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"319503\">醋</a>（放醋的话肉比较容易烂）盖好盖子，大火煮开（把土豆、<a href=\"https://baike.baidu.com/item/%E9%A6%99%E8%8F%87/973881\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"973881\">香菇</a>切块，土豆块可以大一些，备用），多煮一会，这样汤汁看起来比较浓。</div>\n<div class=\"para\">3、换小火慢炖，汤剩一半的时候加土豆块、香菇，换大火沸一下再调回小火。</div>\n<div class=\"para\">4、三分钟后换大火，加入适当酱油（上色用）翻炒，大火收汁。放<a href=\"https://baike.baidu.com/item/%E9%B8%A1%E7%B2%BE\" target=\"_blank\" rel=\"noopener\">鸡精</a>起锅，装盘后洒葱末。</div>\n<div class=\"para\"><strong>注意事项</strong></div>\n<div class=\"para\">1、土豆块不可以太小，烧的时候注意掌握时间，时间短了土豆不够糯，长了就糊成一堆了，以绵软但不散块为佳。</div>\n<div class=\"para\">2、鸭肉膻味较重，先用沸水氽烫，再下锅煸至出油，此法可消除鸭肉的膻味，焖煮后的鸭肉鲜美，汤也香浓味美。</div>\n<div class=\"para\">3、用啤酒炖煮 鸭肉，鸭汤会有很浓郁的啤酒味，不过久煮后酒味就会渐消，只吃鸭肉不喝汤，并不会醉人。</div>\n<div class=\"para\">4、香料份量宜少不宜多，目的在于提升啤酒鸭的鲜香味，放太多香料容易抢了主味。</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">1.香菇去蒂洗 净对半切开；老姜切片；泡辣椒、泡姜剁粒；花椒、香叶、小回香、桂皮洗净后装无纤纸袋中做成香料包。</div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"><a class=\"image-link\" title=\"\" href=\"https://baike.baidu.com/pic/%E5%95%A4%E9%85%92%E9%B8%AD/2843654/0/9a504fc2d562853536f4562293ef76c6a7ef6399?fr=lemma&amp;ct=single\" target=\"_blank\" rel=\"noopener\"><img class=\"\" src=\"https://bkimg.cdn.bcebos.com/pic/9a504fc2d562853536f4562293ef76c6a7ef6399?x-bce-process=image/resize,m_lfit,w_220,limit_1\" alt=\"\"></a></div>\n2.将豆瓣酱、酱油、白糖、泡辣椒粒、泡姜粒、老姜片同放一个碗里成滋汁。3.鸭子整理干净后斩小块，洗净后下沸水锅焯水去血沫后捞出沥干水分。</div>\n<div class=\"para\">4.锅中放油 （如果鸭子是土鸭，可稍微多放一点油，如果是肉鸭就只需放微量油湿锅）烧至七成热，下鸭块用大火爆干水分至亮油，捞出鸭块留下油。</div>\n<div class=\"para\">5.将碗中的滋汁倒入锅中用小火慢炒至呈樱桃色。</div>\n<div class=\"para\">6.下鸭块翻匀。</div>\n<div class=\"para\">7.倒入啤酒、约一斤汤或水、香料包。</div>\n<div class=\"para\">8.加盖用大火 烧沸后改小火烧约四十分钟（汤或水、时间可根据个人喜欢的软硬度作相应增减）。</div>\n<div class=\"para\">9.下香菇、盐，加盖续烧约二十分钟。</div>\n<div class=\"para\">10.改大火收干汤汁，放入鲜味汁。</div>\n<div class=\"para\">11.铲匀后即可起锅装盆上桌开吃。</div>\n</div>', '2021-04-12 22:29:38');
INSERT INTO `shangpin` VALUES ('11', '2101131621084', '剁椒鱼头', 'upload/b3270b90d607d728e0a7c55f572ff9ce.png', '6', '100', '5.00', '43.00', '0', '<div class=\"para\">剁椒鱼头（英文名：Chop bell pepper fish head）是<a href=\"https://baike.baidu.com/item/%E6%B9%96%E5%8D%97/228213\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"228213\">湖南</a>省的传统名菜，属于<a href=\"https://baike.baidu.com/item/%E6%B9%98%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">湘菜</a>系。据传，起源和清代文人<a href=\"https://baike.baidu.com/item/%E9%BB%84%E5%AE%97%E5%AE%AA/10399459\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"10399459\">黄宗宪</a>有关。</div>\n<div class=\"para\">通常以<a href=\"https://baike.baidu.com/item/%E9%B3%99%E9%B1%BC/6812945\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"6812945\">鳙鱼</a>鱼头、<a href=\"https://baike.baidu.com/item/%E5%89%81%E6%A4%92/2805449\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2805449\">剁椒</a>为主料，配以<a href=\"https://baike.baidu.com/item/%E8%B1%89%E6%B2%B9/1072637\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1072637\">豉油</a>、<a href=\"https://baike.baidu.com/item/%E5%A7%9C/1327506\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1327506\">姜</a>、<a href=\"https://baike.baidu.com/item/%E8%91%B1/577741\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"577741\">葱</a>、<a href=\"https://baike.baidu.com/item/%E8%92%9C/13211721\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"13211721\">蒜</a>等辅料<a href=\"https://baike.baidu.com/item/%E8%92%B8%E5%88%B6/5996481\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"5996481\">蒸制</a>而成。菜品色泽红亮、味浓、肉质细嫩。肥而不腻、口感软糯、鲜辣适口。<sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_64634\"></a> </div>\n<div class=\"para\">2018年9月10日，“中国菜”正式发布，“剁椒鱼头“被评为“中国菜”湖南十大经典名菜</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">剁椒鱼头的出处，据说可以追溯到清代<a href=\"https://baike.baidu.com/item/%E9%9B%8D%E6%AD%A3/130080\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"130080\">雍正</a>年间，反清文人<a href=\"https://baike.baidu.com/item/%E9%BB%84%E5%AE%97%E5%AE%AA\" target=\"_blank\" rel=\"noopener\">黄宗宪</a>因文忌“<a href=\"https://baike.baidu.com/item/%E6%96%87%E5%AD%97%E7%8B%B1\" target=\"_blank\" rel=\"noopener\">文字狱</a>”而出逃。</div>\n<div class=\"para\">路上途经<a href=\"https://baike.baidu.com/item/%E6%B9%96%E5%8D%97/228213\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"228213\">湖南</a>的一个小乡村，借住在一个贫苦的农户家。农夫从池塘中捕回一条<a href=\"https://baike.baidu.com/item/%E8%83%96%E5%A4%B4%E9%B1%BC\" target=\"_blank\" rel=\"noopener\">胖头鱼</a>，农妇便用做菜来款待黄宗宪。鱼洗净后，鱼肉放盐煮汤，再用自家产的辣椒剁碎后与<a href=\"https://baike.baidu.com/item/%E9%B1%BC%E5%A4%B4/815537\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"815537\">鱼头</a>同蒸，不想<a href=\"https://baike.baidu.com/item/%E9%BB%84%E5%AE%97%E5%AE%AA/10399459\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"10399459\">黄宗宪</a>吃了觉得非常鲜美，无法忘怀。</div>\n<div class=\"para\">事平回家后，便让家厨将这道菜加以改良，于是便有了今天的“剁椒鱼头”，并成为湘菜<a href=\"https://baike.baidu.com/item/%E8%92%B8%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">蒸菜</a>的代表。<sup class=\"sup--normal\" data-sup=\"3\" data-ctrmap=\":3,\"> [3]</sup>\n</div>\n</div>\n<div class=\"para\"> </div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para-title level-3\">\n<h3 class=\"title-text\">营养价值</h3>\n</div>\n<div class=\"para\">鱼头：营养高、口味好，有助于增强男性性功能，并对降低<a href=\"https://baike.baidu.com/item/%E8%A1%80%E8%84%82\" target=\"_blank\" rel=\"noopener\">血脂</a>、健脑及延缓衰老有好处。</div>\n<div class=\"para\">辣椒：<a href=\"https://baike.baidu.com/item/%E5%BC%80%E8%83%83\" target=\"_blank\" rel=\"noopener\">开胃</a>消食，暖胃驱寒、止痛散热，肌肤美容、降脂减肥，抵抗癌症、保护<a href=\"https://baike.baidu.com/item/%E5%BF%83%E8%84%8F\" target=\"_blank\" rel=\"noopener\">心脏</a>，促进血液循环、降低血压<sup class=\"sup--normal\" data-sup=\"18\" data-ctrmap=\":18,\"> [18]</sup><a class=\"sup-anchor\" name=\"ref_%5B18%5D_64634\"></a>  。</div>\n<div class=\"anchor-list \">\n<a class=\"lemma-anchor para-title\" name=\"4_2\"></a><a class=\"lemma-anchor \" name=\"sub64634_4_2\"></a><a class=\"lemma-anchor \" name=\"%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A1%B9\"></a><a class=\"lemma-anchor \" name=\"4-2\"></a>\n</div>\n<div class=\"para-title level-3\">\n<h3 class=\"title-text\">注意事项</h3>\n</div>\n<div class=\"para\">1.痛风患者不宜吃鱼。因为鱼类含有嘌呤类物质，而痛风则是由于人体内的嘌呤代谢发生紊乱而引起的。</div>\n<div class=\"para\">2.<a href=\"https://baike.baidu.com/item/%E5%87%BA%E8%A1%80%E6%80%A7%E7%96%BE%E7%97%85\" target=\"_blank\" rel=\"noopener\">出血性疾病</a>患者，如血小板减少、血友病、维生素K缺乏等出血性疾病患者要少吃或不吃鱼，因为鱼肉中所含的20碳5烯酸，可抑制血小板凝集，从而加重出血性疾病患者的出血症状。</div>\n<div class=\"para\">3.肝硬化病人不宜吃鱼。肝硬化时机体难以产生凝血因子，加之血小板偏低，容易引起出血，如果再食用富含20碳5烯酸的沙丁鱼、青鱼、金枪鱼等，会使病情急剧恶化。</div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"> </div>\n4.<a href=\"https://baike.baidu.com/item/%E7%BB%93%E6%A0%B8/16336547\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"16336547\">结核</a>病人，服用异烟肼时如果食用某些鱼类容易发生过敏反应，轻者恶心、头痛、皮肤潮红、眼结膜充血等，重者会出现心悸、口唇及面部麻胀、皮疹、腹泻、腹痛、呼吸困难、血压升高，甚至发生高血压危象和脑出血等。<sup class=\"sup--normal\" data-sup=\"19\" data-ctrmap=\":19,\"> [19]</sup><a class=\"sup-anchor\" name=\"ref_%5B19%5D_64634\"></a> </div>\n<div class=\"para\">5.瘦人不宜多吃辣椒。瘦人多属阴虚和热性体质，常表现为咽干、口苦、眼部充血、头重脚轻、烦躁易怒，如果多吃辣椒不仅会使上述症状加重，而且容易导致出血、过敏和炎症，严重时还会发生疮痈感染等。</div>\n<div class=\"para\">6.<a href=\"https://baike.baidu.com/item/%E7%94%B2%E4%BA%A2\" target=\"_blank\" rel=\"noopener\">甲亢</a>患者不宜食辣椒。甲亢患者本来就容易心动过速，食用辣椒后会使心跳加快，加重症状。</div>\n<div class=\"para\">7.肾炎患者不宜食用辣椒。人体代谢过程中，辛辣成分常常要通过肾脏排泄，而这些辛辣成分对肾脏实质细胞均有不同程度的刺激作用，严重时会影响到肾脏功能。</div>\n<div class=\"para\">8.<a href=\"https://baike.baidu.com/item/%E5%93%AE%E5%96%98\" target=\"_blank\" rel=\"noopener\">哮喘</a>患者不宜食用辣椒。因为辣椒碱有时会令哮喘复发。</div>\n<div class=\"para\">9.阿司匹林服用者不宜食用辣椒。因为辣椒会抑制人体对阿司匹林的吸收。<sup class=\"sup--normal\" data-sup=\"20\" data-ctrmap=\":20,\"> [20]</sup>\n</div>\n</div>', '2021-04-12 22:41:57');
INSERT INTO `shangpin` VALUES ('12', '2101131623030', '水煮鱼', 'upload/9e0ed385e68ac924382a48b65b620052.png', '7', '100', '6.00', '88.00', '0', '<div class=\"para\">水煮鱼又称<a href=\"https://baike.baidu.com/item/%E6%B1%9F%E6%B0%B4%E7%85%AE%E6%B1%9F%E9%B1%BC/4086170\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"4086170\">江水煮江鱼</a>、<a href=\"https://baike.baidu.com/item/%E6%B0%B4%E7%85%AE%E9%B1%BC%E7%89%87/2822036\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2822036\">水煮鱼片</a>，是<a href=\"https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD/1122445\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1122445\">中国</a><a href=\"https://baike.baidu.com/item/%E5%B7%9D%E6%B8%9D/9276229\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"9276229\">川渝</a>地区的一道特色名菜，属于<a href=\"https://baike.baidu.com/item/%E5%B7%9D%E8%8F%9C%E7%B3%BB/690953\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"690953\">川菜系</a>，其最早流行于<a href=\"https://baike.baidu.com/item/%E9%87%8D%E5%BA%86%E5%B8%82\" target=\"_blank\" rel=\"noopener\">重庆市</a><a href=\"https://baike.baidu.com/item/%E6%B8%9D%E5%8C%97%E5%8C%BA/2531151\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2531151\">渝北区</a>翠云乡。</div>\n<div class=\"para\">水煮鱼通常由新鲜草鱼、豆芽、辣椒等食材制作而成。“油而不腻、辣而不燥、麻而不苦、肉质滑嫩”是其特色</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">水煮鱼的前身其实是出自重庆的<a href=\"https://baike.baidu.com/item/%E7%81%AB%E9%94%85%E9%B1%BC\" target=\"_blank\" rel=\"noopener\">火锅鱼</a>，最开始是针对司机朋友推出的，风行一时。<sup class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\"> [2]</sup> </div>\n<div class=\"para\">1983年，在重庆地区举办的一次厨艺大赛上，一位川菜厨师凭这道菜获得了大奖，使其发扬光大。</div>\n<div class=\"para\">厨师的一位朋友，生活在<a href=\"https://baike.baidu.com/item/%E5%98%89%E9%99%B5%E6%B1%9F\" target=\"_blank\" rel=\"noopener\">嘉陵江</a>边，来他家时，经常会带上几条刚刚打上来的嘉陵江草鱼。有一次，朋友来时，家中无其他食材。当厨师看到木盆里朋友带来的鱼后，第一盆水煮鱼诞生了。做好后，鱼肉鲜美、麻辣厚重，使得朋友赞不绝口，厨师本人也为之一惊。从此以后，厨师开始潜心研究“水煮鱼肉”，从鱼肉的的特性，麻辣的搭配到色型的创新等诸多方面力争做到精益求精，历经一年多的努力，1985年水煮鱼基本定型</div>\n</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para-title level-3\">\n<h3 class=\"title-text\">价值功效</h3>\n</div>\n<div class=\"para\">草鱼含有丰富的不饱和脂肪酸，对血液循环有利，是心血管病人的良好食物。含有丰富的硒元素，经常食用有抗衰老、养颜的功效，而且对肿瘤也有一定的防治作用。另外，草鱼具有暖胃和中、平肝祛风、治痹、截疟、益肠明眼目之功效，主治虚劳、风虚头痛、肝阳上亢、高血压、头痛、久疟。</div>\n<div class=\"para\">黄豆芽含有丰富的维生素，可以防治维生素B2缺乏症。所含的维生素E能保护皮肤和毛细血管，防止动脉硬化，防治老年高血压。维生素C是美容食品。常吃黄豆芽能营养毛发，使头发保持乌黑光亮，对面部雀斑有较好的淡化效果；对青少年生长发育、预防贫血等有好处；还有健脑、抗疲劳、抗癌，防止牙龈出血、心血管硬化及低胆固醇等功效。</div>\n</div>\n<div class=\"para\"> </div>\n<div class=\"para\">1.水煮鱼中食盐的用量远远超出正常标准。女性在经期食用水煮鱼会加重水肿的情况，容易产生疲倦感；过量食入盐容易让人产生紧张情绪、血压升高，还能影响血管的弹性。\n<div id=\"J-cellModule-22584958\" class=\"lemma-album-marquee disable-scroll disable-scroll-left disable-scroll-right\" title=\"制作水煮鱼所需的材料\">\n<div class=\"lemma-album-marquee__view\">\n<div class=\"lemma-album-marquee__view__imgcontainer gallery\">\n<p> </p>\n</div>\n</div>\n</div>\n</div>', '2021-04-12 21:56:08');
INSERT INTO `shangpin` VALUES ('13', '2101131626020', '宫保鸡丁', 'upload/67f16292a207492d6f3798aa6a8db3d9.png', '7', '100', '7.00', '35.00', '0', '<div class=\"para\">宫保鸡丁（Kung Pao Chicken）<sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_5070414\"></a>  ，是一道闻名中外的特色传统名菜，在<a href=\"https://baike.baidu.com/item/%E9%B2%81%E8%8F%9C/458122\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"458122\">鲁菜</a>、<a href=\"https://baike.baidu.com/item/%E5%B7%9D%E8%8F%9C/26409\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"26409\">川菜</a>、<a href=\"https://baike.baidu.com/item/%E8%B4%B5%E5%B7%9E%E8%8F%9C/5966729\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"5966729\">贵州菜</a>中都有收录，其原料、做法有差别。<sup class=\"sup--normal\" data-sup=\"2\" data-ctrmap=\":2,\"> [2]</sup><a class=\"sup-anchor\" name=\"ref_%5B2%5D_5070414\"></a>  该菜式的起源与鲁菜中的<a href=\"https://baike.baidu.com/item/%E9%85%B1%E7%88%86%E9%B8%A1%E4%B8%81/751867\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"751867\">酱爆鸡丁</a>，和贵州菜的胡<a href=\"https://baike.baidu.com/item/%E8%BE%A3%E5%AD%90%E9%B8%A1%E4%B8%81\" target=\"_blank\" rel=\"noopener\">辣子鸡丁</a>有关，后被清朝山东巡抚、四川总督<a href=\"https://baike.baidu.com/item/%E4%B8%81%E5%AE%9D%E6%A1%A2/302147\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"302147\">丁宝桢</a>改良发扬，形成了一道新菜式——宫保鸡丁，并流传至今，此道菜也被归纳为北京<a href=\"https://baike.baidu.com/item/%E5%AE%AB%E5%BB%B7%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">宫廷菜</a><sup class=\"sup--normal\" data-sup=\"3\" data-ctrmap=\":3,\"> [3]</sup><a class=\"sup-anchor\" name=\"ref_%5B3%5D_5070414\"></a>  。之后宫保鸡丁也流传到国外。</div>\n<div class=\"para\">宫保鸡丁选用鸡肉为主料，佐以花生米、辣椒等辅料烹制而成。 红而不辣、辣而不猛、香辣味浓、肉质滑脆。由于其入口鲜辣，鸡肉的鲜嫩配合花生的香脆。</div>\n<div class=\"para\">2018年9月，被评为“中国菜”之贵州十大经典名菜、四川十大经典名菜</div>\n<div class=\"para\"> </div>\n<div class=\"para\"> </div>\n<div class=\"para\">宫保鸡丁由清朝山东巡抚、四川总督<a href=\"https://baike.baidu.com/item/%E4%B8%81%E5%AE%9D%E6%A1%A2\" target=\"_blank\" rel=\"noopener\">丁宝桢</a>所创，他对烹饪颇有研究，喜欢吃鸡和花生米，并尤其喜好辣味。他在山东为官时曾命家厨改良鲁菜“酱爆鸡丁”为辣炒，后来在四川总督任上的时候将此菜推广开来，创制了一道将鸡丁、红辣椒、花生米下锅爆炒而成的美味佳肴。这道美味本来是丁家的私房菜，但后来尽人皆知，成为了人们熟知的宫保鸡丁。所谓“宫保”，其实是丁宝桢的荣誉官衔，丁宝桢治蜀十年，为官刚正不阿，多有建树，于光绪十一年死在任上，清廷为了表彰他的功绩，追赠“<a href=\"https://baike.baidu.com/item/%E5%A4%AA%E5%AD%90%E5%A4%AA%E4%BF%9D\" target=\"_blank\" rel=\"noopener\">太子太保</a>”。如上文所说，“太子太保”是“宫保”之一，于是，为了纪念丁宝桢，他发明的这道菜由此得名“宫保鸡丁”。由于这道菜流传太广，在各地有很多不同的做法，甚至还出现了将鸡丁演变为肉丁的“宫保肉丁”。宫保鸡丁传到西方后，西方人还根据自己的口味进行了一些改良，使之成为了符合西方口味的“西式宫保鸡丁</div>\n<div class=\"para\"> </div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para-title level-2\">\n<h2 class=\"title-text\">风味特色</h2>\n<a class=\"edit-icon j-edit-link\" data-edit-dl=\"3\">编辑</a>\n</div>\n<div class=\"para\">宫保鸡丁的特色是辣中有甜，甜中有辣，鸡肉的鲜嫩配合花生的香脆，入口鲜辣酥香，红而不辣，辣而不猛，肉质滑脆。</div>\n<div class=\"para\">\n<div class=\"description\"> </div>\n<div class=\"albumBg\"> </div>\n宫保鸡丁入口之后，舌尖先感觉微麻、浅辣，而后冲击味蕾的是一股甜意，咀嚼时又会有些“酸酸”的感觉，麻、辣、酸、甜包裹下的鸡丁、葱段、花生米使人欲罢不能<sup class=\"sup--normal\" data-sup=\"10\" data-ctrmap=\":10,\"> [10]</sup><a class=\"sup-anchor\" name=\"ref_%5B10%5D_5070414\"></a>  。</div>\n<div class=\"para\">各地的宫保鸡丁名字相同，做法却有不同：</div>\n<div class=\"para\">川菜版的宫保鸡丁用的是鸡脯肉，由于鸡脯肉不容易入味，炒出来鸡肉容易嫩滑不足，需要在码味上浆之前，用刀背将鸡肉拍打几下，或者放入一只蛋白，这样的鸡肉会更加嫩滑。川菜版宫保鸡丁原料中必须使用油酥花生米和干辣椒节，味必须是辣型荔枝味。辣椒节炸香，突出糊辣味。</div>\n<div class=\"para\">鲁菜版的宫保鸡丁更多采用鸡腿肉。为了更好地突出宫保鸡丁的口感，鲁菜还添加了笋丁或者马蹄丁。宫保鸡丁的做法和川菜做法大致相同，但是更注重急火爆炒，目的是保留鸡丁的鲜嫩。</div>\n<div class=\"para\">贵州菜版的宫保鸡丁用的是糍粑辣椒，和川菜、鲁菜版本不一样。贵州版宫保鸡丁咸辣略带酸甜，请注意这个“酸”字，酸辣是贵州菜区别川菜的重要标志之一</div>\n</div>', '2021-04-12 23:05:47');
INSERT INTO `shangpin` VALUES ('14', '2101131630153', '大盘鸡', 'upload/a4ed04611fd266de072536a1bc0b7a70.png', '8', '98', '5.00', '38.00', '2', '<div class=\"para\">新疆大盘鸡，又名沙湾大盘鸡、辣子炒鸡，是20世纪80年代起源于新疆公路边饭馆的江湖菜，主要用鸡块和土豆块炒炖而成，还同<a href=\"https://baike.baidu.com/item/%E6%B2%B3%E5%8D%97%E7%83%A9%E9%9D%A2/3235660\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"3235660\">河南烩面</a>搭配食用。<sup class=\"sup--normal\" data-sup=\"1\" data-ctrmap=\":1,\"> [1]</sup><a class=\"sup-anchor\" name=\"ref_%5B1%5D_9624\"></a>  色彩鲜艳、爽滑麻辣的<a href=\"https://baike.baidu.com/item/%E9%B8%A1%E8%82%89/9661436\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"9661436\">鸡肉</a>和软糯甜润的<a href=\"https://baike.baidu.com/item/%E5%9C%9F%E8%B1%86/33722\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"33722\">土豆</a>，辣中有香、粗中带细，是餐桌上的佳品。</div>\n<div class=\"para\">2018年9月10日，“中国菜”正式发布，“大盘鸡”被评为新疆十大经典名菜</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">新疆大盘鸡出现于20世纪80年代，当时新疆沙湾县一位叫李士林的厨师在公路边开了一家“满朋阁”饭店。李士林擅长烹制辣子鸡块，某次一个建筑公司的职工来吃辣子鸡块，虽然觉得味道好，但总感觉量太少，看到李士林拿了只整鸡从后堂出来，就要他把整只鸡都给他们炒上。可是，炒好后的鸡块却没有那么大的盘子装，于是李士林就用盛拌面的盘子盛上了，吃完后这群客人大呼过瘾，而邻座的客人们也纷纷要求来一份大盘装盛的鸡，大盘鸡由此成形。起先店家把菜谱写在一块小黑板上，叫“辣子炒鸡”，后来越来越多的饭店开始推出这种用大盘子装鸡块的做法，大盘鸡的名声也就传开了。一时间，沙湾县城国道两侧，涌现出了许多“大盘鸡”餐馆。<sup class=\"sup--normal\" data-sup=\"3\" data-ctrmap=\":3,\"> [3]</sup> </div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"><span class=\"description\">大盘鸡</span></div>\n1992年，<a href=\"https://baike.baidu.com/item/%E6%B2%99%E6%B9%BE/3699075\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"3699075\">沙湾</a>杏花村大盘鸡店的老板张某首先注册了“大盘鸡”这个品牌，一道<a href=\"https://baike.baidu.com/item/%E4%B9%A1%E5%9C%9F%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">乡土菜</a>，开始了自己的品牌之路。<sup class=\"sup--normal\" data-sup=\"4\" data-ctrmap=\":4,\"> [4]</sup> </div>\n<div class=\"para\">经过20多年的发展演变，在新疆，不仅可以吃到大盘鸡经典款“<a href=\"https://baike.baidu.com/item/%E5%9C%9F%E8%B1%86%E9%B8%A1\" target=\"_blank\" rel=\"noopener\">土豆鸡</a>”，还可以吃到大盘鸡豪华版、升级版“<a href=\"https://baike.baidu.com/item/%E9%A6%99%E8%8F%87%E9%B8%A1/3484274\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"3484274\">香菇鸡</a>、咸菜鸡、豇豆鸡、花卷鸡、海带鸡、油炸馕鸡、冻豆腐大盘鸡、鸡血饼大盘鸡”等，香喷喷的大盘鸡再配上具有新疆特色的<a href=\"https://baike.baidu.com/item/%E9%A6%95/13352602\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"13352602\">馕</a>、<a href=\"https://baike.baidu.com/item/%E7%9A%AE%E5%B8%A6%E9%9D%A2/7184876\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"7184876\">皮带面</a>，绝对是一道美味 </div>\n</div>\n<div class=\"para\"> </div>\n<div class=\"para\">\n<div class=\"para\">新疆大盘鸡，通常是先炒后炖。做好后，皮焦肉烂的鲜美鸡块夹杂着青椒、红椒鲜亮的<a href=\"https://baike.baidu.com/item/%E8%89%B2%E5%BD%A9/7998511\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"7998511\">色彩</a>，混合在汤汁中的土豆淀粉吸收了<a href=\"https://baike.baidu.com/item/%E6%B2%B9%E8%85%BB\" target=\"_blank\" rel=\"noopener\">油腻</a>，用筷子夹起宽且薄的面片在汤汁中搅拌几下，立刻被稠密的<a href=\"https://baike.baidu.com/item/%E6%B1%A4%E6%B1%81\" target=\"_blank\" rel=\"noopener\">汤汁</a>包围，放到嘴里麻辣鲜香，诸般滋味涌上舌尖。<sup class=\"sup--normal\" data-sup=\"14\" data-ctrmap=\":14,\"> [14]</sup><a class=\"sup-anchor\" name=\"ref_%5B14%5D_9624\"></a> </div>\n<div class=\"para\">这道菜，口感独特、味道新颖，既有<a href=\"https://baike.baidu.com/item/%E8%A5%BF%E5%8C%97%E4%BA%BA\" target=\"_blank\" rel=\"noopener\">西北人</a>喜欢的粗犷豪气的辣味儿，又融合了老四川人为这疯狂的舌尖上的麻味儿</div>\n</div>', '2021-04-12 21:46:58');
INSERT INTO `shangpin` VALUES ('15', '2101131631583', '猪肚鸡', 'upload/7b7b71c0da118d7928b74918c896e20b.png', '8', '100', '6.00', '68.00', '0', '<p>猪肚包鸡，是一道<a href=\"https://baike.baidu.com/item/%E5%B9%BF%E4%B8%9C%E7%9C%81/132473\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"132473\">广东省</a>传统的地方名菜，属于<a href=\"https://baike.baidu.com/item/%E5%AE%A2%E5%AE%B6%E8%8F%9C\" target=\"_blank\" rel=\"noopener\">客家菜</a>系，又名猪肚煲鸡、凤凰投胎，流行于广东的<a href=\"https://baike.baidu.com/item/%E6%B7%B1%E5%9C%B3/140588\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"140588\">深圳</a>、<a href=\"https://baike.baidu.com/item/%E6%83%A0%E5%B7%9E/1396484\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"1396484\">惠州</a>、<a href=\"https://baike.baidu.com/item/%E6%B2%B3%E6%BA%90/36386\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"36386\">河源</a>、<a href=\"https://baike.baidu.com/item/%E6%A2%85%E5%B7%9E/2554831\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"2554831\">梅州</a>等粤东一带，是广东<a href=\"https://baike.baidu.com/item/%E5%AE%A2%E5%AE%B6%E5%9C%B0%E5%8C%BA/4583858\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"4583858\">客家地区</a><a href=\"https://baike.baidu.com/item/%E9%85%92%E5%B8%AD/5869960\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"5869960\">酒席</a>必备的餐前用汤，汤里浓中带清，有浓郁的<a href=\"https://baike.baidu.com/item/%E8%8D%AF%E6%9D%90/7493145\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"7493145\">药材</a>味和<a href=\"https://baike.baidu.com/item/%E8%83%A1%E6%A4%92/405754\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"405754\">胡椒</a>香气</p>\n<p><a href=\"https://baike.baidu.com/item/%E7%8C%AA%E8%82%9A\" target=\"_blank\" rel=\"noopener\">猪肚</a>包鸡，又名猪肚包鸡火锅、<a href=\"https://baike.baidu.com/item/%E5%87%A4%E5%87%B0%E6%8A%95%E8%83%8E\" target=\"_blank\" rel=\"noopener\">凤凰投胎</a>。是广东省传统的<a href=\"https://baike.baidu.com/item/%E5%AE%A2%E5%AE%B6%E8%8F%9C/503882\" target=\"_blank\" rel=\"noopener\" data-lemmaid=\"503882\">客家菜</a>。流行于广东的惠州、河源、梅州等粤东一带。广东客家地区酒席必备的餐前用汤，汤里浓中带清，有浓郁的药材味和胡椒香气。</p>\n<p> </p>\n<p>相传在清朝，宜妃刚生完太子，因为宜妃有胃病，产后身体虚弱，乾隆吩咐御膳房炖补品给宜妃吃，可是她吃什么都没有胃口，凤体日渐消瘦。宫里的太医想尽办法做种种名贵补品给宜妃吃，还是无济于事。乾隆召集太医和御膳房，把旨意传下去，无论用何办法，都要医治宜妃的病。御膳房想到“<a href=\"https://baike.baidu.com/item/%E8%8D%AF%E8%A1%A5%E4%B8%8D%E5%A6%82%E9%A3%9F%E8%A1%A5\" target=\"_blank\" rel=\"noopener\">药补不如食补</a>”的方法，于是把民间传统坐月子吃鸡汤的做法加以改良，把鸡放进猪肚里加上名贵药材炖汤，宜妃吃后果然胃口大开，经过一段时间饮食调理，宜妃的胃病已痊愈而且肤色也红润有光泽，美艳动人。这道菜不仅去病强体，也有养生保健之功效，从此乾隆把这道菜叫做“凤凰投胎”，就是现在的猪肚鸡火锅，便从此在民间广为流传</p>\n<p> </p>\n<p>首先饮原汁原味的猪肚包鸡汤；接着将猪肚包鸡斩件后放入汤中继续煲5~10分钟，吃猪肚和鸡肉，猪肚爽口异常，鸡肉鲜嫩可口，汤的味道更增添了鸡的鲜味；然后放入菜干、香菇等干类杂菜，吸收肉味，汤味变得清甜；最后加入肉丸、鲜鸡什、竹肠等肉类，汤水越加浓郁美味</p>\n<p> </p>\n<p>猪肚包鸡火锅就是用生猪肚把生鸡包住，用水草（或用牙签）扎好二头后放到特配的汤料中煲熟，食前再将猪肚刮开，取出熟鸡一起砍件后，放回原煲汤料中滚热再食，这一食法是使生滚食法的火锅多了一种老火食法，节约时间的同时又可品尝到香浓扑鼻，美味可口的鸡肉，不用担心火候难以控制而鸡肉过火变韧</p>\n<div class=\"para\">据《<a href=\"https://baike.baidu.com/item/%E6%9C%AC%E8%8D%89%E7%BA%B2%E7%9B%AE\" target=\"_blank\" rel=\"noopener\">本草纲目</a>》记载，胡椒有温中下气、和胃、止呕功效。用上等胡椒煲猪肚，加上上等靓扇鸡，精制成美味浓汤食用。胡椒猪肚鸡火锅主要针对中气不足、食欲不振、消化不良、虚寒、胃痛、酒毒伤胃等，具有行气、健脾、暖胃、养胃、散寒、止胃痛和排毒的功效。</div>\n<div class=\"anchor-list \">\n<a class=\"lemma-anchor para-title\" name=\"3_2\"></a><a class=\"lemma-anchor \" name=\"sub229469_3_2\"></a><a class=\"lemma-anchor \" name=\"%E7%8C%AA%E8%82%9A\"></a><a class=\"lemma-anchor \" name=\"3-2\"></a>\n</div>\n<div class=\"para-title level-3\">\n<h3 class=\"title-text\">猪肚</h3>\n</div>\n<div class=\"para\">\n<div class=\"lemma-picture text-pic layout-right\"> </div>\n猪肚为猪科动物猪的胃。猪肚含有蛋白质、脂肪、碳水化合物、维生素及钙、磷、铁等，具有补虚损、健脾胃的功效，适用于气血虚损、身体瘦弱者食用</div>\n<p> </p>', '2021-04-12 22:20:19');

-- ----------------------------
-- Table structure for `shangpinfenlei`
-- ----------------------------
DROP TABLE IF EXISTS `shangpinfenlei`;
CREATE TABLE `shangpinfenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenlei` varchar(50) NOT NULL COMMENT '分类',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of shangpinfenlei
-- ----------------------------
INSERT INTO `shangpinfenlei` VALUES ('5', '粤菜', '2021-04-12 23:16:12');
INSERT INTO `shangpinfenlei` VALUES ('6', '湘菜', '2021-04-12 23:51:25');
INSERT INTO `shangpinfenlei` VALUES ('7', '川菜', '2021-04-12 23:29:22');
INSERT INTO `shangpinfenlei` VALUES ('8', '特色菜', '2021-04-12 23:38:23');

-- ----------------------------
-- Table structure for `shouhuodizhi`
-- ----------------------------
DROP TABLE IF EXISTS `shouhuodizhi`;
CREATE TABLE `shouhuodizhi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `dianhua` varchar(50) NOT NULL COMMENT '电话',
  `dizhi` varchar(50) NOT NULL COMMENT '地址',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='收货地址';

-- ----------------------------
-- Records of shouhuodizhi
-- ----------------------------
INSERT INTO `shouhuodizhi` VALUES ('1', '张三', '15933214569', 'xxx街道xxx号', '001', '2021-04-12 20:27:58');
INSERT INTO `shouhuodizhi` VALUES ('2', '小更', '15933214568', 'xxx街道xxx号1', '002', '2021-04-12 20:53:34');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `yonghuming` varchar(50) NOT NULL COMMENT '用户名',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '001', '001', '张三', '女', '15555588885', 'upload/c94f14a4ce32e5343d6e61cec5214944.png', '2021-04-12 20:42:49');
INSERT INTO `yonghu` VALUES ('2', '002', '002', '李四', '男', '15878569562', 'upload/2f4f96edeb12febc31a9aaec58e5e9c1.png', '2021-04-12 20:53:32');
INSERT INTO `yonghu` VALUES ('3', '003', '003', '王武', '女', '16598457236', 'upload/940db15e0357e5f4d157bd83da75c950.png', '2021-04-12 21:03:01');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2021-04-12 20:23:08');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2021-04-12 20:23:08');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2021-04-12 20:23:08');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com', '2021-04-12 20:23:08');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com', '2021-04-12 20:23:08');
