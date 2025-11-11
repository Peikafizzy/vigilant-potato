--liquibase formatted sql

--changeset wfs:1
-- ----------------------------
-- Table structure for doc_doc
-- ----------------------------
DROP TABLE IF EXISTS `doc_doc`;
CREATE TABLE `doc_doc` (
  `id` bigint(20) NOT NULL,
  `type` varchar(30) DEFAULT NULL COMMENT '文件系统类别（本地/招行云/华为云...）',
  `doc_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `mtime` datetime DEFAULT NULL COMMENT '修改时间',
  `creator_id` varchar(32) DEFAULT NULL COMMENT '创建者',
  `creator` varchar(32) DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modifier_id` varchar(32) DEFAULT NULL COMMENT '修改者',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识 0正常 1.删除',
  `optimistic_lock` bigint(20) DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件信息表';

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(128) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(128) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(128) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `username` varchar(16) DEFAULT NULL COMMENT '用户名',
  `password` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `gesture_password` text COMMENT '手势密码',
  `finger_password` text COMMENT '指纹密码',
  `nickname` varchar(16) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(16) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `def_type` tinyint(1) DEFAULT NULL COMMENT '默认用户类型',
  `def_tenant` bigint(20) DEFAULT NULL COMMENT '默认租户',
  `openid` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '招行小程序openid',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `mtime` datetime DEFAULT NULL COMMENT '更新时间',
  `modifier_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除状态0.可用1.删除',
  `modifier` varchar(30) DEFAULT NULL COMMENT '更新人',
  `def_student` bigint(20) DEFAULT NULL COMMENT '默认子女ID',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='帐号表';

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `name` varchar(16) NOT NULL COMMENT '名称',
  `remark` text COMMENT '备注',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '组织机构id',
  `data_scope` tinyint(4) DEFAULT NULL COMMENT '数据权限',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `group_type` tinyint(1) DEFAULT '1' COMMENT '角色类型 0.默认角色 1.普通角色',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 0.禁用 1.启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Table structure for tb_group_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_resource`;
CREATE TABLE `tb_group_resource` (
  `fk_resource_id` bigint(20) NOT NULL COMMENT '资源id',
  `fk_group_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`fk_resource_id`,`fk_group_id`),
  KEY `fk_q82fpmfh128qxoeyymrkg71e2` (`fk_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色资源表';

-- ----------------------------
-- Table structure for tb_group_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_unit`;
CREATE TABLE `tb_group_unit` (
  `group_id` bigint(20) NOT NULL COMMENT '角色id',
  `unit_id` bigint(20) NOT NULL COMMENT '机构id',
  PRIMARY KEY (`group_id`,`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色机构表';

-- ----------------------------
-- Table structure for tb_group_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_user`;
CREATE TABLE `tb_group_user` (
  `fk_group_id` bigint(20) NOT NULL COMMENT '角色id',
  `fk_user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`fk_group_id`,`fk_user_id`),
  KEY `fk_7k068ltfepa1q75qtmvxuawk` (`fk_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色用户表';

-- ----------------------------
-- Table structure for tb_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `component` varchar(64) DEFAULT NULL COMMENT '页面标识',
  `permission` varchar(64) DEFAULT NULL COMMENT '权限标识',
  `remark` text COMMENT '备注',
  `sort` int(11) NOT NULL COMMENT '排序',
  `name` varchar(16) NOT NULL COMMENT '名称',
  `type` int(11) NOT NULL COMMENT '类型 1菜单，2按钮',
  `value` varchar(256) DEFAULT NULL COMMENT '路径',
  `fk_parent_id` bigint(20) DEFAULT NULL COMMENT '上级资源id',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `platform_type` tinyint(1) DEFAULT '2' COMMENT '平台类型 1.全部 2.运营平台 3.校园平台',
  `resource_fk_id` bigint(20) DEFAULT NULL COMMENT '外联资源id,表示该资源来自哪个id的资源',
  PRIMARY KEY (`id`),
  KEY `fk_k2heqvi9muk4cjyyd53r9y37x` (`fk_parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Table structure for tb_unit
-- ----------------------------
DROP TABLE IF EXISTS `tb_unit`;
CREATE TABLE `tb_unit` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级编号',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `org_code` varchar(2000) DEFAULT NULL COMMENT '部门编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '机构类型',
  `master` bigint(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(16) DEFAULT NULL COMMENT '电话',
  `state` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `mtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标识',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(30) DEFAULT NULL COMMENT '修改人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `idx_org_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_org_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构表';

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态 0-禁用 1-启用',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '组织机构id',
  `ctime` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `mtime` datetime DEFAULT NULL COMMENT '更新时间',
  `modifier_id` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `del_flag` tinyint(1) DEFAULT '0' COMMENT '删除状态',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `type` tinyint(1) DEFAULT NULL COMMENT '用户类型 1.学生 2.教职工',
  `creator` varchar(30) DEFAULT NULL COMMENT '创建人',
  `modifier` varchar(30) DEFAULT NULL COMMENT '修改人',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账号id',
  `tenant_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '租户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--changeset chx:1
-- ----------------------------
-- Table structure for tb_data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_dictionary`;
CREATE TABLE `tb_data_dictionary` (
  `name` varchar(16) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `fk_category_id` bigint(30) DEFAULT NULL,
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';
-- ----------------------------
-- Table structure for tb_dictionary_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary_category`;
CREATE TABLE `tb_dictionary_category` (
  `code` varchar(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `remove_able` tinyint(1) DEFAULT NULL,
  `edit_able` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类别';

--changeset wfs:2
ALTER TABLE tb_dictionary_category MODIFY COLUMN `code` VARCHAR(128);