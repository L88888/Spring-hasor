/*
 Navicat Premium Data Transfer

 Source Server         : 172.20.36.121-postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 100007
 Source Host           : 172.20.36.121:5432
 Source Catalog        : videomanager_zy
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 100007
 File Encoding         : 65001

 Date: 17/07/2020 17:43:40
*/


-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."interface_info";
CREATE TABLE "public"."interface_info" (
  "api_id" int4 NOT NULL DEFAULT nextval('interface_info_api_id_seq'::regclass),
  "api_method" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "api_path" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "api_status" int4 NOT NULL,
  "api_comment" varchar(255) COLLATE "pg_catalog"."default",
  "api_type" varchar(24) COLLATE "pg_catalog"."default" NOT NULL,
  "api_script" text COLLATE "pg_catalog"."default" NOT NULL,
  "api_schema" text COLLATE "pg_catalog"."default",
  "api_sample" text COLLATE "pg_catalog"."default",
  "api_create_time" timestamp(0) DEFAULT now(),
  "api_gmt_time" timestamp(0) DEFAULT now(),
  "api_option" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."interface_info"."api_id" IS 'ID';
COMMENT ON COLUMN "public"."interface_info"."api_method" IS 'HttpMethod：GET、PUT、POST';
COMMENT ON COLUMN "public"."interface_info"."api_path" IS '拦截路径';
COMMENT ON COLUMN "public"."interface_info"."api_status" IS '状态：0草稿，1发布，2有变更，3禁用';
COMMENT ON COLUMN "public"."interface_info"."api_comment" IS '注释';
COMMENT ON COLUMN "public"."interface_info"."api_type" IS '脚本类型：SQL、DataQL';
COMMENT ON COLUMN "public"."interface_info"."api_script" IS '查询脚本：xxxxxxx';
COMMENT ON COLUMN "public"."interface_info"."api_schema" IS '接口的请求/响应数据结构';
COMMENT ON COLUMN "public"."interface_info"."api_sample" IS '请求/响应/请求头样本数据';
COMMENT ON COLUMN "public"."interface_info"."api_create_time" IS '创建时间';
COMMENT ON COLUMN "public"."interface_info"."api_gmt_time" IS '修改时间';
COMMENT ON COLUMN "public"."interface_info"."api_option" IS '扩展配置信息';

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO "public"."interface_info" VALUES (40, 'GET', '/pspc/policeStation/queryCheckTypeStat', 1, '巡防战果-查询核查类型统计接口', 'DataQL', '// 参数说明 day-日、month-月、season-季、year-年
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
// 校验参数
if (string.isEmpty(${type})) {
    return {
        "message": "参数统计类型不能为空！"
    };
}
var params = utils.getStartEndTime(${type});
if (collect.isEmpty(params)) {
    return {
        "message": "参数统计类型不正确！"
    };
}
// 核查类型统计
var dataSet = @@sql(params) <%
    SELECT hclx, COUNT(1) AS "count"
    FROM xfzg_hcmx
    WHERE hcsj >= to_timestamp(#{params.startTime}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone
        AND to_timestamp(#{params.endTime}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone >= hcsj
    GROUP BY hclx
%>
return dataSet(params);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"month\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-02 19:51:46', '2020-07-01 15:54:33', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (33, 'POST', '/pspc/policeStation/insertKeyPlaces', 1, '通用功能-新增重点场所接口', 'DataQL', '// insert语句模版
var insertSQL = @@sql(params) <%
    insert into key_places (
        org_code,
        places_name,
        places_addres,
        places_desc,
        longitude,
        latitude,
        places_image,
        places_type,
        places_tel,
        employess,
        security_guards
    ) values (
        #{params.orgCode},
        #{params.placesName},
        #{params.placesAddress},
        #{params.placesDesc},
        #{params.longitude},
        #{params.latitude},
        #{params.placesImage},
        #{params.placesType},
        #{params.placesTel},
        #{params.employess},
        #{params.securityGuards}
    )
%>
// 插入数据
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"latitude":{"type":"number"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"securityGuards":{"type":"number"},"employess":{"type":"number"},"longitude":{"type":"number"},"placesTel":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述--可暂存场所类型中文\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型--可为空，后面统一update编码\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-25 21:01:51', '2020-07-01 15:57:08', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (38, 'POST', '/pspc/policeStation/updatePoliceStation', 1, '巡防设置-修改警务站信息接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 修改警务站快反
var dataSet = @@sql(jwzbh, ylzd4, ylzd3, ylzd2) <%
    UPDATE t_police_station_infos SET
        ylzd4 = #{ylzd4},
        ylzd3 = #{ylzd3},
        ylzd2 = #{ylzd2}
    WHERE jwzbh = #{jwzbh};
%>
return dataSet(${jwzbh}, ${ylzd4}, ${ylzd3}, ${ylzd2});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"ylzd4\": \"\",\n  \"ylzd3\": \"\",\n  \"ylzd2\": \"\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-01 13:59:05', '2020-07-01 15:55:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (35, 'POST', '/pspc/policeStation/initializationQwdj', 1, '巡防设置-初始化勤务等级接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 初始化数据
var initData = [
    { "jwzbh": #{jwzbh}, "djmc": "战时勤务", "jbbh": "1", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "加强勤务", "jbbh": "2", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "日常勤务", "jbbh": "3", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "自定义", "jbbh": "4", "zgl": 0, "zt": "0" }
];
// 初始化勤务等级
var insertSQL = @@sql[](initData) <%
    insert into xfsz_qwdj (
        djbh,
        jwzbh,
        djmc,
        jbbh,
        zgl,
        zt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{initData.jwzbh},
        #{initData.djmc},
        #{initData.jbbh},
        #{initData.zgl},
        #{initData.zt},
        NOW(),
        NOW()
    );
%>
// 插入数据
return insertSQL(initData);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-28 10:13:21', '2020-07-01 15:55:45', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (16, 'GET', '/pspc/policeStation/queryPolicePerson', 1, '巡防设置-查询警务站警力接口', 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询警力
var dataSet = @@sql(jwzbh) <%
    select jh, xm
    from t_police_person_infos
    where jwzbh = #{jwzbh};
%>

// 执行SQL，并返回结果
return dataSet(${jwzbh});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-22 11:45:14', '2020-07-01 15:51:24', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (14, 'GET', '/pspc/policeStation/queryServiceEffect', 1, '巡防设置-查询警务站勤务效果接口', 'DataQL', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"}
];
// 执行SQL，并返回结果
return dataSet;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-22 10:00:50', '2020-07-01 15:50:49', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (54, 'GET', '/pspc/policeStation/queryPolice135', 1, '巡防设置-查询警务站135信息接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 查询警务站135快反
var dataSet = @@sql(jwzbh) <%
    SELECT jwzbh, ylzd4, ylzd3, ylzd2, jwzmc
    FROM t_police_station_infos
    WHERE jwzbh = #{jwzbh}
%>
return dataSet(${jwzbh});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-19 17:54:34', '2020-07-01 15:54:08', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (9, 'GET', '/pspc/policeStation/queryQwxq', 1, '巡防设置-查询勤务详情接口', 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    SELECT dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_xfdw
    WHERE jwzbh = #{jwzbh}
    ORDER BY cjsj DESC
%>
var personSet = @@sql(jwzbh, jh) <%
    SELECT jh, xm, xb, nl, zw, jz, djjh
    FROM t_police_person_infos
    WHERE jwzbh = #{jwzbh} AND #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "dwcybh": dat.dwcybh,
        "dwcymc": dat.dwcymc,
        "zt": dat.zt,
        "cjsj": dat.cjsj,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, a.zt, a.lxjwd, a.lxcd, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.cjsj DESC
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, b.dwmc, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.cjsj DESC
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}) => [fmt(#)],
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 11:41:46', '2020-07-01 15:49:43', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (17, 'POST', '/pspc/policeStation/insertZdqy', 1, '巡防设置-新增巡防区域接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
if (string.isEmpty(params.orgCode)) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增重点区域！"
    };
}
// 校验参数
if (string.isEmpty(params.jwzbh)) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
if (string.isEmpty(params.qymc)) {
    return {
        "message": "参数区域名称不能为空！"
    };
}
if (string.isEmpty(params.xfdw)) {
    return {
        "message": "参数巡防队伍不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// 业务校验
var selectCount = @@sql(params) <%
    select count(1) from xfsz_zdqy where jwzbh = #{params.jwzbh} and qymc = #{params.qymc};
%>
if (selectCount(${params}) >= 1) {
    return {
        "message": "区域名称不能重复！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        xfdw,
        qwdj,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.xfdw},
        #{params.qwdj},
        ''0'',
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"orgCode":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"xfdw\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"8b347205-ee86-4991-aa27-258cda77b635\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-22 14:13:04', '2020-07-01 15:51:40', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (55, 'PUT', '/pspc/policeStation/updateKeyPlaces', 1, '通用功能-修改重点场所接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验参数
if (string.isEmpty(params.id)) {
    return {
        "message": "参数重点场所ID不能为空！"
    };
}
// 修改重点场所
var updateSQL = @@mybatis(params) <%
    <update>
        UPDATE key_places SET
            id = #{params.id}
            <if test="params.orgCode != null">
                , org_code = #{params.orgCode}
            </if>
            <if test="params.placesName != null">
                , places_name = #{params.placesName}
            </if>
            <if test="params.placesAddress != null">
                , places_addres = #{params.placesAddress}
            </if>
            <if test="params.placesDesc != null">
                , places_desc = #{params.placesDesc}
            </if>
            <if test="params.longitude != null">
                , longitude = #{params.longitude}
            </if>
            <if test="params.latitude != null">
                , latitude = #{params.latitude}
            </if>
            <if test="params.placesImage != null">
                , places_image = #{params.placesImage}
            </if>
            <if test="params.placesType != null">
                , places_type = #{params.placesType}
            </if>
            <if test="params.placesTel != null">
                , places_tel = #{params.placesTel}
            </if>
            <if test="params.employess != null">
                , employess = #{params.employess}
            </if>
            <if test="params.securityGuards != null">
                , security_guards = #{params.securityGuards}
            </if>
            <if test="params.ext1 != null">
                , ext1 = #{params.ext1}
            </if>
            <if test="params.ext2 != null">
                , ext2 = #{params.ext2}
            </if>
            <if test="params.ext3 != null">
                , ext3 = #{params.ext3}
            </if>
            <if test="params.typeName != null">
                , type_name = #{params.typeName}
            </if>
        WHERE id = #{params.id}
    </update>
%>
// 插入数据
return updateSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"latitude":{"type":"number"},"typeName":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"ext3":{"type":"string"},"ext2":{"type":"string"},"longitude":{"type":"number"},"ext1":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"id\": \"id\",\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型-\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1,\n    \"ext1\": \"\",\n    \"ext2\": \"\",\n    \"ext3\": \"\",\n    \"typeName\": \"\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-24 14:10:08', '2020-07-01 15:59:49', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (58, 'GET', '/pspc/cloudSearch/queryPoliceComments', 1, '云搜档案-查询警员批注接口', 'DataQL', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 设置的当前页码偏移量 1
hint FRAGMENT_SQL_QUERY_BY_PAGE_NUMBER_OFFSET = 1
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.ConvertUdfSource'' as convert;
// 查询批注数据
var dataSet = @@mybatis() <%
    <select>
        SELECT pzbh, jyzh, jymc, pznr, TO_CHAR(pzsj, ''YYYY-MM-DD HH24:MI:SS'') AS "pzsj"
        FROM jypzb
        ORDER BY pzsj DESC
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet();
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "currentPage" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"pageSize":{"type":"number"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNS42IiwicmVtZW1iZXJNZSI6ZmFsc2UsImV4cCI6MTU5NjQ0ODY2NSwidXNlcklkIjoiMmM5MjgwODM3MjMxMWY4ZTAxNzI1M2MwNTY5YzAwMTMiLCJTRUNSRVQiOiI3ZTM5ODI5YjkzZGQ0N2JmOTRhNzllNmUzM2MyYzVhYiIsInVzZXJuYW1lIjoiZHpnbHkifQ.CY4tOwMOyEyd9KXsDlQz1VIqCDBb4lEvU2jt6mDQmcMp-c_utVuaRUzpfQK0FHXqIOf5NUNjRuqW86VM2-vtXg"}]}', '2020-07-17 17:37:43', '2020-07-17 17:39:24', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 1, '巡防设置-查询勤务等级路线接口', 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var xllxSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh, b.dwcybh, b.dwcymc
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id};
%>
// 查询重点区域
var zdqySet = @@sql(id) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc", b.dwcybh, b.dwcymc
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.qwdj = #{id};
%>
// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${id}),
    "zdqy": zdqySet(${id})
}
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-29 20:37:30', '2020-07-01 15:58:48', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (6, 'POST', '/pspc/policeStation/insertQwdj', 1, '巡防设置-新增勤务等级接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
if (string.isEmpty(params.orgCode)) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增勤务等级！"
    };
}
// 校验参数
if (string.isEmpty(params.jwzbh)) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
if (string.isEmpty(params.djmc)) {
    return {
        "message": "参数等级名称不能为空！"
    };
}
if (string.isEmpty(params.jbbh)) {
    return {
        "message": "参数级别编号不能为空！"
    };
}
if (string.isEmpty(params.zgl)) {
    return {
        "message": "参数在岗率不能为空！"
    };
}
// 业务校验
var selectCount = @@sql(params) <%
    select count(1) from xfsz_qwdj where jwzbh = #{params.jwzbh} and djmc = #{params.djmc}
%>
if (selectCount(${params}) >= 1) {
    return {
        "message": "勤务等级名称不能重复！"
    };
}
// insert语句模版
var insertSQL = @@sql(params) <%
    insert into xfsz_qwdj (
        djbh,
        jwzbh,
        djmc,
        jbbh,
        zgl,
        zt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.djmc},
        #{params.jbbh},
        #{params.zgl},
        ''0'',
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"djmc":{"type":"string"},"orgCode":{"type":"string"},"jwzbh":{"type":"string"},"zgl":{"type":"number"},"jbbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 10:33:15', '2020-07-01 15:48:45', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (7, 'POST', '/pspc/policeStation/insertXfdw', 1, '巡防设置-新增巡防队伍接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
if (string.isEmpty(params.orgCode)) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡防队伍！"
    };
}
// 校验参数
if (string.isEmpty(params.jwzbh)) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
if (string.isEmpty(params.dwmc)) {
    return {
        "message": "参数队伍名称不能为空！"
    };
}
if (string.isEmpty(params.dwcybh)) {
    return {
        "message": "参数队伍成员编号不能为空！"
    };
}
if (string.isEmpty(params.dwcymc)) {
    return {
        "message": "参数队伍成员名称不能为空！"
    };
}
// 业务校验
var selectCount = @@sql(params) <%
    select count(1) from xfsz_xfdw where jwzbh = #{params.jwzbh} and dwmc = #{params.dwmc}
%>
if (selectCount(${params}) >= 1) {
    return {
        "message": "巡防队伍名称不能重复！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xfdw (
        dwbh,
        jwzbh,
        dwmc,
        dwcybh,
        dwcymc,
        zt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.dwmc},
        #{params.dwcybh},
        #{params.dwcymc},
        ''0'',
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"dwmc":{"type":"string"},"orgCode":{"type":"string"},"jwzbh":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 11:08:34', '2020-07-01 15:49:17', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (12, 'PUT', '/pspc/policeStation/enableDisable', 1, '巡防设置-勤务详情启用禁用接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验权限
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(${orgCode}) > 6) {
    return {
        "message": "用户没有权限新增勤务等级！"
    };
}
// 校验参数
if (string.isEmpty(${type})) {
    return {
        "message": "参数启用禁用类型不能为空！"
    };
}
if (string.isEmpty(${id})) {
    return {
        "message": "参数启用禁用ID不能为空！"
    };
}
if (string.isEmpty(${zt})) {
    return {
        "message": "参数启用禁用状态不能为空！"
    };
}
// 修改勤务等级
if ("qwdj" == #{type}) {
    if ("1" == #{zt}) {
        var count = @@sql(id) <%
            select count(1) from xfsz_qwdj where zt = ''1'' and jwzbh in ( select jwzbh from xfsz_qwdj where djbh = #{id} )
        %>
        if (count(${id}) >= 1) {
            return {
                "message": "启用中的勤务等级只能有一个！"
            };
        }
    }
    var qwdjSql = @@sql(zt, id) <%
        update xfsz_qwdj set zt = #{zt} where djbh = #{id};
    %>
    return qwdjSql(${zt}, ${id});
// 修改巡防队伍
} else if ("xfdw" == #{type}) {
    if ("1" == #{zt}) {
        // 查询警务站启用中的队伍成员
        var personSet = @@sql(id) <%
            select string_agg(dwcybh, '','')
            from xfsz_xfdw where zt = ''1'' and jwzbh in ( select jwzbh from xfsz_xfdw where dwbh = #{id} );
        %>
        var personStr = personSet(${id});
        if (personStr != null) {
            // 查询将要启用的队伍成员
            var dwcybh = @@sql(id) <%
                select dwcybh from xfsz_xfdw where dwbh = #{id};
            %>
            var array = utils.split(dwcybh(${id}))
            if (string.containsAny(personStr, array)) {
                return {
                    "message": "启用中的队伍不能存在同一成员"
                };
            }
        }
    }
    var xfdwSql = @@sql(zt, id) <%
        update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
    %>
    return xfdwSql(${zt}, ${id});
// 修改巡逻路线
} else if ("xllx" == #{type}) {
    var xllxSql = @@sql(zt, id) <%
        update xfsz_xllx set zt = #{zt} where lxbh = #{id};
    %>
    return xllxSql(${zt}, ${id});
// 修改重点区域
} else if ("zdqy" == #{type}) {
    var zdqySql = @@sql(zt, id) <%
        update xfsz_zdqy set zt = #{zt} where qybh = #{id};
    %>
    return zdqySql(${zt}, ${id});
}
return {
    "mseeage": "参数启用禁用类型不正确！"
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"},"zt":{"type":"string"},"id":{"type":"string"},"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"xfdw\",\n  \"zt\": \"1\",\n  \"id\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n  \"orgCode\": \"5203\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 21:08:49', '2020-07-01 15:50:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (8, 'POST', '/pspc/policeStation/insertXllx', 1, '巡防设置-新增巡逻路线接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
if (string.isEmpty(params.orgCode)) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡逻路线！"
    };
}
// 校验参数
if (string.isEmpty(params.jwzbh)) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
if (string.isEmpty(params.lxmc)) {
    return {
        "message": "参数路线名称不能为空！"
    };
}
if (string.isEmpty(params.dwbh)) {
    return {
        "message": "参数队伍编号不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// 业务校验
var selectCount = @@sql(params) <%
    select count(1) from xfsz_xllx where jwzbh = #{params.jwzbh} and lxmc = #{params.lxmc}
%>
if (selectCount(${params}) >= 1) {
    return {
        "message": "巡逻路线名称不能重复！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        qwdj,
        zt,
        lxjwd,
        lxcd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.qwdj},
        ''0'',
        #{params.lxjwd},
        #{params.lxcd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"dwbh":{"type":"string"},"orgCode":{"type":"string"},"qwdj":{"type":"string"},"jwzbh":{"type":"string"},"lxcd":{"type":"number"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"lxjwd\": \"\",\n    \"lxcd\": 1,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 11:21:11', '2020-07-01 15:49:29', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (34, 'GET', '/pspc/policeStation/queryKeyPlaces', 1, '通用功能-查询重点场所接口', 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
hint FRAGMENT_SQL_COLUMN_CASE = "hump" // 统一转驼峰
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${extent})) {
    return {
        "message": "参数可视区域不能为空！"
    };
}
if (string.isEmpty(${placesType})) {
    return {
        "message": "参数场所类型不能为空！"
    };
}
if (string.isEmpty(${shortOrgCode})) {
    return {
        "message": "参数组织编码不能为空！"
    };
}
if (string.isEmpty(${serviceIp})) {
    return {
        "message": "参数服务IP不能为空！"
    };
}
// 查询重点场所
var dataSet = @@mybatis(placesType, extent, shortOrgCode) <%
    <select>
        SELECT a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
            , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type AS "places_type_code"
            , b.dmxms AS "icon_name", coalesce(c.device_id, '''') AS "device_id"
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        WHERE ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom) AND a.places_type != ''''
        <if test="shortOrgCode != null and shortOrgCode != ''''">
            AND (a.org_code ~ #{shortOrgCode} OR a.org_code = '''')
        </if>
        <if test="placesType != null and placesType == ''policeStation''">
            AND a.places_type = ''206''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND a.places_type != ''206''
        </if>
    </select>
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"deviceId":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNi4xMTYiLCJyZW1lbWJlck1lIjpmYWxzZSwiZXhwIjoxNTk1NjYxOTcyLCJ1c2VySWQiOiIyYzkyODA4YTcyYmFkZWM0MDE3MmMxMmVhNGQ5MDAwMCIsIlNFQ1JFVCI6IjlkMzgzNzhjMzE0ZjRmNDE4YzJjMDhiMTEyZGVlZDg0IiwidXNlcm5hbWUiOiIwMzA3In0.nPRg-I9AM_edebVvRjifIpGsokS2Uupe6CQym4WoK0yBEUIOqhuZpNLeyf1RV-KYkGF33LH-9GQVbRB1rh8B2g"}]}', '2020-05-27 14:52:40', '2020-07-17 11:35:53', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (11, 'DELETE', '/pspc/policeStation/deleteQwxq', 1, '巡防设置-删除勤务详情接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验权限
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(${orgCode}) > 6) {
    return {
        "message": "用户没有权限删除勤务详情！"
    };
}
// 校验参数
if (string.isEmpty(${delType})) {
    return {
        "message": "参数删除类型不能为空！"
    };
}
if (string.isEmpty(${id})) {
    return {
        "message": "参数ID不能为空！"
    };
}
// 删除勤务等级
if ("qwdj" == #{delType}) {
    var count = @@sql(id) <%
        select count(1) from xfsz_qwdj where djbh = #{id} and zt = ''1'';
    %>
    if (count(${id}) >= 1) {
        return {
            "message": "启用中的勤务等级不能删除！"
        };
    }
    var qwdjSql = @@sql(id) <%
        delete from xfsz_qwdj where djbh = #{id};
    %>
    return qwdjSql(${id});
// 删除巡防队伍
} else if ("xfdw" == #{delType}) {
    var count = @@sql(id) <%
        select count(1) from xfsz_xfdw where dwbh = #{id} and zt = ''1'';
    %>
    if (count(${id}) >= 1) {
        return {
            "message": "启用中的巡防队伍不能删除！"
        };
    }
    var xfdwSql = @@sql(id) <%
        delete from xfsz_xfdw where dwbh = #{id};
    %>
    return xfdwSql(${id});
// 删除巡逻路线
} else if ("xllx" == #{delType}) {
    var count = @@sql(id) <%
        select count(1) from xfsz_xllx where lxbh = #{id} and zt = ''1'';
    %>
    if (count(${id}) >= 1) {
        return {
            "message": "启用中的巡逻路线不能删除！"
        };
    }
    var xllxSql = @@sql(id) <%
        delete from xfsz_xllx where lxbh = #{id};
    %>
    return xllxSql(${id});
// 删除重点区域
} else if ("zdqy" == #{delType}) {
    var count = @@sql(id) <%
        select count(1) from xfsz_zdqy where qybh = #{id} and zt = ''1'';
    %>
    if (count(${id}) >= 1) {
        return {
            "message": "启用中的重点区域不能删除！"
        };
    }
    var zdqySql = @@sql(id) <%
        delete from xfsz_zdqy where qybh = #{id};
    %>
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"},"delType":{"type":"string"},"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\",\n  \"orgCode\":\"2423567547657\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-21 15:39:43', '2020-07-01 15:49:53', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (15, 'GET', '/pspc/policeStation/queryPatrolResults', 1, '巡防设置-查询警务站巡防战果', 'DataQL', '// jwzbh 警务站参数说明：不能为空
// type 类型参数说明：不能为空 day-日；month-月；season-季；year-年

// mock巡防战果数据
var dataSet = [
    {"id":"1","name":"盘查人数","value":360,"percentage":54},
    {"id":"2","name":"盘查车辆","value":230,"percentage":40},
    {"id":"3","name":"盘查重点人员数","value":4,"percentage":4},
    {"id":"4","name":"盘查重点车辆数","value":2,"percentage":2},
    {"id":"5","name":"收缴违禁品数","value":0,"percentage":0},
    {"id":"6","name":"抓获人员数","value":0,"percentage":0}
];
// 执行SQL，并返回结果
return dataSet;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"type\": \"day\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-22 10:44:38', '2020-07-01 15:51:02', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (39, 'GET', '/pspc/policeStation/queryCheckInfo', 1, '巡防战果-查询核查数据接口', 'DataQL', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.ConvertUdfSource'' as convert;
// 查询核查数据
var dataSet = @@mybatis(condition, hcjy, hclx, ssdw, startTime, endTime) <%
    <select>
        SELECT id, hclx, TO_CHAR(hcsj, ''YYYY-MM-DD HH24:MI:SS'') AS "hcsj", hcdd, hcjy, ssdw, qkjl
            , rymc, xb, sfzh, rylx, cphm, cllx, wjpm, lb, jwzbh
        FROM xfzg_hcmx
        WHERE 1 = 1
        <if test="condition != null and condition != ''''">
            AND (hcdd LIKE ''%'' + #{condition} + ''%'' OR rymc LIKE ''%'' + #{condition} + ''%'' OR sfzh LIKE ''%'' + #{condition} + ''%''
            OR cphm LIKE ''%'' + #{condition} + ''%'' OR wjpm LIKE ''%'' + #{condition} + ''%'')
        </if>
        <if test="hcjy != null and hcjy != ''''">
            AND hcjy LIKE ''%'' + #{hcjy} + ''%''
        </if>
        <if test="hclx != null and hclx != ''''">
            AND hclx = #{hclx}
        </if>
        <if test="ssdw != null and ssdw != ''''">
            AND ssdw LIKE ''%'' + #{ssdw} + ''%''
        </if>
        <if test="startTime != null and startTime != ''''">
            AND hcsj >= to_timestamp(#{startTime}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone
        </if>
        <if test="endTime != null and endTime != ''''">
            AND to_timestamp(#{endTime}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone >= hcsj
        </if>
        ORDER BY hcsj DESC
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${condition}, ${hcjy}, ${hclx}, ${ssdw}, ${startTime}, ${endTime});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "currentPage" : convert.toInt(${pageNum}) - 1
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"2020-06-01 15:25:09\",\n  \"endTime\": \"2020-06-04 15:25:09\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-02 15:17:17', '2020-07-01 15:54:50', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (18, 'PUT', '/pspc/policeStation/updateQwxq', 1, '巡防设置-修改勤务详情接口', 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验权限
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数用户组织编码不能为空！"
    };
}
if (utils.length(${orgCode}) > 6) {
    return {
        "message": "用户没有权限修改勤务详情！"
    };
}
// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        zgl = #{data.zgl},
        gxsj = now()
    where djbh = #{data.djbh};
%>
// 修改巡防队伍
var xfdwSql = @@sql(data) <%
    update xfsz_xfdw set
        dwmc = #{data.dwmc},
        dwcybh = #{data.dwcybh},
        dwcymc = #{data.dwcymc},
        gxsj = now()
    where dwbh = #{data.dwbh};
%>
// 修改巡逻路线
var xllxSql = @@sql(data) <%
    update xfsz_xllx set
        lxmc = #{data.lxmc},
        dwbh = #{data.dwbh},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        lxcd = #{data.lxcd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        xfdw = #{data.xfdw},
        qwdj = #{data.qwdj},
        qyfw = #{data.qyfw},
        zxdw = #{data.zxdw},
        gxsj = now()
    where qybh = #{data.qybh};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${data});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${data});
} else if ("xllx" == #{type}) {
    return xllxSql(${data});
} else if ("zdqy" == #{type}) {
    return zdqySql(${data});
}
return {
    "mseeage": "参数修改类型不正确！"
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zgl":{"type":"number"}}},"orgCode":{"type":"string"},"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"52030000000000\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-22 14:19:30', '2020-07-01 15:51:55', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (31, 'GET', '/pspc/policeStation/queryRouteArea', 1, '巡防设置-查询路线区域接口', 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.lxcd, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b on a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c on a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND c.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc", b.dwcybh, b.dwcymc
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND c.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-25 09:45:23', '2020-07-01 15:52:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (43, 'POST', '/pspc/device/bindingDefaultDevice', 1, '设备信息-绑定默认设备接口', 'DataQL', '// 参数说明 policeStation-警务站、keyPlaces-重点场所
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${type})) {
    return {
        "message": "参数绑定类型不能为空！"
    };
}
if (string.isEmpty(${id})) {
    return {
        "message": "参数绑定ID不能为空！"
    };
}
if (string.isEmpty(${deviceId})) {
    return {
        "message": "参数绑定设备ID不能为空！"
    };
}
// 删除绑定
var deleteSet = @@sql(id) <%
    DELETE FROM checkpoint_device WHERE checkpoint_id = #{id}
%>
run deleteSet(${id});
// 绑定设备
var dataSet = @@sql(id, deviceId) <%
    INSERT INTO checkpoint_device (
        checkpoint_id,
        device_id,
        default_play
    ) VALUES (
        #{id},
        #{deviceId},
        ''1''
    )
%>
return dataSet(${id}, ${deviceId});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"},"type":{"type":"string"},"deviceId":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"policeStation\",\n  \"id\": \"JZ790\",\n  \"deviceId\": \"52030263001320300221\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-10 15:47:54', '2020-07-01 15:53:06', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (42, 'GET', '/pspc/device/queryNearDevice', 1, '设备信息-查询附近设备接口', 'DataQL', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.ConvertUdfSource'' as convert;
// 校验参数
if (string.isEmpty(${longitude})) {
    return {
        "message": "参数经度不能为空！"
    };
}
if (string.isEmpty(${latitude})) {
    return {
        "message": "参数纬度不能为空！"
    };
}
if (string.isEmpty(${spacing})) {
    return {
        "message": "参数间距不能为空！"
    };
}
if (string.isEmpty(${shortOrgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
if (string.isEmpty(${id})) {
    return {
        "message": "参数绑定ID不能为空！"
    };
}
if (string.isEmpty(${pageNum})) {
    return {
        "message": "参数分页页数不能为空！"
    };
}
if (string.isEmpty(${pageSize})) {
    return {
        "message": "参数分页数量不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id, deviceName) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", COALESCE(b.default_play, '''') AS "defaultPlay",
        V2.DMXMC AS "deviceState"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    LEFT JOIN checkpoint_device b ON a.device_id = b.device_id AND b.checkpoint_id = #{id}
    LEFT JOIN B_SSSB_SBDQZTXX C ON a.DEVICE_ID = C.SBBH
    LEFT JOIN NV_ENUMERATION_VIEW V2 ON C.SBZTLX = V2.DMXZ AND V2.DMBM = ''DEVICE_STATUS''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.camera_type IN (''1'', ''3'', ''10'', ''11'')
        AND a.device_name ~ #{deviceName}
    ORDER BY a.device_id
%>
// 创建分页查询对象
var pageQuery = dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}, ${deviceName});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "currentPage" : convert.toInt(${pageNum}) - 1
};
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"pageSize":{"type":"number"},"id":{"type":"string"},"pageNum":{"type":"number"},"deviceName":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\",\n  \"pageNum\": 3,\n  \"pageSize\": 5,\n  \"deviceName\": \"\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-06-10 15:17:28', '2020-07-01 15:52:30', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_info" VALUES (32, 'GET', '/pspc/public/queryEnumType', 1, '通用功能-查询枚举类型接口', 'DataQL', '// LocationType--场所类型
// DisposalCircle--处置圈
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${dmbm})) {
    return {
        "message":"参数代码编码不能为空！"
    };
}
// 查询枚举类型
var dataSet = @@sql(dmbm) <%
    select dmxz, dmxmc
    from nv_enumeration_view
    where dmbm = #{dmbm}
    order by dmxz;
%>

// 执行SQL，并返回结果
return dataSet(${dmbm});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"dmbm":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"dmbm\": \"LocationType\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-05-25 17:18:39', '2020-07-01 15:53:31', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');

-- ----------------------------
-- Primary Key structure for table interface_info
-- ----------------------------
ALTER TABLE "public"."interface_info" ADD CONSTRAINT "interface_info_pkey" PRIMARY KEY ("api_id");
