-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.11


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema codecore
--

CREATE DATABASE IF NOT EXISTS codecore;
USE codecore;

--
-- Definition of table `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `b_content` mediumtext,
  `b_time` datetime DEFAULT NULL,
  `b_img` varchar(150) DEFAULT NULL,
  `b_degree` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `FK_User_Blog_Relationship` (`u_id`),
  CONSTRAINT `FK_User_Blog_Relationship` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `blog`
--

/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`b_id`,`u_id`,`b_content`,`b_time`,`b_img`,`b_degree`) VALUES 
 (2,3,'我的乖乖，玩大了啊。 钱，不是万能滴。','2017-03-03 00:00:00','/CodecoreMicroblog/upload/pic/b.jpg',2),
 (3,5,'研发人员自编自导自演自谱自唱的电影，居然搞这么大动静,影片和网络累计播放上1000万次。','2016-06-06 00:00:00','/CodecoreMicroblog/upload/pic/a.jpg',NULL),
 (4,4,'这部电影 花费才6万，仅相当于 1个研发人员的两个月收入。','2016-06-08 00:00:00','/CodecoreMicroblog/upload/pic/c.jpg',NULL),
 (5,6,'昨天在MCM 的開幕活動，遇上很多很久不見的朋友，感覺開心','2017-01-06 00:00:00','/CodecoreMicroblog/upload/pic/d.jpg',NULL),
 (6,14,'发生大富大噶个回复的时间一天股份是德国','2016-09-21 00:00:00',NULL,NULL),
 (10,1,'广泛的收购的风格','2017-07-06 10:19:37',NULL,NULL),
 (15,1,'测试发布','2017-07-06 11:10:10',NULL,NULL),
 (16,27,'哈哈，加“灰色空间”为关注了','2017-07-06 13:04:48','/CodecoreMicroblog/upload/pic/183800250lit.jpg',NULL),
 (17,32,'微博-----------------------111','2017-07-06 16:08:06',NULL,NULL),
 (18,32,'微博--------------------------222','2017-07-06 16:08:24',NULL,NULL),
 (19,32,'微博-------------------333','2017-07-06 16:08:43',NULL,NULL),
 (20,32,'微博--------------44','2017-07-06 16:09:00',NULL,NULL),
 (21,2,'水电费是德国','2017-07-06 16:20:02',NULL,NULL),
 (22,2,'sfg','2017-07-06 16:20:17',NULL,2),
 (23,2,'考虑考虑','2017-07-06 16:20:40','/CodecoreMicroblog/upload/pic/气泡.gif',3),
 (24,2,'房价很高','2017-07-06 16:44:03',NULL,4),
 (31,1,'考虑考虑','2017-07-06 00:00:00','/CodecoreMicroblog/upload/pic/气泡.gif',3),
 (36,1,'房价很高','2017-07-06 22:50:08',NULL,4),
 (37,1,'我的乖乖，玩大了啊。 钱，不是万能滴。','2017-07-06 23:01:19','/CodecoreMicroblog/upload/pic/b.jpg',2),
 (38,1,'fjkdsla','2017-07-06 23:10:41',NULL,NULL),
 (39,2,'测试时间','2017-07-06 23:15:21',NULL,2),
 (40,1,'测试时间','2017-07-07 19:04:16',NULL,2),
 (41,1,'测试时间','2017-07-08 20:46:18',NULL,2),
 (42,27,'哈哈，重转系统后，效果就是不一样····','2017-07-10 09:45:58',NULL,1),
 (43,27,'哈哈，重转系统后，效果就是不一样····','2017-07-10 11:44:28',NULL,1),
 (44,27,'放大图片','2011-07-10 11:45:09','/CodecoreMicroblog/upload/pic/baby.jpg',NULL),
 (46,27,'啦啦啦啦啦啦啦···············','2017-07-10 12:07:18','/CodecoreMicroblog/upload/pic/lala.jpg',NULL),
 (47,38,'fjdksl;af','2017-07-10 15:25:14',NULL,NULL),
 (48,39,'','2017-07-10 20:11:32','/CodecoreMicroblog/upload/pic/hurt.jpg',NULL),
 (49,27,'还是很慢啊','2017-07-10 21:15:55','/CodecoreMicroblog/upload/pic/lala.jpg',NULL),
 (50,27,'怎么办？','2017-07-10 21:16:23',NULL,NULL),
 (51,27,'改优先级？','2017-07-10 21:17:09',NULL,NULL),
 (52,27,'还是很慢呐','2017-07-10 21:17:49',NULL,NULL),
 (54,2,'中文图片','2017-07-13 11:16:31','/CodecoreMicroblog/upload/pic/史迪仔.ico',1),
 (55,2,'中文图片','2017-07-13 12:29:53','/CodecoreMicroblog/upload/pic/史迪仔.ico',1),
 (56,44,'电视剧阿飞会计核算地方','2017-07-13 16:31:40',NULL,NULL),
 (57,44,'但是','2017-07-13 16:35:10',NULL,NULL),
 (58,44,'界面测试','2017-07-13 21:54:39',NULL,NULL),
 (59,47,'发个微博先','2017-07-13 22:01:41','/CodecoreMicroblog/upload/pic/气泡 红.jpg',NULL),
 (60,44,'测试重名','2017-07-15 15:15:31','/CodecoreMicroblog/upload/pic/Android2.png',NULL),
 (61,44,'','2017-07-15 15:18:50','/CodecoreMicroblog/upload/pic/201161531850212Android2.png',NULL);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;


--
-- Definition of table `collect`
--

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `co_time` datetime DEFAULT NULL,
  `co_content` text,
  `co_img` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`co_id`),
  KEY `FK_Collect_Blog_Relationship` (`b_id`),
  KEY `FK_User_Collect_Relationship` (`u_id`),
  CONSTRAINT `FK_Collect_Blog_Relationship` FOREIGN KEY (`b_id`) REFERENCES `blog` (`b_id`),
  CONSTRAINT `FK_User_Collect_Relationship` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `collect`
--

/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` (`co_id`,`u_id`,`b_id`,`co_time`,`co_content`,`co_img`) VALUES 
 (2,27,46,'2017-07-10 15:57:09','啦啦啦啦啦啦啦···············','/CodecoreMicroblog/upload/pic/lala.jpg'),
 (3,44,55,'2017-07-13 18:11:41','中文图片','/CodecoreMicroblog/upload/pic/史迪仔.ico'),
 (6,44,55,'2017-07-13 20:13:15','中文图片','/CodecoreMicroblog/upload/pic/史迪仔.ico'),
 (8,44,4,'2017-07-13 20:15:53','这部电影 花费才6万，仅相当于 1个研发人员的两个月收入。','/CodecoreMicroblog/upload/pic/c.jpg'),
 (9,44,56,'2017-07-13 20:23:29','电视剧阿飞会计核算地方',NULL),
 (10,44,56,'2017-07-13 20:23:42','电视剧阿飞会计核算地方',NULL),
 (11,44,21,'2017-07-13 20:24:19','水电费是德国',NULL);
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;


--
-- Definition of table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `c_content` mediumtext,
  `c_time` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_Blog_Comment_Relationship` (`b_id`),
  KEY `FK_User_Comment_Relationship` (`u_id`),
  CONSTRAINT `FK_Blog_Comment_Relationship` FOREIGN KEY (`b_id`) REFERENCES `blog` (`b_id`),
  CONSTRAINT `FK_User_Comment_Relationship` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`c_id`,`u_id`,`b_id`,`c_content`,`c_time`) VALUES 
 (1,1,40,'hao','2017-07-08 15:58:18'),
 (2,1,31,'nnnn','2017-07-08 16:50:31'),
 (3,2,NULL,'fjdsal;','2017-07-08 18:47:07'),
 (4,4,NULL,'fjdls','2017-07-08 18:52:04'),
 (5,1,NULL,'jfdls;a','2017-07-08 19:25:45'),
 (6,2,40,'ceshishijian','2017-07-08 19:31:57'),
 (7,1,37,'wodeguaiguai','2017-07-08 19:36:35');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


--
-- Definition of table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_uid` int(11) DEFAULT NULL,
  `f_gid` int(11) DEFAULT NULL,
  `f_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `FK_attention_Relationship` (`f_uid`) USING BTREE,
  KEY `FK_attentioned_Relationship` (`f_gid`) USING BTREE,
  CONSTRAINT `FK_attentioned_Relationship` FOREIGN KEY (`f_gid`) REFERENCES `userinfo` (`u_id`),
  CONSTRAINT `FK_attention_Relationship` FOREIGN KEY (`f_uid`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `friends`
--

/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` (`f_id`,`f_uid`,`f_gid`,`f_state`) VALUES 
 (1,8,1,1),
 (3,9,1,2),
 (4,1,10,1),
 (15,4,1,1),
 (16,2,1,1),
 (17,2,3,1),
 (18,2,6,1),
 (21,32,1,1),
 (22,2,4,1),
 (24,1,12,1),
 (25,35,1,1),
 (26,29,1,1),
 (27,1,7,1),
 (28,1,11,1),
 (29,1,13,1),
 (30,1,14,1),
 (31,1,15,1),
 (32,1,16,1),
 (33,1,20,1),
 (34,1,17,1),
 (35,1,18,1),
 (36,1,19,1),
 (37,1,22,1),
 (38,1,21,1),
 (39,1,26,1),
 (40,1,23,1),
 (41,2,7,1),
 (42,5,1,1),
 (43,27,1,1),
 (44,39,2,2),
 (45,39,4,1),
 (46,39,27,1),
 (47,39,33,1),
 (48,44,5,1),
 (50,44,2,1),
 (52,6,44,1),
 (53,44,4,2),
 (54,3,44,1),
 (55,2,10,1),
 (56,2,5,1),
 (57,2,8,1),
 (58,2,9,1),
 (59,2,12,1);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;


--
-- Definition of table `transpond`
--

DROP TABLE IF EXISTS `transpond`;
CREATE TABLE `transpond` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `t_time` datetime DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `FK_Blog_Transpond_Relationship` (`b_id`),
  KEY `FK_User_Transpond_Relationship` (`u_id`),
  CONSTRAINT `FK_Blog_Transpond_Relationship` FOREIGN KEY (`b_id`) REFERENCES `blog` (`b_id`),
  CONSTRAINT `FK_User_Transpond_Relationship` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Dumping data for table `transpond`
--

/*!40000 ALTER TABLE `transpond` DISABLE KEYS */;
/*!40000 ALTER TABLE `transpond` ENABLE KEYS */;


--
-- Definition of table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_account` varchar(50) DEFAULT NULL,
  `u_password` varchar(50) DEFAULT NULL,
  `u_nick` varchar(50) DEFAULT NULL,
  `u_img` varchar(50) DEFAULT NULL,
  `u_sex` varchar(50) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_date` date DEFAULT NULL,
  `u_addr` varchar(50) DEFAULT NULL,
  `u_mail` varchar(50) DEFAULT NULL,
  `u_qq` varchar(50) DEFAULT NULL,
  `u_msn` varchar(50) DEFAULT NULL,
  `u_sign` mediumtext,
  `u_url` varchar(100) DEFAULT NULL,
  `u_question` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=gbk;

--
-- Dumping data for table `userinfo`
--

/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` (`u_id`,`u_account`,`u_password`,`u_nick`,`u_img`,`u_sex`,`u_name`,`u_date`,`u_addr`,`u_mail`,`u_qq`,`u_msn`,`u_sign`,`u_url`,`u_question`) VALUES 
 (1,'useraccount1','321','灰色空间','/CodecoreMicroblog/face/4.bmp','male','陈管希','1987-07-07','澳门','chenguanxi@163.com','123423123','chenguanxi@hotmail.com','成大事不在于力量多少，而在能坚持多久','http://weibo.com/1','白色'),
 (2,'useraccount2','userpassword2','小屁孩','/CodecoreMicroblog/face/2.jpg','女','张百之','1988-09-09','香港','zhangbozhi@163.com','234234234','zhangbozhi@hotmail.com','成名每在穷苦日，败事多因得意时','http://weibo.com/2',''),
 (3,'useraccount3','userpassword3','lovelystyle','/CodecoreMicroblog/face/3.jpg','male','谢听风','1983-09-18','american','lskdjflsdkjf@11.com','34858029128','lsknmonno@hotmail.com','冰冻三尺，非一日之寒；人生祸福，皆多年累积','http://weibo.com/3',''),
 (4,'useraccount4','userpassword4','hellokitty','/CodecoreMicroblog/face/4.jpg','female','早薇','1988-12-30','canada','lskdc@dd.com','3729472','skdflskjdflksjdflkj@hotmail.com','牙好，胃口就好','http://weibo.com/4',''),
 (5,'useraccount5','userpassword5','死性不改','/CodecoreMicroblog/face/5.jpg','男','张三','1990-12-02','中国台湾','lskdfj@163.com','3249488','sldkfjlk@hotmail.com','一个人的态度，决定他的高度','http://weibo.com/5',''),
 (6,'useraccount6','userpassword6','angle','/CodecoreMicroblog/face/6.jpg','female','徐静兰','1989-10-18','中国','sdlkfj@163.com','9849389898','lskdfj@hotmail.com','大家好才是真的好','http://weibo.com/6',''),
 (7,'useraccount7','userpassword7','K歌之王','/CodecoreMicroblog/face/7.jpg','女','lady嘎嘎','1989-10-30','印度','lskdjf@163.com','2903480','lskdjc@hotmail.com','如果要挖井，就要挖到水出为止','http://weibo.com/7',''),
 (8,'useraccount8','userpassword8','灰色头像','/CodecoreMicroblog/face/8.jpg','男','王宝强','1991-11-21','北京','slkdjf@163.com','88192883','lskdfjlj@hotmail.com','做对的事情比把事情做对重要','http://weibo.com/8',''),
 (9,'useraccount9','userpassword9','很久以后','/CodecoreMicroblog/face/9.jpg','女','仲辛桐','1992-10-09','天津','cowi@163.com','235728787','lskcmoi@hotmail.com','你可以选择这样的“三心二意”：信心恒心决心；创意乐意','http://weibo.com/9',''),
 (10,'useraccount10','userpassword10','可乐','/CodecoreMicroblog/face/10.jpg','男','五月天','1993-09-01','广州','lcmie@163.com','781724','scnoen@hotmail.com','你明白，人的一生，既不是人们想象的那么好，也不是那么坏。——莫泊桑','http://weibo.com/10',''),
 (11,'useraccount11','userpassword11','暖暖','/CodecoreMicroblog/face/11.jpg','女','罗林','1991-11-02','大连','ciem@163.com','324342','slcmoein@hotmail.com','领导的速度决定团队的效率','http://weibo.com/11',''),
 (12,'useraccount12','userpassword12','大手拉小手','/CodecoreMicroblog/face/12.jpg','男','陈星','1988-12-04','南昌','lceon@163.com','432424234','ldcon@hotmail.com','空想会想出很多绝妙的主意，但却办不成任何事情','http://weibo.com/12',''),
 (13,'useraccount13','userpassword13','飞鱼','/CodecoreMicroblog/face/13.jpg','male','李四','1991-10-03','深圳','lcmie@163.com','43242432','cowimi@hotmail.com','、少壮不努力，老大徒悲伤','http://weibo.com/13',''),
 (14,'useraccount14','userpassword14','猪八戒','/CodecoreMicroblog/face/14.jpg','male','王五','1988-10-30','LA ','cnow@163.com','2332111','lsdkvnmoi@hotmail.com','业精于勤，荒于嬉','http://weibo.com/14',''),
 (15,'useraccount15','userpassword15','崇拜','/CodecoreMicroblog/face/15.jpg','female','张柳','1988-10-10','上海','sldcni@163.com','98798798','sdmifme@hotmail.com','一寸光阴一寸金，寸金难买寸光阴','http://weibo.com/15',''),
 (16,'useraccount16','userpassword16','小心眼','/CodecoreMicroblog/face/16.jpg','male','赵奇','1991-10-10','上海','lsdkfjnm@163.com','5498','dlskfj@hotmail.com','天行健，君子以自强不息','http://weibo.com/16',''),
 (17,'useraccount17','userpassword17','彩虹','/CodecoreMicroblog/face/17.jpg','female','凤姐','1987-11-11','深圳','flsicne@163.com','53829928','sldkfnciu@hotmail.com','现实是很残酷的，就像战场一样，败者为寇，胜者为王。','http://weibo.com/17',''),
 (18,'useraccount18','userpassword18','闪亮的星','/CodecoreMicroblog/face/18.jpg','male','花无缺','1990-10-19','北京','lscie@163.com','987654321','lsibn@hotmail.com','统兵的关键在于威信。无威令不行，无信行不果','http://weibo.com/18',''),
 (19,'useraccount19','userpassword19','badguy','/CodecoreMicroblog/face/19.jpg','male','小鱼儿','1988-10-10','大连','nvoaiw@163.com','3456789','snceon@hotmail.com','成功呈概率分布，关键是你能不能坚持到成功开始呈现的那一刻','http://weibo.com/19',''),
 (20,'useraccount22','userpassword22','旅程','/CodecoreMicroblog/face/20.jpg','male','郭靖','1990-10-19','大连','slciej@163.com','87654321','dslfien@hotmail.com','我们活着不能与草木同腐，不能醉生梦死，枉度人生，要有所作为','http://weibo.com/20',''),
 (21,'useraccount23','userpassword23','不来也不去','/CodecoreMicroblog/face/21.jpg','female','王蓉','1988-08-18','北京','mcei@163.com','743245','slcmi@hotmail.com','做人也要像蜡烛一样，在有限的一生中有一分热发一分光，给人以光明，给人以温暖','http://weibo.com/21',''),
 (22,'useraccount24','userpassword24','燕尾蝶','/CodecoreMicroblog/face/1024.jpg','female','小龙女','1999-09-19','北京','slfiem@163.com','7654321','ldcmei@hotmail.com','志不强者智不达','http://weibo.com/22',''),
 (23,'useraccount25','userpassword25','茉莉花','/CodecoreMicroblog/face/23.jpg','male','杨过','1988-09-09','大连','lsdicj@163.com','76432','sldfij@hotmail.com','青，取之于蓝而青于蓝；冰，水为之而寒于水','http://weibo.com/23',''),
 (24,'useraccount20','userpassword20','悲伤奏鸣曲','/CodecoreMicroblog/face/24.jpg','female','芙蓉姐姐','1989-09-20','重庆','slcin@163.com','765432','ciencion@hotmail.com','天行健，君子以自强不息','http://weibo.com/24',''),
 (25,'useraccount21','userpassword21','轻舞飞扬','/CodecoreMicroblog/face/1025.jpg','male','周伯通','1990-08-21','南京','leicjn@163.com','765432','sldcin@hotmail.com','做对的事情比把事情做对重要','http://weibo.com/25',''),
 (26,'0405vincent@gmail.com','123','nick','','男',NULL,NULL,'天津','0405vincent@gmail.com',NULL,NULL,NULL,NULL,''),
 (27,'0405vincent@gmail.com','123','OuO','/CodecoreMicroblog/face/Android1.png','male','小飞','1989-06-07','tianjin','0405vincent@gmail.com','','','什么都是浮云',NULL,''),
 (29,'123dsafaf@126.com','123','Wa','','男',NULL,NULL,'tiajin','123dsafaf@126.com',NULL,NULL,NULL,NULL,''),
 (32,'123d@126.com','123','Nicks','/CodecoreMicroblog/face/blue.jpg','male','小飞','2013-02-03','天津','123d@126.com','','','',NULL,''),
 (33,'fdsaf@163.com','123','UoU','','男',NULL,NULL,'的发生大','fdsaf@163.com',NULL,NULL,NULL,NULL,''),
 (35,'chen@163.com','123','Fei','/CodecoreMicroblog/face/1.jpg','男',NULL,NULL,'天津','chen@163.com',NULL,NULL,NULL,NULL,''),
 (36,'231432@163.com','123','fsad ','','男',NULL,NULL,'','231432@163.com',NULL,NULL,NULL,NULL,''),
 (38,'aaa@163.com','123','aaa','','男',NULL,NULL,'tianjin','aaa@163.com',NULL,NULL,NULL,NULL,''),
 (39,'xin@sina.com','123','xin','','男',NULL,NULL,'','xin@sina.com',NULL,NULL,NULL,NULL,''),
 (44,'0405vincent@gmail.com','123','fsaf','/CodecoreMicroblog/face/20116153268531_德罗巴.jpg','男','','2011-11-11','','0405vincent@gmail.com','','','',NULL,''),
 (45,'05vincent@gmail.com','123456','vvv','','男',NULL,NULL,'天津','05vincent@gmail.com',NULL,NULL,NULL,NULL,''),
 (46,'aaa@126.com','123456','AAA','','男',NULL,NULL,'北京','aaa@126.com',NULL,NULL,NULL,NULL,''),
 (47,'wws@163.com','123456','fengsee','/CodecoreMicroblog/face/史迪仔.jpg','男','','2011-11-11','上海','wws@163.com','','','',NULL,''),
 (48,'default@163.com','123456','default','','男',NULL,NULL,'北京','default@163.com',NULL,NULL,NULL,NULL,''),
 (49,'default@sina.com','123456','default2','','男',NULL,NULL,'天津','default@sina.com',NULL,NULL,NULL,NULL,''),
 (50,'feng@163.com','123456','feng','/CodecoreMicroblog/face/default.jpg','男',NULL,NULL,'北京','feng@163.com',NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
