--liquibase formatted sql

--changeset wfs:1
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('app', NULL, '{bcrypt}$2a$06$xOud6hU9X103I5PHlA6qk.GbutDpwnTHryKDcisGE6ByP7CO0XYmW', 'app', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('cmb', NULL, '{bcrypt}$2a$10$0YqfBvyEgD/F9xO/6mCrB.XvtooPAjT1xEHYWkC5g9GHfnwmIt02e', 'cmb', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES ('web', NULL, '{bcrypt}$2a$10$UqQQEY2QOdKfgpbnbmVS7ejbHigEdXbokru1aImFfX58Lat8hy4we', 'web', 'client_credentials,password,refresh_token', NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `tb_account` (`id`, `username`, `password`, `gesture_password`, `finger_password`, `nickname`, `phone`, `def_type`, `def_tenant`, `openid`, `ctime`, `creator_id`, `creator`, `mtime`, `modifier_id`, `del_flag`, `modifier`, `def_student`, `avatar`) VALUES ('3', 'maintain', '{bcrypt}$2a$10$FDau4qk/UXI/lSD2Ax5QgON56adrRBhNJd7thpO3HYcVd5hUhP7nq', NULL, NULL, 'maintain', '15259737881', '3', '0', 'oFw2V6zuf1uMVQS9JYQmdPNlgpPk', '2018-08-14 10:57:37', NULL, NULL, '2024-02-03 16:31:51', NULL, '0', NULL, NULL, NULL);

INSERT INTO `tb_group` (`id`, `name`, `remark`, `unit_id`, `data_scope`, `tenant_id`, `group_type`, `status`) VALUES ('2', '管理员', '管理员', '-1', '3', '0', '1', '1');
INSERT INTO `tb_group` (`id`, `name`, `remark`, `unit_id`, `data_scope`, `tenant_id`, `group_type`, `status`) VALUES ('3', '超级管理员', '超级管理员', '-1', '0', '0', '0', '1');
INSERT INTO `tb_group` (`id`, `name`, `remark`, `unit_id`, `data_scope`, `tenant_id`, `group_type`, `status`) VALUES ('4', '开发角色', '开发角色', '-1', '3', '0', '1', '1');

INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('2', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('3', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('4', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('5', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('6', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('7', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('8', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('9', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('10', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('11', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('12', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('13', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1001', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1003', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1061795714310340609', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1061796635891204097', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1061796792326160384', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1061796876346458113', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1061796962749120512', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062237803993104384', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062239403281219584', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062239572546551808', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062239650648686593', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062239772619046913', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062239960465145856', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062240022591176704', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062240186521354241', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062240281648168960', '2');
INSERT INTO `tb_group_resource` (`fk_resource_id`, `fk_group_id`) VALUES ('1062240364850577408', '2');


INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('2', '/count-to/count-to', 'user:list', '', '4', '用户管理', '1', '/upms/user-list', '1', 'md-contacts', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('3', '/count-to/count-to', 'user:save', '', '3', '保存用户', '2', '', '2', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('4', '/count-to/count-to', 'user:delete', '', '4', '删除用户', '2', '', '2', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('5', '/count-to/count-to', 'user:edit', '', '5', '编辑用户', '2', '', '2', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('6', '/count-to/count-to', 'group:list', '', '5', '角色管理', '1', '/upms/group-list', '1', 'ios-people', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('7', 'ACCOUNT_GROUP_SAVE', 'group:save', '', '7', '保存组', '2', '', '6', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('8', 'ACCOUNT_GROUP_EDIT', 'group:edit', '', '8', '编辑组', '2', '', '6', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('9', 'ACCOUNT_GROUP_DELETE', 'group:delete', '', '9', '删除组', '2', '', '6', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('10', '/count-to/count-to', 'resource:list', '', '6', '资源管理', '1', '/upms/resource-mgr', '1', 'ios-basket-outline', '0', '2', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('11', 'ACCOUNT_RESOURCE_SAVE', 'resource:save', '', '11', '保存资源', '2', '', '10', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('12', 'ACCOUNT_RESOURCE_EDIT', 'resource:edit', '', '12', '编辑资源', '2', '', '10', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('13', 'ACCOUNT_RESOURCE_DELETE', 'resource:delete', '', '13', '删除资源', '2', '', '10', '', '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1001', NULL, 'attendance-manager/day-summary', NULL, '4', '每日统计', '1', '/attendance-manager/day-summary', '1234295088964755457', NULL, '0', '3', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1003', NULL, 'attendance-manager/original-attendance', NULL, '5', '原始记录', '1', '/attendance-manager/original-attendance', '1234295088964755457', NULL, '0', '3', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1061795714310340609', NULL, 'job:list', NULL, '26', '定时任务', '1', '/upms/job-manager', '14', NULL, '0', '2', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1061796635891204097', NULL, 'job:start', NULL, '26', '启动定时任务', '2', NULL, '1061795714310340609', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1061796792326160384', NULL, 'job:stop', NULL, '27', '停止定时任务', '2', NULL, '1061795714310340609', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1061796876346458113', NULL, 'job:pause', NULL, '28', '暂停定时任务', '2', NULL, '1061795714310340609', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1061796962749120512', NULL, 'job:resmue', NULL, '29', '恢复定时任务', '2', NULL, '1061795714310340609', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062237803993104384', NULL, 'user:list', NULL, '1', '查看用户列表', '2', NULL, '2', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062239403281219584', NULL, 'group:list', NULL, '1', '查看组', '2', NULL, '6', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062239572546551808', NULL, 'resource:list', NULL, '1', '查看资源', '2', NULL, '10', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062239650648686593', NULL, 'unit:list', NULL, '1', '查看架构', '2', NULL, '990792035847897088', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062239772619046913', NULL, 'unit:edit', NULL, '2', '编辑架构', '2', NULL, '990792035847897088', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062239960465145856', NULL, 'unit:save', NULL, '3', '保存架构', '2', NULL, '990792035847897088', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062240022591176704', NULL, 'unit:delete', NULL, '4', '删除架构', '2', NULL, '990792035847897088', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062240186521354241', NULL, 'data-dictionary:list', NULL, '37', '查看数据字典', '2', NULL, '15', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062240281648168960', NULL, 'dictionary-category:list', NULL, '1', '查看字典类别', '2', NULL, '19', NULL, '0', '1', '-1');
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1062240364850577408', NULL, 'job:list', NULL, '1', '查看定时任务', '2', NULL, '1061795714310340609', NULL, '0', '1', '-1');

INSERT INTO `tb_group_user` (`fk_group_id`, `fk_user_id`) VALUES ('2', '3');

INSERT INTO `tb_user` (`id`, `state`, `unit_id`, `ctime`, `creator_id`, `mtime`, `modifier_id`, `del_flag`, `tenant_id`, `type`, `creator`, `modifier`, `account_id`, `tenant_no`) VALUES ('3', '1', '1753311069616480257', '2018-08-14 10:57:37', NULL, '2024-02-03 16:31:51', NULL, '0', '0', '3', NULL, NULL, '3', '0');

--changeset wfs:2
INSERT INTO `tb_resource` (`id`, `component`, `permission`, `remark`, `sort`, `name`, `type`, `value`, `fk_parent_id`, `icon`, `tenant_id`, `platform_type`, `resource_fk_id`) VALUES ('1', 'main', 'upms', '', '12', '系统管理', '1', '/account', NULL, 'logo-buffer', '0', '1', '-1');

--changeset wfs:3
INSERT INTO `tb_resource` VALUES ('1810233573149229057', null, null, null, '7', '字典类别', '1', '/dictionary/dictionary-category', '1', '', '0', '1', '-1');
INSERT INTO `tb_resource` VALUES ('1810233791907348481', null, null, null, '8', '字典管理', '1', '/dictionary/dictionary', '1', '', '0', '1', '-1');
INSERT INTO `tb_group_resource` VALUES ('1810233573149229057', '2');
INSERT INTO `tb_group_resource` VALUES ('1810233791907348481', '2');

--changeset wfs:4
INSERT INTO `tb_resource` VALUES ('14', null, null, null, '9', '部门管理', '1', '/upms/department-management', '1', '', '0', '1', '-1');
INSERT INTO `tb_group_resource` VALUES ('14', '2');