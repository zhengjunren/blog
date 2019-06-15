/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 31/05/2019 17:02:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博客id',
  `bolgger_id` bigint(20) NULL DEFAULT NULL COMMENT '所属博主id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客标题',
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '博客的展示图片',
  `categoriy_id` int(20) NOT NULL COMMENT '所属分类',
  `blog_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客描述',
  `blog_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '博客内容',
  `blog_content_markdown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'markdown内容',
  `created` datetime(0) NOT NULL COMMENT '博客发布时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '博客更新时间',
  `read_times` int(20) NULL DEFAULT NULL COMMENT '阅读次数',
  `praise_times` int(20) NULL DEFAULT NULL COMMENT '点赞次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, 1, 'springMVC', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 34, 'springMVC的配置', '<h1 id=\"h1-springmvc\"><a name=\"SpringMVC\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>SpringMVC</h1><pre><code class=\"lang-xml\">&lt;?xml version=&quot;1.0&quot; encoding=&quot;UTF-8&quot;?&gt;\r\n&lt;beans xmlns=&quot;http://www.springframework.org/schema/beans&quot; xmlns:xsi=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;\r\n       xmlns:context=&quot;http://www.springframework.org/schema/context&quot;\r\n       xmlns:mvc=&quot;http://www.springframework.org/schema/mvc&quot;\r\n       xsi:schemaLocation=&quot;http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd\r\n        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd\r\n        http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd&quot;&gt;\r\n\r\n    &lt;description&gt;Spring MVC Configuration&lt;/description&gt;\r\n\r\n    &lt;!-- 加载配置属性文件 --&gt;\r\n    &lt;context:property-placeholder ignore-unresolvable=&quot;true&quot; location=&quot;classpath:myshop.properties&quot;/&gt;\r\n\r\n    &lt;!-- 使用 Annotation 自动注册 Bean,只扫描 @Controller --&gt;\r\n    &lt;context:component-scan base-package=&quot;com.lusifer.myshop&quot; use-default-filters=&quot;false&quot;&gt;\r\n        &lt;context:include-filter type=&quot;annotation&quot; expression=&quot;org.springframework.stereotype.Controller&quot;/&gt;\r\n    &lt;/context:component-scan&gt;\r\n\r\n    &lt;!-- 默认的注解映射的支持 --&gt;\r\n    &lt;mvc:annotation-driven /&gt;\r\n\r\n    &lt;!-- 定义视图文件解析 --&gt;\r\n    &lt;bean class=&quot;org.springframework.web.servlet.view.InternalResourceViewResolver&quot;&gt;\r\n        &lt;property name=&quot;prefix&quot; value=&quot;${web.view.prefix}&quot;/&gt;\r\n        &lt;property name=&quot;suffix&quot; value=&quot;${web.view.suffix}&quot;/&gt;\r\n    &lt;/bean&gt;\r\n\r\n    &lt;!-- 静态资源映射 --&gt;\r\n    &lt;mvc:resources mapping=&quot;/static/**&quot; location=&quot;/static/&quot; cache-period=&quot;31536000&quot;/&gt;\r\n&lt;/beans&gt;\r\n</code></pre>\r\n<pre><code class=\"lang-java\">public static void main(String[] args){\r\n    System.out.println(&quot;hello world&quot;);\r\n}\r\n</code></pre>\r\n<p>请输入您的正常</p>\r\n', '# SpringMVC\r\n``` xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<beans xmlns=\"http://www.springframework.org/schema/beans\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n       xmlns:context=\"http://www.springframework.org/schema/context\"\r\n       xmlns:mvc=\"http://www.springframework.org/schema/mvc\"\r\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd\r\n        http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd\r\n        http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd\">\r\n\r\n    <description>Spring MVC Configuration</description>\r\n\r\n    <!-- 加载配置属性文件 -->\r\n    <context:property-placeholder ignore-unresolvable=\"true\" location=\"classpath:myshop.properties\"/>\r\n\r\n    <!-- 使用 Annotation 自动注册 Bean,只扫描 @Controller -->\r\n    <context:component-scan base-package=\"com.lusifer.myshop\" use-default-filters=\"false\">\r\n        <context:include-filter type=\"annotation\" expression=\"org.springframework.stereotype.Controller\"/>\r\n    </context:component-scan>\r\n\r\n    <!-- 默认的注解映射的支持 -->\r\n    <mvc:annotation-driven />\r\n\r\n    <!-- 定义视图文件解析 -->\r\n    <bean class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\">\r\n        <property name=\"prefix\" value=\"${web.view.prefix}\"/>\r\n        <property name=\"suffix\" value=\"${web.view.suffix}\"/>\r\n    </bean>\r\n\r\n    <!-- 静态资源映射 -->\r\n    <mvc:resources mapping=\"/static/**\" location=\"/static/\" cache-period=\"31536000\"/>\r\n</beans>\r\n```\r\n\r\n```java\r\npublic static void main(String[] args){\r\n	System.out.println(\"hello world\");\r\n}\r\n```\r\n请输入您的正常\r\n', '2019-05-15 17:03:58', '2019-05-30 16:40:59', 1, 1);
INSERT INTO `blog` VALUES (2, 1, 'JDK8新特性', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 5, 'jdk8新特性', '<h1 id=\"h1-u4E00u7EA7u6807u9898\"><a name=\"一级标题\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>一级标题</h1><table>\r\n<thead>\r\n<tr>\r\n<th>项目</th>\r\n<th style=\"text-align:right\">价格</th>\r\n<th style=\"text-align:center\">数量</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr>\r\n<td>计算机</td>\r\n<td style=\"text-align:right\">$1600</td>\r\n<td style=\"text-align:center\">5</td>\r\n</tr>\r\n<tr>\r\n<td>手机</td>\r\n<td style=\"text-align:right\">$12</td>\r\n<td style=\"text-align:center\">12</td>\r\n</tr>\r\n<tr>\r\n<td>管线</td>\r\n<td style=\"text-align:right\">$1</td>\r\n<td style=\"text-align:center\">234</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<ul>\r\n<li>列表一</li><li>列表二<ul>\r\n<li>列表二-1</li><li>列表二-2</li><li>列表二-3</li></ul>\r\n</li><li>列表三<ul>\r\n<li>列表一</li><li>列表二</li><li>列表三</li></ul>\r\n</li></ul>\r\n', '# 一级标题\r\n\r\n\r\n| 项目        | 价格   |  数量  |\r\n| --------   | -----:  | :----:  |\r\n| 计算机      | $1600   |   5     |\r\n| 手机        |   $12   |   12   |\r\n| 管线        |    $1    |  234  |\r\n\r\n+ 列表一\r\n+ 列表二\r\n    + 列表二-1\r\n    + 列表二-2\r\n    + 列表二-3\r\n+ 列表三\r\n    * 列表一\r\n    * 列表二\r\n    * 列表三', '2019-05-15 17:04:34', '2019-05-24 20:01:25', 2, 2);
INSERT INTO `blog` VALUES (3, 1, 'c#之谜', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 1, '这是一篇关于c#的博文', '', '', '2019-05-15 19:36:43', '2019-05-24 23:37:39', 199, 1);
INSERT INTO `blog` VALUES (4, 1, 'python为什么适合做人工智能', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 4, '这是一篇关于python的博文', NULL, NULL, '2019-05-15 21:07:03', '2019-05-15 21:07:06', 1, 1);
INSERT INTO `blog` VALUES (5, 1, 'java不开源了吗？', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 5, '这是一篇关于java的博文', NULL, NULL, '2019-05-15 21:07:52', '2019-05-15 21:07:55', 1, 1);
INSERT INTO `blog` VALUES (6, 1, '关于c++', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 2, '这是一篇关于c++的博文', '<p>擦</p>', NULL, '2019-05-16 20:03:46', '2019-05-23 13:19:39', 1, 1);
INSERT INTO `blog` VALUES (7, 1, 'spring，java程序员的春天', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 5, 'spring全家桶', '<p>spring</p>', NULL, '2019-05-16 20:12:20', '2019-05-23 13:20:05', 1, 1);
INSERT INTO `blog` VALUES (8, 1, 'mybatis映射原理', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 5, 'mybatis的原理', '<p>mybatis</p><p>啊</p>', NULL, '2019-05-16 20:12:54', '2019-05-23 13:13:45', 1, 1);
INSERT INTO `blog` VALUES (9, 1, '微服务时代', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 5, '2013年，微服务元年', '<p>微服务</p><p>使用</p>', NULL, '2019-05-16 20:13:47', '2019-05-23 13:20:58', 1, 1);
INSERT INTO `blog` VALUES (10, 1, 'c++为何永垂不朽', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 2, '面向对象之起源', '<p>这是一篇c++</p><p>test</p>', NULL, '2019-05-16 20:14:21', '2019-05-23 13:10:31', 1, 1);
INSERT INTO `blog` VALUES (12, 3, '这是第一个测试', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 2, '希望能通过', '', '', '2019-05-22 23:27:01', '2019-05-24 23:38:03', NULL, NULL);
INSERT INTO `blog` VALUES (13, 3, '这是第一个测试修改', 'http://10.254.75.188:8079/static/upload/5643f0de-3f09-4c6e-9ecd-a8d2048d452a.jpg', 1, '希望能通过修改', '', '', '2019-05-23 07:33:07', '2019-05-24 23:38:24', NULL, NULL);
INSERT INTO `blog` VALUES (15, 3, '表情包', 'http://10.254.75.188:8079/static/upload/423fd0a8-1d52-4a13-84bd-eab207f42367.jpg', 3, '考拉', '<p><img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/broken_heart.png\" class=\"emoji\" title=\"&#58;broken_heart&#58;\" alt=\"&#58;broken_heart&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/dash.png\" class=\"emoji\" title=\"&#58;dash&#58;\" alt=\"&#58;dash&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/worried.png\" class=\"emoji\" title=\"&#58;worried&#58;\" alt=\"&#58;worried&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/sweat_drops.png\" class=\"emoji\" title=\"&#58;sweat_drops&#58;\" alt=\"&#58;sweat_drops&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/angry.png\" class=\"emoji\" title=\"&#58;angry&#58;\" alt=\"&#58;angry&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/rage.png\" class=\"emoji\" title=\"&#58;rage&#58;\" alt=\"&#58;rage&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/paw_prints.png\" class=\"emoji\" title=\"&#58;paw_prints&#58;\" alt=\"&#58;paw_prints&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/cat2.png\" class=\"emoji\" title=\"&#58;cat2&#58;\" alt=\"&#58;cat2&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/four_leaf_clover.png\" class=\"emoji\" title=\"&#58;four_leaf_clover&#58;\" alt=\"&#58;four_leaf_clover&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/blowfish.png\" class=\"emoji\" title=\"&#58;blowfish&#58;\" alt=\"&#58;blowfish&#58;\" /> <img src=\"https://www.webpagefx.com/tools/emoji-cheat-sheet/graphics/emojis/waxing_crescent_moon.png\" class=\"emoji\" title=\"&#58;waxing_crescent_moon&#58;\" alt=\"&#58;waxing_crescent_moon&#58;\" /></p>\r\n', ':broken_heart: :dash: :worried: :sweat_drops: :angry: :rage: :paw_prints: :cat2: :four_leaf_clover: :blowfish: :waxing_crescent_moon:', '2019-05-24 19:55:14', '2019-05-24 23:37:03', NULL, NULL);
INSERT INTO `blog` VALUES (16, 3, 'hello', 'http://10.254.75.188:8079/static/upload/875da4cc-9b9c-4c52-9f89-cc680db4ac8b.jpg', 3, '图片显示不出来', '<h1 id=\"h1-test\"><a name=\"test\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>test</h1><p><img src=\"http://10.254.75.188:8079/static/upload/0cb98998-598e-4a27-8204-b1afb7609b50.jpg\" alt=\"\"></p>\r\n', '# test\r\n![](http://10.254.75.188:8079/static/upload/0cb98998-598e-4a27-8204-b1afb7609b50.jpg)', '2019-05-24 20:03:52', '2019-05-24 23:36:52', NULL, NULL);
INSERT INTO `blog` VALUES (23, 2, 'test1', '', 2, 'test1', '<p>q</p>\r\n', 'q', '2019-05-29 19:26:27', '2019-05-29 19:26:27', NULL, NULL);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '博客分类id',
  `blog_category_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` int(20) NULL DEFAULT NULL,
  `is_parent` tinyint(1) NULL DEFAULT NULL,
  `category_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` date NOT NULL COMMENT '创建时间',
  `updated` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1, 'c', 0, 1, '这是关于c的博客分类', '2019-05-24', '2019-05-28 21:23:52');
INSERT INTO `blog_category` VALUES (2, 'c++', 0, 1, '这是关于c++的博客分类', '2019-05-16', '2019-05-16 20:00:34');
INSERT INTO `blog_category` VALUES (3, 'c#', 0, 1, '这是关于c#的博客分类', '2019-05-16', '2019-05-30 13:11:15');
INSERT INTO `blog_category` VALUES (4, 'python', 0, 0, '这是关于python的博客分类', '2019-05-16', '2019-05-30 16:38:34');
INSERT INTO `blog_category` VALUES (5, 'java', 0, 1, '这是关于java的博客分类', '2019-05-16', '2019-05-30 16:38:42');
INSERT INTO `blog_category` VALUES (34, 'spring', 5, 0, '这里是关于spring的分类', '2019-05-30', '2019-05-30 16:39:10');

-- ----------------------------
-- Table structure for blogger
-- ----------------------------
DROP TABLE IF EXISTS `blogger`;
CREATE TABLE `blogger`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '博主id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名密码',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_admin` tinyint(10) NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogger
-- ----------------------------
INSERT INTO `blogger` VALUES (1, 'zjr', '123456', '15070517468', '1440629746@qq.com', '2019-05-14 19:11:02', '2019-05-14 19:11:06', 1);
INSERT INTO `blogger` VALUES (2, 'hxh', '123456', '15946978522', '2954275153@qq.com', '2019-05-29 19:13:01', '2019-05-29 19:13:04', 1);
INSERT INTO `blogger` VALUES (3, 'test', '123456', '12345', '1234@qq.com', '2019-05-29 20:06:54', '2019-05-29 20:06:57', 0);

SET FOREIGN_KEY_CHECKS = 1;
