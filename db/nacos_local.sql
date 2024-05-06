/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 127.0.0.1:3306
 Source Schema         : nacos_local

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 06/05/2024 16:18:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'group_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '配置的模式',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (13, 'dfs.yaml', 'dev', 'reading: longtime', 'b2aab97115bb5a36cf78596f1e291695', '2023-07-27 03:09:24', '2023-07-27 03:09:58', 'nacos', '127.0.0.1', '', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (15, 'dfs9102.yaml', 'dev', 'reading: longtime', 'b2aab97115bb5a36cf78596f1e291695', '2023-08-03 07:40:55', '2023-08-03 07:40:55', NULL, '127.0.0.1', '', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (16, 'gateway.yaml', 'dev', '[{\n      \"id\": \"dfs\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9101/\"\n  },{\n      \"id\": \"dfs9102\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs9102/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9102/\"\n  }\n  ]', '3b0f0037a5a60c650c89e2a65ec36b95', '2023-08-03 08:44:31', '2023-08-03 09:45:58', 'nacos', '127.0.0.1', '', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '', '', '', 'json', '', '');
INSERT INTO `config_info` VALUES (24, 'collect-prod.yaml', 'prod', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-08-07 08:06:02', '2023-08-07 08:06:02', NULL, '127.0.0.1', '', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (25, 'manage-prod.yaml', 'prod', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-08-07 08:24:51', '2023-08-07 08:24:51', NULL, '127.0.0.1', '', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (28, 'gateway.yml', 'prod', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"lb://manage\"\n  }\n  ]', '9bd9d801723257432cafcf2eaddc06c7', '2023-08-09 06:59:37', '2023-12-19 09:31:59', 'nacos', '127.0.0.1', '', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '', '', '', 'json', '', '');
INSERT INTO `config_info` VALUES (37, 'clusterManage-prod.yaml', 'prod', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-12-19 09:24:48', '2023-12-19 09:24:48', NULL, '127.0.0.1', '', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '', NULL, NULL, 'yaml', NULL, '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(0) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(0) UNSIGNED NOT NULL COMMENT 'id',
  `nid` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'dljt', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9100\r\n#  servlet:\r\n#    context-path: /dams\r\n#证书验证配置\r\nspringboot:\r\n  license:\r\n    verify:\r\n      subject: dams-1\r\n      publicAlias: aL9zs952UkvD9BTgENHT3iNE9sSU1WdsT5tYygtLWio=\r\n      publicKeysStorePath: /yozoCerts.store\r\n      storePass: V4RrJQX9c6aWma88qMUNXxWUcsoEm3csbgZE2L+NKho=\r\n      #证书存放路径\r\n      licensePath:  classpath:key/license.lic\r\n#报表地址\r\n#带项目名时为:/dams/ureport\r\n#不带项目名时为:/ureport\r\nureport:\r\n  path: /ureport\r\n\r\nspring:\r\n  data:\r\n    #ES配置\r\n    elasticsearch:\r\n      cluster-name: da-cluster\r\n      #若为es集群,多个用逗号分隔\r\n      cluster-nodes: 192.168.80.39:9300\r\n      #索引前缀，一般根据环境区分即可\r\n      prefix: mysqldl\r\n      #es加密设置\r\n      xpackSecurity:\r\n        #加密打开：true，关闭：false\r\n        xpack: true\r\n        user: elastic:TR54e$%STs#h\r\n        ca-crt: D:\\crt\\ca.crt\r\n        client-key: D:\\crt\\instance.key\r\n        client-crt: D:\\crt\\instance.crt\r\n  #redis配置\r\n  redis:\r\n    database: 9\r\n    host: 192.168.9.234\r\n    port: 6379\r\n    password: YM12wHlTNi8CO8cXab\r\n      #适配redis集群 注释host、port 放开下面代码\r\n      #cluster:\r\n    #nodes: 127.0.0.1:6380,127.0.0.1:6381,127.0.0.1:6382,127.0.0.1:6383\r\n    #适配redis集群 注释host、port 放开上面代码\r\n    lettuce:\r\n      pool:\r\n        max-active: 200\r\n        max-wait: -1ms\r\n        max-idle: 10\r\n        min-idle: 0\r\n    #连接超时时间（毫秒）\r\n    timeout: 5000ms\r\n  # 数据源配置\r\n  datasource:\r\n    druid:\r\n      driverClassName: com.mysql.cj.jdbc.Driver\r\n      #url: jdbc:mysql://192.168.80.39:3306/dams_server_dljt?useUnicode=true&characterEncoding=utf8&nullCatalogMeansCurrent=true&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      url: jdbc:mysql://192.168.80.39:3306/dams_server_dljt_0712?useUnicode=true&characterEncoding=utf8&nullCatalogMeansCurrent=true&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      username: root\r\n      password: KD98%#9$2J\r\n      initial-size: 10\r\n      max-active: 100\r\n      min-idle: 10\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 300000\r\n      max-evictable-idle-time-millis: 60000\r\n      validation-query: SELECT 1 FROM DUAL\r\n      # validation-query-timeout: 5000\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\r\n      #filters: #配置多个英文逗号分隔(统计，sql注入，log4j过滤)\r\n      filters: stat\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n      #--------------数据库备份配置-start-------------------\r\n      #备份数据库类型，达梦-dm  人大-kingbasees mysql-mysql\r\n      source-type: mysql\r\n      #备份数据库服务IP\r\n      host: 127.0.0.1\r\n      #备份数据库端口\r\n      port: 3306\r\n      #备份数据库的名称（模式名）\r\n      dbname: dams_server_dljt_0712\r\n      #备份数据库安装的基础路径\r\n      exedir: /opt/software/mysql5.7/bin\r\n      #window 备份文件的存放路径\r\n      winbakdir: d:\\\\database\\\\\r\n      #linux 备份文件存放路径\r\n      linuxbakdir: /data/database\r\n      #是否将文件备份到远程服务器\r\n      scpdbfile: false\r\n      #备份远程服务器地址\r\n      sshhost: 127.0.0.1\r\n      #远程服务器存放备份文件的路径\r\n      sshsavepath: /usr/local/src\r\n      # 备份模式\r\n      database-location-type: local\r\n      # true 开启 false 关闭（若档案服务与数据库没有部署在一起时，客户不能提供远程服务器密码，此功能不可用）\r\n      dbback-state: true\r\n      database-location-information:\r\n        remote-server: # remote 时，必须配置远程服务器信息，否则不可用\r\n          host: 127.0.0.1\r\n          user: root\r\n          password: root\r\n          port: 22\r\n      backup-location-type: local\r\n      backup-location-information:\r\n        local-server:\r\n          exe-dir: /usr/bin # 数据库安装的基础路径\r\n          bakck-dir: /data/database # 备份文件存放路径\r\n        remote-server:\r\n          host: 127.0.0.1\r\n          user: root\r\n          password: root\r\n          port: 22\r\n          exe-dir: /usr/bin\r\n          bakck-dir: /data/database\r\n      #--------------数据库备份配置-end-------------------\r\n#数据库备份配置-是否为远程数据库\r\ndbbackupparam:\r\n  #主要两种方式，本地：local 远程：remote\r\n  con-mode: local\r\n  remotehost:\r\n    #远程服务器地址\r\n    host: 127.0.0.1\r\n    #远程服务器用户名\r\n    user: root\r\n    #远程服务器用户密码\r\n    password: root\r\n    #远程服务端口\r\n    port: 22\r\n#工作流中配置数据库类型，达梦：oracle，人大：postgres，mysql:mysql\r\nprocessEngine:\r\n  configuration:\r\n    databaseType: mysql\r\n#日志级别配置\r\nlogging:\r\n  level:\r\n    com.yozosoft.dams.mapper.*: error\r\n\r\n#dfs上传下载文件接口地址配置\r\ndfs:\r\n  #savePath: http://192.168.80.38:9111/globalFile/saveFile\r\n  savePath: http://127.0.0.1:9101/globalFile/saveFile\r\n  #downPath: http://192.168.80.38:9111/globalFile/downLoadFile\r\n  downPath: http://127.0.0.1:9101/globalFile/downLoadFile\r\n#fcs配置\r\nfcs:\r\n  replacePath: xxx\r\n  path: http://192.168.80.39:9550/fcscloud\r\n# 存放有关文件地址的相关配置\r\nfile:\r\n  base:\r\n    #path: /opt/dams/file/doc/\r\n    path: F:\\tempPath\r\n  store:\r\n    url: http://127.0.0.1:9101/\r\n  isLocalStore: true\r\n#临时文件存放地址，末尾不加/或\\\\\r\n#temp_path: /opt/dams/file/temp/\r\ntemp_path: F:\\tempPath\r\n#系统配置菜单中默认背景图标的存放位置\r\nimage:\r\n  imagePath: file:/opt/dams/file/takes/\r\n  path: D:\\yozoSoft\\dljt\\pdf\r\n  pngPath: D:\\yozoSoft\\dljt\\png\r\n#ocr配置\r\ntessdata:\r\n  #  path: D:\\yozosoft\\tessdata\r\n  path: D:\\yozosoft\\tessdata\r\n  cachePath: D:\\yozosoft\\file\r\n#对接密集架系统\r\nshelving:\r\n  #密集架IP\r\n  ip: http://172.17.0.100:8733\r\n  #打开某区某列 POST请求 参数 location 说明:两个整数型字符串中间用逗号分隔，（区号,列号）\r\n  openColumn: /DFServer/RestFullWcf/OpenColumn\r\n  #显示3D定位图 说明: 5)发送档案信息，显示3D定位图 调用此接口，架体会打开档案存放位置的架体，\r\n  #同时在架体屏上有3D地震波显示，当有人走入架体时，还会有语音播报档案所在位置。\r\n  #location 四个整数型字符串中间用逗号分隔，（区号,列号,层号,节号）\r\n  #sn 档案编号\r\n  #name 档案名称\r\n  #islend 在库=0，外借=1\r\n  sendArchivesInfo: /DFServer/RestFullWcf/SendArchivesInfo\r\n  #温湿度数据获取\r\n  #room.wsd1_var1房间1温湿度1温度测量值（浮点，单位℃）\r\n  #房间1温湿度1湿度测量值（浮点，单位%）\r\n  queryHumiture: /html5/GETTAGVAL/room.wsd1_var1,room.wsd1_var2\r\n  #定时任务开关 true为开启  false为关闭\r\n  isRun: true\r\n  #库房ID\r\n  id: 1fb107eaaebc4d2eb13342cb66e78d62\r\n  #定时维护温湿度表\r\n  #维护库房温湿度记录条数,如定时任务每10分钟执行一次,每天是144条,定时15天清理一次(15×144=2160)\r\n  #所以当条数超过之后,按时间排序删除15天前的数据,维护记录表\r\n  count: 2160\r\n#光盘打包路径\r\ndisc_packaging_path: D:\\discFile\r\nimport:\r\n  archive:\r\n    filesUrl: /opt/dams/tmp/guajia\r\n#ocr配置\r\nocr:\r\n  #是否开启\r\n  isItEnabled: true\r\n  TesseractOCR:\r\n    path: F:\\tessdata\r\n    cachePath: F:\\tessdata\\file\r\n', 'c3e1ca1a9aebb5623706669494f0f88f', '2023-07-25 16:53:41', '2023-07-25 08:53:42', NULL, '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'example', 'DEFAULT_GROUP', '', 'useLocalCache=true', '25a822367cd73c79acc56da3c73fa07e', '2023-07-25 17:02:44', '2023-07-25 09:02:44', NULL, '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (2, 3, 'example', 'DEFAULT_GROUP', '', 'useLocalCache=true', '25a822367cd73c79acc56da3c73fa07e', '2023-07-25 17:03:13', '2023-07-25 09:03:14', NULL, '127.0.0.1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (1, 4, 'dljt', 'DEFAULT_GROUP', '', 'server:\r\n  port: 9100\r\n#  servlet:\r\n#    context-path: /dams\r\n#证书验证配置\r\nspringboot:\r\n  license:\r\n    verify:\r\n      subject: dams-1\r\n      publicAlias: aL9zs952UkvD9BTgENHT3iNE9sSU1WdsT5tYygtLWio=\r\n      publicKeysStorePath: /yozoCerts.store\r\n      storePass: V4RrJQX9c6aWma88qMUNXxWUcsoEm3csbgZE2L+NKho=\r\n      #证书存放路径\r\n      licensePath:  classpath:key/license.lic\r\n#报表地址\r\n#带项目名时为:/dams/ureport\r\n#不带项目名时为:/ureport\r\nureport:\r\n  path: /ureport\r\n\r\nspring:\r\n  data:\r\n    #ES配置\r\n    elasticsearch:\r\n      cluster-name: da-cluster\r\n      #若为es集群,多个用逗号分隔\r\n      cluster-nodes: 192.168.80.39:9300\r\n      #索引前缀，一般根据环境区分即可\r\n      prefix: mysqldl\r\n      #es加密设置\r\n      xpackSecurity:\r\n        #加密打开：true，关闭：false\r\n        xpack: true\r\n        user: elastic:TR54e$%STs#h\r\n        ca-crt: D:\\crt\\ca.crt\r\n        client-key: D:\\crt\\instance.key\r\n        client-crt: D:\\crt\\instance.crt\r\n  #redis配置\r\n  redis:\r\n    database: 9\r\n    host: 192.168.9.234\r\n    port: 6379\r\n    password: YM12wHlTNi8CO8cXab\r\n      #适配redis集群 注释host、port 放开下面代码\r\n      #cluster:\r\n    #nodes: 127.0.0.1:6380,127.0.0.1:6381,127.0.0.1:6382,127.0.0.1:6383\r\n    #适配redis集群 注释host、port 放开上面代码\r\n    lettuce:\r\n      pool:\r\n        max-active: 200\r\n        max-wait: -1ms\r\n        max-idle: 10\r\n        min-idle: 0\r\n    #连接超时时间（毫秒）\r\n    timeout: 5000ms\r\n  # 数据源配置\r\n  datasource:\r\n    druid:\r\n      driverClassName: com.mysql.cj.jdbc.Driver\r\n      #url: jdbc:mysql://192.168.80.39:3306/dams_server_dljt?useUnicode=true&characterEncoding=utf8&nullCatalogMeansCurrent=true&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      url: jdbc:mysql://192.168.80.39:3306/dams_server_dljt_0712?useUnicode=true&characterEncoding=utf8&nullCatalogMeansCurrent=true&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=GMT%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true\r\n      username: root\r\n      password: KD98%#9$2J\r\n      initial-size: 10\r\n      max-active: 100\r\n      min-idle: 10\r\n      max-wait: 60000\r\n      pool-prepared-statements: true\r\n      max-pool-prepared-statement-per-connection-size: 20\r\n      time-between-eviction-runs-millis: 60000\r\n      min-evictable-idle-time-millis: 300000\r\n      max-evictable-idle-time-millis: 60000\r\n      validation-query: SELECT 1 FROM DUAL\r\n      # validation-query-timeout: 5000\r\n      test-on-borrow: false\r\n      test-on-return: false\r\n      test-while-idle: true\r\n      connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=5000\r\n      #filters: #配置多个英文逗号分隔(统计，sql注入，log4j过滤)\r\n      filters: stat\r\n      stat-view-servlet:\r\n        enabled: true\r\n        url-pattern: /druid/*\r\n      #--------------数据库备份配置-start-------------------\r\n      #备份数据库类型，达梦-dm  人大-kingbasees mysql-mysql\r\n      source-type: mysql\r\n      #备份数据库服务IP\r\n      host: 127.0.0.1\r\n      #备份数据库端口\r\n      port: 3306\r\n      #备份数据库的名称（模式名）\r\n      dbname: dams_server_dljt_0712\r\n      #备份数据库安装的基础路径\r\n      exedir: /opt/software/mysql5.7/bin\r\n      #window 备份文件的存放路径\r\n      winbakdir: d:\\\\database\\\\\r\n      #linux 备份文件存放路径\r\n      linuxbakdir: /data/database\r\n      #是否将文件备份到远程服务器\r\n      scpdbfile: false\r\n      #备份远程服务器地址\r\n      sshhost: 127.0.0.1\r\n      #远程服务器存放备份文件的路径\r\n      sshsavepath: /usr/local/src\r\n      # 备份模式\r\n      database-location-type: local\r\n      # true 开启 false 关闭（若档案服务与数据库没有部署在一起时，客户不能提供远程服务器密码，此功能不可用）\r\n      dbback-state: true\r\n      database-location-information:\r\n        remote-server: # remote 时，必须配置远程服务器信息，否则不可用\r\n          host: 127.0.0.1\r\n          user: root\r\n          password: root\r\n          port: 22\r\n      backup-location-type: local\r\n      backup-location-information:\r\n        local-server:\r\n          exe-dir: /usr/bin # 数据库安装的基础路径\r\n          bakck-dir: /data/database # 备份文件存放路径\r\n        remote-server:\r\n          host: 127.0.0.1\r\n          user: root\r\n          password: root\r\n          port: 22\r\n          exe-dir: /usr/bin\r\n          bakck-dir: /data/database\r\n      #--------------数据库备份配置-end-------------------\r\n#数据库备份配置-是否为远程数据库\r\ndbbackupparam:\r\n  #主要两种方式，本地：local 远程：remote\r\n  con-mode: local\r\n  remotehost:\r\n    #远程服务器地址\r\n    host: 127.0.0.1\r\n    #远程服务器用户名\r\n    user: root\r\n    #远程服务器用户密码\r\n    password: root\r\n    #远程服务端口\r\n    port: 22\r\n#工作流中配置数据库类型，达梦：oracle，人大：postgres，mysql:mysql\r\nprocessEngine:\r\n  configuration:\r\n    databaseType: mysql\r\n#日志级别配置\r\nlogging:\r\n  level:\r\n    com.yozosoft.dams.mapper.*: error\r\n\r\n#dfs上传下载文件接口地址配置\r\ndfs:\r\n  #savePath: http://192.168.80.38:9111/globalFile/saveFile\r\n  savePath: http://127.0.0.1:9101/globalFile/saveFile\r\n  #downPath: http://192.168.80.38:9111/globalFile/downLoadFile\r\n  downPath: http://127.0.0.1:9101/globalFile/downLoadFile\r\n#fcs配置\r\nfcs:\r\n  replacePath: xxx\r\n  path: http://192.168.80.39:9550/fcscloud\r\n# 存放有关文件地址的相关配置\r\nfile:\r\n  base:\r\n    #path: /opt/dams/file/doc/\r\n    path: F:\\tempPath\r\n  store:\r\n    url: http://127.0.0.1:9101/\r\n  isLocalStore: true\r\n#临时文件存放地址，末尾不加/或\\\\\r\n#temp_path: /opt/dams/file/temp/\r\ntemp_path: F:\\tempPath\r\n#系统配置菜单中默认背景图标的存放位置\r\nimage:\r\n  imagePath: file:/opt/dams/file/takes/\r\n  path: D:\\yozoSoft\\dljt\\pdf\r\n  pngPath: D:\\yozoSoft\\dljt\\png\r\n#ocr配置\r\ntessdata:\r\n  #  path: D:\\yozosoft\\tessdata\r\n  path: D:\\yozosoft\\tessdata\r\n  cachePath: D:\\yozosoft\\file\r\n#对接密集架系统\r\nshelving:\r\n  #密集架IP\r\n  ip: http://172.17.0.100:8733\r\n  #打开某区某列 POST请求 参数 location 说明:两个整数型字符串中间用逗号分隔，（区号,列号）\r\n  openColumn: /DFServer/RestFullWcf/OpenColumn\r\n  #显示3D定位图 说明: 5)发送档案信息，显示3D定位图 调用此接口，架体会打开档案存放位置的架体，\r\n  #同时在架体屏上有3D地震波显示，当有人走入架体时，还会有语音播报档案所在位置。\r\n  #location 四个整数型字符串中间用逗号分隔，（区号,列号,层号,节号）\r\n  #sn 档案编号\r\n  #name 档案名称\r\n  #islend 在库=0，外借=1\r\n  sendArchivesInfo: /DFServer/RestFullWcf/SendArchivesInfo\r\n  #温湿度数据获取\r\n  #room.wsd1_var1房间1温湿度1温度测量值（浮点，单位℃）\r\n  #房间1温湿度1湿度测量值（浮点，单位%）\r\n  queryHumiture: /html5/GETTAGVAL/room.wsd1_var1,room.wsd1_var2\r\n  #定时任务开关 true为开启  false为关闭\r\n  isRun: true\r\n  #库房ID\r\n  id: 1fb107eaaebc4d2eb13342cb66e78d62\r\n  #定时维护温湿度表\r\n  #维护库房温湿度记录条数,如定时任务每10分钟执行一次,每天是144条,定时15天清理一次(15×144=2160)\r\n  #所以当条数超过之后,按时间排序删除15天前的数据,维护记录表\r\n  count: 2160\r\n#光盘打包路径\r\ndisc_packaging_path: D:\\discFile\r\nimport:\r\n  archive:\r\n    filesUrl: /opt/dams/tmp/guajia\r\n#ocr配置\r\nocr:\r\n  #是否开启\r\n  isItEnabled: true\r\n  TesseractOCR:\r\n    path: F:\\tessdata\r\n    cachePath: F:\\tessdata\\file\r\n', 'c3e1ca1a9aebb5623706669494f0f88f', '2023-07-26 11:36:08', '2023-07-26 03:36:09', NULL, '127.0.0.1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 5, 'dfs-yaml', 'DEFAULT_GROUP', '', 'whetherMultithreading: false', 'b8d5d8d0b330b3e3a632a73dcde6b770', '2023-07-26 11:37:04', '2023-07-26 03:37:04', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (3, 6, 'dfs-yaml', 'DEFAULT_GROUP', '', 'whetherMultithreading: false', 'b8d5d8d0b330b3e3a632a73dcde6b770', '2023-07-26 11:50:58', '2023-07-26 03:50:59', NULL, '127.0.0.1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'dfs-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 11:51:27', '2023-07-26 03:51:27', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (4, 8, 'dfs-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 11:53:53', '2023-07-26 03:53:54', NULL, '127.0.0.1', 'D', '', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'dev-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 11:54:08', '2023-07-26 03:54:08', 'nacos', '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 10, 'dfs-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 11:58:27', '2023-07-26 03:58:27', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (5, 11, 'dev-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 11:58:30', '2023-07-26 03:58:31', NULL, '127.0.0.1', 'D', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (6, 12, 'dfs-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-26 12:01:30', '2023-07-26 04:01:31', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (6, 13, 'dfs-yaml', 'dev', '', 'whetherMultithreading: true', '1109f766246367980869f51c230b5901', '2023-07-27 10:31:43', '2023-07-27 02:31:44', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'dfs-yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 10:40:52', '2023-07-27 02:40:53', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (6, 15, 'dfs-yaml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 10:40:56', '2023-07-27 02:40:57', NULL, '127.0.0.1', 'D', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (9, 16, 'dfs-yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 10:41:19', '2023-07-27 02:41:19', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 17, 'dfs.yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 10:59:22', '2023-07-27 02:59:22', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (9, 18, 'dfs-yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 10:59:25', '2023-07-27 02:59:26', NULL, '127.0.0.1', 'D', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 19, 'dfs-yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 11:03:51', '2023-07-27 03:03:52', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (11, 20, 'dfs.yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 11:03:55', '2023-07-27 03:03:55', NULL, '127.0.0.1', 'D', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 21, 'dfs.yaml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 11:09:24', '2023-07-27 03:09:24', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (12, 22, 'dfs-yml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 11:09:28', '2023-07-27 03:09:28', NULL, '127.0.0.1', 'D', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (13, 23, 'dfs.yaml', 'dev', '', 'reading: true', 'be2bbf51a499e060ab9fc0c469b1beb7', '2023-07-27 11:09:57', '2023-07-27 03:09:58', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 24, 'dfs9102.yaml', 'dev', '', 'reading: longtime', 'b2aab97115bb5a36cf78596f1e291695', '2023-08-03 15:40:55', '2023-08-03 07:40:55', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 25, 'gateway.yaml', 'dev', '', 'reading: longtime', 'b2aab97115bb5a36cf78596f1e291695', '2023-08-03 16:44:31', '2023-08-03 08:44:31', NULL, '127.0.0.1', 'I', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (16, 26, 'gateway.yaml', 'dev', '', 'reading: longtime', 'b2aab97115bb5a36cf78596f1e291695', '2023-08-03 17:43:12', '2023-08-03 09:43:13', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (16, 27, 'gateway.yaml', 'dev', '', '[{\n      \"id\": \"xxx-server\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9101/\"\n  }]', '8059c095c88df86ba0748ef2887b7496', '2023-08-03 17:45:57', '2023-08-03 09:45:58', 'nacos', '127.0.0.1', 'U', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', '');
INSERT INTO `his_config_info` VALUES (0, 28, 'app-prod.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 11:53:30', '2023-08-07 03:53:30', 'nacos', '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 29, 'app1-prodNode1.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 12:06:29', '2023-08-07 04:06:29', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (19, 30, 'app-prod.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 12:06:34', '2023-08-07 04:06:34', NULL, '127.0.0.1', 'D', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 31, 'app1-prodNode2.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 12:06:42', '2023-08-07 04:06:43', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (21, 32, 'app1-prodNode2.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 13:55:54', '2023-08-07 05:55:54', NULL, '127.0.0.1', 'D', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 33, 'app2-prodNode2.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 13:56:05', '2023-08-07 05:56:05', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (20, 34, 'app1-prodNode1.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 14:10:18', '2023-08-07 06:10:19', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (22, 35, 'app2-prodNode2.yaml', 'prod', '', 'size: 10', 'f3b5f2e36a664d4e549694be20d7afae', '2023-08-07 16:05:40', '2023-08-07 08:05:40', NULL, '127.0.0.1', 'D', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 36, 'collect-prod.yaml', 'prod', '', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-08-07 16:06:02', '2023-08-07 08:06:02', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (20, 37, 'app1-prodNode1.yaml', 'prod', '', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-08-07 16:06:05', '2023-08-07 08:06:05', NULL, '127.0.0.1', 'D', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 38, 'manage-prod.yaml', 'prod', '', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-08-07 16:24:51', '2023-08-07 08:24:51', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 39, 'gateway.yaml', 'dev', '', '[{\n      \"id\": \"dfs\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9101/\"\n  },{\n      \"id\": \"dfs9102\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs9102/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9102/\"\n  }\n  ]', '3b0f0037a5a60c650c89e2a65ec36b95', '2023-08-09 14:58:35', '2023-08-09 06:58:36', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (26, 40, 'gateway.yaml', 'dev', '', '[{\n      \"id\": \"dfs\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9101/\"\n  },{\n      \"id\": \"dfs9102\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/dfs9102/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"dfs\"  \n      }],\n      \"uri\": \"http://192.168.170.51:9102/\"\n  }\n  ]', '3b0f0037a5a60c650c89e2a65ec36b95', '2023-08-09 14:59:11', '2023-08-09 06:59:12', NULL, '127.0.0.1', 'D', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 41, 'gateway.yml', 'prod', '', '[{\r\n      \"id\": \"dfs\",\r\n      \"order\": 1, \r\n      \"predicates\": [{ \r\n          \"args\": {\r\n              \"pattern\": \"/dfs/**\"\r\n          },\r\n          \"name\": \"Path\"\r\n      }],\r\n      \"filters\":[{ \r\n          \"args\": {\r\n              \"parts\": 0\r\n          },\r\n          \"name\": \"dfs\"  \r\n      }],\r\n      \"uri\": \"http://192.168.170.51:9101/\"\r\n  },{\r\n      \"id\": \"dfs9102\",\r\n      \"order\": 1, \r\n      \"predicates\": [{ \r\n          \"args\": {\r\n              \"pattern\": \"/dfs9102/**\"\r\n          },\r\n          \"name\": \"Path\"\r\n      }],\r\n      \"filters\":[{ \r\n          \"args\": {\r\n              \"parts\": 0\r\n          },\r\n          \"name\": \"dfs\"  \r\n      }],\r\n      \"uri\": \"http://192.168.170.51:9102/\"\r\n  }\r\n  ]', '4b273cd6601894bfb86654b16e0191fc', '2023-08-09 14:59:36', '2023-08-09 06:59:37', 'nacos', '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 42, 'gateway.yml', 'prod', '', '[{\r\n      \"id\": \"dfs\",\r\n      \"order\": 1, \r\n      \"predicates\": [{ \r\n          \"args\": {\r\n              \"pattern\": \"/dfs/**\"\r\n          },\r\n          \"name\": \"Path\"\r\n      }],\r\n      \"filters\":[{ \r\n          \"args\": {\r\n              \"parts\": 0\r\n          },\r\n          \"name\": \"dfs\"  \r\n      }],\r\n      \"uri\": \"http://192.168.170.51:9101/\"\r\n  },{\r\n      \"id\": \"dfs9102\",\r\n      \"order\": 1, \r\n      \"predicates\": [{ \r\n          \"args\": {\r\n              \"pattern\": \"/dfs9102/**\"\r\n          },\r\n          \"name\": \"Path\"\r\n      }],\r\n      \"filters\":[{ \r\n          \"args\": {\r\n              \"parts\": 0\r\n          },\r\n          \"name\": \"dfs\"  \r\n      }],\r\n      \"uri\": \"http://192.168.170.51:9102/\"\r\n  }\r\n  ]', '4b273cd6601894bfb86654b16e0191fc', '2023-08-09 15:02:16', '2023-08-09 07:02:17', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 43, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://127.0.0.1:8102/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://127.0.0.1:8103/\"\n  }\n  ]', '7998357c91489f92b8530281e2a520db', '2023-08-09 15:03:38', '2023-08-09 07:03:39', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 44, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://127.0.0.1:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://127.0.0.1:8013/\"\n  }\n  ]', '3aaf1b656a97d1f4021dbcd7948fd314', '2023-08-09 15:20:17', '2023-08-09 07:20:17', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 45, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013/\"\n  }\n  ]', '89fab3fa5b1aa01a3d31021fa49d80ef', '2023-08-09 15:28:47', '2023-08-09 07:28:47', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 46, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect1\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage1\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013/\"\n  }\n  ]', '35aa2c9821740bc1ed6957afb8f70c12', '2023-08-09 15:29:50', '2023-08-09 07:29:50', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 47, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013\"\n  }\n  ]', '259d5e5403dfe612510a4e726bf6bca4', '2023-08-09 15:33:22', '2023-08-09 07:33:23', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 48, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013/\"\n  }\n  ]', '89fab3fa5b1aa01a3d31021fa49d80ef', '2023-08-09 15:39:50', '2023-08-09 07:39:50', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 49, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/collect/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013/manage/\"\n  }\n  ]', '5ceb9b3ab7ba750f082d74e43ba0866f', '2023-08-09 16:42:35', '2023-08-09 08:42:36', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (0, 50, 'clusterManage-prod.yaml', 'prod', '', 'size: 120', 'ac8c438476ddf4248a1310a3c61d2d5e', '2023-12-19 17:24:47', '2023-12-19 09:24:48', NULL, '127.0.0.1', 'I', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 51, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8013/\"\n  }\n  ]', '89fab3fa5b1aa01a3d31021fa49d80ef', '2023-12-19 17:29:33', '2023-12-19 09:29:34', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 52, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": lb://tool-service-ly\n  }\n  ]', '703f648fec7457c45928e91230e2949c', '2023-12-19 17:30:00', '2023-12-19 09:30:01', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');
INSERT INTO `his_config_info` VALUES (28, 53, 'gateway.yml', 'prod', '', '[{\n      \"id\": \"collect\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/collect/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"collect\"  \n      }],\n      \"uri\": \"http://192.168.170.51:8012/\"\n  },{\n      \"id\": \"manage\",\n      \"order\": 1, \n      \"predicates\": [{ \n          \"args\": {\n              \"pattern\": \"/manage/**\"\n          },\n          \"name\": \"Path\"\n      }],\n      \"filters\":[{ \n          \"args\": {\n              \"parts\": 0\n          },\n          \"name\": \"manage\"  \n      }],\n      \"uri\": \"lb://manage\"\n  }\n  ]', '9bd9d801723257432cafcf2eaddc06c7', '2023-12-19 17:31:59', '2023-12-19 09:31:59', 'nacos', '127.0.0.1', 'U', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'role',
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'resource',
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'action',
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'username',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'role',
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '4e2c0103-d382-4f6b-9268-f5f6a83aba32', 'dev', '测试环境', 'nacos', 1690337857158, 1690337857158);
INSERT INTO `tenant_info` VALUES (2, '1', '394dc226-eec7-44e8-90c1-2c9fcffa5a5e', 'prod', '生产环境', 'nacos', 1691380328400, 1691380328400);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'username',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
