-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-10-02 15:22:14
-- 服务器版本： 5.6.37-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `www_wustudy_com`
--

-- --------------------------------------------------------

--
-- 表的结构 `db_admins`
--

CREATE TABLE `db_admins` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `admin_name` varchar(100) NOT NULL DEFAULT '',
  `admin_pwd` varchar(100) NOT NULL DEFAULT '',
  `logins` int(10) UNSIGNED DEFAULT '0',
  `last_ip` varchar(50) DEFAULT NULL,
  `last_time` int(10) UNSIGNED DEFAULT '0',
  `salt` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `db_admins`
--

INSERT INTO `db_admins` (`id`, `admin_name`, `admin_pwd`, `logins`, `last_ip`, `last_time`, `salt`) VALUES
(1, 'admin', 'ff4f07e4fa9a1353c287a609e683e569', 8, '192.168.1.100', 1538185903, '6455ec'),
(2, 'testok', '16f1fcd1098499589907dd753530b237', 0, NULL, 0, '225a7a');

-- --------------------------------------------------------

--
-- 表的结构 `db_admins_logs`
--

CREATE TABLE `db_admins_logs` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `admin_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '关联ID',
  `admin_name` varchar(50) NOT NULL COMMENT '称呼',
  `info` varchar(255) NOT NULL COMMENT '日志信息',
  `ip` varchar(50) NOT NULL COMMENT '操作IP',
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `url` varchar(250) DEFAULT NULL,
  `url_method` varchar(50) DEFAULT NULL,
  `contents` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员操作日志';

--
-- 转存表中的数据 `db_admins_logs`
--

INSERT INTO `db_admins_logs` (`id`, `admin_id`, `admin_name`, `info`, `ip`, `dateline`, `url`, `url_method`, `contents`) VALUES
(1, 1, '1', 'test', '192.168.1.100', 1537504199, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(2, 1, '1', 'test', '192.168.1.100', 1537504235, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(3, 1, '1', 'test', '192.168.1.100', 1537504252, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(4, 1, '1', 'test', '192.168.1.100', 1537504275, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(5, 1, '1', 'test', '192.168.1.100', 1537504285, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(6, 1, '1', 'test', '192.168.1.100', 1537504295, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(7, 1, '1', 'test', '192.168.1.100', 1537504310, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(8, 1, '1', 'test', '192.168.1.100', 1537510734, 'http://www.wustudy.com/admin/login/index.html', 'GET', '参数：'),
(9, 1, 'admin', '管理员登录', '192.168.1.100', 1537511467, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(10, 1, 'admin', '管理员登录', '192.168.1.100', 1537511501, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(11, 1, 'admin', '管理员登录', '192.168.1.100', 1537540516, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(12, 1, 'admin', '添加了登录名为{testok}的管理员', '192.168.1.100', 1537586082, 'http://www.wustudy.com/admin/admins/add.html', 'POST', '参数：admin_name,password,'),
(13, 1, 'admin', '修改了登录名为{admin}管理员的登录密码', '192.168.1.100', 1537587358, 'http://www.wustudy.com/admin/admins/edit/id/1.html', 'POST', '参数：password,repassword,id,'),
(14, 1, 'admin', '管理员登录', '192.168.1.100', 1537587367, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(15, 1, 'admin', '修改了登录名为{admin}管理员的登录密码', '192.168.1.100', 1537587382, 'http://www.wustudy.com/admin/admins/edit/id/1.html', 'POST', '参数：password,repassword,id,'),
(16, 1, 'admin', '管理员登录', '192.168.1.100', 1537587389, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(17, 1, 'admin', '添加了名称为{个人生活}的类别', '192.168.1.100', 1537600765, 'http://www.wustudy.com/admin/cate/add.html', 'POST', '参数：topic,'),
(18, 1, 'admin', '修改了名称为{个人生活}的类别', '192.168.1.100', 1537601269, 'http://www.wustudy.com/admin/cate/edit/id/1.html', 'POST', '参数：topic,sort_id,id,'),
(19, 1, 'admin', '添加了名称为{PHP}的类别', '192.168.1.100', 1537601395, 'http://www.wustudy.com/admin/cate/add.html', 'POST', '参数：topic,sort_id,'),
(20, 1, 'admin', '添加了名称为{MySQL}的类别', '192.168.1.100', 1537601410, 'http://www.wustudy.com/admin/cate/add.html', 'POST', '参数：topic,sort_id,'),
(21, 1, 'admin', '新增了文章', '192.168.1.100', 1537629199, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,contents,'),
(22, 1, 'admin', '新增了文章', '192.168.1.100', 1537681834, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,editormd-markdown-doc,'),
(23, 1, 'admin', '新增了文章', '192.168.1.100', 1537683200, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,editormd-markdown-doc,'),
(24, 1, 'admin', '修改了文章', '192.168.1.100', 1537683213, 'http://www.wustudy.com/admin/article/edit/id/3.html', 'POST', '参数：topic,cate_id,editormd-markdown-doc,id,'),
(25, 1, 'admin', '管理员登录', '192.168.1.100', 1538102241, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(26, 1, 'admin', '新增了文章', '192.168.1.100', 1538102286, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,editormd-markdown-doc,'),
(27, 1, 'admin', '修改了文章', '192.168.1.100', 1538102516, 'http://www.wustudy.com/admin/article/edit/id/4.html', 'POST', '参数：topic,cate_id,editormd-markdown-doc,id,'),
(28, 1, 'admin', '新增了文章', '192.168.1.100', 1538113021, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,contents,'),
(29, 1, 'admin', '修改了文章', '192.168.1.100', 1538144135, 'http://www.wustudy.com/admin/article/edit/id/5.html', 'POST', '参数：topic,cate_id,contents,id,'),
(30, 1, 'admin', '新增了文章', '192.168.1.100', 1538144165, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,contents,'),
(31, 1, 'admin', '修改了文章', '192.168.1.100', 1538144267, 'http://www.wustudy.com/admin/article/edit/id/6.html', 'POST', '参数：topic,cate_id,contents,id,'),
(32, 1, 'admin', '修改了文章', '192.168.1.100', 1538144701, 'http://www.wustudy.com/admin/article/edit/id/6.html', 'POST', '参数：topic,cate_id,contents,id,'),
(33, 1, 'admin', '修改了文章', '192.168.1.100', 1538144897, 'http://www.wustudy.com/admin/article/edit/id/6.html', 'POST', '参数：topic,cate_id,contents,id,'),
(34, 1, 'admin', '新增了文章', '192.168.1.100', 1538181457, 'http://www.wustudy.com/admin/article/add.html', 'POST', '参数：topic,cate_id,contents,'),
(35, 1, 'admin', '修改了文章', '192.168.1.100', 1538182306, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(36, 1, 'admin', '修改了文章', '192.168.1.100', 1538182358, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(37, 1, 'admin', '修改了文章', '192.168.1.100', 1538182405, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(38, 1, 'admin', '修改了文章', '192.168.1.100', 1538182581, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(39, 1, 'admin', '修改了文章', '192.168.1.100', 1538182691, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(40, 1, 'admin', '修改了文章', '192.168.1.100', 1538184461, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(41, 1, 'admin', '修改了文章', '192.168.1.100', 1538184499, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(42, 1, 'admin', '修改了文章', '192.168.1.100', 1538184535, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(43, 1, 'admin', '修改了文章', '192.168.1.100', 1538185494, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(44, 1, 'admin', '修改了文章', '192.168.1.100', 1538185852, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(45, 1, 'admin', '管理员登录', '192.168.1.100', 1538185903, 'http://www.wustudy.com/admin/login/index.html', 'POST', '参数：name,password,'),
(46, 1, 'admin', '修改了文章', '192.168.1.100', 1538186333, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(47, 1, 'admin', '修改了文章', '192.168.1.100', 1538186383, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(48, 1, 'admin', '修改了文章', '192.168.1.100', 1538186490, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(49, 1, 'admin', '修改了文章', '192.168.1.100', 1538186687, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,'),
(50, 1, 'admin', '修改了文章', '192.168.1.100', 1538187005, 'http://www.wustudy.com/admin/article/edit/id/7.html', 'POST', '参数：topic,cate_id,contents,id,');

-- --------------------------------------------------------

--
-- 表的结构 `db_article`
--

CREATE TABLE `db_article` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `topic` varchar(255) NOT NULL,
  `cate_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `defaultpic` varchar(255) DEFAULT NULL,
  `contents` mediumtext NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `is_post` tinyint(1) UNSIGNED DEFAULT '0',
  `views` int(10) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `db_article`
--

INSERT INTO `db_article` (`id`, `topic`, `cate_id`, `defaultpic`, `contents`, `dateline`, `tags`, `is_post`, `views`) VALUES
(1, '45345', 2, NULL, '543534', 1537629199, NULL, 1, 0),
(2, 'fdsfds', 1, NULL, 'fdsf\n```php\n<?php\necho \"test\"\n```', 1537681834, NULL, 1, 0),
(3, '测试', 1, NULL, 'fdsf\n```php\n<?php\necho \"test\"\n```', 1537683200, NULL, 1, 0),
(4, '使用SORT进行排序', 2, NULL, '```go\npackage main\n\nimport(\n    \"fmt\"\n    \"sort\"\n)\n\nfunc main(){\n    var a[5]int = [5]int{5,4,3,2,1}\n    sort.Ints(a[:])\n    fmt.Println(a)\n\n    var b[5]string = [5]string{\"as\", \"dd\", \"book\", \"dot\", \"cat\"}\n    sort.Strings(b[:]) // 字符串排序\n    fmt.Println(\"b:\", b)\n\n    var c[5]float64 = [5]float64{22.1, 22.45, 32.22, 18.1, 76.5}\n    sort.Float64s(c[:]) // 浮点数排序\n    fmt.Println(\"c:\", c)\n}\n```', 1538102286, NULL, 1, 0),
(5, '测试kindeditor', 1, NULL, '<p>\n	fdsfdsfdsfds\n</p>\n<p>\n	<br />\n</p>\n<p>\n	<br />\n</p>\n<p style=\"font-size:18px;font-family:\" microsoft=\"\" yahei\";text-indent:2em;color:#404040;text-align:justify;background-color:#ffffff;\"=\"\">\n		外资新药在中国上市价格普遍高于欧美发达国家的定价，这种趋势随着国内药企的研发实力提升逐渐在改变。\n	</p>\n<p style=\"font-size:18px;font-family:\" microsoft=\"\" yahei\";text-indent:2em;color:#404040;text-align:justify;background-color:#ffffff;\"=\"\">\n		近日，默沙东公司公布了旗下PD-1药物帕博利珠<a href=\"http://money.163.com/keywords/5/5/53556297/1.html\" target=\"_blank\">单抗</a>注射液（Keytruda，中文商品名“可瑞达”，以下简称K药）在中国内地的售价和患者援助计划。据媒体报道，K药100mg/4ml的规格为17918元，每年的费用约为30万人民币左右。据了解，同一规格的K药在美国售价为33000元、中国香港为26200元；此外，对于低收入黑色素瘤患者，有买三赠三的赠药政策，一年费用只有16万人民币，低保的黑色素瘤患者可免费使用24个月。\n</p>\n<div>\n	<br />\n</div>\n<p>\n	<br />\n</p>', 1538113021, NULL, 1, 0),
(6, '测试测试', 2, NULL, '<pre class=\" language-javascript\">KindEditor<span class=\"token punctuation\">.</span><span class=\"token function\">ready</span><span class=\"token punctuation\">(</span><span class=\"token keyword keyword-function\">function</span><span class=\"token punctuation\">(</span><span class=\"token constant\">K</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">.</span><span class=\"token function\">create</span><span class=\"token punctuation\">(</span><span class=\"token string\">\'textarea[name=\"contents\"]\'</span><span class=\"token punctuation\">,</span> <span class=\"token punctuation\">{</span> uploadJson <span class=\"token punctuation\">:</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">.</span>basePath<span class=\"token operator\">+</span><span class=\"token string\">\'php/qiniu/upload_json.php\'</span><span class=\"token punctuation\">,</span> fileManagerJson <span class=\"token punctuation\">:</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">.</span>basePath<span class=\"token operator\">+</span><span class=\"token string\">\'php/qiniu/file_manager_json.php\'</span><span class=\"token punctuation\">,</span> dialogOffset <span class=\"token punctuation\">:</span> <span class=\"token number\">0</span><span class=\"token punctuation\">,</span> <span class=\"token comment\">//对话框距离页面顶部的位置，默认为0居中，</span> allowFileManager <span class=\"token punctuation\">:</span> <span class=\"token boolean\">true</span><span class=\"token punctuation\">,</span> allowImageUpload <span class=\"token punctuation\">:</span> <span class=\"token boolean\">true</span><span class=\"token punctuation\">,</span> allowMediaUpload <span class=\"token punctuation\">:</span> <span class=\"token boolean\">true</span><span class=\"token punctuation\">,</span> <span class=\"token comment\">//cssPath : [K.basePath+\'plugins/code/prism.css\'], //网编辑器中插入自定义的 css</span> <span class=\"token comment\">//jsPath: [\'http://www.r9it.com/assets/themes/twitter/js/jquery-1.11.1.min.js\'], // 插入自定义的脚本</span> <span class=\"token function-variable function\">afterCreate</span> <span class=\"token punctuation\">:</span> <span class=\"token keyword keyword-function\">function</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> <span class=\"token keyword keyword-var\">var</span> self <span class=\"token operator\">=</span> <span class=\"token keyword keyword-this\">this</span><span class=\"token punctuation\">;</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">.</span><span class=\"token function\">ctrl</span><span class=\"token punctuation\">(</span>document<span class=\"token punctuation\">,</span> <span class=\"token number\">13</span><span class=\"token punctuation\">,</span> <span class=\"token keyword keyword-function\">function</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> self<span class=\"token punctuation\">.</span><span class=\"token function\">sync</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">(</span><span class=\"token string\">\'form[name=example]\'</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">[</span><span class=\"token number\">0</span><span class=\"token punctuation\">]</span><span class=\"token punctuation\">.</span><span class=\"token function\">submit</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">.</span><span class=\"token function\">ctrl</span><span class=\"token punctuation\">(</span>self<span class=\"token punctuation\">.</span>edit<span class=\"token punctuation\">.</span>doc<span class=\"token punctuation\">,</span> <span class=\"token number\">13</span><span class=\"token punctuation\">,</span> <span class=\"token keyword keyword-function\">function</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> self<span class=\"token punctuation\">.</span><span class=\"token function\">sync</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token constant\">K</span><span class=\"token punctuation\">(</span><span class=\"token string\">\'form[name=example]\'</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">[</span><span class=\"token number\">0</span><span class=\"token punctuation\">]</span><span class=\"token punctuation\">.</span><span class=\"token function\">submit</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span><span class=\"token punctuation\">,</span> showHelpGrid<span class=\"token punctuation\">:</span> <span class=\"token boolean\">true</span><span class=\"token punctuation\">,</span> <span class=\"token comment\">// 是否显示输入辅助线</span> themeType <span class=\"token punctuation\">:</span> <span class=\"token string\">\"primary\"</span><span class=\"token punctuation\">,</span> <span class=\"token comment\">//主题</span> <span class=\"token comment\">//错误处理 handler</span> <span class=\"token function-variable function\">errorMsgHandler</span> <span class=\"token punctuation\">:</span> <span class=\"token keyword keyword-function\">function</span><span class=\"token punctuation\">(</span>message<span class=\"token punctuation\">,</span> type<span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> <span class=\"token keyword keyword-try\">try</span> <span class=\"token punctuation\">{</span> JDialog<span class=\"token punctuation\">.</span><span class=\"token function\">msg</span><span class=\"token punctuation\">(</span><span class=\"token punctuation\">{</span>type<span class=\"token punctuation\">:</span>type<span class=\"token punctuation\">,</span> content<span class=\"token punctuation\">:</span>message<span class=\"token punctuation\">,</span> timer<span class=\"token punctuation\">:</span><span class=\"token number\">2000</span><span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span> <span class=\"token keyword keyword-catch\">catch</span> <span class=\"token punctuation\">(</span>Error<span class=\"token punctuation\">)</span> <span class=\"token punctuation\">{</span> <span class=\"token function\">alert</span><span class=\"token punctuation\">(</span>message<span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span> <span class=\"token punctuation\">}</span> <span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span> <span class=\"token punctuation\">}</span><span class=\"token punctuation\">)</span><span class=\"token punctuation\">;</span></pre>\n<br />', 1538144165, NULL, 1, 0),
(7, '333', 1, NULL, '<pre class=\"line-numbers\"><code class=\"language-go\"> package main  \nimport ( \n    \"fmt\" \n)\n\nfunc main() {\n	const a int = 100\n	fmt.Printf(\"a=%d\\n\", a)\n}</code></pre>', 1538181457, NULL, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `db_cate`
--

CREATE TABLE `db_cate` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `topic` varchar(150) NOT NULL,
  `sort_id` int(8) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `db_cate`
--

INSERT INTO `db_cate` (`id`, `topic`, `sort_id`) VALUES
(1, '个人生活', 0),
(2, 'PHP', 1),
(3, 'MySQL', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_admins`
--
ALTER TABLE `db_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_admins_logs`
--
ALTER TABLE `db_admins_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_article`
--
ALTER TABLE `db_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_cate`
--
ALTER TABLE `db_cate`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `db_admins`
--
ALTER TABLE `db_admins`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `db_admins_logs`
--
ALTER TABLE `db_admins_logs`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用表AUTO_INCREMENT `db_article`
--
ALTER TABLE `db_article`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `db_cate`
--
ALTER TABLE `db_cate`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
