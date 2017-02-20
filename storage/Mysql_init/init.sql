# 数据库初始化 from fanhehe.com "vcrmp3@gmail.com"
## PS: 所有语句 都经过Mysql v5.7.16 from homebrew 测试.

USE mysql;

## 数据库用户设置
UPDATE user set Password=PASSWORD("13889441200") where user="root";
INSERT into user (Host, User, Password) values ("%", "fanhehe", "13889441200");
GRANT all privileges on Main.* to "fanhehe"@"%" identified by "123456";

## 创建数据库
create database Main;
	use Main;

## 创建表信息 " `` " 可以完全不加，并忽略大小写。
### 用户表
CREATE TABLE `tbl_user` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`username` varchar(40) NOT NULL,
	`password` varchar(40) NOT NULL,
	`real_name` varchar(40) DEFAULT NULL,
	`preview` varchar(100) DEFAULT NULL,
	`nickname` varchar(40) NOT NULL,
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`gender` enum('male','femail') DEFAULT NULL,
	`email` varchar(40) DEFAULT NULL,
	`telephone` int(11) DEFAULT NULL,
	`qq` varchar(20) DEFAULT NULL,
	`status` tinyint(1) unsigned DEFAULT '1',
	`college` varchar(40) DEFAULT NULL,
	`ip` varchar(20) DEFAULT NULL,
	PRIMARY KEY (`username`),
	UNIQUE KEY `username` (`username`),
	UNIQUE KEY `nickname` (`nickname`),
	UNIQUE KEY `email` (`email`),
	UNIQUE KEY `telephone` (`telephone`),
	KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

### 文章表
CREATE TABLE `tbl_article` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`author` varchar(40) NOT NULL,
	`type` int(1) unsigned NOT NULL,
	`title` varchar(40) NOT NULL DEFAULT '',
	`content` mediumtext,
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`status` tinyint(1) unsigned DEFAULT '1',
	PRIMARY KEY (`id`),
	KEY `author` (`author`),
	CONSTRAINT `tbl_article_ibfk_1` FOREIGN KEY (`author`) REFERENCES `tbl_user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

### 评论表
CREATE TABLE `tbl_article_comments` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`username` varchar(40) NOT NULL,
	`reply_to` varchar(40) DEFAULT NULL,
	`article_id` int(11) unsigned NOT NULL,
	`parent_id` int(11) unsigned DEFAULT NULL,
	`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`content` text NOT NULL,
	`status` tinyint(1) unsigned zerofill DEFAULT '1',
	PRIMARY KEY (`id`),
	KEY `FOREIGN` (`username`),
	KEY `reply_to` (`reply_to`),
	KEY `article_id` (`article_id`),
	KEY `parent_id` (`parent_id`),
	CONSTRAINT `tbl_article_comments_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tbl_user` (`username`),
	CONSTRAINT `tbl_article_comments_ibfk_2` FOREIGN KEY (`reply_to`) REFERENCES `tbl_user` (`username`),
	CONSTRAINT `tbl_article_comments_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `tbl_article` (`id`),
	CONSTRAINT `tbl_article_comments_ibfk_4` FOREIGN KEY (`parent_id`) REFERENCES `tbl_article_comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

## 插入 `tbl_user` 表
# insert into tbl_user ( username, password, nickname ) values ( "fanhehe", "13889441200", "fanhehe" );

## 插入 `tbl_article` 表
# insert into tbl_article ( author, title, content, type ) values ( "fanhehe", "测试文章", "这是一个很久远的故事", 1);

## 取消 tbl_user 表中 telephone 的 unique 属性
#  alter table `tbl_user` DROP INDEX `telephone`;
## 增加 tbl_user 表中 telephone 的 unique 属性 (telephone 字段不能加引号)
#  alter table `tbl_user` ADD UNIQUE (telephone);
## 增加 tbl_article 外键约束
#  alert table `tbl_article` foreign key (author) references `tbl_user` (`username`);
