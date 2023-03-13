/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : freshpurchase

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 01/12/2022 13:50:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_list
-- ----------------------------
DROP TABLE IF EXISTS `admin_list`;
CREATE TABLE `admin_list`  (
  `id` int(20) NOT NULL,
  `username` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `avatarUrl` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `telNumber` int(20) NULL DEFAULT NULL,
  `homeAddress` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `contactAddress` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_list
-- ----------------------------
INSERT INTO `admin_list` VALUES (0, 'admin', 'admin', 'https://tuchuangs.com/imgs/2022/11/20/38d3952f6aabeb88.jpg', 110110110, '中山大学南方学院', '南方学院');
INSERT INTO `admin_list` VALUES (1, 'root', 'root', 'https://tuchuangs.com/imgs/2022/11/20/38d3952f6aabeb88.jpg', 123456789, '南方学院', '中山大学南方学院');
INSERT INTO `admin_list` VALUES (2, 'user', '123456', 'http', 110, 'CHINA', 'Earth');
INSERT INTO `admin_list` VALUES (3, 'mike', '123213', 'http', 10086, '中国', '地球');

-- ----------------------------
-- Table structure for classify_banner
-- ----------------------------
DROP TABLE IF EXISTS `classify_banner`;
CREATE TABLE `classify_banner`  (
  `id` int(11) NOT NULL,
  `src` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classify_banner
-- ----------------------------
INSERT INTO `classify_banner` VALUES (0, 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/banner/banner1.png?versionId=CAEQBxiBgIC24u3ioBgiIDQ0YzkyZWViZjUwNzQxMjlhMTg3OWY5YTY5ZTQyZmFl');
INSERT INTO `classify_banner` VALUES (1, 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/banner/banner2.png?versionId=CAEQBxiBgMDI4u3ioBgiIGY5ZjE1NjcyZGM2ZTRkNzJiOGQ2YzM0YWEyN2I0ZWU2');
INSERT INTO `classify_banner` VALUES (2, 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/banner/banner3.png?versionId=CAEQBxiCgMDI4u3ioBgiIDg1NzY4NjBhMGUwODRiYjFhY2IwZTUxOTIyNTBkMjNm');
INSERT INTO `classify_banner` VALUES (3, 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/banner/banner4.png?versionId=CAEQBxiBgMC44u3ioBgiIDI4OTI0NDc0YmQyZTQyMTliMDg1N2M2ZjhkYzliOTU4');

-- ----------------------------
-- Table structure for classify_name
-- ----------------------------
DROP TABLE IF EXISTS `classify_name`;
CREATE TABLE `classify_name`  (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `classify_id` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `sales` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classify_name
-- ----------------------------
INSERT INTO `classify_name` VALUES (0, '为你推荐', '0', 6);
INSERT INTO `classify_name` VALUES (1, '超低折扣', '1', 12);
INSERT INTO `classify_name` VALUES (2, '新品上架', '2', 10);
INSERT INTO `classify_name` VALUES (3, '水果鲜花', '3', 5);
INSERT INTO `classify_name` VALUES (4, '蔬菜豆制品', '4', 8);
INSERT INTO `classify_name` VALUES (5, '肉禽蛋', '5', 7);
INSERT INTO `classify_name` VALUES (6, '海鲜水产', '6', 12);
INSERT INTO `classify_name` VALUES (7, '乳品烘培', '7', 13);
INSERT INTO `classify_name` VALUES (8, '冻品面点', '8', 7);
INSERT INTO `classify_name` VALUES (9, '粮油调味', '9', 10);
INSERT INTO `classify_name` VALUES (10, '酒水饮料', '10', 7);
INSERT INTO `classify_name` VALUES (11, '休闲零食', '11', 9);
INSERT INTO `classify_name` VALUES (12, '熟食预制菜', '12', 11);
INSERT INTO `classify_name` VALUES (13, '打边炉', '13', 6);
INSERT INTO `classify_name` VALUES (14, '方便速食', '14', 9);
INSERT INTO `classify_name` VALUES (15, '纸品家清', '15', 7);
INSERT INTO `classify_name` VALUES (16, '家居百货', '16', 8);
INSERT INTO `classify_name` VALUES (17, '个护母婴', '17', 4);

-- ----------------------------
-- Table structure for goods_list
-- ----------------------------
DROP TABLE IF EXISTS `goods_list`;
CREATE TABLE `goods_list`  (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `newPrice` decimal(10, 2) NULL DEFAULT NULL,
  `oldPrice` decimal(10, 2) NULL DEFAULT NULL,
  `classify_id` int(11) NULL DEFAULT NULL,
  `sales` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of goods_list
-- ----------------------------
INSERT INTO `goods_list` VALUES (0, '泰国香水椰青单粒800g起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E6%B3%B0%E5%9B%BD%E6%A4%B0%E9%9D%92.png?versionId=CAEQBxiBgID84pD0oBgiIDJiMGFkZjdkYzM4ZDRiZDU4ZDhhNzQ3ZWFhNzlkYWI3', 8.80, 13.90, 0, 77);
INSERT INTO `goods_list` VALUES (1, '上海青 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E4%B8%8A%E6%B5%B7%E9%9D%92.png?versionId=CAEQBxiBgMDr4pD0oBgiIDExYzU5MWVhYjJkYjRjZjU4YjBlNjY0NDhkOGI0NWM3', 1.98, 5.59, 0, 154);
INSERT INTO `goods_list` VALUES (2, '绿色和美精选鸡腿肉 330g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E9%B8%A1%E8%85%BF%E8%82%89.png?versionId=CAEQBxiBgMD94pD0oBgiIGFiOWY4MmRkOTA0MzQxYTQ4ODYzNmQyNTNkMjBkNzE3', 9.90, 14.80, 0, 16);
INSERT INTO `goods_list` VALUES (3, '罗非鱼 1条400g起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E7%BD%97%E9%9D%9E%E9%B1%BC.png?versionId=CAEQBxiBgICa45D0oBgiIDEwZjE3N2U1ZTkwNTRiOTlhNGI0NjVlZDkyNTcyZWY1', 9.90, 10.80, 0, 38);
INSERT INTO `goods_list` VALUES (4, '大杏鲍菇约 250g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E5%A4%A7%E6%9D%8F%E9%B2%8D%E8%8F%87.png?versionId=CAEQBxiBgIDV36H0oBgiIGJhNWUzZTRiZmRlNzQyMWY5NzFlNTMxMDBiODI1OWYy', 3.99, 4.99, 0, 87);
INSERT INTO `goods_list` VALUES (5, '精选香葱约 50g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E7%B2%BE%E9%80%89%E9%A6%99%E8%91%B1.png?versionId=CAEQBxiBgICa36H0oBgiIDhhNTNlY2JhYWZjODQzMGQ5MjFhYTYyYjU0MTlmODZi', 0.98, 2.19, 0, 180);
INSERT INTO `goods_list` VALUES (6, '甜玉米', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E7%94%9C%E7%8E%89%E7%B1%B3.png?versionId=CAEQBxiBgID83qH0oBgiIDAxODQ3MGFlOWMzYjQ4ODdhM2RiN2E2MjMwZjU5ZTAw', 5.60, 8.98, 0, 21);
INSERT INTO `goods_list` VALUES (7, '冰鲜净化鲈鱼 400g 起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/超低折扣/%E5%86%B0%E9%B2%9C%E5%87%80%E5%8C%96%E9%B2%88%E9%B1%BC.png?versionId=CAEQBxiBgMCZsbH0oBgiIGUyYWE3MmE3YzkxNTQ5NzA4NmVkMTJkYmFkNzZlM2Vj', 8.80, 15.80, 1, 29);
INSERT INTO `goods_list` VALUES (8, '空心菜 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/超低折扣/%E7%A9%BA%E5%BF%83%E8%8F%9C.png?versionId=CAEQBxiBgMCJta_0oBgiIDc5NTViZmU4ODI1YjQyYjM4MzExM2NhM2M2ZTM0N2Qz', 2.80, 4.96, 1, 150);
INSERT INTO `goods_list` VALUES (9, '圣女果', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/超低折扣/%E5%9C%A3%E5%A5%B3%E6%9E%9C.png?versionId=CAEQBxiBgICGta_0oBgiIGNjMTAyN2JhNDBlYjQyZGFiYTAxMWY1M2U3N2U0MDdh', 6.30, 12.80, 1, 136);
INSERT INTO `goods_list` VALUES (10, '雪花清爽8度啤酒 500ml*12(整箱)', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%B6%85%E4%BD%8E%E6%8A%98%E6%89%A3/%E9%9B%AA%E8%8A%B1%E6%B8%85%E7%88%BD8%E5%BA%A6%E5%95%A4%E9%85%92.png', 24.70, 29.70, 1, 170);
INSERT INTO `goods_list` VALUES (11, '福临门营养家活粒鲜胚玉米胚芽油 700ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%B6%85%E4%BD%8E%E6%8A%98%E6%89%A3/%E7%A6%8F%E4%B8%B4%E9%97%A8%E8%90%A5%E5%85%BB%E5%AE%B6%E6%B4%BB%E7%B2%92%E9%B2%9C%E8%83%9A%E7%8E%89%E7%B1%B3%E8%83%9A%E8%8A%BD%E6%B2%B9.png', 13.90, 18.90, 1, 179);
INSERT INTO `goods_list` VALUES (12, '合口味黑米馒头 650g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%B6%85%E4%BD%8E%E6%8A%98%E6%89%A3/%E5%90%88%E5%8F%A3%E5%91%B3%E9%BB%91%E7%B1%B3%E9%A6%92%E5%A4%B4.png', 12.90, 15.90, 1, 152);
INSERT INTO `goods_list` VALUES (13, '晨光算牛乳饮品 946ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%B6%85%E4%BD%8E%E6%8A%98%E6%89%A3/%E6%99%A8%E5%85%89%E7%AE%97%E7%89%9B%E4%B9%B3%E9%A5%AE%E5%93%81.png', 7.60, 12.60, 1, 25);
INSERT INTO `goods_list` VALUES (14, 'if椰子水 350ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B0%E5%93%81%E4%B8%8A%E6%9E%B6/if%E6%A4%B0%E5%AD%90%E6%B0%B4.png', 7.50, 9.90, 2, 68);
INSERT INTO `goods_list` VALUES (15, '白大象好喝辣牛肉面 103.5g*5', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B0%E5%93%81%E4%B8%8A%E6%9E%B6/%E7%99%BD%E5%A4%A7%E8%B1%A1%E5%A5%BD%E5%96%9D%E8%BE%A3%E7%89%9B%E8%82%89%E9%9D%A2.png', 15.80, 19.80, 2, 43);
INSERT INTO `goods_list` VALUES (16, '秋道名匠绿豆饼 330g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B0%E5%93%81%E4%B8%8A%E6%9E%B6/%E7%A7%8B%E9%81%93%E5%90%8D%E5%8C%A0%E7%BB%BF%E8%B1%86%E9%A5%BC.png', 8.99, 12.80, 2, 141);
INSERT INTO `goods_list` VALUES (18, '益圆七号电池 4粒', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B0%E5%93%81%E4%B8%8A%E6%9E%B6/%E7%9B%8A%E5%9C%86%E4%B8%83%E5%8F%B7%E7%94%B5%E6%B1%A0.png', 3.90, 5.00, 2, 166);
INSERT INTO `goods_list` VALUES (19, '小饿小满足肉松奶心吐司 102g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B0%E5%93%81%E4%B8%8A%E6%9E%B6/%E5%B0%8F%E9%A5%BF%E5%B0%8F%E6%BB%A1%E8%B6%B3%E8%82%89%E6%9D%BE%E5%A5%B6%E5%BF%83%E5%90%90%E5%8F%B8.png', 5.90, 5.90, 2, 25);
INSERT INTO `goods_list` VALUES (20, '（小确幸）百合混搭小花束1束', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%28%E5%B0%8F%E7%A1%AE%E5%B9%B8%29%E7%99%BE%E5%90%88%E6%B7%B7%E6%90%AD%E5%B0%8F%E8%8A%B1%E6%9D%9F.png', 26.90, 40.90, 3, 15);
INSERT INTO `goods_list` VALUES (21, '佳农进口超甜蕉 650g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E4%BD%B3%E5%86%9C%E8%BF%9B%E5%8F%A3%E8%B6%85%E7%94%9C%E8%95%89.png', 12.90, 13.90, 3, 127);
INSERT INTO `goods_list` VALUES (22, '鲜切红肉波罗蜜 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E9%B2%9C%E5%88%87%E7%BA%A2%E8%82%89%E6%B3%A2%E7%BD%97%E8%9C%9C.png', 9.90, 14.90, 3, 183);
INSERT INTO `goods_list` VALUES (23, '进口即食牛油果 2粒装 260g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E8%BF%9B%E5%8F%A3%E5%8D%B3%E9%A3%9F%E7%89%9B%E6%B2%B9%E6%9E%9C.png', 15.90, 17.90, 3, 133);
INSERT INTO `goods_list` VALUES (24, '新西兰索尼娅苹果2粒装 350g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E6%96%B0%E8%A5%BF%E5%85%B0%E7%B4%A2%E5%B0%BC%E5%A8%85%E8%8B%B9%E6%9E%9C2%E7%B2%92.png', 14.66, 18.90, 3, 68);
INSERT INTO `goods_list` VALUES (25, '四川红心猕猴桃4粒装 370g起(即食)', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E5%9B%9B%E5%B7%9D%E7%BA%A2%E5%BF%83%E7%8C%95%E7%8C%B4%E6%A1%834%E7%B2%92.png', 11.90, 19.90, 3, 93);
INSERT INTO `goods_list` VALUES (26, '（花好月圆）向日葵玫瑰花束1束', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E5%90%91%E6%97%A5%E8%91%B5%E7%8E%AB%E7%91%B0%E8%8A%B1%E6%9D%9F1%E6%9D%9F.png', 24.90, 40.90, 3, 168);
INSERT INTO `goods_list` VALUES (27, '（爱在秋天）玫瑰混合花束1束', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1/%E7%8E%AB%E7%91%B0%E6%B7%B7%E5%90%88%E8%8A%B1%E6%9D%9F1%E6%9D%9F.png', 22.90, 28.00, 3, 179);
INSERT INTO `goods_list` VALUES (28, '上海青 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E4%B8%8A%E6%B5%B7%E9%9D%92.png', 1.76, 3.79, 4, 172);
INSERT INTO `goods_list` VALUES (29, '宁夏菜心 250g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E5%AE%81%E5%A4%8F%E8%8F%9C%E5%BF%83.png', 3.99, 5.28, 4, 102);
INSERT INTO `goods_list` VALUES (30, '蒜苔 350g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E8%92%9C%E8%8B%94350g.png', 6.63, 9.63, 4, 20);
INSERT INTO `goods_list` VALUES (31, '黄瓜约 750g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E9%BB%84%E7%93%9C%E7%BA%A6750g.png', 4.90, 7.99, 4, 34);
INSERT INTO `goods_list` VALUES (32, '葫芦卜约 380g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E8%91%AB%E8%8A%A6%E5%8D%9C%E7%BA%A6380g.png', 2.91, 4.92, 4, 28);
INSERT INTO `goods_list` VALUES (33, '指天椒 50g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E6%8C%87%E5%A4%A9%E6%A4%9250g.png', 1.88, 3.99, 4, 123);
INSERT INTO `goods_list` VALUES (34, '爆汁番茄约 500g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E7%88%86%E6%B1%81%E7%95%AA%E8%8C%84%E7%BA%A6500g.png', 5.20, 5.98, 4, 47);
INSERT INTO `goods_list` VALUES (35, '象优选醇厚攸县香干 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E8%B1%A1%E4%BC%98%E9%80%89%E9%86%87%E5%8E%9A%E6%94%B8%E5%8E%BF%E9%A6%99%E5%B9%B2.png', 3.68, 3.90, 4, 132);
INSERT INTO `goods_list` VALUES (36, '青椒约 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81/%E9%9D%92%E6%A4%92%E7%BA%A6300g.png', 6.90, 3.72, 4, 46);
INSERT INTO `goods_list` VALUES (37, '优质鲜猪肝 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E4%BC%98%E8%B4%A8%E9%B2%9C%E7%8C%AA%E8%82%9D.png', 6.52, 10.80, 5, 181);
INSERT INTO `goods_list` VALUES (38, '优质冷鲜五花肉 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E4%BC%98%E8%B4%A8%E5%86%B7%E9%B2%9C%E4%BA%94%E8%8A%B1%E8%82%89.png', 17.80, 25.80, 5, 187);
INSERT INTO `goods_list` VALUES (39, '绿色和美精选鸡翅中', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E7%BB%BF%E8%89%B2%E5%92%8C%E7%BE%8E%E7%B2%BE%E9%80%89%E9%B8%A1%E7%BF%85%E4%B8%AD.png', 19.80, 27.80, 5, 21);
INSERT INTO `goods_list` VALUES (40, '汇先丰供港鲜河源山地鸡（半只切块）500g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E6%B1%87%E5%85%88%E4%B8%B0%E4%BE%9B%E6%B8%AF%E9%B2%9C%E6%B2%B3%E6%BA%90%E5%B1%B1%E5%9C%B0%E9%B8%A1.png', 19.90, 23.80, 5, 95);
INSERT INTO `goods_list` VALUES (41, '利源昌鲜猪肉馅 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E5%88%A9%E6%BA%90%E6%98%8C%E9%B2%9C%E7%8C%AA%E8%82%89%E9%A6%85.png', 9.99, 10.80, 5, 135);
INSERT INTO `goods_list` VALUES (42, '圣农冷冻琵琶腿 500g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E5%9C%A3%E5%86%9C%E5%86%B7%E5%86%BB%E7%90%B5%E7%90%B6%E8%85%BF.png', 9.85, 14.80, 5, 74);
INSERT INTO `goods_list` VALUES (43, '优质冷鲜瘦肉 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E4%BC%98%E8%B4%A8%E5%86%B7%E9%B2%9C%E7%98%A6%E8%82%89.png', 12.90, 18.80, 5, 168);
INSERT INTO `goods_list` VALUES (44, '土鸡蛋8枚 400g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E5%9C%9F%E9%B8%A1%E8%9B%8B8%E6%9E%9A.png', 7.99, 8.99, 5, 87);
INSERT INTO `goods_list` VALUES (45, '优质冷鲜鸡大胸 400g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E4%BC%98%E8%B4%A8%E5%86%B7%E9%B2%9C%E9%B8%A1%E5%A4%A7%E8%83%B8.png', 13.80, 14.80, 5, 109);
INSERT INTO `goods_list` VALUES (46, '鲜鸡蛋15枚 750g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E8%82%89%E7%A6%BD%E8%9B%8B/%E9%B2%9C%E9%B8%A1%E8%9B%8B15%E6%9E%9A.png', 14.68, 17.80, 5, 147);
INSERT INTO `goods_list` VALUES (47, '冰鲜小八爪鱼 250g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E5%86%B0%E9%B2%9C%E5%B0%8F%E5%85%AB%E7%88%AA%E9%B1%BC.png', 18.64, 28.80, 6, 11);
INSERT INTO `goods_list` VALUES (48, '鲜活黄金鲫鱼 1条 350g起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E9%B2%9C%E6%B4%BB%E9%BB%84%E9%87%91%E9%B2%AB%E9%B1%BC.gif', 9.90, 19.90, 6, 22);
INSERT INTO `goods_list` VALUES (49, '冰鲜宁德黄花鱼 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E5%86%B0%E9%B2%9C%E5%AE%81%E5%BE%B7%E9%BB%84%E8%8A%B1%E9%B1%BC.png', 9.90, 10.81, 6, 168);
INSERT INTO `goods_list` VALUES (50, '冰鲜净化鲈鱼 400g 起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E5%86%B0%E9%B2%9C%E5%87%80%E5%8C%96%E9%B2%88%E9%B1%BC.png', 11.10, 15.80, 6, 25);
INSERT INTO `goods_list` VALUES (51, '鲜活基围虾 250g（对虾）', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E9%B2%9C%E6%B4%BB%E5%9F%BA%E5%9B%B4%E8%99%BE250g.gif', 16.90, 19.90, 6, 60);
INSERT INTO `goods_list` VALUES (52, '鲜活 罗非鱼 1条 400g起', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7/%E9%B2%9C%E6%B4%BB%20%E7%BD%97%E9%9D%9E%E9%B1%BC%201%E6%9D%A1.png', 8.80, 10.80, 6, 102);
INSERT INTO `goods_list` VALUES (53, '面包新语梦龙巧克力盒子蛋糕 115g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E9%9D%A2%E5%8C%85%E6%96%B0%E8%AF%AD%E6%A2%A6%E9%BE%99%E5%B7%A7%E5%85%8B%E5%8A%9B%E7%9B%92%E5%AD%90%E8%9B%8B%E7%B3%95115g.png', 9.90, 25.00, 7, 87);
INSERT INTO `goods_list` VALUES (54, '阿华田蛋糕卷 80g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E9%98%BF%E5%8D%8E%E7%94%B0%E8%9B%8B%E7%B3%95%E5%8D%B7%2080g.png', 3.90, 5.90, 7, 87);
INSERT INTO `goods_list` VALUES (55, '象大厨 虎皮蛋糕卷 110g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E8%B1%A1%E5%A4%A7%E5%8E%A8%20%E8%99%8E%E7%9A%AE%E8%9B%8B%E7%B3%95%E5%8D%B7%20110g.png', 11.90, 13.90, 7, 87);
INSERT INTO `goods_list` VALUES (56, '喜乐多活菌型乳酸菌饮品 108ml*5', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E5%96%9C%E4%B9%90%E5%A4%9A%E6%B4%BB%E8%8F%8C%E5%9E%8B%E4%B9%B3%E9%85%B8%E8%8F%8C%E9%A5%AE%E5%93%81.png', 4.89, 12.90, 7, 87);
INSERT INTO `goods_list` VALUES (57, '卡士活菌酸奶200ml *3', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E5%8D%A1%E5%A3%AB%E6%B4%BB%E8%8F%8C%E9%85%B8%E5%A5%B6200ml.png', 3.89, 8.89, 7, 87);
INSERT INTO `goods_list` VALUES (58, '燕塘酸奶饮品 180ml*4', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E7%87%95%E5%A1%98%E9%85%B8%E5%A5%B6%E9%A5%AE%E5%93%81.png', 3.89, 8.89, 7, 87);
INSERT INTO `goods_list` VALUES (59, '胜记和原味麻薯 120g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E8%83%9C%E8%AE%B0%E5%92%8C%E5%8E%9F%E5%91%B3%E9%BA%BB%E8%96%AF.png', 6.99, 8.50, 7, 87);
INSERT INTO `goods_list` VALUES (60, '胜记和芝士火锅肉松三明治 90g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E8%83%9C%E8%AE%B0%E5%92%8C%E8%8A%9D%E5%A3%AB%E7%81%AB%E9%94%85%E8%82%89%E6%9D%BE%E4%B8%89%E6%98%8E%E6%B2%BB.png', 3.90, 6.90, 7, 87);
INSERT INTO `goods_list` VALUES (61, '哇哈哈 AD 钙奶 220g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9/%E5%93%87%E5%93%88%E5%93%88%20AD%20%E9%92%99%E5%A5%B6%20220g.png', 7.10, 9.90, 7, 87);
INSERT INTO `goods_list` VALUES (62, '象大厨脆皮烤肠 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E8%84%86%E7%9A%AE%E7%83%A4%E8%82%A0%20200g.png', 12.90, 13.90, 8, 87);
INSERT INTO `goods_list` VALUES (63, '安井手撕红糖馒头 510g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E5%AE%89%E4%BA%95%E6%89%8B%E6%92%95%E7%BA%A2%E7%B3%96%E9%A6%92%E5%A4%B4%20510g.png', 7.89, 17.90, 8, 87);
INSERT INTO `goods_list` VALUES (64, '三全香菇猪肉飘香小馄饨 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E4%B8%89%E5%85%A8%E9%A6%99%E8%8F%87%E7%8C%AA%E8%82%89%E9%A3%98%E9%A6%99%E5%B0%8F%E9%A6%84%E9%A5%A8%20300g.png', 5.49, 9.90, 8, 99);
INSERT INTO `goods_list` VALUES (65, '象大厨手工糯米烧麦 400g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E6%89%8B%E5%B7%A5%E7%B3%AF%E7%B1%B3%E7%83%A7%E9%BA%A6%20400g.png', 8.80, 13.80, 8, 73);
INSERT INTO `goods_list` VALUES (66, '三全猪肉白菜水饺 800g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E4%B8%89%E5%85%A8%E7%8C%AA%E8%82%89%E7%99%BD%E8%8F%9C%E6%B0%B4%E9%A5%BA%20800g.png', 7.90, 14.90, 8, 105);
INSERT INTO `goods_list` VALUES (67, '包点王马拉糕 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E5%8C%85%E7%82%B9%E7%8E%8B%E9%A9%AC%E6%8B%89%E7%B3%95%20200g.png', 6.90, 9.90, 8, 30);
INSERT INTO `goods_list` VALUES (68, '礼拜天红豆糯米方糕雪糕 70g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E7%A4%BC%E6%8B%9C%E5%A4%A9%E7%BA%A2%E8%B1%86%E7%B3%AF%E7%B1%B3%E6%96%B9%E7%B3%95%E9%9B%AA%E7%B3%95%2070g.png', 3.50, 4.99, 8, 133);
INSERT INTO `goods_list` VALUES (67, '一号饭堂潮汕工夫牛筋丸 140g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E4%B8%80%E5%8F%B7%E9%A5%AD%E5%A0%82%E6%BD%AE%E6%B1%95%E5%B7%A5%E5%A4%AB%E7%89%9B%E7%AD%8B%E4%B8%B8%20140g.png', 14.80, 19.99, 8, 175);
INSERT INTO `goods_list` VALUES (68, '海霸王虾味饺 105g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E6%B5%B7%E9%9C%B8%E7%8E%8B%E8%99%BE%E5%91%B3%E9%A5%BA.png', 5.90, 11.90, 8, 31);
INSERT INTO `goods_list` VALUES (69, '湾仔码头玉米蔬菜猪肉水饺 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E6%B9%BE%E4%BB%94%E7%A0%81%E5%A4%B4%E7%8E%89%E7%B1%B3%E8%94%AC%E8%8F%9C%E7%8C%AA%E8%82%89%E6%B0%B4%E9%A5%BA%20300g.png', 15.90, 16.90, 8, 8);
INSERT INTO `goods_list` VALUES (70, '思念珍味三鲜上汤小云吞 120g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9/%E6%80%9D%E5%BF%B5%E7%8F%8D%E5%91%B3%E4%B8%89%E9%B2%9C%E4%B8%8A%E6%B1%A4%E5%B0%8F%E4%BA%91%E5%90%9E%20120g.png', 5.80, 9.90, 8, 186);
INSERT INTO `goods_list` VALUES (71, '厨邦特级鲜生抽酿造酱油 410ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E5%8E%A8%E9%82%A6%E7%89%B9%E7%BA%A7%E9%B2%9C%E7%94%9F%E6%8A%BD%E9%85%BF%E9%80%A0%E9%85%B1%E6%B2%B9%20410ml.png', 6.90, 10.90, 9, 113);
INSERT INTO `goods_list` VALUES (72, '乌江鲜脆榨菜丝 70g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E4%B9%8C%E6%B1%9F%E9%B2%9C%E8%84%86%E6%A6%A8%E8%8F%9C%E4%B8%9D%2070g.png', 2.20, 4.90, 9, 185);
INSERT INTO `goods_list` VALUES (73, '昌茂墨鱼干 100g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E6%98%8C%E8%8C%82%E5%A2%A8%E9%B1%BC%E5%B9%B2%20100g.png', 29.90, 33.80, 9, 94);
INSERT INTO `goods_list` VALUES (74, '甘竹牌豆鼓鱼罐头 184g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E7%94%98%E7%AB%B9%E7%89%8C%E8%B1%86%E9%BC%93%E9%B1%BC%E7%BD%90%E5%A4%B4%20184g.png', 9.90, 14.50, 9, 130);
INSERT INTO `goods_list` VALUES (75, '千禾味极鲜特技生抽酱油1L', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E5%8D%83%E7%A6%BE%E5%91%B3%E6%9E%81%E9%B2%9C%E7%89%B9%E6%8A%80%E7%94%9F%E6%8A%BD%E9%85%B1%E6%B2%B91L.png', 22.80, 29.90, 9, 127);
INSERT INTO `goods_list` VALUES (76, '海天零添加酱油特级0锦标生抽500ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E6%B5%B7%E5%A4%A9%E9%9B%B6%E6%B7%BB%E5%8A%A0%E9%85%B1%E6%B2%B9%E7%89%B9%E7%BA%A70%E9%94%A6%E6%A0%87%E7%94%9F%E6%8A%BD500ml.png', 12.50, 13.90, 9, 59);
INSERT INTO `goods_list` VALUES (77, '泰金香一品茉莉香米5kg', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E6%B3%B0%E9%87%91%E9%A6%99%E4%B8%80%E5%93%81%E8%8C%89%E8%8E%89%E9%A6%99%E7%B1%B35kg.png', 27.80, 39.90, 9, 180);
INSERT INTO `goods_list` VALUES (78, '粤盐加碘自然食用盐250g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E7%B2%A4%E7%9B%90%E5%8A%A0%E7%A2%98%E8%87%AA%E7%84%B6%E9%A3%9F%E7%94%A8%E7%9B%90250g.png', 4.00, 5.50, 9, 200);
INSERT INTO `goods_list` VALUES (79, '海天上等蚝油 700g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E6%B5%B7%E5%A4%A9%E4%B8%8A%E7%AD%89%E8%9A%9D%E6%B2%B9%20700g.png', 6.80, 11.50, 9, 174);
INSERT INTO `goods_list` VALUES (80, '厨邦葱姜汁料酒 500ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E5%8E%A8%E9%82%A6%E8%91%B1%E5%A7%9C%E6%B1%81%E6%96%99%E9%85%92%20500ml.png', 4.80, 7.90, 9, 191);
INSERT INTO `goods_list` VALUES (81, '胡姬花古法小榨花生油 400ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3/%E8%83%A1%E5%A7%AC%E8%8A%B1%E5%8F%A4%E6%B3%95%E5%B0%8F%E6%A6%A8%E8%8A%B1%E7%94%9F%E6%B2%B9%20400ml.png', 11.90, 24.90, 9, 10);
INSERT INTO `goods_list` VALUES (82, '椰树椰汁植物蛋白饮料 1L', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E6%A4%B0%E6%A0%91%E6%A4%B0%E6%B1%81%E6%A4%8D%E7%89%A9%E8%9B%8B%E7%99%BD%E9%A5%AE%E6%96%99%201L.png', 11.90, 16.90, 10, 83);
INSERT INTO `goods_list` VALUES (83, '王老吉凉茶植物饮料250ml*6', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E7%8E%8B%E8%80%81%E5%90%89%E5%87%89%E8%8C%B6%E6%A4%8D%E7%89%A9%E9%A5%AE%E6%96%99250ml.png', 9.90, 14.50, 10, 58);
INSERT INTO `goods_list` VALUES (84, '百事可乐零度汽水 500ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E7%99%BE%E4%BA%8B%E5%8F%AF%E4%B9%90%E9%9B%B6%E5%BA%A6%E6%B1%BD%E6%B0%B4%20500ml.png', 3.20, 4.00, 10, 188);
INSERT INTO `goods_list` VALUES (85, '芬达橙味汽水330ml*6', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E8%8A%AC%E8%BE%BE%E6%A9%99%E5%91%B3%E6%B1%BD%E6%B0%B4330ml.png', 9.90, 16.90, 10, 126);
INSERT INTO `goods_list` VALUES (86, '牛拦山陈酿42度 500ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E7%89%9B%E6%8B%A6%E5%B1%B1%E9%99%88%E9%85%BF42%E5%BA%A6%20500ml.png', 16.80, 18.80, 10, 60);
INSERT INTO `goods_list` VALUES (87, '天地壹号苹果醋饮料330ml', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E5%A4%A9%E5%9C%B0%E5%A3%B9%E5%8F%B7%E8%8B%B9%E6%9E%9C%E9%86%8B%E9%A5%AE%E6%96%99330ml.png', 3.80, 6.80, 10, 77);
INSERT INTO `goods_list` VALUES (88, '百事可乐碳酸饮料 330ml*6', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E7%99%BE%E4%BA%8B%E5%8F%AF%E4%B9%90%E7%A2%B3%E9%85%B8%E9%A5%AE%E6%96%99%20330ml.png', 9.99, 16.90, 10, 187);
INSERT INTO `goods_list` VALUES (89, '康师傅柠檬味冰红茶1L*3', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E5%BA%B7%E5%B8%88%E5%82%85%E6%9F%A0%E6%AA%AC%E5%91%B3%E5%86%B0%E7%BA%A2%E8%8C%B61L.png', 9.40, 13.50, 10, 80);
INSERT INTO `goods_list` VALUES (90, '维他柠檬茶饮料 250ml*6', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E9%85%92%E6%B0%B4%E9%A5%AE%E6%96%99/%E7%BB%B4%E4%BB%96%E6%9F%A0%E6%AA%AC%E8%8C%B6%E9%A5%AE%E6%96%99%20250ml.png', 12.90, 16.90, 10, 190);
INSERT INTO `goods_list` VALUES (91, '脆生升蜂蜜黄油味薯条 40gd', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E8%84%86%E7%94%9F%E5%8D%87%E8%9C%82%E8%9C%9C%E9%BB%84%E6%B2%B9%E5%91%B3%E8%96%AF%E6%9D%A1%2040g.png', 3.90, 5.90, 11, 83);
INSERT INTO `goods_list` VALUES (92, '咪咪虾味虾条 360g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E5%92%AA%E5%92%AA%E8%99%BE%E5%91%B3%E8%99%BE%E6%9D%A1%20360g.png', 12.90, 13.90, 11, 174);
INSERT INTO `goods_list` VALUES (93, '良品铺子高蛋白肉铺 100g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E8%89%AF%E5%93%81%E9%93%BA%E5%AD%90%E9%AB%98%E8%9B%8B%E7%99%BD%E8%82%89%E9%93%BA%20100g.png', 7.99, 17.90, 11, 80);
INSERT INTO `goods_list` VALUES (94, '同享九制乌梅 40g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E5%90%8C%E4%BA%AB%E4%B9%9D%E5%88%B6%E4%B9%8C%E6%A2%85%2040g.png', 2.90, 5.00, 11, 161);
INSERT INTO `goods_list` VALUES (95, '南北特麻辣素牛筋 80g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E5%8D%97%E5%8C%97%E7%89%B9%E9%BA%BB%E8%BE%A3%E7%B4%A0%E7%89%9B%E7%AD%8B%2080g.png', 2.50, 3.90, 11, 106);
INSERT INTO `goods_list` VALUES (96, '潘氏兄弟五香味猫耳朵 108g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E6%BD%98%E6%B0%8F%E5%85%84%E5%BC%9F%E4%BA%94%E9%A6%99%E5%91%B3%E7%8C%AB%E8%80%B3%E6%9C%B5%20108g.png', 2.50, 3.90, 11, 145);
INSERT INTO `goods_list` VALUES (97, '达利园法式香奶味软面包 360g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E8%BE%BE%E5%88%A9%E5%9B%AD%E6%B3%95%E5%BC%8F%E9%A6%99%E5%A5%B6%E5%91%B3%E8%BD%AF%E9%9D%A2%E5%8C%85%20360g.png', 9.99, 13.90, 11, 97);
INSERT INTO `goods_list` VALUES (98, '喜之郎什锦果冻 360g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E5%96%9C%E4%B9%8B%E9%83%8E%E4%BB%80%E9%94%A6%E6%9E%9C%E5%86%BB%20360g.png', 3.90, 4.90, 11, 173);
INSERT INTO `goods_list` VALUES (99, '乖媳妇山椒凤爪 70g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%BC%91%E9%97%B2%E9%9B%B6%E9%A3%9F/%E5%96%9C%E4%B9%8B%E9%83%8E%E4%BB%80%E9%94%A6%E6%9E%9C%E5%86%BB%20360g.png', 4.90, 5.90, 11, 134);
INSERT INTO `goods_list` VALUES (100, '象大厨 象优猪肉芹菜水饺 500g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E8%B1%A1%E5%A4%A7%E5%8E%A8%20%E8%B1%A1%E4%BC%98%E7%8C%AA%E8%82%89%E8%8A%B9%E8%8F%9C%E6%B0%B4%E9%A5%BA%20500g.png', 5.00, 10.80, 12, 125);
INSERT INTO `goods_list` VALUES (101, '象大厨柳州螺蛳粉 300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E6%9F%B3%E5%B7%9E%E8%9E%BA%E8%9B%B3%E7%B2%89%20300g.png', 6.79, 12.90, 12, 17);
INSERT INTO `goods_list` VALUES (102, '象大厨酱牛肉 100g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E9%85%B1%E7%89%9B%E8%82%89.png', 19.00, 26.80, 12, 80);
INSERT INTO `goods_list` VALUES (103, '煌上煌甜辣卤鸭脖 190g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E7%85%8C%E4%B8%8A%E7%85%8C%E7%94%9C%E8%BE%A3%E5%8D%A4%E9%B8%AD%E8%84%96%20190g.png', 14.80, 15.90, 12, 63);
INSERT INTO `goods_list` VALUES (104, '象大厨老卤猪头肉 120g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E8%80%81%E5%8D%A4%E7%8C%AA%E5%A4%B4%E8%82%89%20120g.png', 14.90, 17.80, 12, 35);
INSERT INTO `goods_list` VALUES (105, '周黑鸭卤莲藕 150g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E5%91%A8%E9%BB%91%E9%B8%AD%E5%8D%A4%E8%8E%B2%E8%97%95%20150g.png', 8.20, 10.90, 12, 44);
INSERT INTO `goods_list` VALUES (106, '周黑鸭卤鸭锁骨 120g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%86%9F%E9%A3%9F%E9%A2%84%E5%88%B6%E8%8F%9C/%E5%91%A8%E9%BB%91%E9%B8%AD%E5%8D%A4%E9%B8%AD%E9%94%81%E9%AA%A8%20120g.png', 11.89, 17.90, 12, 183);
INSERT INTO `goods_list` VALUES (107, '雪榕金针菇 150g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%89%93%E8%BE%B9%E7%82%89/%E9%9B%AA%E6%A6%95%E9%87%91%E9%92%88%E8%8F%87%20150g.png', 1.99, 2.99, 13, 56);
INSERT INTO `goods_list` VALUES (108, '冰鲜海带苗 200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%89%93%E8%BE%B9%E7%82%89/%E5%86%B0%E9%B2%9C%E6%B5%B7%E5%B8%A6%E8%8B%97%20200g.png', 5.05, 7.99, 13, 81);
INSERT INTO `goods_list` VALUES (109, '象大厨嗨聊锅 75%青虾滑 150g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%89%93%E8%BE%B9%E7%82%89/%E8%B1%A1%E5%A4%A7%E5%8E%A8%E5%97%A8%E8%81%8A%E9%94%85%2075%25%E9%9D%92%E8%99%BE%E6%BB%91%20150g.gif', 10.80, 15.00, 13, 152);
INSERT INTO `goods_list` VALUES (110, '海底捞醇香牛油火锅底料 150g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%89%93%E8%BE%B9%E7%82%89/%E6%B5%B7%E5%BA%95%E6%8D%9E%E9%86%87%E9%A6%99%E7%89%9B%E6%B2%B9%E7%81%AB%E9%94%85%E5%BA%95%E6%96%99%20150g.png', 5.90, 9.99, 13, 68);
INSERT INTO `goods_list` VALUES (111, '香菇 150g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%89%93%E8%BE%B9%E7%82%89/%E9%A6%99%E8%8F%87%20150g.png', 2.78, 5.39, 13, 14);
INSERT INTO `goods_list` VALUES (112, '统一来一桶红烧牛肉面大桶 138g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E7%BB%9F%E4%B8%80%E6%9D%A5%E4%B8%80%E6%A1%B6%E7%BA%A2%E7%83%A7%E7%89%9B%E8%82%89%E9%9D%A2%E5%A4%A7%E6%A1%B6%20138g.png', 3.90, 5.90, 14, 133);
INSERT INTO `goods_list` VALUES (113, '自嗨锅广式香肠煲仔饭 263g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E8%87%AA%E5%97%A8%E9%94%85%E5%B9%BF%E5%BC%8F%E9%A6%99%E8%82%A0%E7%85%B2%E4%BB%94%E9%A5%AD%20263g.png', 9.90, 18.90, 14, 193);
INSERT INTO `goods_list` VALUES (114, '双汇王中王优级火腿肠 30g*9', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E5%8F%8C%E6%B1%87%E7%8E%8B%E4%B8%AD%E7%8E%8B%E4%BC%98%E7%BA%A7%E7%81%AB%E8%85%BF%E8%82%A0%2030g.png', 7.80, 14.90, 14, 100);
INSERT INTO `goods_list` VALUES (115, '双汇玉米热狗肠 40g*8', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E5%8F%8C%E6%B1%87%E7%8E%89%E7%B1%B3%E7%83%AD%E7%8B%97%E8%82%A0%2040g.png', 7.90, 14.90, 14, 111);
INSERT INTO `goods_list` VALUES (116, '康师傅经典红烧牛肉面 100g*5', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E5%BA%B7%E5%B8%88%E5%82%85%E7%BB%8F%E5%85%B8%E7%BA%A2%E7%83%A7%E7%89%9B%E8%82%89%E9%9D%A2%20100g.png', 10.90, 14.90, 14, 122);
INSERT INTO `goods_list` VALUES (117, '李子柒柳州螺蛳粉 335g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E6%96%B9%E4%BE%BF%E9%80%9F%E9%A3%9F/%E6%9D%8E%E5%AD%90%E6%9F%92%E6%9F%B3%E5%B7%9E%E8%9E%BA%E8%9B%B3%E7%B2%89%20335g.png', 9.80, 15.90, 14, 43);
INSERT INTO `goods_list` VALUES (118, '蓝月亮深层洁净洗衣液组合装 薰衣草1kg瓶', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%BA%B8%E5%93%81%E5%AE%B6%E6%B8%85/%E8%93%9D%E6%9C%88%E4%BA%AE%E6%B7%B1%E5%B1%82%E6%B4%81%E5%87%80%E6%B4%97%E8%A1%A3%E6%B6%B2%E7%BB%84%E5%90%88%E8%A3%85.png', 16.95, 19.95, 15, 157);
INSERT INTO `goods_list` VALUES (119, '维达超韧系列3层抽取式纸面巾 130抽*6包', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%BA%B8%E5%93%81%E5%AE%B6%E6%B8%85/%E7%BB%B4%E8%BE%BE%E8%B6%85%E9%9F%A7%E7%B3%BB%E5%88%973%E5%B1%82%E6%8A%BD%E5%8F%96%E5%BC%8F%E7%BA%B8%E9%9D%A2%E5%B7%BE%20130%E6%8A%BD.png', 14.90, 16.90, 15, 166);
INSERT INTO `goods_list` VALUES (120, '茶花马桶疏通器1个', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%BA%B8%E5%93%81%E5%AE%B6%E6%B8%85/%E8%8C%B6%E8%8A%B1%E9%A9%AC%E6%A1%B6%E7%96%8F%E9%80%9A%E5%99%A81%E4%B8%AA.png', 16.90, 19.90, 15, 119);
INSERT INTO `goods_list` VALUES (121, '心相印金装经典三层抽纸 100抽', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E7%BA%B8%E5%93%81%E5%AE%B6%E6%B8%85/%E5%BF%83%E7%9B%B8%E5%8D%B0%E9%87%91%E8%A3%85%E7%BB%8F%E5%85%B8%E4%B8%89%E5%B1%82%E6%8A%BD%E7%BA%B8%20100%E6%8A%BD.png', 7.90, 14.80, 15, 10);
INSERT INTO `goods_list` VALUES (122, '太平朝辉雨伞1把', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%AE%B6%E5%B1%85%E7%99%BE%E8%B4%A7/%E5%93%81%E8%83%9C2.4A%E5%BF%AB%E5%85%851m%E8%8B%B9%E6%9E%9C%E5%85%85%E7%94%B5%E7%BA%BF1%E6%A0%B9.png', 19.90, 29.00, 16, 30);
INSERT INTO `goods_list` VALUES (123, '公牛6位排插1.8米1个', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%AE%B6%E5%B1%85%E7%99%BE%E8%B4%A7/%E5%85%AC%E7%89%9B6%E4%BD%8D%E6%8E%92%E6%8F%921.8%E7%B1%B31%E4%B8%AA.png', 19.90, 29.90, 16, 77);
INSERT INTO `goods_list` VALUES (124, '品胜2.4A快充1m苹果充电线1根', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E5%AE%B6%E5%B1%85%E7%99%BE%E8%B4%A7/%E5%93%81%E8%83%9C2.4A%E5%BF%AB%E5%85%851m%E8%8B%B9%E6%9E%9C%E5%85%85%E7%94%B5%E7%BA%BF1%E6%A0%B9.png', 36.00, 49.99, 16, 49);
INSERT INTO `goods_list` VALUES (125, '她研社春日小懒裤型卫生巾可换芯1条', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B8%AA%E6%8A%A4%E6%AF%8D%E5%A9%B4/%E5%A5%B9%E7%A0%94%E7%A4%BE%E6%98%A5%E6%97%A5%E5%8D%AB%E7%94%9F%E5%B7%BE.png', 12.80, 19.90, 17, 85);
INSERT INTO `goods_list` VALUES (126, '舒克亮齿白清薄荷牙膏 210g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B8%AA%E6%8A%A4%E6%AF%8D%E5%A9%B4/%E8%88%92%E5%85%8B%E4%BA%AE%E9%BD%BF%E7%99%BD%E6%B8%85%E8%96%84%E8%8D%B7%E7%89%99%E8%86%8F%20210g.png', 7.99, 14.90, 17, 133);
INSERT INTO `goods_list` VALUES (127, '名创优品全开你系列洗脸巾120抽', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B8%AA%E6%8A%A4%E6%AF%8D%E5%A9%B4/%E5%90%8D%E5%88%9B%E4%BC%98%E5%93%81%E5%85%A8%E5%BC%80%E4%BD%A0%E7%B3%BB%E5%88%97%E6%B4%97%E8%84%B8%E5%B7%BE120%E6%8A%BD.png', 15.90, 17.90, 17, 193);
INSERT INTO `goods_list` VALUES (128, '超威艾草清香加大盘蚊香40盘', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/%E4%B8%AA%E6%8A%A4%E6%AF%8D%E5%A9%B4/%E8%B6%85%E5%A8%81%E8%89%BE%E8%8D%89%E6%B8%85%E9%A6%99%E5%8A%A0%E5%A4%A7%E7%9B%98%E8%9A%8A%E9%A6%9940%E7%9B%98.png', 12.90, 15.90, 17, 55);

-- ----------------------------
-- Table structure for index_cate
-- ----------------------------
DROP TABLE IF EXISTS `index_cate`;
CREATE TABLE `index_cate`  (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `classifyId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of index_cate
-- ----------------------------
INSERT INTO `index_cate` VALUES (0, '水果鲜花', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E6%B0%B4%E6%9E%9C%E9%B2%9C%E8%8A%B1.png', 3);
INSERT INTO `index_cate` VALUES (1, '蔬菜豆制品', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E8%94%AC%E8%8F%9C%E8%B1%86%E5%88%B6%E5%93%81.png', 4);
INSERT INTO `index_cate` VALUES (2, '肉禽蛋', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E8%82%89%E7%A6%BD%E8%9B%8B.png', 5);
INSERT INTO `index_cate` VALUES (3, '海鲜水产', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E6%B5%B7%E9%B2%9C%E6%B0%B4%E4%BA%A7.png', 6);
INSERT INTO `index_cate` VALUES (4, '乳品烘培', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E4%B9%B3%E5%93%81%E7%83%98%E5%9F%B9.png', 7);
INSERT INTO `index_cate` VALUES (5, '冻品面点', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E5%86%BB%E5%93%81%E9%9D%A2%E7%82%B9.png', 8);
INSERT INTO `index_cate` VALUES (6, '粮油调味', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E7%B2%AE%E6%B2%B9%E8%B0%83%E5%91%B3.png', 9);
INSERT INTO `index_cate` VALUES (7, '其他', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/cate/%E5%85%B6%E4%BB%96.png', 0);

-- ----------------------------
-- Table structure for index_timelimit
-- ----------------------------
DROP TABLE IF EXISTS `index_timelimit`;
CREATE TABLE `index_timelimit`  (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `oldPrice` decimal(10, 2) NULL DEFAULT NULL,
  `newPrice` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of index_timelimit
-- ----------------------------
INSERT INTO `index_timelimit` VALUES (0, '鲜活基围虾200g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img1.png?versionId=CAEQBxiBgMDLr9ngoBgiIGE5ZDA5MjFkNGQ5ZDRlYTNiOWEyMzE0NWUwNTY3MmYy', 22.90, 18.80);
INSERT INTO `index_timelimit` VALUES (1, '东江湖蜜橘', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img2.png?versionId=CAEQBxiBgIC1r9ngoBgiIDcyYTI1OTY2NmFmYzRiOGI5MWMyYTRjMTkwMTc1NzYz', 9.00, 4.88);
INSERT INTO `index_timelimit` VALUES (2, '山东千禧小番茄', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img3.png?versionId=CAEQBxiBgMCpr9ngoBgiIDNjZDM4NWU2YjE3YzRmZDBiNGExOWRkOTM1NTAxYThk', 12.90, 7.90);
INSERT INTO `index_timelimit` VALUES (3, '杭白菜约300g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img4.png?versionId=CAEQBxiBgMDKr9ngoBgiIGNlZDIzY2RkMTViODQ5ZTY5YTE4NmY2MTJiZDgwYzJk', 5.99, 2.99);
INSERT INTO `index_timelimit` VALUES (4, '沈佳农有机笋350g', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img5.png?versionId=CAEQBxiBgICur9ngoBgiIDNiMDk3M2Y4NmZjNzRiZTRhOTczZjg2MWI5ZjlmNDc2', 19.90, 15.90);
INSERT INTO `index_timelimit` VALUES (5, '百事可乐碳酸饮料330ml*6', 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/index/timeLimit/img6.png?versionId=CAEQBxiBgICWoubgoBgiIGM4ZDE1ZWE4ODFhYjQwOWFiZWZlNGY2MWFjYzI1N2Rl', 16.90, 10.40);

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list`  (
  `id` int(11) NOT NULL,
  `orderNumber` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `telNumber` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order_list
-- ----------------------------
INSERT INTO `order_list` VALUES (0, '21qw31qwe1', '李先生', 110110110, '广州南方学院', '2022-11-17 09:08:35');
INSERT INTO `order_list` VALUES (1, '21qw31qwe1', '方女士', 1234567894, '中山大学南方学院', '2022-11-18 18:26:49');
INSERT INTO `order_list` VALUES (2, 'cgzftmb5v3', '陈先生', 987654321, '广州市从化区广州南方学院', '2022-11-17 15:52:14');
INSERT INTO `order_list` VALUES (3, '5gg5f4h7h4', '黄先生', 10086, '南方学院', '2022-11-24 15:08:59');

-- ----------------------------
-- Table structure for sales_list
-- ----------------------------
DROP TABLE IF EXISTS `sales_list`;
CREATE TABLE `sales_list`  (
  `year` int(11) NOT NULL,
  `month` int(11) NULL DEFAULT NULL,
  `value` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales_list
-- ----------------------------
INSERT INTO `sales_list` VALUES (2020, 1, 33);
INSERT INTO `sales_list` VALUES (2020, 2, 145);
INSERT INTO `sales_list` VALUES (2020, 3, 19);
INSERT INTO `sales_list` VALUES (2020, 4, 53);
INSERT INTO `sales_list` VALUES (2020, 5, 122);
INSERT INTO `sales_list` VALUES (2020, 6, 187);
INSERT INTO `sales_list` VALUES (2020, 7, 18);
INSERT INTO `sales_list` VALUES (2020, 8, 130);
INSERT INTO `sales_list` VALUES (2020, 9, 112);
INSERT INTO `sales_list` VALUES (2020, 10, 200);
INSERT INTO `sales_list` VALUES (2020, 11, 77);
INSERT INTO `sales_list` VALUES (2021, 1, 6);
INSERT INTO `sales_list` VALUES (2020, 12, 111);
INSERT INTO `sales_list` VALUES (2021, 2, 126);
INSERT INTO `sales_list` VALUES (2021, 2, 111);
INSERT INTO `sales_list` VALUES (2021, 3, 117);
INSERT INTO `sales_list` VALUES (2021, 3, 111);
INSERT INTO `sales_list` VALUES (2021, 4, 183);
INSERT INTO `sales_list` VALUES (2021, 4, 111);
INSERT INTO `sales_list` VALUES (2021, 5, 9);
INSERT INTO `sales_list` VALUES (2021, 5, 111);
INSERT INTO `sales_list` VALUES (2021, 6, 43);
INSERT INTO `sales_list` VALUES (2021, 7, 47);
INSERT INTO `sales_list` VALUES (2021, 6, 111);
INSERT INTO `sales_list` VALUES (2022, 1, 129);
INSERT INTO `sales_list` VALUES (2022, 2, 130);
INSERT INTO `sales_list` VALUES (2022, 3, 140);
INSERT INTO `sales_list` VALUES (2022, 4, 164);
INSERT INTO `sales_list` VALUES (2022, 5, 66);
INSERT INTO `sales_list` VALUES (2022, 6, 21);
INSERT INTO `sales_list` VALUES (2022, 7, 13);
INSERT INTO `sales_list` VALUES (2022, 8, 149);
INSERT INTO `sales_list` VALUES (2022, 9, 146);
INSERT INTO `sales_list` VALUES (2022, 10, 133);
INSERT INTO `sales_list` VALUES (2022, 11, 74);
INSERT INTO `sales_list` VALUES (2022, 12, 29);

SET FOREIGN_KEY_CHECKS = 1;
