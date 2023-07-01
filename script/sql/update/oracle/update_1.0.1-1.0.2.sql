-- 修改表结构
alter table sys_dept modify(status char(1) default '1');
alter table sys_dict_data modify(status char(1) default '1');
alter table sys_dict_type modify(status char(1) default '1');
alter table sys_logininfor modify(status char(1) default '1');
alter table sys_menu modify(is_frame number(1) default 0);
alter table sys_menu modify(is_cache number(1) default 1);
alter table sys_menu modify(visible char(1) default '1');
alter table sys_menu modify(status char(1) default '1');
alter table sys_notice modify(status char(1) default '1');
alter table sys_oper_log modify(status number(1) default 1);
alter table sys_oss_config modify(status char(1) default '0');
alter table sys_post modify(status char(1));
alter table sys_role modify(status char(1));
alter table sys_tenant modify(status char(1) default '1');
alter table sys_tenant_package modify(status char(1) default '1');
alter table sys_user modify(status char(1) default '1');
comment on column sys_dept.status is '部门状态（1正常 0停用）';
comment on column sys_dept.del_flag is '删除标志（0代表存在 1代表删除）';
comment on column sys_dict_data.status is '状态（1正常 0停用）';
comment on column sys_dict_type.status is '状态（1正常 0停用）';
comment on column sys_logininfor.status is '状态（1正常 0停用）';
comment on column sys_menu.is_frame is '是否为外链（1是 0否）';
comment on column sys_menu.is_cache is '是否缓存（1缓存 0不缓存）';
comment on column sys_menu.visible is '显示状态（1显示 0隐藏）';
comment on column sys_menu.status is '菜单状态（1正常 0停用）';
comment on column sys_notice.status is '公告状态（1正常 0关闭）';
comment on column sys_oper_log.status is '操作状态（1正常 0异常）';
comment on column sys_oss_config.status is '是否默认（1=是,0=否）';
comment on column sys_post.status is '状态（1正常 0停用）';
comment on column sys_role.status is '角色状态（1正常 0停用）';
comment on column sys_role.del_flag is '删除标志（0代表存在 1代表删除）';
comment on column sys_tenant.status is '租户状态（1正常 0停用）';
comment on column sys_tenant.del_flag is '删除标志（0代表存在 1代表删除）';
comment on column sys_tenant_package.status is '状态（1正常 0停用）';
comment on column sys_tenant_package.del_flag is '删除标志（0代表存在 1代表删除）';
comment on column sys_user.status is '帐号状态（1正常 0停用）';
comment on column sys_user.del_flag is '删除标志（0代表存在 1代表删除）';

-- 存在数据时使用该脚本，对状态值取反
-- UPDATE sys_config SET is_global = 1 WHERE config_id = 5;
-- UPDATE sys_config SET is_global = 1 WHERE config_id = 11;
-- UPDATE sys_dept SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_dict_data SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_dict_type SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_dict_data SET dict_value = '1' WHERE dict_code = 4;
-- UPDATE sys_dict_data SET dict_value = '0' WHERE dict_code = 5;
-- UPDATE sys_dict_data SET dict_value = '1' WHERE dict_code = 6;
-- UPDATE sys_dict_data SET dict_value = '0' WHERE dict_code = 7;
-- UPDATE sys_dict_data SET dict_value = '1' WHERE dict_code = 16;
-- UPDATE sys_dict_data SET dict_value = '0' WHERE dict_code = 17;
-- UPDATE sys_dict_data SET dict_value = '1' WHERE dict_code = 27;
-- UPDATE sys_dict_data SET dict_value = '0' WHERE dict_code = 28;
-- UPDATE sys_menu SET status = DECODE(status, '1', '0', '1'),visible = DECODE(status, '1', '0', '1'),is_frame = DECODE(status, 1, 0, 1),is_cache = DECODE(status, 1, 0, 1);
-- UPDATE sys_notice SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_oss_config SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_oss_rule SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_post SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_role SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_tenant SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_tenant_package SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_user SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_logininfor SET status = DECODE(status, '1', '0', '1');
-- UPDATE sys_oper_log SET status = DECODE(status, '1', '0', '1');
-- 存在数据的情况，可以使用以上脚本替代
-- 修改表数据
UPDATE sys_config SET is_global = 1 WHERE config_id = 5;
UPDATE sys_config SET is_global = 1 WHERE config_id = 11;
UPDATE sys_dept SET status = '1' WHERE dept_id = 100;
UPDATE sys_dept SET status = '1' WHERE dept_id = 101;
UPDATE sys_dept SET status = '1' WHERE dept_id = 102;
UPDATE sys_dept SET status = '1' WHERE dept_id = 103;
UPDATE sys_dept SET status = '1' WHERE dept_id = 104;
UPDATE sys_dept SET status = '1' WHERE dept_id = 105;
UPDATE sys_dept SET status = '1' WHERE dept_id = 106;
UPDATE sys_dept SET status = '1' WHERE dept_id = 107;
UPDATE sys_dept SET status = '1' WHERE dept_id = 108;
UPDATE sys_dept SET status = '1' WHERE dept_id = 109;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 1;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 2;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 3;
UPDATE sys_dict_data SET dict_value = '1', status = '1' WHERE dict_code = 4;
UPDATE sys_dict_data SET dict_value = '0', status = '1' WHERE dict_code = 5;
UPDATE sys_dict_data SET dict_value = '1', status = '1' WHERE dict_code = 6;
UPDATE sys_dict_data SET dict_value = '0', status = '1' WHERE dict_code = 7;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 12;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 13;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 14;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 15;
UPDATE sys_dict_data SET dict_value = '1', status = '1' WHERE dict_code = 16;
UPDATE sys_dict_data SET dict_value = '0', status = '1' WHERE dict_code = 17;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 18;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 19;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 20;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 21;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 22;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 23;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 24;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 25;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 26;
UPDATE sys_dict_data SET dict_value = '1', status = '1' WHERE dict_code = 27;
UPDATE sys_dict_data SET dict_value = '0', status = '1' WHERE dict_code = 28;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 29;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 30;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 31;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 32;
UPDATE sys_dict_data SET status = '1' WHERE dict_code = 33;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 1;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 2;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 3;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 6;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 7;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 8;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 9;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 10;
UPDATE sys_dict_type SET status = '1' WHERE dict_id = 11;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 2;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 3;
UPDATE sys_menu SET is_frame = 1, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 4;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 6;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 100;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 101;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 102;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 103;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 104;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 105;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 106;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 107;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 108;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 109;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 113;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 114;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 115;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 117;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 118;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 120;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 121;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 122;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 500;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 501;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1001;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1002;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1003;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1004;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1005;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1006;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1007;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1008;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1009;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1010;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1011;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1012;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1013;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1014;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1015;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1016;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1017;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1018;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1019;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1020;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1021;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1022;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1023;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1024;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1025;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1026;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1027;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1028;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1029;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1030;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1031;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1032;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1033;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1034;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1035;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1036;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1037;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1038;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1039;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1040;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1041;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1042;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1043;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1044;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1045;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1046;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1047;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1048;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1050;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1055;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1056;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1057;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1058;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1059;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1060;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1500;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1501;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1502;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1503;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1510;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1521;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1522;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1523;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1524;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1525;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1526;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1600;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1601;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1602;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1603;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1606;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1607;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1608;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1609;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1610;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1611;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1612;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1613;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1614;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1615;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1701;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1702;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1703;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1704;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1705;
UPDATE sys_menu SET is_frame = 0, is_cache = 1, visible = '1', status = '1' WHERE menu_id = 1706;
UPDATE sys_notice SET status = '1' WHERE notice_id = 1;
UPDATE sys_notice SET status = '1' WHERE notice_id = 2;
UPDATE sys_oss_config SET status = '1' WHERE oss_config_id = 1;
UPDATE sys_oss_config SET status = '0' WHERE oss_config_id = 2;
UPDATE sys_oss_config SET status = '0' WHERE oss_config_id = 3;
UPDATE sys_oss_config SET status = '0' WHERE oss_config_id = 4;
UPDATE sys_oss_config SET status = '0' WHERE oss_config_id = 5;
UPDATE sys_oss_rule SET status = '1' WHERE oss_rule_id = 1;
UPDATE sys_oss_rule SET status = '1' WHERE oss_rule_id = 2;
UPDATE sys_post SET status = '1' WHERE post_id = 1;
UPDATE sys_post SET status = '1' WHERE post_id = 2;
UPDATE sys_post SET status = '1' WHERE post_id = 3;
UPDATE sys_post SET status = '1' WHERE post_id = 4;
UPDATE sys_role SET status = '1' WHERE role_id = 1;
UPDATE sys_role SET status = '1' WHERE role_id = 2;
UPDATE sys_tenant SET status = '1' WHERE id = 1;
UPDATE sys_user SET status = '1' WHERE user_id = 1;
UPDATE sys_user SET status = '1' WHERE user_id = 2;
