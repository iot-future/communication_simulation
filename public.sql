/*
 Navicat Premium Data Transfer

 Source Server         : datang
 Source Server Type    : PostgreSQL
 Source Server Version : 110019
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110019
 File Encoding         : 65001

 Date: 09/07/2023 19:54:23
*/


-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS "public"."element";
CREATE TABLE "public"."element" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "serial_number" varchar(30) COLLATE "pg_catalog"."default",
  "name" varchar(64) COLLATE "pg_catalog"."default",
  "type" varchar(64) COLLATE "pg_catalog"."default",
  "lon" float8,
  "lat" float8,
  "scene_id" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "info" text COLLATE "pg_catalog"."default",
  "element_type" varchar(20) COLLATE "pg_catalog"."default",
  "parent_id" varchar(50) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."element"."id" IS '唯一识别';
COMMENT ON COLUMN "public"."element"."serial_number" IS '序号';
COMMENT ON COLUMN "public"."element"."name" IS '名称';
COMMENT ON COLUMN "public"."element"."type" IS '类型';
COMMENT ON COLUMN "public"."element"."lon" IS '经度';
COMMENT ON COLUMN "public"."element"."lat" IS '维度';
COMMENT ON COLUMN "public"."element"."scene_id" IS '场景id';
COMMENT ON COLUMN "public"."element"."info" IS '元素备用信息';
COMMENT ON COLUMN "public"."element"."element_type" IS '元素类型';
COMMENT ON COLUMN "public"."element"."parent_id" IS '归属id';

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO "public"."element" VALUES ('817f214df6f24d028351383b1225ccc0', '2', '大采油区微基站', '微基站', 391, 1296, '01', '{"top":"2.71rem","left":"12.76rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('5c489b3dcc0e4083b837cd2a4c1f2cb6', '3', '微基站', '微基站', 540, 1360, '01', '{"top":"4.2rem","left":"13.4rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('2e529206707240f18c61ff80cfacd16c', '1', '无人机', '视频下载类终端', 760, 979, '07', '{"top":"6.4rem","left":"9.59rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('9e344edb9b3148e49dac6ac61a6d793a', '4', '微基站', '微基站', 704, 1378, '01', '{"top":"5.84rem","left":"13.58rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('f748f744eaf04a71bf018c82c0e2632b', '6', '微基站', '微基站', 704, 588, '01', '{"top":"5.84rem","left":"5.68rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('47fef36f50274ab4bb636e4b6d1cf77e', '1', '宏基站', '宏基站', 536, 962, '', '{"top":"4.16rem","left":"9.42rem","src":"/assets/img/Base-station1.6c4a984b.png","url":"/assets/img/Base-station_1.8fdd1bb2.png","type":"宏基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('03231afa85ec4937868763356d9935cd', '1', '微基站', '微基站', 379, 663, '', '{"top":"2.59rem","left":"6.43rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('57554c6bb9eb4871b08eb27911db62f8', '2', '微基站', '微基站', 411, 1017, '', '{"top":"2.91rem","left":"9.97rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('deef45a08d444405ae11d45421b63134', '3', '微基站', '微基站', 411, 1369, '', '{"top":"2.91rem","left":"13.49rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('3bc7ff2891344b9ea35cf1a330fee833', '1', '配置', '', 0, 0, '', '', '', '47fef36f50274ab4bb636e4b6d1cf77e');
INSERT INTO "public"."element" VALUES ('55e17a02193141808daa861f44b3041e', '4', '微基站', '微基站', 713, 616, '', '{"top":"5.93rem","left":"5.96rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('2181d4e872484610845d5f14826295a9', '5', '微基站', '微基站', 743, 936, '', '{"top":"6.23rem","left":"9.16rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('9d4012318e734cd0a70258e49a5608d7', '6', '微基站', '微基站', 761, 1375, '', '{"top":"6.41rem","left":"13.55rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('1f4986aa09654f07b99e460cd863f962', '1', '宏基站', '宏基站', 525, 963, '07', '{"top":"4.16rem","left":"9.42rem","src":"/assets/img/Base-station1.6c4a984b.png","url":"/assets/img/Base-station_1.8fdd1bb2.png","type":"宏基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('8848a5cff9d642b8b3e092712c86e162', '7', '微基站', '微基站', 705, 953, '01', '{"top":"5.85rem","left":"9.33rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('9e25557f6ba442d4b9f89ec0c34bcf98', '8', '微基站', '微基站', 400, 969, '01', '{"top":"2.8rem","left":"9.49rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('cec53be73c314c7fa1bacc862813fe4d', '1', '传感器', '传感器', 550, 792, '07', '{"top":"4.3rem","left":"7.72rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('eafded2b47ed4f319fb021f4f81f1a77', '2', '传感器', '传感器', 681, 792, '07', '{"top":"5.61rem","left":"7.72rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', '1', '摄像头', '摄像头', 491, 841, '07', '{"top":"3.71rem","left":"8.21rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('e67f0636bb1c4fb4a2fd4a0e674ade2f', '2', '摄像头', '摄像头', 636, 864, '07', '{"top":"5.16rem","left":"8.44rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('77856f878df049d489f0036c628498f1', '3', '摄像头', '摄像头', 559, 1089, '07', '{"top":"4.39rem","left":"10.69rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('3d98a705be084ff1a846cd61919d1147', '3', '传感器', '传感器', 439, 985, '07', '{"top":"3.19rem","left":"9.65rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('9815c856968340e7bcb658e5d94f9b05', '4', '传感器', '传感器', 532, 995, '07', '{"top":"4.12rem","left":"9.75rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('82ddeec370be4e1b8f17bba987de2049', '5', '传感器', '传感器', 672, 1014, '07', '{"top":"5.52rem","left":"9.94rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('1b072c0301634787adf490275cd90151', '6', '传感器', '传感器', 460, 1139, '07', '{"top":"3.4rem","left":"11.19rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('7c409a63446949ed8986cdb2f2d72e18', '7', '传感器', '传感器', 580, 1122, '07', '{"top":"4.6rem","left":"11.02rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('faffef28b5b0417ba4b9abd2382744f8', '2', '视频下载类终端', '视频下载类终端', 761, 846, '07', '{"top":"6.41rem","left":"8.26rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('34b824f6741b4cd08ca31d7b5739343a', '5', '视频下载类终端', '视频下载类终端', 759, 514, '01', '{"top":"6.39rem","left":"4.94rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('fb3e42a243804591b1439ceb94206c48', '6', '视频下载类终端', '视频下载类终端', 764, 655, '01', '{"top":"6.44rem","left":"6.35rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('afa6fcae291f446899934fdf2846b855', '1', '摄像头', '摄像头', 739, 956, '01', '{"top":"6.19rem","left":"9.36rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('04eada1a3bc7483ab05b0851fffd1852', '7', '视频下载类终端', '视频下载类终端', 549, 840, '01', '{"top":"4.29rem","left":"8.2rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('f974e9878e30401985222a57c6345216', '1', '传感器', '传感器', 344, 798, '01', '{"top":"2.24rem","left":"7.78rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('33f5198d87a24e0882ba9092f969f81b', '2', '传感器', '传感器', 352, 940, '01', '{"top":"2.32rem","left":"9.2rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('bf2ffe04dcef4db39ae269d60feb589d', '3', '传感器', '传感器', 372, 1079, '01', '{"top":"2.52rem","left":"10.59rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('79ede4113b46404983cc5bae6930d377', '4', '传感器', '传感器', 471, 1130, '01', '{"top":"3.51rem","left":"11.1rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('55cef45d585f4d6698df1c5b79123624', '2', '摄像头', '摄像头', 418, 1013, '01', '{"top":"2.98rem","left":"9.93rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('570defde8f8449668cb1f528422cc3c5', '5', '传感器', '传感器', 372, 1324, '01', '{"top":"2.52rem","left":"13.04rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('7a8cac068c674f9299207f7b6561d127', '6', '传感器', '传感器', 433, 1476, '01', '{"top":"3.13rem","left":"14.56rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('fb5660ca2d86400387c6370ab0b30660', '7', '传感器', '传感器', 630, 1468, '01', '{"top":"5.1rem","left":"14.48rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('0cb302dfc1464db0b744e9aee0d6e173', '8', '传感器', '传感器', 760, 1471, '01', '{"top":"6.4rem","left":"14.51rem","src":"/assets/img/terminal9.d9e52a4a.png","url":"/assets/img/terminal_9.da25f4e8.png","type":"传感器"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('fcbbd088ea044d40b587edbc61d146d2', '3', '摄像头', '摄像头', 587, 1399, '01', '{"top":"4.67rem","left":"13.79rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('d540883e31f7409795f52e564ef7a8cc', '4', '摄像头', '摄像头', 492, 1402, '01', '{"top":"3.72rem","left":"13.82rem","src":"/assets/img/terminal3.96cd390b.png","url":"/assets/img/terminal_3.bcef6c73.png","type":"摄像头"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('b432c6131fac4e7e9831bec232480228', '1', '宏基站', '宏基站', 585, 977, '01', '{"top":"4.65rem","left":"9.57rem","src":"/assets/img/Base-station1.6c4a984b.png","url":"/assets/img/Base-station_1.8fdd1bb2.png","type":"宏基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', '2', '电视机', '视频下载类终端', 376, 571, '01', '{"top":"2.56rem","left":"5.51rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('589104d432c74eb3b7d2150d9c90be1b', '3', '手机', '视频下载类终端', 536, 520, '01', '{"top":"4.16rem","left":"5rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('ab39df0fcf83400f88d3ccb517bde251', '4', '数字大屏', '视频下载类终端', 763, 411, '01', '{"top":"6.43rem","left":"3.91rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');
INSERT INTO "public"."element" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', '1', '配置', '', 0, 0, '01', '', '', 'b432c6131fac4e7e9831bec232480228');
INSERT INTO "public"."element" VALUES ('131cdc0bef484e63ab512626435bc1b6', '1', '生活区微基站', '微基站', 394, 654, '01', '{"top":"2.74rem","left":"6.34rem","src":"/assets/img/Base-station2.f7ad75ea.png","url":"/assets/img/Base-station_2.fd11c239.png","type":"微基站"}', '基站库', '');
INSERT INTO "public"."element" VALUES ('46c05e1624f041d09d1ebed8178dd829', '1', '计算机', '视频下载类终端', 363, 485, '01', '{"top":"2.43rem","left":"4.65rem","src":"/assets/img/terminal5.a914335e.png","url":"/assets/img/terminal_5.c36295c6.png","type":"视频下载类终端"}', '终端库', '');

-- ----------------------------
-- Table structure for element_header
-- ----------------------------
DROP TABLE IF EXISTS "public"."element_header";
CREATE TABLE "public"."element_header" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "header" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."element_header"."header" IS '列名字';

-- ----------------------------
-- Records of element_header
-- ----------------------------
INSERT INTO "public"."element_header" VALUES ('fb5660ca2d86400387c6370ab0b30660', '["序号","数量"]');
INSERT INTO "public"."element_header" VALUES ('f974e9878e30401985222a57c6345216', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('131cdc0bef484e63ab512626435bc1b6', '["序号","基站高度","天线下倾角","频段","载波数量","带宽","MU-MIMO","MIMO层数","中心频点(G)","子载波间隔(kHz)","数据传输方式","天线通道","天线增益（dBi）","发射功率(dBm)","MCS index","调制阶数","模式"]');
INSERT INTO "public"."element_header" VALUES ('589104d432c74eb3b7d2150d9c90be1b', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('2e529206707240f18c61ff80cfacd16c', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('3bc7ff2891344b9ea35cf1a330fee833', '["基站高度","天线下倾角","频段","带宽","MU-MIMO","MIMO层数","中心频点（G）","子载波间隔","数据传输方式","天线通道","天线增益","MCS index","调制阶数","模式","目标码率Rx","Rmax","PRB数目","控制面开销","载波数量","发射功率(dBm)"]');
INSERT INTO "public"."element_header" VALUES ('817f214df6f24d028351383b1225ccc0', '["序号","基站高度","天线下倾角","频段","载波数量","带宽","MU-MIMO","MIMO层数","中心频点(G)","子载波间隔(kHz)","数据传输方式","天线通道","天线增益（dBi）","发射功率(dBm)","MCS index","调制阶数","模式"]');
INSERT INTO "public"."element_header" VALUES ('1f4986aa09654f07b99e460cd863f962', '["序号","基站高度","天线下倾角","频段","载波数量","带宽","MU-MIMO","MIMO层数","中心频点(G)","子载波间隔(kHz)","数据传输方式","天线通道","天线增益（dBi）","发射功率(dBm)","MCS index","调制阶数","模式"]');
INSERT INTO "public"."element_header" VALUES ('afa6fcae291f446899934fdf2846b855', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('', '[]');
INSERT INTO "public"."element_header" VALUES ('b432c6131fac4e7e9831bec232480228', '["序号"]');
INSERT INTO "public"."element_header" VALUES ('f748f744eaf04a71bf018c82c0e2632b', '["序号","基站高度","天线下倾角","频段","载波数量","带宽","MU-MIMO","MIMO层数","中心频点(G)","子载波间隔(kHz)","数据传输方式","天线通道","天线增益（dBi）","发射功率(dBm)","MCS index","调制阶数","模式"]');
INSERT INTO "public"."element_header" VALUES ('ab39df0fcf83400f88d3ccb517bde251', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', '["序号","基站高度","天线下倾角","频段","载波数量","带宽","MU-MIMO","MIMO层数","中心频点(G)","子载波间隔(kHz)","数据传输方式","天线通道","天线增益（dBi）","发射功率(dBm)","MCS index","调制阶数","模式"]');
INSERT INTO "public"."element_header" VALUES ('5c489b3dcc0e4083b837cd2a4c1f2cb6', '["序号"]');
INSERT INTO "public"."element_header" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('46c05e1624f041d09d1ebed8178dd829', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('46c05e1624f041d09d1ebed8178dd829', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('cec53be73c314c7fa1bacc862813fe4d', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');
INSERT INTO "public"."element_header" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', '["序号","频段","天线通道数","天线高度","天线增益","发射功率","边缘速率"]');

-- ----------------------------
-- Table structure for element_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."element_param";
CREATE TABLE "public"."element_param" (
  "id" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "row_index" int4,
  "col_index" int4,
  "value" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."element_param"."id" IS '元素唯一id';
COMMENT ON COLUMN "public"."element_param"."row_index" IS '单元格行索引';
COMMENT ON COLUMN "public"."element_param"."col_index" IS '单元格列索引';
COMMENT ON COLUMN "public"."element_param"."value" IS '单元格值';

-- ----------------------------
-- Records of element_param
-- ----------------------------
INSERT INTO "public"."element_param" VALUES ('fb5660ca2d86400387c6370ab0b30660', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('fb5660ca2d86400387c6370ab0b30660', 0, 1, '1');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('589104d432c74eb3b7d2150d9c90be1b', 0, 6, '25MB/S');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 1, '5m');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 2, '16度');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 3, 'FR1');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 4, '4');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 5, '100M');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 6, '8');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 7, '4');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 8, '2.6');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 9, '30');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 12, '22.5');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 13, '53');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 14, '28');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 15, '6');
INSERT INTO "public"."element_param" VALUES ('b432c6131fac4e7e9831bec232480228', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('131cdc0bef484e63ab512626435bc1b6', 0, 16, '64QAM');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 6, '80MB/S');
INSERT INTO "public"."element_param" VALUES ('46c05e1624f041d09d1ebed8178dd829', 0, 7, '');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('cec53be73c314c7fa1bacc862813fe4d', 0, 6, '0.055KB/S');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('ab39df0fcf83400f88d3ccb517bde251', 0, 6, '50MB/S');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 6, '10MB/S');
INSERT INTO "public"."element_param" VALUES ('afa6fcae291f446899934fdf2846b855', 0, 7, '');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 5, '24dBm');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('1a3dc5297c134615aa138d5ec70f6eb6', 0, 6, '10MB/S');
INSERT INTO "public"."element_param" VALUES ('c583b0a6dd5b43b8b73424eb6192b55a', 0, 6, '10MB/S');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 1, '25m');
INSERT INTO "public"."element_param" VALUES ('5c489b3dcc0e4083b837cd2a4c1f2cb6', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('5c489b3dcc0e4083b837cd2a4c1f2cb6', 0, 1, '');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 2, '18度');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 5, '23dBm');
INSERT INTO "public"."element_param" VALUES ('f974e9878e30401985222a57c6345216', 0, 6, '0.055KB/S');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 3, 'FR1');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 4, '2');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 5, '100M');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 6, '8');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 7, '2');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 8, '2.6');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 9, '60');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 12, '22.5');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 13, '53');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 14, '28');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 15, '6');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 0, 16, '64QAM');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 0, '2');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 1, '25m');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 2, '18度');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 3, 'FR2');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 4, '2');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 5, '200M');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 6, '8');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 7, '6');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 8, '26');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 9, '60');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 12, '28');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 13, '55');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 14, '28');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 15, '6');
INSERT INTO "public"."element_param" VALUES ('3ec3e62c1a6a4d9fac340c4df478b145', 1, 16, '64QAM');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 12, '22.5');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 13, '53');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 14, '28');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 15, '6');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 16, '64QAM');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 1, '5m');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 2, '15度');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 3, 'FR1');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 4, '2');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 5, '100M');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 6, '1');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 7, '1');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 8, '2.6');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 9, '30');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 12, '22.5');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 13, '53');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 14, '28');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 15, '6');
INSERT INTO "public"."element_param" VALUES ('f748f744eaf04a71bf018c82c0e2632b', 0, 16, '64QAM');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 1, 'FR1');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 2, '2T4R');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 3, '1.5m');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 4, '10dBi');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 5, '26dBm');
INSERT INTO "public"."element_param" VALUES ('2e529206707240f18c61ff80cfacd16c', 0, 6, '10MB/S');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 1, '5m');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 2, '15度');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 3, 'FR1');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 4, '2');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 5, '100M');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 0, '1');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 1, '25m');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 2, '5度');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 3, 'FR1');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 4, '2');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 5, '100M');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 6, '8');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 7, '2');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 8, '2.6');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 9, '30');
INSERT INTO "public"."element_param" VALUES ('1f4986aa09654f07b99e460cd863f962', 0, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 6, '2');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 7, '2');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 8, '2.6');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 9, '30');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 10, 'DL');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 11, '64T64R');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 12, '22.5');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 13, '53');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 14, '28');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 15, '6');
INSERT INTO "public"."element_param" VALUES ('817f214df6f24d028351383b1225ccc0', 0, 16, '64QAM');

-- ----------------------------
-- Table structure for scene
-- ----------------------------
DROP TABLE IF EXISTS "public"."scene";
CREATE TABLE "public"."scene" (
  "scene_id" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."scene"."scene_id" IS '场景id';
COMMENT ON COLUMN "public"."scene"."name" IS '场景名字';

-- ----------------------------
-- Records of scene
-- ----------------------------

-- ----------------------------
-- Indexes structure for table element_param
-- ----------------------------
CREATE INDEX "id" ON "public"."element_param" USING btree (
  "id" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
