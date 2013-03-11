-- phpMyAdmin SQL Dump
-- version 3.4.7.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 03 月 11 日 04:41
-- 服务器版本: 5.5.20
-- PHP 版本: 5.2.9-1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `school`
--

-- --------------------------------------------------------

--
-- 表的结构 `citys`
--

CREATE TABLE IF NOT EXISTS `citys` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `parent_id` smallint(6) DEFAULT '0' COMMENT '上级ID',
  `type` tinyint(4) DEFAULT '0' COMMENT '城市类型，0-省，1-市，2-县',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，1 为正常，0 审核中',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3193 ;

-- --------------------------------------------------------

--
-- 表的结构 `school`
--

CREATE TABLE IF NOT EXISTS `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学校ID',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '校园描述',
  `type` tinyint(4) NOT NULL COMMENT '学校类型',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，1 为正常，0 审核中， 2..',
  `create_user` int(11) DEFAULT '0' COMMENT '创建人, 0 为匿名',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_correct`
--

CREATE TABLE IF NOT EXISTS `school_correct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL COMMENT '需要修正的记录的ID',
  `type` tinyint(4) NOT NULL COMMENT '修正类型',
  `content` text NOT NULL COMMENT '修正内容',
  `create_user` int(11) DEFAULT '0' COMMENT '创建者',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `reason` varchar(200) DEFAULT '' COMMENT '审核原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='修正记录' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_link`
--

CREATE TABLE IF NOT EXISTS `school_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `title` varchar(20) NOT NULL COMMENT '链接标题',
  `url` varchar(100) NOT NULL COMMENT '连接地址',
  `create_user` int(11) DEFAULT '0',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学校的相关链接' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_note`
--

CREATE TABLE IF NOT EXISTS `school_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '校园ID',
  `title` varchar(20) NOT NULL COMMENT '记事标题',
  `content` varchar(200) NOT NULL COMMENT '记事内容',
  `occurrence_time` char(12) NOT NULL COMMENT '事件发生时间',
  `create_user` int(11) DEFAULT '0' COMMENT '创建者',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，0 审核中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校园记事' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_pic`
--

CREATE TABLE IF NOT EXISTS `school_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL COMMENT '学校ID',
  `zone_id` int(11) NOT NULL COMMENT '所属校区的ID',
  `title` varchar(20) DEFAULT '' COMMENT '图片标题',
  `name` varchar(20) NOT NULL COMMENT '图片存放在磁盘上的名称',
  `thumb` varchar(30) DEFAULT '' COMMENT '缩略图名称',
  `path` varchar(100) NOT NULL COMMENT '图片存放路径',
  `create_user` int(11) DEFAULT '0',
  `create_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校园图片' AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_pic_desc`
--

CREATE TABLE IF NOT EXISTS `school_pic_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_id` int(11) NOT NULL COMMENT '图片ID',
  `desc` text NOT NULL COMMENT '描述内容',
  `create_user` int(11) DEFAULT '0' COMMENT '创建者ID，0 匿名',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态， 0 待审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校园图片描述' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_type`
--

CREATE TABLE IF NOT EXISTS `school_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `parent_id` tinyint(4) DEFAULT '0' COMMENT '父ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校园分类' AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- 表的结构 `school_zone`
--

CREATE TABLE IF NOT EXISTS `school_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '校区ID',
  `school_id` int(11) NOT NULL COMMENT '校园ID',
  `name` varchar(30) NOT NULL COMMENT '校区名称',
  `desc` varchar(500) DEFAULT '' COMMENT '校区描述',
  `type` tinyint(4) NOT NULL COMMENT '校区类型',
  `address` varchar(200) NOT NULL COMMENT '校区地址',
  `latitude` float DEFAULT '0' COMMENT '纬度',
  `longitude` float DEFAULT '0' COMMENT '经度',
  `provinces` smallint(6) DEFAULT '0' COMMENT '所在省ID',
  `city` smallint(6) DEFAULT '0' COMMENT '所在市ID',
  `county` smallint(6) DEFAULT '0' COMMENT '所在县ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  `create_user` int(11) DEFAULT '0' COMMENT '创建者ID，0 匿名',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='校区' AUTO_INCREMENT=3 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
