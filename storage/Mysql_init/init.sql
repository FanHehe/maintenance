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
create table if not exists `tbl_user` (
    `id` int(11) unsigned not null auto_increment,
    `username` varchar(40) not null unique,
    `password` varchar(40) not null,
    `real_name` varchar(40) default null,
    `preview` varchar(100) default  null,
    `nickname` varchar(40) not null unique,
    `create_time` timestamp  default current_timestamp,
    `gender`  enum ( 'male', 'femail' ) default null,
    `email` varchar(40) default null unique,
    `telephone` int(11) unique,
    `qq` varchar(20)  default null,
    `status` tinyint(1) unsigned default 1,
    `college` varchar(40) default null,
    `ip` varchar(20) default null,
    key (`id`),
    primary key (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

### 文章表
create table if not exists tbl_article (
    `id` int(11) not null auto_increment,
    `author` varchar(40) not null,
    `type` int(4) not null,
    `title` varchar(20) not null,
    `content` mediumtext,
    `status` tinyint(1) default 1,
    `create_time` timestamp default current_timestamp,
    `last_modify_time` timestamp default current_timestamp on update current_timestamp,
    key (`id`),
    primary key (`author`, `title`),
    foreign key (`author`) references tbl_user (`username`)
);

### 评论表
create table if not exists`tbl_article_comments` (
    `id` int(11) unsigned not null auto_increment,
    `username` varchar(40) not null,
    `reply_to` varchar(40) default null,
    `parent_id` int(11) default null,
    `create_time` timestamp not null default CURRENT_TIMESTAMP,
    `content` text not null,
    primary key (`id`),
    KEY `FOREIGN` (`username`),
    KEY `reply_to` (`reply_to`),
    CONSTRAINT `tbl_article_comments_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tbl_user` (`username`),
    CONSTRAINT `tbl_article_comments_ibfk_2` FOREIGN KEY (`reply_to`) REFERENCES `tbl_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

## 插入 `tbl_user` 表
insert into tbl_user ( username, password, nickname ) values ( "fanhehe", "13889441200", "fanhehe" );

## 插入 `tbl_article` 表
insert into tbl_article ( author, title, content, type ) values ( "fanhehe", "测试文章", "这是一个很久远的故事", 1);

## 取消 tbl_user 表中 telephone 的 unique 属性
## alter table `tbl_user` DROP INDEX `telephone`;
## 增加 tbl_user 表中 telephone 的 unique 属性 (telephone 字段不能加引号)
## alter table `tbl_user` ADD UNIQUE (telephone);
## 增加 tbl_article 外键约束
## alert table `tbl_article` foreign key (author) references `tbl_user` (`username`);
