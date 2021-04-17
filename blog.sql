/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 50622
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50622
 File Encoding         : 65001

 Date: 17/04/2021 21:57:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (1, b'0', b'1', '你好，hello word\r\n**作者**：李', '2021-01-04 17:17:06', '欢迎观看和学习', 'http://www.nipic.com/show/33410259.html', '', b'0', b'0', b'1', 'Java学习啊', '2021-01-04 17:17:06', 11, 1, 1);
INSERT INTO `t_blog` VALUES (2, b'1', b'1', '欢迎来到c学习', '2021-01-04 17:19:24', '双方都是房间数量大幅减少的分类算法计算副食店解放螺丝钉发， 撒旦发射点', 'https://cn.dreamstime.com/%E5%BA%93%E5%AD%98%E7%85%A7%E7%89%87-%E5%9C%A8%E7%BA%BF%E5%B7%A5%E4%BD%9C-image55467092', '', b'0', b'0', b'0', 'c学习', '2021-01-04 17:19:24', 6, 2, 1);
INSERT INTO `t_blog` VALUES (3, b'0', b'1', '## 博客一\r\n这是一篇有些的博客', '2021-01-25 10:26:54', '博客测试', 'https://www.veer.com/illustration/158396601', '', b'1', b'0', b'0', '测试博客一', '2021-01-25 10:27:19', 11, 3, 1);
INSERT INTO `t_blog` VALUES (4, b'1', b'1', '**1、spring boot第一部分**\r\n	springboot是一个强大的后端轻量级框架，使用起来非常方便，特别是搭建一个小型项目时。\r\n**2、spring boot第二部分**\r\n	yml分析，yml为我们省去了大量的配置代码。\r\n	\r\n![小猫](https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg \"小猫\")', '2020-02-03 14:53:12', 'spring boot测试1', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2853553659,1775735885&fm=26&gp=0.jpg', '', b'1', b'0', b'0', '有关spring boot的分析一', '2021-04-15 20:49:12', 24, 1, 2);
INSERT INTO `t_blog` VALUES (5, b'0', b'0', '1、application注解\r\n	注解讲解\r\n\r\n2、Response注解\r\n	此注解是相应注解，就是后台返回的数据进行解析\r\n\r\n[![放松](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2989832003,2963819663&fm=26&gp=0.jpg \"放松\")](https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2989832003,2963819663&fm=26&gp=0.jpg \"放松\")', '2021-02-04 14:25:01', 'spring boot的讲解', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2989832003,2963819663&fm=26&gp=0.jpg', '', b'1', b'0', b'1', 'springboot学习之路二', '2021-02-04 14:25:01', 2, 1, 1);
INSERT INTO `t_blog` VALUES (6, b'0', b'1', '> 耐克倒闭\r\n今天介绍有关耐克在2021年4月倒闭问题\r\n![有关耐克](http://pic.17qq.com/img_qqtouxiang/86790751.jpeg \"有关耐克\")\r\n犯得上发生。。。。。。。。', '2021-03-26 14:35:02', '耐克', 'http://www.020qingyun.com/uploads/allimg/160106/8-16010609391c61.jpg', '', b'1', b'0', b'0', '耐克问题', '2021-03-26 14:35:02', 7, 3, 1);
INSERT INTO `t_blog` VALUES (7, b'1', b'1', '1、非常高兴\r\n2、c++是一门很好的编程语言\r\n\r\n![c++图](http://pic2.zhimg.com/v2-0f35643744e65d7cec18a4dce6260efb_1200x500.jpg \"c++图\")', '2021-04-01 17:41:23', '很好的一门语言', 'http://pic2.zhimg.com/v2-0f35643744e65d7cec18a4dce6260efb_1200x500.jpg', '', b'1', b'1', b'1', 'c++学习一', '2021-04-01 17:41:45', 7, 2, 1);
INSERT INTO `t_blog` VALUES (8, b'0', b'0', '你好，今日头条\r\n1、这是一条好的新闻\r\n\r\n', '2021-04-01 22:24:02', '发生的', 'http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg', '', b'1', b'0', b'1', '头条', '2021-04-01 22:24:02', 7, 3, 2);
INSERT INTO `t_blog` VALUES (9, b'0', b'0', '大家好，这里是个性的个人博客系统\r\n欢迎！\r\n\r\n![小家伙](https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg \"小家伙\")', '2021-04-07 16:40:54', '好系统', 'https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg', '', b'1', b'0', b'1', '测试博客二', '2021-04-07 16:40:54', 6, 3, 2);
INSERT INTO `t_blog` VALUES (10, b'0', b'0', '这是一个好的东西\r\n\r\n![图](http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg \"图\")', '2021-04-08 18:30:31', 'sfds', 'http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg', '', b'1', b'0', b'1', '哈哈', '2021-04-08 18:30:31', 2, 3, 2);
INSERT INTO `t_blog` VALUES (11, b'1', b'1', 'fsfs\r\n![附件是的](http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg \"附件是的\")', '2020-04-08 18:44:21', '方式', 'http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg', '', b'1', b'1', b'0', '华为', '2021-04-08 18:44:34', 109, 3, 2);
INSERT INTO `t_blog` VALUES (12, b'0', b'1', '推荐的测试使用\r\n[![测试](https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3206689113,2237998950&fm=26&gp=0.jpg \"测试\")](http://1233 \"测试\")', '2021-04-11 21:43:44', '这是推荐博客', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3206689113,2237998950&fm=26&gp=0.jpg', '', b'1', b'1', b'0', '测试推荐', '2021-04-11 21:43:44', 12, 3, 2);
INSERT INTO `t_blog` VALUES (13, b'1', b'1', '阿里系\r\n1、有关马云的演讲是否真实\r\n2、马云人品败坏了？\r\n\r\n[![疯狂](https://img1.baidu.com/it/u=1737038389,702667362&fm=26&fmt=auto&gp=0.jpg \"疯狂\")](https://img1.baidu.com/it/u=1737038389,702667362&fm=26&fmt=auto&gp=0.jpg \"疯狂\")', '2021-04-15 17:29:50', '马云', 'https://img1.baidu.com/it/u=1737038389,702667362&fm=26&fmt=auto&gp=0.jpg', '', b'1', b'1', b'0', '蚂蚁金服', '2021-04-15 17:29:50', 2, 4, 15);
INSERT INTO `t_blog` VALUES (14, b'1', b'1', '今天阳光明媚，很开心的过完了一天。\r\n[![生活日常](https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg \"生活日常\")](https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg \"生活日常\")', '2021-04-15 20:40:03', '生活', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2496571732,442429806&fm=26&gp=0.jpg', '', b'1', b'1', b'0', '今天日记', '2021-04-15 20:40:03', 16, 4, 2);
INSERT INTO `t_blog` VALUES (15, b'1', b'1', '今天你过滤了吗，这是一哦i按份上了飞机斯拉夫就是雷锋精神李世民的第一夫是谁，发士大夫但是拉法基拉萨', '2021-04-17 10:52:07', '发士大夫', 'http://pic1.win4000.com/wallpaper/2017-11-18/5a0ffa1b046b2.jpg', '', b'1', b'0', b'0', '过滤了吗', '2021-04-17 10:52:07', 5, 4, 2);
INSERT INTO `t_blog` VALUES (16, b'1', b'1', '这是一个不明智的做法，对后代不负责，值得反思。', '2021-04-17 21:35:15', '废水', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1745875751,1512923435&fm=26&gp=0.jpg', '', b'1', b'1', b'0', '日本核废水排入大海', '2021-04-17 21:35:15', 1, 4, 2);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (1, 1);
INSERT INTO `t_blog_tags` VALUES (5, 1);
INSERT INTO `t_blog_tags` VALUES (5, 2);
INSERT INTO `t_blog_tags` VALUES (6, 1);
INSERT INTO `t_blog_tags` VALUES (6, 2);
INSERT INTO `t_blog_tags` VALUES (7, 1);
INSERT INTO `t_blog_tags` VALUES (7, 2);
INSERT INTO `t_blog_tags` VALUES (8, 1);
INSERT INTO `t_blog_tags` VALUES (8, 2);
INSERT INTO `t_blog_tags` VALUES (9, 1);
INSERT INTO `t_blog_tags` VALUES (9, 2);
INSERT INTO `t_blog_tags` VALUES (10, 1);
INSERT INTO `t_blog_tags` VALUES (10, 2);
INSERT INTO `t_blog_tags` VALUES (11, 1);
INSERT INTO `t_blog_tags` VALUES (11, 2);
INSERT INTO `t_blog_tags` VALUES (12, 2);
INSERT INTO `t_blog_tags` VALUES (12, 3);
INSERT INTO `t_blog_tags` VALUES (13, 3);
INSERT INTO `t_blog_tags` VALUES (14, 2);
INSERT INTO `t_blog_tags` VALUES (14, 3);
INSERT INTO `t_blog_tags` VALUES (4, 1);
INSERT INTO `t_blog_tags` VALUES (4, 2);
INSERT INTO `t_blog_tags` VALUES (15, 2);
INSERT INTO `t_blog_tags` VALUES (15, 3);
INSERT INTO `t_blog_tags` VALUES (16, 2);
INSERT INTO `t_blog_tags` VALUES (16, 3);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKke3uogd04j4jx316m1p51e05u`(`blog_id`) USING BTREE,
  INDEX `FK4jj284r3pb7japogvo6h72q95`(`parent_comment_id`) USING BTREE,
  CONSTRAINT `FK4jj284r3pb7japogvo6h72q95` FOREIGN KEY (`parent_comment_id`) REFERENCES `t_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKke3uogd04j4jx316m1p51e05u` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, b'1', 'li', '博客写的不错已赞', '2021-01-25 10:20:22', 'lizh28@asiainfo.com', '李中华', 2, NULL);
INSERT INTO `t_comment` VALUES (2, b'1', 'li', '很好，已赞赏', '2021-01-25 10:34:49', 'lizh28@asiainfo.com', '李中华', 1, NULL);
INSERT INTO `t_comment` VALUES (3, b'1', 'li', '博主太强了', '2021-01-25 10:35:23', 'lizh28@asiainfo.com', '李中华', 1, NULL);
INSERT INTO `t_comment` VALUES (4, b'1', 'li', '哈哈', '2021-01-25 10:35:33', 'lizh28@asiainfo.com', '李中华', 1, 3);
INSERT INTO `t_comment` VALUES (5, b'1', 'li', '很好', '2021-03-26 14:35:41', 'lizh28@asiainfo.com', '李中华1', 6, NULL);
INSERT INTO `t_comment` VALUES (6, b'1', 'li', '不错', '2021-03-26 14:35:49', 'lizh28@asiainfo.com', '李中华1', 6, NULL);
INSERT INTO `t_comment` VALUES (7, b'1', 'li', '干的漂亮', '2021-03-26 14:36:05', 'lizh28@asiainfo.com', '李中华2', 6, NULL);
INSERT INTO `t_comment` VALUES (8, b'1', 'li', '是的呢', '2021-03-26 14:37:46', '999@qq.com', '马云', 6, 5);
INSERT INTO `t_comment` VALUES (9, b'1', 'li', '你好', '2021-04-03 15:49:28', 'lizh288@asiainfo.com', '李中华2', 6, 8);
INSERT INTO `t_comment` VALUES (10, b'1', 'https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg', '博主写的不错', '2021-04-08 18:32:35', 'lizh282@asiainfo.com', '泰山', 7, NULL);
INSERT INTO `t_comment` VALUES (11, b'1', 'https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg', '哈哈', '2021-04-08 18:33:06', 'lizh28221@asiainfo.com', '泰山21', 7, 10);
INSERT INTO `t_comment` VALUES (12, b'1', 'https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg', '加算法 ', '2021-04-08 18:47:25', 'lizh282@asiainfo.com', '泰山', 11, NULL);
INSERT INTO `t_comment` VALUES (13, b'1', 'https://c-http://p2.itc.cn/images01/20200718/7d2735f0ab1f464385373a53d24f27f6.png', '博主写的不错', '2021-04-09 09:27:26', 'lizh28@asiainfo.com', '李中华', 3, NULL);
INSERT INTO `t_comment` VALUES (14, b'1', 'li3', '说的好', '2021-04-09 09:35:31', 'lizh282@asiainfo.com', '张哥', 3, 13);
INSERT INTO `t_comment` VALUES (15, b'1', 'https://img1.baidu.com/it/u=1592818054,1793398938&fm=26&fmt=auto&gp=0.jpg', '是的', '2021-04-09 09:44:57', 'lizh28@asiainfo.com', '李中华', 3, 14);
INSERT INTO `t_comment` VALUES (16, b'1', 'https://img1.baidu.com/it/u=1592818054,1793398938&fm=26&fmt=auto&gp=0.jpg', '是', '2021-04-09 09:51:05', 'lizh228@asiainfo.com', '李哥', 3, NULL);
INSERT INTO `t_comment` VALUES (17, b'0', '/images/avatar.png', '什么', '2021-04-09 09:55:22', 'lizh2228@asiainfo.com', '贤王', 3, 16);
INSERT INTO `t_comment` VALUES (18, b'0', '/images/avatar.png', '分岛式', '2021-04-09 10:25:09', 'lizh2s228@asiainfo.com', '申哥', 3, 17);
INSERT INTO `t_comment` VALUES (19, b'0', '/images/avatar.png', '是的', '2021-04-09 11:22:17', '999@qq.com', '王萨满', 11, NULL);
INSERT INTO `t_comment` VALUES (20, b'0', '/images/avatar.png', '这是不错的选择', '2021-04-09 11:22:45', '9929@qq.com', '陈总', 11, 19);
INSERT INTO `t_comment` VALUES (22, b'0', '/images/avatar.png', '可以', '2021-04-09 17:06:03', '999@qq.com', '小叶', 1, NULL);
INSERT INTO `t_comment` VALUES (23, b'1', 'https://c-ssl.duitang.com/uploads/blog/202101/28/20210128171909_4c0a4.jpeg', '这篇文章不错', '2021-04-11 21:47:31', 'lizh282@asiainfo.com', '泰山', 12, NULL);
INSERT INTO `t_comment` VALUES (24, b'0', '/images/avatar.png', '其实还有更好的选择呢', '2021-04-13 11:16:45', '000@qq.com', '孙悟空', 11, 20);
INSERT INTO `t_comment` VALUES (27, b'0', '/images/avatar.png', '你说的不错', '2021-04-15 15:40:13', '981951015@qq.com', '树枝', 11, 12);
INSERT INTO `t_comment` VALUES (30, b'0', '/images/avatar.png', '博主写的不错呀', '2021-04-15 17:05:28', '123@qq.com', '绿茶', 11, NULL);
INSERT INTO `t_comment` VALUES (31, b'0', '/images/avatar.png', '博主太有才了！', '2021-04-15 17:05:50', '123@qq.com', '红茶', 11, 30);
INSERT INTO `t_comment` VALUES (32, b'0', '/images/avatar.png', '是的', '2021-04-15 17:06:10', '123@qq.com', '冰红茶', 11, 31);
INSERT INTO `t_comment` VALUES (33, b'0', '/images/avatar.png', '哈哈', '2021-04-15 17:06:35', '123@qq.com', '可乐', 11, 31);
INSERT INTO `t_comment` VALUES (34, b'1', 'https://img2.baidu.com/it/u=1596558941,2317673721&fm=26&fmt=auto&gp=0.jpg', '哈哈', '2021-04-15 17:30:34', '123@qq.com', '小人', 13, NULL);
INSERT INTO `t_comment` VALUES (35, b'0', '/images/avatar.png', '可以', '2021-04-15 19:13:36', '123@qq.com', '小人', 13, 34);
INSERT INTO `t_comment` VALUES (36, b'0', '/images/avatar.png', '小小', '2021-04-15 19:22:53', '123@qq.com', '小人', 13, 35);
INSERT INTO `t_comment` VALUES (40, b'1', 'https://pic.rmb.bdstatic.com/8bd896d48c8de43197af1dc001ab5890.jpeg', 'fsd', '2021-04-15 20:46:44', 'lizh282@asiainfo.com', '泰山', 14, NULL);
INSERT INTO `t_comment` VALUES (42, b'0', '/images/avatar.png', '你好', '2021-04-15 20:51:50', '123@qq.com', '什么', 14, 40);
INSERT INTO `t_comment` VALUES (43, b'0', '/images/avatar.png', 'haha', '2021-04-15 21:33:31', '123@qq.com', '小美', 4, NULL);
INSERT INTO `t_comment` VALUES (44, b'1', 'https://img1.baidu.com/it/u=1592818054,1793398938&fm=26&fmt=auto&gp=0.jpg', '嘿嘿', '2021-04-16 08:09:58', 'lizh28@asiainfo.com', '李中华', 4, 43);
INSERT INTO `t_comment` VALUES (45, b'0', '/images/avatar.png', '嗯嗯', '2021-04-16 09:12:34', '123@qq.com', '哥斯拉', 4, 44);
INSERT INTO `t_comment` VALUES (46, b'0', '/images/avatar.png', '哈哈', '2021-04-17 21:25:33', '999@qq.com', '金子', 15, NULL);
INSERT INTO `t_comment` VALUES (47, b'0', '/images/avatar.png', '您好呀', '2021-04-17 21:25:52', '999@qq.com', '银子', 15, 46);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, '代码Java');
INSERT INTO `t_tag` VALUES (2, '测试博客');
INSERT INTO `t_tag` VALUES (3, '爱国');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, 'Java');
INSERT INTO `t_type` VALUES (2, 'C语言');
INSERT INTO `t_type` VALUES (3, '测试博客');
INSERT INTO `t_type` VALUES (4, '日常生活');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://img1.baidu.com/it/u=1592818054,1793398938&fm=26&fmt=auto&gp=0.jpg', '2021-01-04 17:06:35', 'lizh28@asiainfo.com', '李中华', '202cb962ac59075b964b07152d234b70', 0, '2021-01-04 17:08:03', 'admin');
INSERT INTO `t_user` VALUES (2, 'https://pic.rmb.bdstatic.com/8bd896d48c8de43197af1dc001ab5890.jpeg', '2021-01-04 17:06:35', 'lizh282@asiainfo.com', '泰山', '202cb962ac59075b964b07152d234b70', 1, '2021-01-04 17:08:03', '叶子');
INSERT INTO `t_user` VALUES (3, 'https://img1.baidu.com/it/u=1592818054,1793398938&fm=26&fmt=auto&gp=0.jpg', '2021-01-04 17:06:35', 'lizh283@asiainfo.com', '张三丰', '202cb962ac59075b964b07152d234b70', 1, '2021-01-04 17:08:03', '张三丰');
INSERT INTO `t_user` VALUES (9, 'http://inews.gtimg.com/newsapp_match/0/3575553587/0.jpg', '2021-04-08 17:18:35', '123@qq.com', '金毛狮王', '202cb962ac59075b964b07152d234b70', 1, '2021-04-08 17:18:35', '谢逊');
INSERT INTO `t_user` VALUES (10, 'http://inews.gtimg.com/newsapp_match/0/3575553587/0.jpg', '2021-04-08 17:23:26', '123@qq.com', '吸血王', '202cb962ac59075b964b07152d234b70', 1, '2021-04-08 17:23:26', '韦一笑');
INSERT INTO `t_user` VALUES (11, 'http://img-arch.pconline.com.cn/images/upload/upc/tx/photoblog/1402/07/c7/31066355_31066355_1391779709500_mthumb.jpg', '2021-04-10 11:16:43', '123@qq.com', '赵敏', '202cb962ac59075b964b07152d234b70', 1, '2021-04-10 11:16:43', '赵敏');
INSERT INTO `t_user` VALUES (15, 'https://img2.baidu.com/it/u=1596558941,2317673721&fm=26&fmt=auto&gp=0.jpg', '2021-04-15 17:22:42', '123@qq.com', '小人', '202cb962ac59075b964b07152d234b70', 1, '2021-04-15 17:22:42', '宋青书');
INSERT INTO `t_user` VALUES (16, 'https://img0.baidu.com/it/u=1999921673,816131569&fm=26&fmt=auto&gp=0.jpg', '2021-04-16 08:08:50', '999@qq.com', '猴子', '202cb962ac59075b964b07152d234b70', 1, '2021-04-16 08:08:50', '孙悟空');

-- ----------------------------
-- Procedure structure for agreeApply
-- ----------------------------
DROP PROCEDURE IF EXISTS `agreeApply`;
delimiter ;;
CREATE PROCEDURE `agreeApply`(in s int,in aid1 int)
BEGIN
      declare s1 char(32);
      declare wid1 int;
      set s1 = (select request from apply where aid=aid1);
      set wid1 = (select wid from apply where aid=aid1);
      if '申请出诊'=s1 then
        update workday set state='预约',nsnum=s where wid=wid1;
      end if;
      if '申请停诊'=s1 then
        update workday set state='停诊',nsnum=0 where wid=wid1;
      end if;
      update apply set state='同意' where aid=aid1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for orderList
-- ----------------------------
DROP PROCEDURE IF EXISTS `orderList`;
delimiter ;;
CREATE PROCEDURE `orderList`(in pid int)
BEGIN
      select recode.rid,recode.pid,recode.wid,recode.did,recode.serialnumber,recode.visitdate,recode.visitnoon,recode.visittime,recode.ordertime,recode.state,
      doctor.dname,doctor.office,doctor.room,doctor.picpath,doctor.fee
      from recode,doctor
      where recode.pid=pid  and doctor.did=recode.did
      order by recode.ordertime desc;
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
