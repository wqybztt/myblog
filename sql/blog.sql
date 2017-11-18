# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.34)
# Database: blog
# Generation Time: 2017-11-18 14:48:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '文章标题',
  `desc` varchar(100) NOT NULL DEFAULT '' COMMENT '文章描述',
  `content` text NOT NULL COMMENT '文章内容',
  `cate` int(11) NOT NULL COMMENT '文章大分类',
  `subcate` int(11) NOT NULL COMMENT '文章小分类',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;

INSERT INTO `article` (`id`, `title`, `desc`, `content`, `cate`, `subcate`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,'于红尘中，与你相逢','于红尘中，与你相逢，宛如杯中的水恋上菊花的清香，在浮沉中，相守彼此的柔情，在旋转的舞姿中，寻找心灵的牵挂。','<p>于红尘中，与你相逢，宛如杯中的水恋上菊花的清香，在浮沉中，相守彼此的柔情，在旋转的舞姿中，寻找心灵的牵挂。</p><p>流年似水，时光如梭。不羡名利，不慕虚荣。于林花谢了春红间，守候不变的初心，守候醉人的香魂；于夏花烂漫中，坚守纯真的芳心，坚守一帘的幽梦。于秋月白霜中，淡妆如雪，与君邂逅；于腊梅绽放时，清雅如菊，执子之手。</p><p>爱是一种修行，席慕容说：“ 如何让你遇见我，在我最美丽的时刻，为这，我已在佛前求了五百年…… ” 素指轻弹流年，拨动沉寂的心弦。缓缓从指间流淌的琴韵，成流光飞羽，成锦书鸿雁。漫卷珠帘，倚窗凭栏，静赏一场花事，一季香风。曾记去年小园香径，携手游玩，暗香拂袖，君说：“待来年春暖花开时，我定会娶你。”</p><p>相逢是一种缘，不求天长地久，只在乎曾经拥有。人生若只如初见，遇见即是今生最大的幸福，那是前世修来的福。不求过多的奢望，只要你一个承诺，就够。</p><p>相逢是一种缘，“有缘千里来相会，无缘对面不相识”。如果你今生遇见了他，不要轻言放弃，不要错过今生唯一的他。如何让你在今生遇见他，在你最美的时候，莫等青春不再，容颜衰老。</p><p>于红尘中，与你相逢，牵手在撩人夜色；牵手在斑斓霓虹；牵手在烟花三月；牵手在蒙蒙烟雨。共赏璀璨星光；共赏幸福生活；共赏人间烟火；共赏缠绵心语。(&nbsp;文章阅读网：www.sanwen.net )</p><p>“晓镜但愁云鬓改，夜莺应觉月光寒。” 遇见你是幸福的，如春风，唤醒沉睡的海棠；如流水，滋润干涸的桃花。</p><p>相逢是一种生命的交集，需要对美丽人生进行酝酿，如上等女儿红，酿悠然醇香，溢江南韵味，品千年滋养；如上等桂花蜜，吸天地灵气，受日精月华，藏琼浆玉液。</p><p>弱水三千，只取一瓢饮；菊花万朵，只摘一朵品。那一杯水，经过寒暖的熔炼，落入大地，经年累月，沉降，净化；那一朵菊，饱经风霜寒露，摈弃浊气、污垢，化天地清气幽香，铸至清之香。那一杯水，那一朵菊，于冥冥中，相映成趣，成为彼此的唯一。</p><p>“士为知己者死，女为悦己者容。” 相逢若能不离不弃，把心中的位置永远留给彼此；相逢若能如影随形，你是风，我是雨，缠缠绵绵到天涯。</p><p>于红尘中，与你相逢。相逢在江南雨巷、相逢在秦淮灯影、相逢在风花雪月、相逢在夏荷秋日……</p>',1,4,'2017-11-18 21:58:36','2017-11-18 22:14:16',NULL);

/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cate`;

CREATE TABLE `cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `pid` int(11) unsigned NOT NULL COMMENT '父级分类id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称(zh-cn)',
  `alias` varchar(20) NOT NULL DEFAULT '' COMMENT '分类别名(en)',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

LOCK TABLES `cate` WRITE;
/*!40000 ALTER TABLE `cate` DISABLE KEYS */;

INSERT INTO `cate` (`id`, `pid`, `name`, `alias`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,0,'前端资料','front','2017-10-31 21:28:41','2017-10-31 21:30:28',NULL),
	(2,0,'后端资料','back','2017-10-31 21:29:05','2017-10-31 21:30:32',NULL),
	(3,0,'服务器资料','server','2017-10-31 21:29:50','2017-10-31 21:30:35',NULL),
	(4,1,'UI框架','ui','2017-10-31 21:30:38','2017-10-31 21:41:53',NULL),
	(5,1,'js基础','js-base','2017-10-31 21:31:05','2017-10-31 21:41:54',NULL),
	(6,1,' js框架','js-framework','2017-10-31 21:32:27','2017-10-31 21:41:55',NULL),
	(7,1,'jquery','jquery','2017-10-31 21:32:50','2017-10-31 21:41:56',NULL),
	(8,1,'vue','vue','2017-10-31 21:33:10','2017-10-31 21:41:59',NULL),
	(9,1,'react','react','2017-10-31 21:33:54','2017-10-31 21:42:02',NULL),
	(10,1,'angular','angular','2017-10-31 21:34:12','2017-10-31 21:42:04',NULL),
	(11,2,'后端基础','back-base','2017-10-31 21:34:52','2017-10-31 21:42:23',NULL),
	(12,2,'node','node','2017-10-31 21:35:11','2017-10-31 21:42:26',NULL),
	(13,2,'php','php','2017-10-31 21:35:24','2017-10-31 21:42:29',NULL),
	(14,2,'后端安全','back-security','2017-10-31 21:36:23',NULL,NULL),
	(15,3,' 服务器基础','server-base','2017-10-31 21:36:43',NULL,NULL),
	(16,3,'windows','windows','2017-10-31 21:37:00','2017-10-31 21:37:53',NULL),
	(17,3,'linux','linux','2017-10-31 21:37:57',NULL,NULL),
	(18,3,'macos','macos','2017-10-31 21:38:29',NULL,NULL),
	(19,3,'服务器安全','server-security','2017-10-31 21:38:55',NULL,NULL),
	(20,1,'前端基础','html-css','2017-10-31 21:42:17','2017-10-31 21:43:01',NULL),
	(21,1,'angularjs','angularjs','2017-10-31 22:01:30',NULL,NULL),
	(22,1,'工程化','engineering','2017-10-31 22:29:52',NULL,NULL),
	(23,2,'数据库','database','2017-10-31 22:49:04',NULL,NULL);

/*!40000 ALTER TABLE `cate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table material
# ------------------------------------------------------------

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资料id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '资料标题',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '资料地址',
  `cate` int(11) NOT NULL COMMENT '资料大分类',
  `subcate` int(11) NOT NULL COMMENT '资料小分类',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;

INSERT INTO `material` (`id`, `title`, `url`, `cate`, `subcate`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,'HTML教程w3cschool ','https://www.w3cschool.cn/html/',1,20,'2017-10-31 21:46:47',NULL,NULL),
	(2,'Lodash 中文文档','http://www.css88.com/doc/lodash/',1,6,'2017-10-31 21:47:51',NULL,NULL),
	(3,'CSS教程 w3cschool','https://www.w3cschool.cn/css/',1,20,'2017-10-31 21:49:03',NULL,NULL),
	(4,'javascript教程 w3cschool','https://www.w3cschool.cn/javascript/',1,5,'2017-10-31 21:49:52',NULL,NULL),
	(5,'jQuery教程 w3cschool','https://www.w3cschool.cn/jquery/',1,7,'2017-10-31 21:50:33',NULL,NULL),
	(6,'Bootstrap中文网','http://www.bootcss.com/',1,4,'2017-10-31 21:51:27',NULL,NULL),
	(7,'Foundation中文网','http://www.foundcss.com/',1,4,'2017-10-31 21:52:37',NULL,NULL),
	(8,'AJAX教程 w3cschool','https://www.w3cschool.cn/ajax/',1,5,'2017-10-31 21:53:43',NULL,NULL),
	(9,'jQuery UI教程 w3cschool','https://www.w3cschool.cn/jqueryui/',1,7,'2017-10-31 21:55:55',NULL,NULL),
	(10,'bootstrap教程 w3cschool','https://www.w3cschool.cn/bootstrap/',1,4,'2017-10-31 21:57:24',NULL,NULL),
	(11,'HTML5教程 w3cschool','https://www.w3cschool.cn/html5/',1,20,'2017-10-31 21:58:18',NULL,NULL),
	(12,'AngularJS教程 w3cschool','https://www.w3cschool.cn/angularjs/',1,21,'2017-10-31 21:59:35','2017-10-31 22:01:42',NULL),
	(13,'Foundation5 教程 w3cschool','https://www.w3cschool.cn/foundation/',1,4,'2017-10-31 22:00:24',NULL,NULL),
	(14,'Angular2教程 w3cschool','https://www.w3cschool.cn/angular2/',1,10,'2017-10-31 22:01:17',NULL,NULL),
	(15,'Angular中文网','https://www.angular.cn/',1,10,'2017-10-31 22:02:42',NULL,NULL),
	(16,'AngularJS中文网','http://www.angularjs.net.cn/',1,21,'2017-10-31 22:03:40',NULL,NULL),
	(17,'React中文网','https://doc.react-china.org/',1,9,'2017-10-31 22:13:19',NULL,NULL),
	(18,'React Native 中文网','http://reactnative.cn/',1,9,'2017-10-31 22:13:43',NULL,NULL),
	(19,'React教程 w3cschool','https://www.w3cschool.cn/react/',1,9,'2017-10-31 22:14:14',NULL,NULL),
	(20,'JSON教程 w3cschool','https://www.w3cschool.cn/json/',1,5,'2017-10-31 22:15:17',NULL,NULL),
	(21,'Node.js 中文网','http://nodejs.cn/',2,12,'2017-10-31 22:16:27',NULL,NULL),
	(22,'Node.js教程 w3cschool','https://www.w3cschool.cn/nodejs/',2,12,'2017-10-31 22:17:03',NULL,NULL),
	(23,'jQuery EasyUI教程 w3cschool','https://www.w3cschool.cn/jqueryeasyui/',1,7,'2017-10-31 22:17:42',NULL,NULL),
	(24,'Extjs中文网','http://extjs.org.cn/',1,6,'2017-10-31 22:19:23',NULL,NULL),
	(25,'Extjs教程 w3cschool','https://www.w3cschool.cn/extjs/',1,6,'2017-10-31 22:19:49',NULL,NULL),
	(26,'Highcharts中文网','https://www.hcharts.cn/',1,6,'2017-10-31 22:24:04',NULL,NULL),
	(27,'Highcharts教程 w3cschool','https://www.w3cschool.cn/highcharts/',1,6,'2017-10-31 22:24:42',NULL,NULL),
	(28,'ECMAScript 6 入门--阮一峰','http://es6.ruanyifeng.com/',1,5,'2017-10-31 22:25:52',NULL,NULL),
	(29,'ECMAScript教程 w3cschool','https://www.w3cschool.cn/ecmascript/',1,5,'2017-10-31 22:26:22',NULL,NULL),
	(30,'HTML DOM教程 w3cschool','https://www.w3cschool.cn/htmldom/',1,5,'2017-10-31 22:27:11',NULL,NULL),
	(31,'Omi官网','http://alloyteam.github.io/omi/',1,22,'2017-10-31 22:30:55',NULL,NULL),
	(32,'Omi 手册 w3cschool','https://www.w3cschool.cn/omi/',1,22,'2017-10-31 22:31:26',NULL,NULL),
	(33,'vue.js中文官网','https://cn.vuejs.org/',1,8,'2017-10-31 22:34:25',NULL,NULL),
	(34,'vue-cli 官网','https://github.com/vuejs/vue-cli',1,8,'2017-10-31 22:35:38',NULL,NULL),
	(35,'vuex中文官网','https://vuex.vuejs.org/zh-cn/',1,8,'2017-10-31 22:37:30',NULL,NULL),
	(36,'Vue.js 服务器端渲染指南','https://ssr.vuejs.org/zh/',1,8,'2017-10-31 22:38:32',NULL,NULL),
	(37,'vue.js优选资源','https://curated.vuejs.org/',1,8,'2017-10-31 22:40:01',NULL,NULL),
	(38,'awesome-vue资源收集 ','https://github.com/vuejs/awesome-vue',1,8,'2017-10-31 22:41:01',NULL,NULL),
	(39,'iView官网','https://www.iviewui.com/',1,8,'2017-10-31 22:42:25',NULL,NULL),
	(40,'ElementUI 官网','http://element-cn.eleme.io/#/zh-CN',1,8,'2017-10-31 22:45:04',NULL,NULL),
	(41,'Awesome ElementUI 资源收集','https://github.com/ElementUI/awesome-element',1,8,'2017-10-31 22:45:43',NULL,NULL),
	(42,'Moment.js 中文网','http://momentjs.cn/',1,6,'2017-10-31 22:47:21',NULL,NULL),
	(43,'php文档-php中文网','http://www.php.cn/php/php-tutorial.html',2,13,'2017-10-31 22:52:36',NULL,NULL),
	(44,'PHP 框架 CodeIgniter 中国','http://codeigniter.org.cn/',2,13,'2017-10-31 22:54:15',NULL,NULL),
	(45,'ThinkPHP3.2完全开发手册','http://document.thinkphp.cn/manual_3_2.html',2,13,'2017-10-31 22:57:06',NULL,NULL),
	(46,'express中文网','http://www.expressjs.com.cn/',2,12,'2017-10-31 23:01:50',NULL,NULL),
	(47,'koa中文网','http://koa.bootcss.com/',2,12,'2017-10-31 23:02:38',NULL,NULL),
	(48,'thinkjs3.0中文文档','https://thinkjs.org/doc/index.html',2,12,'2017-10-31 23:03:51',NULL,NULL),
	(49,'iScroll-5 API 中文版','http://wiki.jikexueyuan.com/project/iscroll-5/',1,6,'2017-10-31 23:07:53',NULL,NULL),
	(50,'Swiper中文网','http://www.swiper.com.cn/',1,6,'2017-10-31 23:08:46',NULL,NULL),
	(51,'SuperSlide  和  TouchSlide','http://www.superslide2.com/',1,6,'2017-10-31 23:10:07',NULL,NULL),
	(52,'SUI淘宝','http://sui.taobao.org/sui/docs/index.html',1,4,'2017-10-31 23:11:49',NULL,NULL),
	(53,'MUI','http://dev.dcloud.net.cn/mui/',1,4,'2017-10-31 23:12:29',NULL,NULL),
	(54,'jQuery API 中文文档','http://www.css88.com/jqapi-1.9/',1,7,'2017-10-31 23:15:36',NULL,NULL),
	(55,'Normalize.css','http://necolas.github.io/normalize.css/',1,20,'2017-10-31 23:16:34',NULL,NULL),
	(56,'Font Awesome图标字体库','http://fontawesome.dashgame.com/',1,4,'2017-10-31 23:17:25',NULL,NULL),
	(57,'Web前端开发资源库','https://www.awesomes.cn/',1,6,'2017-10-31 23:18:56',NULL,NULL),
	(58,'JavaScript Promise迷你书','http://liubin.org/promises-book/',1,5,'2017-10-31 23:19:46',NULL,NULL),
	(59,'cookie.js','https://github.com/florian/cookie.js',1,6,'2017-10-31 23:20:30',NULL,NULL),
	(60,'ECharts官网','http://echarts.baidu.com/',1,6,'2017-10-31 23:21:14',NULL,NULL),
	(61,'Axios 中文说明','https://www.kancloud.cn/yunye/axios/234845',1,6,'2017-10-31 23:22:44',NULL,NULL);

/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `createtime` datetime DEFAULT NULL COMMENT '用户创建时间',
  `edittime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `deletetime` datetime DEFAULT NULL COMMENT '用户删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `password`, `createtime`, `edittime`, `deletetime`)
VALUES
	(1,'wangqiyuan','wqy112690yqw','2017-08-29 13:42:55',NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
