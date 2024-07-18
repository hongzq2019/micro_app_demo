SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `data_dic`;
CREATE TABLE `data_dic`  (
                             `ID` int(0) NOT NULL,
                             `DIC_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                             `DIC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                             `DIC_DESC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                             `DIC_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                             `DIC_ORDER` int(0) NULL DEFAULT NULL,
                             `IS_DELETE` int(0) UNSIGNED NULL DEFAULT 0,
                             `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
                             `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
                             PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `archive_collect`;
CREATE TABLE `archive_collect`  (
                                    `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                    `REAL_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `TOTAL_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                    `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
                                    `YEAR` int(0) NULL DEFAULT NULL,
                                    `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
                                    PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `archive_manage`;
CREATE TABLE `archive_manage`  (
                                   `ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                                   `COLLECT_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                   `PROJECT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                   `PROJECT_NUMBER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                   `MAX_NUMBER` int(0) NULL DEFAULT NULL,
                                   `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
                                   `UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
                                   `PROJECT_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                   PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
                             `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
                             `branch_id` bigint(0) NOT NULL COMMENT '分支事务ID',
                             `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '全局事务唯一标识',
                             `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '上下文',
                             `rollback_info` longblob NOT NULL COMMENT '回滚信息',
                             `log_status` int(0) NOT NULL COMMENT '状态，0正常，1全局已完成（防悬挂）',
                             `log_created` datetime(0) NOT NULL COMMENT '创建时间',
                             `log_modified` datetime(0) NOT NULL COMMENT '修改时间',
                             PRIMARY KEY (`id`) USING BTREE,
                             UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36047 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
