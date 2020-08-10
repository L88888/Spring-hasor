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

 Date: 17/07/2020 17:43:48
*/


-- ----------------------------
-- Table structure for interface_release
-- ----------------------------
DROP TABLE IF EXISTS "public"."interface_release";
CREATE TABLE "public"."interface_release" (
  "pub_id" int4 NOT NULL DEFAULT nextval('interface_release_pub_id_seq'::regclass),
  "pub_api_id" int4 NOT NULL,
  "pub_method" varchar(12) COLLATE "pg_catalog"."default" NOT NULL,
  "pub_path" varchar(512) COLLATE "pg_catalog"."default" NOT NULL,
  "pub_status" int4 NOT NULL,
  "pub_type" varchar(24) COLLATE "pg_catalog"."default" NOT NULL,
  "pub_script" text COLLATE "pg_catalog"."default" NOT NULL,
  "pub_script_ori" text COLLATE "pg_catalog"."default" NOT NULL,
  "pub_schema" text COLLATE "pg_catalog"."default",
  "pub_sample" text COLLATE "pg_catalog"."default",
  "pub_release_time" timestamp(0) DEFAULT now(),
  "pub_option" text COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."interface_release"."pub_id" IS 'Publish ID';
COMMENT ON COLUMN "public"."interface_release"."pub_api_id" IS '所属API ID';
COMMENT ON COLUMN "public"."interface_release"."pub_method" IS 'HttpMethod：GET、PUT、POST';
COMMENT ON COLUMN "public"."interface_release"."pub_path" IS '拦截路径';
COMMENT ON COLUMN "public"."interface_release"."pub_status" IS '状态：0有效，1无效（可能被下线）';
COMMENT ON COLUMN "public"."interface_release"."pub_type" IS '脚本类型：SQL、DataQL';
COMMENT ON COLUMN "public"."interface_release"."pub_script" IS '查询脚本：xxxxxxx';
COMMENT ON COLUMN "public"."interface_release"."pub_script_ori" IS '原始查询脚本，仅当类型为SQL时不同';
COMMENT ON COLUMN "public"."interface_release"."pub_schema" IS '接口的请求/响应数据结构';
COMMENT ON COLUMN "public"."interface_release"."pub_sample" IS '请求/响应/请求头样本数据';
COMMENT ON COLUMN "public"."interface_release"."pub_release_time" IS '发布时间（下线不更新）';
COMMENT ON COLUMN "public"."interface_release"."pub_option" IS '扩展配置信息';

-- ----------------------------
-- Records of interface_release
-- ----------------------------
INSERT INTO "public"."interface_release" VALUES (202, 55, 'PUT', '/pspc/policeStation/updateKeyPlaces', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
            <if test="params.orgCode != null">
                org_code = #{params.orgCode},
            </if>
            <if test="params.placesName != null">
                places_name = #{params.placesName},
            </if>
            <if test="params.placesAddress != null">
                places_addres = #{params.placesAddress},
            </if>
            <if test="params.placesDesc != null">
                places_desc = #{params.placesDesc},
            </if>
            <if test="params.longitude != null">
                longitude = #{params.longitude},
            </if>
            <if test="params.latitude != null">
                latitude = #{params.latitude},
            </if>
            <if test="params.placesImage != null">
                places_image = #{params.placesImage},
            </if>
            <if test="params.placesType != null">
                places_type = #{params.placesType},
            </if>
            <if test="params.placesTel != null">
                places_tel = #{params.placesTel},
            </if>
            <if test="params.employess != null">
                employess = #{params.employess},
            </if>
            <if test="params.securityGuards != null">
                security_guards = #{params.securityGuards},
            </if>
            <if test="params.ext1 != null">
                ext1 = #{params.ext1},
            </if>
            <if test="params.ext2 != null">
                ext2 = #{params.ext2},
            </if>
            <if test="params.ext3 != null">
                ext3 = #{params.ext3},
            </if>
            <if test="params.typeName != null">
                type_name = #{params.typeName}
            </if>
        WHERE id = #{params.id}
    </update>
%>
// 插入数据
return updateSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
            <if test="params.orgCode != null">
                org_code = #{params.orgCode},
            </if>
            <if test="params.placesName != null">
                places_name = #{params.placesName},
            </if>
            <if test="params.placesAddress != null">
                places_addres = #{params.placesAddress},
            </if>
            <if test="params.placesDesc != null">
                places_desc = #{params.placesDesc},
            </if>
            <if test="params.longitude != null">
                longitude = #{params.longitude},
            </if>
            <if test="params.latitude != null">
                latitude = #{params.latitude},
            </if>
            <if test="params.placesImage != null">
                places_image = #{params.placesImage},
            </if>
            <if test="params.placesType != null">
                places_type = #{params.placesType},
            </if>
            <if test="params.placesTel != null">
                places_tel = #{params.placesTel},
            </if>
            <if test="params.employess != null">
                employess = #{params.employess},
            </if>
            <if test="params.securityGuards != null">
                security_guards = #{params.securityGuards},
            </if>
            <if test="params.ext1 != null">
                ext1 = #{params.ext1},
            </if>
            <if test="params.ext2 != null">
                ext2 = #{params.ext2},
            </if>
            <if test="params.ext3 != null">
                ext3 = #{params.ext3},
            </if>
            <if test="params.typeName != null">
                type_name = #{params.typeName}
            </if>
        WHERE id = #{params.id}
    </update>
%>
// 插入数据
return updateSQL(${params});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"latitude":{"type":"number"},"typeName":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"ext3":{"type":"string"},"ext2":{"type":"string"},"longitude":{"type":"number"},"ext1":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"id\": \"id\",\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型-\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1,\n    \"ext1\": \"\",\n    \"ext2\": \"\",\n    \"ext3\": \"\",\n    \"typeName\": \"\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4yMi42NyIsInJlbWVtYmVyTWUiOmZhbHNlLCJleHAiOjE1OTQ5MDE4MDEsInVzZXJJZCI6IjJjOTI4MDhmNzI5MWZkNTYwMTcyOWNkNWY1ZmYwMDE4IiwiU0VDUkVUIjoiMTI3M2Q0NTMwZjJkNGI1NWI4Mjk0ZDFiNjE1YWExMTIiLCJ1c2VybmFtZSI6ImRwdyJ9.NRQGs7iSUJFzqnJE8BIwK9Sxxu4qNWq2Iuvqw1L5IEoTsmyjOO2z19RUeBCIiaT1EHuNdKYIO2voMT5PmtuyKg"}]}', '2020-06-24 14:17:26', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (203, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
            , b.dmxms AS "icon_name", c.device_id
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
            , b.dmxms AS "icon_name", c.device_id
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"deviceId":{"type":["string","boolean","number","object","array","null"]},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC41LjE1MCIsInJlbWVtYmVyTWUiOmZhbHNlLCJleHAiOjE1OTUwNTg5MTMsInVzZXJJZCI6IjJjOTI4MDhmNzI3MmM0NjkwMTcyODM1NjVlNjMwMDAyIiwiU0VDUkVUIjoiNDRhMzU3NGYwNTRjNDZhNTk0Yjc4YzdkY2UwZTI0ODIiLCJ1c2VybmFtZSI6ImRtcCJ9.3soAyMVuRj495Pg6CU2TtKbQ0SgEN0ENGvYNZkczn6ZLeumR_M_tiMkaEmJWul5nuJQwr-hEdMSGY2KUctl8Sw"}]}', '2020-06-24 17:06:24', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (7, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', '// insert语句模版
var insertSQL = @@sql(params) <%
    insert into xfsz_qwdj (
        djbh,
        jwzbh,
        djmc,
        jbbh,
        zgl,
        djzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.djmc},
        #{params.jbbh},
        #{params.zgl},
        #{params.djzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句模版
var insertSQL = @@sql(params) <%
    insert into xfsz_qwdj (
        djbh,
        jwzbh,
        djmc,
        jbbh,
        zgl,
        djzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.djmc},
        #{params.jbbh},
        #{params.zgl},
        #{params.djzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"djzt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-21 10:55:53', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (8, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xfdw (
        dwbh,
        jwzbh,
        dwmc,
        dwcybh,
        dwcymc,
        dwzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.dwmc},
        #{params.dwcybh},
        #{params.dwcymc},
        #{params.dwzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xfdw (
        dwbh,
        jwzbh,
        dwmc,
        dwcybh,
        dwcymc,
        dwzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.dwmc},
        #{params.dwcybh},
        #{params.dwcymc},
        #{params.dwzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"dwzt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-21 11:10:40', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (9, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xfdw (
        dwbh,
        jwzbh,
        dwmc,
        dwcybh,
        dwcymc,
        dwzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.dwmc},
        #{params.dwcybh},
        #{params.dwcymc},
        #{params.dwzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xfdw (
        dwbh,
        jwzbh,
        dwmc,
        dwcybh,
        dwcymc,
        dwzt,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.dwmc},
        #{params.dwcybh},
        #{params.dwcymc},
        #{params.dwzt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"dwzt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-21 11:19:33', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (10, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        xlzt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.xlzt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        xlzt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.xlzt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\":\"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"xlzt\": \"1\",\n    \"lxjwd\":\"\"\n  }\n}","headerData":[]}', '2020-05-21 11:36:39', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (204, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"deviceId":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC41LjE1MCIsInJlbWVtYmVyTWUiOmZhbHNlLCJleHAiOjE1OTUwNTg5MTMsInVzZXJJZCI6IjJjOTI4MDhmNzI3MmM0NjkwMTcyODM1NjVlNjMwMDAyIiwiU0VDUkVUIjoiNDRhMzU3NGYwNTRjNDZhNTk0Yjc4YzdkY2UwZTI0ODIiLCJ1c2VybmFtZSI6ImRtcCJ9.3soAyMVuRj495Pg6CU2TtKbQ0SgEN0ENGvYNZkczn6ZLeumR_M_tiMkaEmJWul5nuJQwr-hEdMSGY2KUctl8Sw"}]}', '2020-06-24 17:13:01', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (13, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        xlzt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.xlzt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        xlzt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.xlzt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\":\"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"xlzt\": \"1\",\n    \"lxjwd\":\"\"\n  }\n}","headerData":[]}', '2020-05-21 14:42:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (14, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', '// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-21 15:12:55', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (15, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(djbh) <%
    delete from xfsz_qwdj where djbh = #{djbh};
%>
// 删除巡防队伍
var xfdwSql = @@sql(dwbh) <%
    delete from xfsz_xfdw where dwbh = #{dwbh};
%>
// 删除巡逻路线
var xllxSql = @@sql(lxbh) <%
    delete from xfsz_xllx where lxbh = #{lxbh};
%>
// 删除重点区域


if ("qwdj" == #{delType}) {
    return qwdjSql(${djbh});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${dwbh});
} else if ("xllx" == #{delType}) {
    return xllxSql(${lxbh});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(djbh) <%
    delete from xfsz_qwdj where djbh = #{djbh};
%>
// 删除巡防队伍
var xfdwSql = @@sql(dwbh) <%
    delete from xfsz_xfdw where dwbh = #{dwbh};
%>
// 删除巡逻路线
var xllxSql = @@sql(lxbh) <%
    delete from xfsz_xllx where lxbh = #{lxbh};
%>
// 删除重点区域


if ("qwdj" == #{delType}) {
    return qwdjSql(${djbh});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${dwbh});
} else if ("xllx" == #{delType}) {
    return xllxSql(${lxbh});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"xllx\",\n  \"djbh\": \"2cd3fa6e-02c2-4ea8-8448-22c669462f11\",\n  \"dwbh\": \"fb88502f-449d-4a1f-b707-8df3236562c1\",\n  \"lxbh\": \"ae9734b6-d866-4567-8163-1f09035b4160\"\n}","headerData":[]}', '2020-05-21 16:38:02', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (16, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', '// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-21 20:43:34', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (17, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, djzt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, dwzt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.xlzt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-21 21:32:49', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (18, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set djzt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set dwzt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set xlzt = #{zt} where lxbh = #{id};
%>
// 修改重点区域


if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
}
return null;', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set djzt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set dwzt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set xlzt = #{zt} where lxbh = #{id};
%>
// 修改重点区域


if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
}
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"zt\": \"1\",\n  \"id\": \"06910f37-1539-41e9-9ae7-8167600f68f5\"\n}","headerData":[]}', '2020-05-22 09:35:59', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (20, 14, 'GET', '/pspc/policeStation/queryServiceEffect', 0, 'DataQL', '// mock勤务效果数据

var dataSet = [
    {"name":"巡逻次数","value":"50"},
    {"name":"路线偏离","value":"40"},
    {"name":"久停","value":"10"}
];
// 执行SQL，并返回结果
return dataSet;', '// mock勤务效果数据

var dataSet = [
    {"name":"巡逻次数","value":"50"},
    {"name":"路线偏离","value":"40"},
    {"name":"久停","value":"10"}
];
// 执行SQL，并返回结果
return dataSet;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-22 10:42:11', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (21, 14, 'GET', '/pspc/policeStation/queryServiceEffect', 0, 'DataQL', '// mock勤务效果数据
var dataSet = [
    {"name":"巡逻次数","value":"50"},
    {"name":"路线偏离","value":"40"},
    {"name":"久停","value":"10"}
];
// 执行SQL，并返回结果
return dataSet;', '// mock勤务效果数据
var dataSet = [
    {"name":"巡逻次数","value":"50"},
    {"name":"路线偏离","value":"40"},
    {"name":"久停","value":"10"}
];
// 执行SQL，并返回结果
return dataSet;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-22 10:42:35', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (22, 15, 'GET', '/pspc/policeStation/queryPatrolResults', 0, 'DataQL', '// mock巡防战果数据
var dataSet = [
    {"id":"1","name":"盘查人数","value":360},
    {"id":"2","name":"盘查车辆","value":230},
    {"id":"3","name":"盘查重点人员数","value":4},
    {"id":"4","name":"盘查重点车辆数","value":2},
    {"id":"5","name":"收缴违禁品数","value":0},
    {"id":"6","name":"抓获人员数","value":0}
];
// 执行SQL，并返回结果
return dataSet;', '// mock巡防战果数据
var dataSet = [
    {"id":"1","name":"盘查人数","value":360},
    {"id":"2","name":"盘查车辆","value":230},
    {"id":"3","name":"盘查重点人员数","value":4},
    {"id":"4","name":"盘查重点车辆数","value":2},
    {"id":"5","name":"收缴违禁品数","value":0},
    {"id":"6","name":"抓获人员数","value":0}
];
// 执行SQL，并返回结果
return dataSet;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"type\": \"day\"\n}","headerData":[]}', '2020-05-22 10:50:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (23, 15, 'GET', '/pspc/policeStation/queryPatrolResults', 0, 'DataQL', '// jwzbh 警务站参数说明：不能为空
// type 类型参数说明：不能为空 day-日；month-月；season-季；year-年

// mock巡防战果数据
var dataSet = [
    {"id":"1","name":"盘查人数","value":360},
    {"id":"2","name":"盘查车辆","value":230},
    {"id":"3","name":"盘查重点人员数","value":4},
    {"id":"4","name":"盘查重点车辆数","value":2},
    {"id":"5","name":"收缴违禁品数","value":0},
    {"id":"6","name":"抓获人员数","value":0}
];
// 执行SQL，并返回结果
return dataSet;', '// jwzbh 警务站参数说明：不能为空
// type 类型参数说明：不能为空 day-日；month-月；season-季；year-年

// mock巡防战果数据
var dataSet = [
    {"id":"1","name":"盘查人数","value":360},
    {"id":"2","name":"盘查车辆","value":230},
    {"id":"3","name":"盘查重点人员数","value":4},
    {"id":"4","name":"盘查重点车辆数","value":2},
    {"id":"5","name":"收缴违禁品数","value":0},
    {"id":"6","name":"抓获人员数","value":0}
];
// 执行SQL，并返回结果
return dataSet;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"type\": \"day\"\n}","headerData":[]}', '2020-05-22 10:53:56', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (205, 55, 'PUT', '/pspc/policeStation/updateKeyPlaces', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return updateSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return updateSQL(${params});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"latitude":{"type":"number"},"typeName":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"ext3":{"type":"string"},"ext2":{"type":"string"},"longitude":{"type":"number"},"ext1":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"id\": \"id\",\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型-\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1,\n    \"ext1\": \"\",\n    \"ext2\": \"\",\n    \"ext3\": \"\",\n    \"typeName\": \"\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4yMi42NyIsInJlbWVtYmVyTWUiOmZhbHNlLCJleHAiOjE1OTQ5MDE4MDEsInVzZXJJZCI6IjJjOTI4MDhmNzI5MWZkNTYwMTcyOWNkNWY1ZmYwMDE4IiwiU0VDUkVUIjoiMTI3M2Q0NTMwZjJkNGI1NWI4Mjk0ZDFiNjE1YWExMTIiLCJ1c2VybmFtZSI6ImRwdyJ9.NRQGs7iSUJFzqnJE8BIwK9Sxxu4qNWq2Iuvqw1L5IEoTsmyjOO2z19RUeBCIiaT1EHuNdKYIO2voMT5PmtuyKg"}]}', '2020-06-24 17:47:42', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (24, 16, 'GET', '/pspc/policeStation/queryPolicePerson', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询警力
var dataSet = @@sql(jwzbh) <%
    select jh, xm
    from t_police_person_infos
    where jwzbh = #{jwzbh};
%>

// 执行SQL，并返回结果
return dataSet(${jwzbh});', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询警力
var dataSet = @@sql(jwzbh) <%
    select jh, xm
    from t_police_person_infos
    where jwzbh = #{jwzbh};
%>

// 执行SQL，并返回结果
return dataSet(${jwzbh});', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-22 11:45:20', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (25, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        qyzt,
        qyfw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.qyzt},
        #{params.qyfw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        qyzt,
        qyfw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.qyzt},
        #{params.qyfw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\":\"列管原因\",\n    \"qyzt\": \"1\",\n    \"qyfw\":\"\"\n  }\n}","headerData":[]}', '2020-05-22 14:16:51', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (26, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域


if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域


if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"xllx\",\n  \"id\": \"2cd3fa6e-02c2-4ea8-8448-22c669462f111\"\n}","headerData":[]}', '2020-05-22 14:42:31', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (75, 32, 'GET', '/pspc/public/queryEnumType', 0, 'DataQL', '// LocationType--场所类型
// DisposalCircle--处置圈
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询枚举类型
var dataSet = @@sql(dmbm) <%
    select dmxz, dmxmc
    from nv_enumeration_view
    where dmbm = #{dmbm}
    order by dmxz;
%>

// 执行SQL，并返回结果
return dataSet(${dmbm});', '// LocationType--场所类型
// DisposalCircle--处置圈
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询枚举类型
var dataSet = @@sql(dmbm) <%
    select dmxz, dmxmc
    from nv_enumeration_view
    where dmbm = #{dmbm}
    order by dmxz;
%>

// 执行SQL，并返回结果
return dataSet(${dmbm});', '{}', '{"requestBody":"{\n  \"dmbm\": \"DisposalCircle\"\n}","headerData":[]}', '2020-05-25 17:27:30', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (27, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-22 15:03:24', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (28, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', '// insert语句模版
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句模版
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-22 15:03:57', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (29, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', '// insert语句
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"zt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-22 15:04:21', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (30, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\":\"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"zt\": \"1\",\n    \"lxjwd\":\"\"\n  }\n}","headerData":[]}', '2020-05-22 15:04:36', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (118, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
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
        xlpc,
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
        #{params.xlpc},
        #{params.qwdj},
        ''0'',
        #{params.lxjwd},
        #{params.lxcd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
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
        xlpc,
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
        #{params.xlpc},
        #{params.qwdj},
        ''0'',
        #{params.lxjwd},
        #{params.lxcd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"lxjwd\": \"\",\n    \"lxcd\": 1,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-05-28 14:05:39', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (31, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域


if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
}
return null;', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域


if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
}
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"zt\": \"1\",\n  \"id\": \"06910f37-1539-41e9-9ae7-8167600f68f5\"\n}","headerData":[]}', '2020-05-22 15:05:23', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (32, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\":\"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\":\"\"\n  }\n}","headerData":[]}', '2020-05-22 15:05:52', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (37, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw
    from xfsz_zdqy
    where jwzbh = #{jwzbh}
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw
    from xfsz_zdqy
    where jwzbh = #{jwzbh}
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-22 17:09:27', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (38, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"xllx\",\n  \"id\": \"2cd3fa6e-02c2-4ea8-8448-22c669462f111\"\n}","headerData":[]}', '2020-05-22 17:11:45', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (33, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
        zgl = #{data.zgl}
    where djbh = #{data.djbh};
%>
// 修改巡防队伍
var xfdwSql = @@sql(data) <%
    update xfsz_xfdw set

    where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(data) <%
    update xfsz_xllx set

    where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set

    where qybh = #{id};
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
        zgl = #{data.zgl}
    where djbh = #{data.djbh};
%>
// 修改巡防队伍
var xfdwSql = @@sql(data) <%
    update xfsz_xfdw set

    where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(data) <%
    update xfsz_xllx set

    where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set

    where qybh = #{id};
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\":80\n  }\n}","headerData":[]}', '2020-05-22 16:36:45', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (34, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
        zgl = #{data.zgl}
    where djbh = #{data.djbh};
%>
// 修改巡防队伍
var xfdwSql = @@sql(data) <%
    update xfsz_xfdw set

    where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(data) <%
    update xfsz_xllx set

    where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set

    where qybh = #{id};
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
        zgl = #{data.zgl}
    where djbh = #{data.djbh};
%>
// 修改巡防队伍
var xfdwSql = @@sql(data) <%
    update xfsz_xfdw set

    where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(data) <%
    update xfsz_xllx set

    where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set

    where qybh = #{id};
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-22 16:37:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (35, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-22 16:46:40', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (36, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czy},
        lgyy = #{data.lgyy},
        qyfw = #{data.qyfw},
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czy},
        lgyy = #{data.lgyy},
        qyfw = #{data.qyfw},
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-22 16:50:56', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (39, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where zdqy = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where zdqy = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"zt\": \"1\",\n  \"id\": \"06910f37-1539-41e9-9ae7-8167600f68f5\"\n}","headerData":[]}', '2020-05-22 17:15:25', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (40, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
        qyfw = #{data.qyfw},
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
        qyfw = #{data.qyfw},
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-22 18:43:16', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (206, 56, 'POST', '/pspc/test', 1, 'DataQL', '// a new Query.
return ${message};', '// a new Query.
return ${message};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"message":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"},"value":{"type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}}}', '{"requestBody":"{\"message\":\"Hello DataQL.\"}","headerData":[{"name":"authorization","checked":true,"value":"123"}]}', '2020-07-01 14:40:17', '{"wrapAllParameters":false,"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (217, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zgl":{"type":"number"}}},"orgCode":{"type":"string"},"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"52030000000000\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:51:55', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (218, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:52:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (41, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\"\n}","headerData":[]}', '2020-05-22 19:56:28', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (42, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delTye}) {
    return zdqySql(${id});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\"\n}","headerData":[]}', '2020-05-22 20:01:36', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (43, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return null;', '// 删除勤务等级
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return null;', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\"\n}","headerData":[]}', '2020-05-22 20:02:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (207, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"djmc":{"type":"string"},"orgCode":{"type":"string"},"jwzbh":{"type":"string"},"zgl":{"type":"number"},"jbbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:48:45', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (208, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"dwmc":{"type":"string"},"orgCode":{"type":"string"},"jwzbh":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:49:17', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (209, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"dwbh":{"type":"string"},"orgCode":{"type":"string"},"qwdj":{"type":"string"},"jwzbh":{"type":"string"},"lxcd":{"type":"number"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"lxjwd\": \"\",\n    \"lxcd\": 1,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:49:29', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (210, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:49:43', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (211, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"},"delType":{"type":"string"},"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\",\n  \"orgCode\":\"2423567547657\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:49:53', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (212, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"},"zt":{"type":"string"},"id":{"type":"string"},"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"xfdw\",\n  \"zt\": \"1\",\n  \"id\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n  \"orgCode\": \"5203\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:50:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (213, 14, 'GET', '/pspc/policeStation/queryServiceEffect', 0, 'DataQL', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"}
];
// 执行SQL，并返回结果
return dataSet;', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"}
];
// 执行SQL，并返回结果
return dataSet;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:50:49', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (52, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\": \"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\"\n  }\n}","headerData":[]}', '2020-05-23 16:34:38', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (53, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh = #{jwzbh}
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh = #{jwzbh}
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-23 16:35:42', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (54, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
return null;', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
return null;', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-23 16:36:31', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (214, 15, 'GET', '/pspc/policeStation/queryPatrolResults', 0, 'DataQL', '// jwzbh 警务站参数说明：不能为空
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
return dataSet;', '// jwzbh 警务站参数说明：不能为空
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
return dataSet;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"type\": \"day\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:51:02', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (215, 16, 'GET', '/pspc/policeStation/queryPolicePerson', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询警力
var dataSet = @@sql(jwzbh) <%
    select jh, xm
    from t_police_person_infos
    where jwzbh = #{jwzbh};
%>

// 执行SQL，并返回结果
return dataSet(${jwzbh});', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询警力
var dataSet = @@sql(jwzbh) <%
    select jh, xm
    from t_police_person_infos
    where jwzbh = #{jwzbh};
%>

// 执行SQL，并返回结果
return dataSet(${jwzbh});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:51:24', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (216, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"orgCode":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"xfdw\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"8b347205-ee86-4991-aa27-258cda77b635\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:51:40', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (219, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
};', '// SQL 执行器切换为分页模式
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"pageSize":{"type":"number"},"id":{"type":"string"},"pageNum":{"type":"number"},"deviceName":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\",\n  \"pageNum\": 3,\n  \"pageSize\": 5,\n  \"deviceName\": \"\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:52:30', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (56, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-25 10:06:15', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (57, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-25 10:13:56', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (220, 43, 'POST', '/pspc/device/bindingDefaultDevice', 0, 'DataQL', '// 参数说明 policeStation-警务站、keyPlaces-重点场所
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
return dataSet(${id}, ${deviceId});', '// 参数说明 policeStation-警务站、keyPlaces-重点场所
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
return dataSet(${id}, ${deviceId});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"},"type":{"type":"string"},"deviceId":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"policeStation\",\n  \"id\": \"JZ790\",\n  \"deviceId\": \"52030263001320300221\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:53:06', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (221, 32, 'GET', '/pspc/public/queryEnumType', 0, 'DataQL', '// LocationType--场所类型
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
return dataSet(${dmbm});', '// LocationType--场所类型
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
return dataSet(${dmbm});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"dmbm":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"dmbm\": \"LocationType\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:53:31', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (222, 54, 'GET', '/pspc/policeStation/queryPolice135', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"},"value":{"type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:53:56', '{"wrapAllParameters":false,"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (157, 14, 'GET', '/pspc/policeStation/queryServiceEffect', 0, 'DataQL', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"}
];
// 执行SQL，并返回结果
return dataSet;', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"}
];
// 执行SQL，并返回结果
return dataSet;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"name":{"type":"string"},"value":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-03 14:08:38', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (223, 54, 'GET', '/pspc/policeStation/queryPolice135', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:54:08', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (224, 40, 'GET', '/pspc/policeStation/queryCheckTypeStat', 0, 'DataQL', '// 参数说明 day-日、month-月、season-季、year-年
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
return dataSet(params);', '// 参数说明 day-日、month-月、season-季、year-年
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
return dataSet(params);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"month\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:54:33', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (225, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
};', '// SQL 执行器切换为分页模式
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"2020-06-01 15:25:09\",\n  \"endTime\": \"2020-06-04 15:25:09\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:54:50', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (163, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
            , b.dmxms AS "icon_name"
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
            , b.dmxms AS "icon_name"
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-06-08 21:04:40', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (226, 38, 'POST', '/pspc/policeStation/updatePoliceStation', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh}, ${ylzd4}, ${ylzd3}, ${ylzd2});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh}, ${ylzd4}, ${ylzd3}, ${ylzd2});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"ylzd4\": \"\",\n  \"ylzd3\": \"\",\n  \"ylzd2\": \"\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:55:07', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (227, 35, 'POST', '/pspc/policeStation/initializationQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:55:31', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (228, 35, 'POST', '/pspc/policeStation/initializationQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:55:45', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (229, 33, 'POST', '/pspc/policeStation/insertKeyPlaces', 0, 'DataQL', '// insert语句模版
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
return insertSQL(${params});', '// insert语句模版
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
return insertSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"latitude":{"type":"number"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"securityGuards":{"type":"number"},"employess":{"type":"number"},"longitude":{"type":"number"},"placesTel":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述--可暂存场所类型中文\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型--可为空，后面统一update编码\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:57:08', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (230, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
        LEFT JOIN checkpoint_device c ON a.id = c.checkpoint_id
        <if test="placesType != null and placesType == ''policeStation''">
            AND b.dmbm = ''policeLayer''
        </if>
        <if test="placesType != null and placesType == ''keyPlaces''">
            AND b.dmbm = ''societyLayer''
        </if>
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:57:52', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (231, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:58:48', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (232, 55, 'PUT', '/pspc/policeStation/updateKeyPlaces', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return updateSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return updateSQL(${params});', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"placesAddress":{"type":"string"},"latitude":{"type":"number"},"typeName":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesType":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"ext3":{"type":"string"},"ext2":{"type":"string"},"longitude":{"type":"number"},"ext1":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"id\": \"id\",\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型-\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1,\n    \"ext1\": \"\",\n    \"ext2\": \"\",\n    \"ext3\": \"\",\n    \"typeName\": \"\"\n  }\n}","headerData":[{"name":"authorization","checked":true,"value":""}]}', '2020-07-01 15:59:49', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (72, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-25 15:14:13', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (73, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where qybh = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', '// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where qybh = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', '{}', '{"requestBody":"{\n  \"type\": \"zdqy\",\n  \"zt\": \"0\",\n  \"id\": \"36a70f67-1ef3-46f3-8b6d-1c76514e4049\"\n}","headerData":[]}', '2020-05-25 15:20:29', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (233, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNi4xMTYiLCJyZW1lbWJlck1lIjpmYWxzZSwiZXhwIjoxNTk1NjYxOTcyLCJ1c2VySWQiOiIyYzkyODA4YTcyYmFkZWM0MDE3MmMxMmVhNGQ5MDAwMCIsIlNFQ1JFVCI6IjlkMzgzNzhjMzE0ZjRmNDE4YzJjMDhiMTEyZGVlZDg0IiwidXNlcm5hbWUiOiIwMzA3In0.nPRg-I9AM_edebVvRjifIpGsokS2Uupe6CQym4WoK0yBEUIOqhuZpNLeyf1RV-KYkGF33LH-9GQVbRB1rh8B2g"}]}', '2020-07-02 09:09:14', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (77, 33, 'POST', '/pspc/policeStation/insertKeyPlaces', 0, 'DataQL', '// insert语句模版
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
return insertSQL(${params});', '// insert语句模版
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述--可暂存场所类型中文\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型--可为空，后面统一update编码\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1\n  }\n}","headerData":[]}', '2020-05-25 21:11:07', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (78, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-26 15:38:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (79, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-26 16:00:45', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (80, 32, 'GET', '/pspc/public/queryEnumType', 0, 'DataQL', '// LocationType--场所类型
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
return dataSet(${dmbm});', '// LocationType--场所类型
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
return dataSet(${dmbm});', '{}', '{"requestBody":"{\n  \"dmbm\": \"DisposalCircle\"\n}","headerData":[]}', '2020-05-26 16:17:11', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (81, 32, 'GET', '/pspc/public/queryEnumType', 0, 'DataQL', '// LocationType--场所类型
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
return dataSet(${dmbm});', '// LocationType--场所类型
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
return dataSet(${dmbm});', '{}', '{"requestBody":"{\n  \"dmbm\": \"LocationType\"\n}","headerData":[]}', '2020-05-26 16:26:49', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (82, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message":"参数警务站编号不能为空！"
    };
}
if (string.isEmpty(${djmc})) {
    return {
        "message":"参数等级名称不能为空！"
    };
}
if (string.isEmpty(${jbbh})) {
    return {
        "message":"参数级别编号不能为空！"
    };
}
if (string.isEmpty(${zgl})) {
    return {
        "message":"参数在岗率不能为空！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message":"参数警务站编号不能为空！"
    };
}
if (string.isEmpty(${djmc})) {
    return {
        "message":"参数等级名称不能为空！"
    };
}
if (string.isEmpty(${jbbh})) {
    return {
        "message":"参数级别编号不能为空！"
    };
}
if (string.isEmpty(${zgl})) {
    return {
        "message":"参数在岗率不能为空！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\"\n  }\n}","headerData":[]}', '2020-05-26 16:34:46', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (83, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\"\n}","headerData":[]}', '2020-05-26 16:43:08', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (84, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  }\n}","headerData":[]}', '2020-05-26 16:47:23', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (85, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-26 16:49:02', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (86, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''com.sailing.hasor.dataway.common.UtilsUdfSource'' as utils;
// 校验权限
if (utils.lenth(${orgCode}) > 6) {
    return {
        "message":"用户没有权限新增勤务等级！"
    };
}
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message":"参数警务站编号不能为空！"
    };
}
if (string.isEmpty(${djmc})) {
    return {
        "message":"参数等级名称不能为空！"
    };
}
if (string.isEmpty(${jbbh})) {
    return {
        "message":"参数级别编号不能为空！"
    };
}
if (string.isEmpty(${zgl})) {
    return {
        "message":"参数在岗率不能为空！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''com.sailing.hasor.dataway.common.UtilsUdfSource'' as utils;
// 校验权限
if (utils.lenth(${orgCode}) > 6) {
    return {
        "message":"用户没有权限新增勤务等级！"
    };
}
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message":"参数警务站编号不能为空！"
    };
}
if (string.isEmpty(${djmc})) {
    return {
        "message":"参数等级名称不能为空！"
    };
}
if (string.isEmpty(${jbbh})) {
    return {
        "message":"参数级别编号不能为空！"
    };
}
if (string.isEmpty(${zgl})) {
    return {
        "message":"参数在岗率不能为空！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-26 19:26:44', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (87, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\",\n    \"orgCode\": \"123456\"\n  }\n}","headerData":[]}', '2020-05-26 21:11:54', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (88, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
var params = ${params};
// 校验权限
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-26 21:23:30', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (89, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡防队伍！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡防队伍！"
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"zt\": \"1\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-26 21:24:36', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (90, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡逻路线！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增巡逻路线！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"zt\": \"1\",\n    \"lxjwd\": \"\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-26 21:25:39', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (91, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验权限
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验权限
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\",\n  \"orgCode\":\"2423567547657\"\n}","headerData":[]}', '2020-05-26 21:27:25', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (92, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增重点区域！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'var params = ${params};
// 校验权限
if (utils.length(params.orgCode) > 6) {
    return {
        "message": "用户没有权限新增重点区域！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\": \"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"234567876544\"\n  }\n}","headerData":[]}', '2020-05-26 21:28:24', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (93, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', '// 校验权限
if (utils.length(${orgCode}) > 6) {
    return {
        "message": "用户没有权限修改勤务详情！"
    };
}
// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '// 校验权限
if (utils.length(${orgCode}) > 6) {
    return {
        "message": "用户没有权限修改勤务详情！"
    };
}
// 修改勤务等级
var qwdjSql = @@sql(data) <%
    update xfsz_qwdj set
        djmc = #{data.djmc},
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"456789567896\"\n}","headerData":[]}', '2020-05-26 21:30:14', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (94, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"zt\": \"1\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-27 09:37:35', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (95, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        #{params.zt},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"zt\": \"1\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-27 09:41:10', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (96, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.dwbh)) {
    return {
        "message": "参数队伍编号不能为空！"
    };
}
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.dwbh)) {
    return {
        "message": "参数队伍编号不能为空！"
    };
}
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
        qwdj,
        zt,
        lxjwd,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.lxmc},
        #{params.dwbh},
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"zt\": \"1\",\n    \"lxjwd\": \"\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-27 09:48:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (97, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.qylx)) {
    return {
        "message": "参数区域类型不能为空！"
    };
}
if (string.isEmpty(params.czq)) {
    return {
        "message": "参数处置圈不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.qylx)) {
    return {
        "message": "参数区域类型不能为空！"
    };
}
if (string.isEmpty(params.czq)) {
    return {
        "message": "参数处置圈不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\": \"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-27 09:52:30', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (98, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.qylx)) {
    return {
        "message": "参数区域类型不能为空！"
    };
}
if (string.isEmpty(params.czq)) {
    return {
        "message": "参数处置圈不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.qylx)) {
    return {
        "message": "参数区域类型不能为空！"
    };
}
if (string.isEmpty(params.czq)) {
    return {
        "message": "参数处置圈不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\": \"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"1234567893456\"\n  }\n}","headerData":[]}', '2020-05-27 09:57:31', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (99, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
        qwdj = #{data.qwdj},
        lxjwd = #{data.lxjwd},
        gxsj = now()
    where lxbh = #{data.lxbh};
%>
// 修改重点区域
var zdqySql = @@sql(data) <%
    update xfsz_zdqy set
        qymc = #{data.qymc},
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"456789567896\"\n}","headerData":[]}', '2020-05-27 09:58:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (100, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where qybh = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
// 修改勤务等级
var qwdjSql = @@sql(zt, id) <%
    update xfsz_qwdj set zt = #{zt} where djbh = #{id};
%>
// 修改巡防队伍
var xfdwSql = @@sql(zt, id) <%
    update xfsz_xfdw set zt = #{zt} where dwbh = #{id};
%>
// 修改巡逻路线
var xllxSql = @@sql(zt, id) <%
    update xfsz_xllx set zt = #{zt} where lxbh = #{id};
%>
// 修改重点区域
var zdqySql = @@sql(zt, id) <%
    update xfsz_zdqy set zt = #{zt} where qybh = #{id};
%>

if ("qwdj" == #{type}) {
    return qwdjSql(${zt}, ${id});
} else if ("xfdw" == #{type}) {
    return xfdwSql(${zt}, ${id});
} else if ("xllx" == #{type}) {
    return xllxSql(${zt}, ${id});
} else if ("zdqy" == #{type}) {
    return zdqySql(${zt}, ${id});
}
return null;', '{}', '{"requestBody":"{\n  \"type\": \"zdqy\",\n  \"zt\": \"0\",\n  \"id\": \"36a70f67-1ef3-46f3-8b6d-1c76514e4049\",\n  \"orgCode\": \"\"\n}","headerData":[]}', '2020-05-27 10:01:03', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (101, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var qwdjSql = @@sql(id) <%
    delete from xfsz_qwdj where djbh = #{id};
%>
// 删除巡防队伍
var xfdwSql = @@sql(id) <%
    delete from xfsz_xfdw where dwbh = #{id};
%>
// 删除巡逻路线
var xllxSql = @@sql(id) <%
    delete from xfsz_xllx where lxbh = #{id};
%>
// 删除重点区域
var zdqySql = @@sql(id) <%
    delete from xfsz_zdqy where qybh = #{id};
%>

if ("qwdj" == #{delType}) {
    return qwdjSql(${id});
} else if ("xfdw" == #{delType}) {
    return xfdwSql(${id});
} else if ("xllx" == #{delType}) {
    return xllxSql(${id});
} else if ("zdqy" == #{delType}) {
    return zdqySql(${id});
}
return {
    "message": "参数删除类型不正确！"
};', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\",\n  \"orgCode\":\"2423567547657\"\n}","headerData":[]}', '2020-05-27 10:02:07', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (102, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
//hint FRAGMENT_SQL_COLUMN_CASE = "hump" // 统一转驼峰
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

// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所
// 执行SQL，并返回结果
//return sqlCondition;
return stationSet(sqlCondition);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
//hint FRAGMENT_SQL_COLUMN_CASE = "hump" // 统一转驼峰
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

// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所
// 执行SQL，并返回结果
//return sqlCondition;
return stationSet(sqlCondition);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\"\n}","headerData":[]}', '2020-05-27 18:08:02', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (103, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_zdqy (
        qybh,
        jwzbh,
        qymc,
        qylx,
        czq,
        lgyy,
        zt,
        qyfw,
        zxdw,
        cjsj,
        gxsj
    ) values (
        uuid_generate_v4(),
        #{params.jwzbh},
        #{params.qymc},
        #{params.qylx},
        #{params.czq},
        #{params.lgyy},
        #{params.zt},
        #{params.qyfw},
        #{params.zxdw},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"qylx\": \"重点核心区域\",\n    \"czq\": \"一分钟反应圈\",\n    \"lgyy\": \"列管原因\",\n    \"zt\": \"1\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"1234567893456\"\n  }\n}","headerData":[]}', '2020-05-27 19:16:46', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (104, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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

// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所

// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(sqlCondition));', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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

// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所

// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(sqlCondition));', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\"\n}","headerData":[]}', '2020-05-27 20:03:34', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (105, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所

// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(sqlCondition), iconImageUrl);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var sqlCondition = ("policeStation" == #{placesType}) ? "and a.places_type = ''206''" : "";
// 查询派出所
var stationSet = @@sql(sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type
    from checkpoint_key_places a
    where 1 = 1 ${sqlCondition};
%>
// 查询重点场所

// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(sqlCondition), iconImageUrl);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-27 20:29:38', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (106, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var stationSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(enumType, sqlCondition), iconImageUrl);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var stationSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(stationSet(enumType, sqlCondition), iconImageUrl);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-27 20:45:47', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (107, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition), iconImageUrl);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition), iconImageUrl);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-27 20:51:21', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (108, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from checkpoint_key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition), iconImageUrl, scale);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-27 20:56:36', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (109, 35, 'POST', '/pspc/policeStation/initializationQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 初始化数据
var initData = [
    { "jwzbh": #{jwzbh}, "djmc": "战时勤务", "jbbh": "一级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "加强勤务", "jbbh": "二级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "日常勤务", "jbbh": "三级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "自定义", "jbbh": "四级", "zgl": 0, "zt": "0" }
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
return insertSQL(initData);', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 初始化数据
var initData = [
    { "jwzbh": #{jwzbh}, "djmc": "战时勤务", "jbbh": "一级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "加强勤务", "jbbh": "二级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "日常勤务", "jbbh": "三级", "zgl": 0, "zt": "0" },
    { "jwzbh": #{jwzbh}, "djmc": "自定义", "jbbh": "四级", "zgl": 0, "zt": "0" }
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
return insertSQL(initData);', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-28 10:23:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (110, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.dwbh)) {
    return {
        "message": "参数队伍编号不能为空！"
    };
}
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
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
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        #{params.lxcd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
if (string.isEmpty(params.dwbh)) {
    return {
        "message": "参数队伍编号不能为空！"
    };
}
if (string.isEmpty(params.xlpc)) {
    return {
        "message": "参数线路频次不能为空！"
    };
}
if (string.isEmpty(params.qwdj)) {
    return {
        "message": "参数勤务等级不能为空！"
    };
}
// insert语句
var insertSQL = @@sql(params) <%
    insert into xfsz_xllx (
        lxbh,
        jwzbh,
        lxmc,
        dwbh,
        xlpc,
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
        #{params.xlpc},
        #{params.qwdj},
        #{params.zt},
        #{params.lxjwd},
        #{params.lxcd},
        NOW(),
        NOW()
    )
%>
// 插入数据
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"xlpc\": 2,\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"zt\": \"1\",\n    \"lxjwd\": \"\",\n    \"lxcd\": 1,\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-28 11:07:55', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (111, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        jbbh = #{data.jbbh},
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
        xlpc = #{data.xlpc},
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"456789567896\"\n}","headerData":[]}', '2020-05-28 11:08:24', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (112, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
%>

// 查询今日在岗统计

// 执行SQL，并返回结果
var result = {
    "qwdj": qwdjSet(${jwzbh}),
    "xfdw": xfdwSet(${jwzbh}),
    "xllx": xllxSet(${jwzbh}),
    "zdqy": zdqySet(${jwzbh}),
    "jrzrs": 15,
    "jrzgrs": 15,
    "jrzgrszb": 100
}
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-28 11:08:50', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (113, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-28 11:09:13', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (114, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-28 11:58:11', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (115, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"orgCode\": \"\"\n  }\n}","headerData":[]}', '2020-05-28 12:01:48', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (116, 6, 'POST', '/pspc/policeStation/insertQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"djmc\": \"日常勤务\",\n    \"jbbh\": \"三级\",\n    \"zgl\": 50,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-05-28 13:54:59', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (117, 7, 'POST', '/pspc/policeStation/insertXfdw', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"dwmc\": \"遵义会址警务站第1巡逻小队\",\n    \"dwcybh\": \"002、003、004\",\n    \"dwcymc\": \"张三、李四、王五\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-05-28 14:00:53', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (119, 33, 'POST', '/pspc/policeStation/insertKeyPlaces', 0, 'DataQL', '// insert语句模版
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
return insertSQL(${params});', '// insert语句模版
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"orgCode\": \"组织编码\",\n    \"placesName\": \"场所名称\",\n    \"placesAddress\": \"场所地址\",\n    \"placesDesc\": \"场所描述--可暂存场所类型中文\",\n    \"longitude\": 106.1,\n    \"latitude\": 27.2,\n    \"placesImage\": \"场所图片\",\n    \"placesType\": \"场所类型--可为空，后面统一update编码\",\n    \"placesTel\": \"场所电话\",\n    \"employess\": 1,\n    \"securityGuards\": 1\n  }\n}","headerData":[]}', '2020-05-28 14:06:37', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (120, 11, 'DELETE', '/pspc/policeStation/deleteQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{}', '{"requestBody":"{\n  \"delType\": \"zdqy\",\n  \"id\": \"29989a9a-1375-4d47-a74b-99c206dd4051\",\n  \"orgCode\":\"2423567547657\"\n}","headerData":[]}', '2020-05-28 14:29:47', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (121, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{}', '{"requestBody":"{\n  \"type\": \"zdqy\",\n  \"zt\": \"0\",\n  \"id\": \"36a70f67-1ef3-46f3-8b6d-1c76514e4049\",\n  \"orgCode\": \"\"\n}","headerData":[]}', '2020-05-28 14:47:27', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (234, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
return utils.scatterPointDataFormat(dataSet(${placesType}, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"deviceId":{"type":"string"},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"keyPlaces\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNi4xMTYiLCJyZW1lbWJlck1lIjpmYWxzZSwiZXhwIjoxNTk1NjYxOTcyLCJ1c2VySWQiOiIyYzkyODA4YTcyYmFkZWM0MDE3MmMxMmVhNGQ5MDAwMCIsIlNFQ1JFVCI6IjlkMzgzNzhjMzE0ZjRmNDE4YzJjMDhiMTEyZGVlZDg0IiwidXNlcm5hbWUiOiIwMzA3In0.nPRg-I9AM_edebVvRjifIpGsokS2Uupe6CQym4WoK0yBEUIOqhuZpNLeyf1RV-KYkGF33LH-9GQVbRB1rh8B2g"}]}', '2020-07-17 11:35:53', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (235, 57, 'POST', '/pspc/faceAlarm/queryAlarmInfo', 1, 'DataQL', '// a new Query.

return ${message};', '// a new Query.

return ${message};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"message":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"message\": \"Hello DataQL.\"\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNi4xMTYiLCJyZW1lbWJlck1lIjpmYWxzZSwiZXhwIjoxNTk1NjYxOTcyLCJ1c2VySWQiOiIyYzkyODA4YTcyYmFkZWM0MDE3MmMxMmVhNGQ5MDAwMCIsIlNFQ1JFVCI6IjlkMzgzNzhjMzE0ZjRmNDE4YzJjMDhiMTEyZGVlZDg0IiwidXNlcm5hbWUiOiIwMzA3In0.nPRg-I9AM_edebVvRjifIpGsokS2Uupe6CQym4WoK0yBEUIOqhuZpNLeyf1RV-KYkGF33LH-9GQVbRB1rh8B2g"}]}', '2020-07-17 14:43:39', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (236, 58, 'GET', '/pspc/cloudSearch/queryPoliceComments', 0, 'DataQL', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 设置的当前页码偏移量 1
hint FRAGMENT_SQL_QUERY_BY_PAGE_NUMBER_OFFSET = 1
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
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
};', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 设置的当前页码偏移量 1
hint FRAGMENT_SQL_QUERY_BY_PAGE_NUMBER_OFFSET = 1
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"pageSize":{"type":"number"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNS42IiwicmVtZW1iZXJNZSI6ZmFsc2UsImV4cCI6MTU5NjQ0ODY2NSwidXNlcklkIjoiMmM5MjgwODM3MjMxMWY4ZTAxNzI1M2MwNTY5YzAwMTMiLCJTRUNSRVQiOiI3ZTM5ODI5YjkzZGQ0N2JmOTRhNzllNmUzM2MyYzVhYiIsInVzZXJuYW1lIjoiZHpnbHkifQ.CY4tOwMOyEyd9KXsDlQz1VIqCDBb4lEvU2jt6mDQmcMp-c_utVuaRUzpfQK0FHXqIOf5NUNjRuqW86VM2-vtXg"}]}', '2020-07-17 17:37:47', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (237, 58, 'GET', '/pspc/cloudSearch/queryPoliceComments', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
};', '// SQL 执行器切换为分页模式
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
};', '{"headerSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"authorization":{"type":"string"}}},"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"pageSize":{"type":"number"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10\n}","headerData":[{"name":"authorization","checked":true,"value":"eyJhbGciOiJIUzUxMiJ9.eyJwYXNzd29yZCI6InNhaWxpbmdAMTIzIiwiaG9zdCI6IjE3Mi4yMC4zNS42IiwicmVtZW1iZXJNZSI6ZmFsc2UsImV4cCI6MTU5NjQ0ODY2NSwidXNlcklkIjoiMmM5MjgwODM3MjMxMWY4ZTAxNzI1M2MwNTY5YzAwMTMiLCJTRUNSRVQiOiI3ZTM5ODI5YjkzZGQ0N2JmOTRhNzllNmUzM2MyYzVhYiIsInVzZXJuYW1lIjoiZHpnbHkifQ.CY4tOwMOyEyd9KXsDlQz1VIqCDBb4lEvU2jt6mDQmcMp-c_utVuaRUzpfQK0FHXqIOf5NUNjRuqW86VM2-vtXg"}]}', '2020-07-17 17:39:24', '{"wrapAllParameters":false,"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}","wrapParameterName":"root"}');
INSERT INTO "public"."interface_release" VALUES (122, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-28 15:34:13', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (123, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type, b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-28 16:05:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (124, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type as "places_type_code"
    , b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@sql(enumType, sqlCondition, extent) <%
    select a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
    , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type as "places_type_code"
    , b.dmxms as "icon_name"
    from key_places a
    left join nv_enumeration_view b on a.places_type = b.dmxz and b.dmbm = #{enumType}
    where a.places_type ${sqlCondition} ''206'' and ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
        and a.places_type != '''';
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}), iconImageUrl, scale);', '{}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-05-29 09:24:55', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (125, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-29 10:36:36', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (126, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "dwcybh": dat.dwcybh,
        "dwcymc": dat.dwcymc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    select djbh, djmc, jbbh, zgl, zt
    from xfsz_qwdj
    where jwzbh = #{jwzbh};
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "dwcybh": dat.dwcybh,
        "dwcymc": dat.dwcymc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-29 10:38:06', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (127, 12, 'PUT', '/pspc/policeStation/enableDisable', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{}', '{"requestBody":"{\n  \"type\": \"xfdw\",\n  \"zt\": \"1\",\n  \"id\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-29 14:44:48', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (128, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "dwcybh": dat.dwcybh,
        "dwcymc": dat.dwcymc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
%>
var fmt = (dat)-> {
    return {
        "dwbh": dat.dwbh,
        "dwmc": dat.dwmc,
        "dwcybh": dat.dwcybh,
        "dwcymc": dat.dwcymc,
        "zt": dat.zt,
        "person": personSet(${jwzbh}, '','' + dat.dwcybh + '','')
    };
};
// 查询巡逻路线
var xllxSet = @@sql(jwzbh) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-29 20:31:22', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (129, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        xlpc = #{data.xlpc},
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        xlpc = #{data.xlpc},
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-29 20:34:40', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (130, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var dataSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id}
%>
return dataSet(${id});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var dataSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id}
%>
return dataSet(${id});', '{}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[]}', '2020-05-29 20:51:00', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (131, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var dataSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id}
%>
return dataSet(${id});', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var dataSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id}
%>
return dataSet(${id});', '{}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[]}', '2020-05-29 20:54:25', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (132, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    select qybh, qymc, qylx, czq, lgyy, zt, qyfw, zxdw, jwzbh
    from xfsz_zdqy
    where zt = ''1'' and jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"qylx":{"type":"string"},"zxdw":{"type":"string"},"lgyy":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"czq":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-30 14:18:19', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (147, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxjwd":{"type":"string"},"dwmc":{"type":"string"},"dwcybh":{"type":"string"},"lxmc":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[]}', '2020-06-01 20:35:06', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (133, 8, 'POST', '/pspc/policeStation/insertXllx', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"lxmc\": \"海尔大道巡逻线\",\n    \"dwbh\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"lxjwd\": \"\",\n    \"lxcd\": 1,\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-05-30 15:54:00', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (134, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
        qylx = #{data.qylx},
        czq = #{data.czq},
        lgyy = #{data.lgyy},
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
};', '{}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-05-30 15:56:27', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (135, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.DateTimeUdfSource'' as time;
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.DateTimeUdfSource'' as time;
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-30 16:10:16', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (136, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    select a.qybh, a.qymc, a.qylx, a.czq, a.lgyy, a.zt, a.qyfw, a.zxdw, b.dmxmc as "qylxmc", c.dmxmc as "czqmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_zdqy a
    left join nv_enumeration_view b on a.qylx = b.dmxz and b.dmbm = ''LocationType''
    left join nv_enumeration_view c on a.czq = b.dmxz and b.dmbm = ''DisposalCircle''
    where jwzbh = #{jwzbh};
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
return result;', '{}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-05-30 16:58:12', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (137, 38, 'POST', '/pspc/policeStation/updatePoliceStation', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 修改警务站快反
var dataSet = @@sql(jwzbh, ylzd4) <%
    UPDATE t_police_station_infos SET
        ylzd4 = #{ylzd4}
    WHERE jwzbh = #{jwzbh};
%>
return dataSet(${jwzbh}, ${ylzd4});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 修改警务站快反
var dataSet = @@sql(jwzbh, ylzd4) <%
    UPDATE t_police_station_infos SET
        ylzd4 = #{ylzd4}
    WHERE jwzbh = #{jwzbh};
%>
return dataSet(${jwzbh}, ${ylzd4});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"ylzd4\": \"\"\n}","headerData":[]}', '2020-06-01 14:06:11', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (138, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"orgCode":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"xfdw\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"8b347205-ee86-4991-aa27-258cda77b635\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-06-01 14:35:05', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (139, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"orgCode":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"xfdw\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"8b347205-ee86-4991-aa27-258cda77b635\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-06-01 14:35:49', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (140, 17, 'POST', '/pspc/policeStation/insertZdqy', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(${params});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"params":{"type":"object","properties":{"orgCode":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"}}}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"params\": {\n    \"jwzbh\": \"JZ790\",\n    \"qymc\": \"遵义会议会址\",\n    \"xfdw\": \"9373d721-1e3d-4201-9892-2297cdb12244\",\n    \"qwdj\": \"8b347205-ee86-4991-aa27-258cda77b635\",\n    \"qyfw\": \"\",\n    \"zxdw\": \"\",\n    \"orgCode\": \"5203\"\n  }\n}","headerData":[]}', '2020-06-01 14:37:17', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (141, 18, 'PUT', '/pspc/policeStation/updateQwxq', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zgl":{"type":"number"}}},"orgCode":{"type":"string"},"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"qwdj\",\n  \"data\": {\n    \"djbh\": \"06910f37-1539-41e9-9ae7-8167600f68f5\",\n    \"djmc\": \"日常勤务1\",\n    \"zgl\": 80\n  },\n  \"orgCode\": \"52030000000000\"\n}","headerData":[]}', '2020-06-01 14:38:51', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (142, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, b.dwmc, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, b.dwmc, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh};
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"jrzgrs":{"type":"number"},"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"cjsj":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"}}}},"jrzrs":{"type":"number"},"qwdj":{"type":"array","items":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zt":{"type":"string"},"zgl":{"type":"number"},"jbbh":{"type":"string"}}}},"xfdw":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"person":{"type":"array","items":{"type":"object","properties":{"jz":{"type":"string"},"xm":{"type":"string"},"xb":{"type":"string"},"djjh":{"type":["string","boolean","number","object","array","null"]},"zw":{"type":["string","boolean","number","object","array","null"]},"jh":{"type":"string"},"nl":{"type":["string","boolean","number","object","array","null"]}}}},"zt":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"}}}},"jrzgrszb":{"type":"number"}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-01 14:46:00', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (143, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"}}}},"zdqy":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-06-01 15:24:17', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (144, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var xllxSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id};
%>
// 查询重点区域
var zdqySet = @@sql(id) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${id})) {
    return {
        "message": "参数勤务等级ID不能为空！"
    };
}
// 查询勤务等级下路线
var xllxSet = @@sql(id) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.lxcd, a.jwzbh
    FROM xfsz_xllx a
    LEFT JOIN xfsz_xfdw b ON a.dwbh = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    WHERE a.zt = ''1'' AND a.qwdj = #{id};
%>
// 查询重点区域
var zdqySet = @@sql(id) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"}}}},"zdqy":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[]}', '2020-06-01 17:11:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (145, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-06-01 20:26:52', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (146, 36, 'GET', '/pspc/policeStation/queryServiceLevelLine', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc"
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxjwd":{"type":"string"},"dwmc":{"type":"string"},"dwcybh":{"type":"string"},"lxmc":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"id\": \"fe0fe377-caf7-49ec-9408-ad729e10f53a\"\n}","headerData":[]}', '2020-06-01 20:27:57', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (148, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc", b.dwcybh, b.dwcymc
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    where a.zt = ''1'' and a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>
// 查询重点区域
var zdqySet = @@sql(orgCode) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, a.jwzbh, b.dwmc, v.dmxmc AS "djmc", b.dwcybh, b.dwcymc
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.zt = ''1'' AND a.jwzbh in (select jwzbh from t_police_station_infos where lsdw ~ #{orgCode});
%>

// 执行SQL，并返回结果
var result = {
    "xllx": xllxSet(${orgCode}),
    "zdqy": zdqySet(${orgCode})
}
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"xlpc":{"type":"number"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-06-01 20:36:00', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (149, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${orgCode})) {
    return {
        "message": "参数组织权限编码不能为空！"
    };
}
// 查询巡逻路线
var xllxSet = @@sql(orgCode) <%
    SELECT a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, c.djmc, a.zt, a.lxjwd, a.jwzbh, b.dwcybh, b.dwcymc
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":["string","boolean","number","object","array","null"]}},"zdqy":{"type":"array","items":{"type":"object","properties":{"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-06-01 20:40:25', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (150, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, a.zt, a.lxjwd, a.lxcd, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, b.dwmc, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh};
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
// 查询勤务等级
var qwdjSet = @@sql(jwzbh) <%
    SELECT a.djbh, a.djmc, v.dmxmc as "jbbh", a.zgl, a.zt
    FROM xfsz_qwdj a
    LEFT JOIN nv_enumeration_view v on a.jbbh = v.dmxz and v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh}
    ORDER BY a.jbbh;
%>
// 查询巡防队伍
var xfdwSet = @@sql(jwzbh) <%
    select dwbh, dwmc, dwcybh, dwcymc, zt, TO_CHAR(cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xfdw
    where jwzbh = #{jwzbh};
%>
var personSet = @@sql(jwzbh, jh) <%
    select jh, xm, xb, nl, zw, jz, djjh
    from t_police_person_infos
    where jwzbh = #{jwzbh} and #{jh} ~ ('','' || jh || '','');
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
    select a.lxbh, a.lxmc, a.dwbh, b.dwmc, a.xlpc, a.qwdj, a.zt, a.lxjwd, a.lxcd, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    from xfsz_xllx a
    left join xfsz_xfdw b on a.dwbh = b.dwbh
    left join xfsz_qwdj c on a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    where a.jwzbh = #{jwzbh};
%>
// 查询重点区域
var zdqySet = @@sql(jwzbh) <%
    SELECT a.qybh, a.qymc, a.xfdw, a.qwdj, a.zt, a.qyfw, a.zxdw, b.dwmc, v.dmxmc AS "djmc"
        , TO_CHAR(a.cjsj, ''YYYY-MM-DD HH24:MI:SS'') AS "cjsj"
    FROM xfsz_zdqy a
    LEFT JOIN xfsz_xfdw b ON a.xfdw = b.dwbh
    LEFT JOIN xfsz_qwdj c ON a.qwdj = c.djbh
    LEFT JOIN nv_enumeration_view v ON c.jbbh = v.dmxz AND v.dmbm = ''ServiceLevel''
    WHERE a.jwzbh = #{jwzbh};
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"jrzgrs":{"type":"number"},"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"cjsj":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"}}}},"jrzrs":{"type":"number"},"qwdj":{"type":"array","items":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zt":{"type":"string"},"zgl":{"type":"number"},"jbbh":{"type":"string"}}}},"xfdw":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"person":{"type":"array","items":{"type":"object","properties":{"jz":{"type":"string"},"xm":{"type":"string"},"xb":{"type":"string"},"djjh":{"type":["string","boolean","number","object","array","null"]},"zw":{"type":["string","boolean","number","object","array","null"]},"jh":{"type":"string"},"nl":{"type":["string","boolean","number","object","array","null"]}}}},"zt":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"}}}},"jrzgrszb":{"type":"number"}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-01 20:42:49', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (151, 31, 'GET', '/pspc/policeStation/queryRouteArea', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"orgCode":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"jwzbh":{"type":"string"},"lxcd":{"type":"number"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"},"jwzbh":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"orgCode\": \"5203\"\n}","headerData":[]}', '2020-06-01 21:30:43', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (152, 35, 'POST', '/pspc/policeStation/initializationQwdj', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return insertSQL(initData);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"number"}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-02 11:26:16', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (153, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.ConvertUdfSource'' as convert;
// 查询核查数据
var dataSet = @@mybatis(hclx) <%
    <select>
        SELECT id, hclx, TO_CHAR(hcsj, ''YYYY-MM-DD HH24:MI:SS'') AS "hcsj", hcdd, hcjy, ssdw, qkjl
            , rymc, xb, sfzh, rylx, cphm, cllx, wjpm, lb, jwzbh
        FROM xfzg_hcmx
        WHERE 1 = 1
        <if test="hclx != null and hclx != ''''">
            AND hclx = #{hclx}
        </if>
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${hclx});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '// SQL 执行器切换为分页模式
hint FRAGMENT_SQL_QUERY_BY_PAGE = true
// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.ConvertUdfSource'' as convert;
// 查询核查数据
var dataSet = @@mybatis(hclx) <%
    <select>
        SELECT id, hclx, TO_CHAR(hcsj, ''YYYY-MM-DD HH24:MI:SS'') AS "hcsj", hcdd, hcjy, ssdw, qkjl
            , rymc, xb, sfzh, rylx, cphm, cllx, wjpm, lb, jwzbh
        FROM xfzg_hcmx
        WHERE 1 = 1
        <if test="hclx != null and hclx != ''''">
            AND hclx = #{hclx}
        </if>
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${hclx});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hcsj":{"type":"string"},"ssdw":{"type":"string"},"rylx":{"type":["string","boolean","number","object","array","null"]},"wjpm":{"type":["string","boolean","number","object","array","null"]},"qkjl":{"type":"string"},"rymc":{"type":"string"},"xb":{"type":"string"},"hcdd":{"type":"string"},"sfzh":{"type":"string"},"lb":{"type":["string","boolean","number","object","array","null"]},"hclx":{"type":"string"},"hcjy":{"type":"string"},"id":{"type":"string"},"cllx":{"type":["string","boolean","number","object","array","null"]},"cphm":{"type":["string","boolean","number","object","array","null"]},"jwzbh":{"type":["string","boolean","number","object","array","null"]}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"\",\n  \"endTime\": \"\"\n}","headerData":[]}', '2020-06-02 16:34:35', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (154, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
            AND hcsj >= to_timestamp(#{startTime, jdbcType=DATE}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone
        </if>
        <if test="endTime != null and endTime != ''''">
            AND to_timestamp(#{endTime, jdbcType=DATE}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone >= hcsj
        </if>
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${condition}, ${hcjy}, ${hclx}, ${ssdw}, ${startTime}, ${endTime});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '// SQL 执行器切换为分页模式
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
            AND hcsj >= to_timestamp(#{startTime, jdbcType=DATE}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone
        </if>
        <if test="endTime != null and endTime != ''''">
            AND to_timestamp(#{endTime, jdbcType=DATE}, ''yyyy-mm-dd HH24:mi:ss'')::timestamp without time zone >= hcsj
        </if>
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${condition}, ${hcjy}, ${hclx}, ${ssdw}, ${startTime}, ${endTime});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hcsj":{"type":"string"},"ssdw":{"type":"string"},"rylx":{"type":["string","boolean","number","object","array","null"]},"wjpm":{"type":["string","boolean","number","object","array","null"]},"qkjl":{"type":"string"},"rymc":{"type":"string"},"xb":{"type":"string"},"hcdd":{"type":"string"},"sfzh":{"type":"string"},"lb":{"type":["string","boolean","number","object","array","null"]},"hclx":{"type":"string"},"hcjy":{"type":"string"},"id":{"type":"string"},"cllx":{"type":["string","boolean","number","object","array","null"]},"cphm":{"type":["string","boolean","number","object","array","null"]},"jwzbh":{"type":["string","boolean","number","object","array","null"]}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"\",\n  \"endTime\": \"\"\n}","headerData":[]}', '2020-06-02 17:27:51', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (155, 15, 'GET', '/pspc/policeStation/queryPatrolResults', 0, 'DataQL', '// jwzbh 警务站参数说明：不能为空
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
return dataSet;', '// jwzbh 警务站参数说明：不能为空
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
return dataSet;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"percentage":{"type":"number"},"name":{"type":"string"},"id":{"type":"string"},"value":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"type\": \"day\"\n}","headerData":[]}', '2020-06-03 12:04:09', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (156, 14, 'GET', '/pspc/policeStation/queryServiceEffect', 0, 'DataQL', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"},
];
// 执行SQL，并返回结果
return dataSet;', '// mock勤务效果数据
var dataSet = [
    {"name":"久停","value":"10"},
    {"name":"路线偏离","value":"40"},
    {"name":"巡逻次数","value":"50"},
];
// 执行SQL，并返回结果
return dataSet;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-03 14:08:20', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (158, 34, 'GET', '/pspc/policeStation/queryKeyPlaces', 0, 'DataQL', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@mybatis(enumType, sqlCondition, extent, shortOrgCode) <%
    <select>
        SELECT a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
            , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type AS "places_type_code"
            , b.dmxms AS "icon_name"
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz AND b.dmbm = #{enumType}
        WHERE a.places_type ${sqlCondition} ''206'' AND ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
            AND a.places_type != ''''
        <if test="shortOrgCode != null and shortOrgCode != ''''">
            AND (a.org_code ~ #{shortOrgCode} OR a.org_code = '''')
        </if>
    </select>
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '// placesType:''policeStation-派出所;keyPlaces-重点场所''
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
// 使用 DataQL 拼接字符串
var enumType = ("policeStation" == #{placesType}) ? "policeLayer" : "societyLayer";
var sqlCondition = ("policeStation" == #{placesType}) ? "=" : "!=";
// 查询重点场所
var dataSet = @@mybatis(enumType, sqlCondition, extent, shortOrgCode) <%
    <select>
        SELECT a.id, a.org_code, a.places_name, a.places_desc, a.places_addres, a.longitude, a.latitude
            , a.places_image, a.places_tel, a.employess, a.security_guards, a.places_type AS "places_type_code"
            , b.dmxms AS "icon_name"
        FROM key_places a
        LEFT JOIN nv_enumeration_view b ON a.places_type = b.dmxz AND b.dmbm = #{enumType}
        WHERE a.places_type ${sqlCondition} ''206'' AND ST_Contains(st_geometryfromtext(#{extent}, 4326), a.geom)
            AND a.places_type != ''''
        <if test="shortOrgCode != null and shortOrgCode != ''''">
            AND (a.org_code ~ #{shortOrgCode} OR a.org_code = '''')
        </if>
    </select>
%>
// 地图图片地址：地图前端
var iconImageUrl = "http://" + ${serviceIp} + ":2087/device-img/";
var scale = ("policeStation" == #{placesType}) ? 0.25 : 0.41;
// 执行SQL，并返回结果
return utils.scatterPointDataFormat(dataSet(enumType, sqlCondition, ${extent}, ${shortOrgCode}), iconImageUrl, scale);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"extent":{"type":"string"},"serviceIp":{"type":"string"},"shortOrgCode":{"type":"string"},"placesType":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"symbol":{"type":"object","properties":{"image":{"type":"object","properties":{"src":{"type":"string"},"rotation":{"type":"number"},"scale":{"type":"number"},"radius":{"type":"number"},"opacity":{"type":"string"}}}}},"showFlg":{"type":"number"},"lng":{"type":"number"},"attributes":{"type":"object","properties":{"iconName":{"type":"string"},"latitude":{"type":"number"},"employess":{"type":"number"},"placesTel":{"type":"string"},"imgUrl":{"type":"string"},"placesDesc":{"type":"string"},"orgCode":{"type":"string"},"placesAddres":{"type":"string"},"placesName":{"type":"string"},"placesImage":{"type":"string"},"placesTypeCode":{"type":"string"},"id":{"type":"string"},"securityGuards":{"type":"number"},"longitude":{"type":"number"}}},"id":{"type":"string"},"geom":{"type":"object","properties":{"type":{"type":"string"},"points":{"type":"string"}}},"lat":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"extent\": \"POLYGON ((106.8861803836868 27.657747662133783, 106.9685778446243 27.657747662133783, 106.9685778446243 27.704911625451654, 106.8861803836868 27.704911625451654, 106.8861803836868 27.657747662133783))\",\n  \"placesType\": \"policeStation\",\n  \"shortOrgCode\": \"5203\",\n  \"serviceIp\": \"172.20.36.121\"\n}","headerData":[]}', '2020-06-03 21:18:04', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (159, 9, 'GET', '/pspc/policeStation/queryQwxq', 0, 'DataQL', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', 'hint FRAGMENT_SQL_OPEN_PACKAGE = "off" // 拆包模式设置为：关闭
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
return result;', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"jrzgrs":{"type":"number"},"xllx":{"type":"array","items":{"type":"object","properties":{"lxbh":{"type":"string"},"lxmc":{"type":"string"},"cjsj":{"type":"string"},"lxjwd":{"type":"string"},"djmc":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"xlpc":{"type":"number"},"lxcd":{"type":"number"}}}},"jrzrs":{"type":"number"},"qwdj":{"type":"array","items":{"type":"object","properties":{"djbh":{"type":"string"},"djmc":{"type":"string"},"zt":{"type":"string"},"zgl":{"type":"number"},"jbbh":{"type":"string"}}}},"xfdw":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"dwbh":{"type":"string"},"dwmc":{"type":"string"},"person":{"type":"array","items":{"type":"object","properties":{"jz":{"type":"string"},"xm":{"type":"string"},"xb":{"type":"string"},"djjh":{"type":["string","boolean","number","object","array","null"]},"zw":{"type":["string","boolean","number","object","array","null"]},"jh":{"type":"string"},"nl":{"type":["string","boolean","number","object","array","null"]}}}},"zt":{"type":"string"},"dwcybh":{"type":"string"},"dwcymc":{"type":"string"}}}},"zdqy":{"type":"array","items":{"type":"object","properties":{"cjsj":{"type":"string"},"djmc":{"type":"string"},"dwmc":{"type":"string"},"zxdw":{"type":"string"},"xfdw":{"type":"string"},"qwdj":{"type":"string"},"zt":{"type":"string"},"qybh":{"type":"string"},"qymc":{"type":"string"},"qyfw":{"type":"string"}}}},"jrzgrszb":{"type":"number"}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-04 15:36:23', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (160, 40, 'GET', '/pspc/policeStation/queryCheckTypeStat', 0, 'DataQL', '// 参数说明 day-日、month-月、season-季、year-年
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
return dataSet(params);', '// 参数说明 day-日、month-月、season-季、year-年
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
return dataSet(params);', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"type":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hclx":{"type":"string"},"count":{"type":"number"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"month\"\n}","headerData":[]}', '2020-06-05 16:22:25', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (161, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${condition}, ${hcjy}, ${hclx}, ${ssdw}, ${startTime}, ${endTime});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '// SQL 执行器切换为分页模式
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
    </select>
%>
// 创建分页查询对象
var pageQuery = dataSet(${condition}, ${hcjy}, ${hclx}, ${ssdw}, ${startTime}, ${endTime});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hcsj":{"type":"string"},"ssdw":{"type":"string"},"rylx":{"type":["string","boolean","number","object","array","null"]},"wjpm":{"type":["string","boolean","number","object","array","null"]},"qkjl":{"type":"string"},"rymc":{"type":"string"},"xb":{"type":"string"},"hcdd":{"type":"string"},"sfzh":{"type":"string"},"lb":{"type":["string","boolean","number","object","array","null"]},"hclx":{"type":"string"},"hcjy":{"type":"string"},"id":{"type":"string"},"cllx":{"type":["string","boolean","number","object","array","null"]},"cphm":{"type":["string","boolean","number","object","array","null"]},"jwzbh":{"type":["string","boolean","number","object","array","null"]}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"2020-06-01 15:25:09\",\n  \"endTime\": \"2020-06-04 15:25:09\"\n}","headerData":[]}', '2020-06-08 11:41:29', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (162, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '// SQL 执行器切换为分页模式
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
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hcsj":{"type":"string"},"ssdw":{"type":"string"},"rylx":{"type":["string","boolean","number","object","array","null"]},"wjpm":{"type":["string","boolean","number","object","array","null"]},"qkjl":{"type":"string"},"rymc":{"type":"string"},"xb":{"type":"string"},"hcdd":{"type":"string"},"sfzh":{"type":"string"},"lb":{"type":["string","boolean","number","object","array","null"]},"hclx":{"type":"string"},"hcjy":{"type":"string"},"id":{"type":"string"},"cllx":{"type":["string","boolean","number","object","array","null"]},"cphm":{"type":["string","boolean","number","object","array","null"]},"jwzbh":{"type":["string","boolean","number","object","array","null"]}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"2020-06-01 15:25:09\",\n  \"endTime\": \"2020-06-04 15:25:09\"\n}","headerData":[]}', '2020-06-08 11:42:23', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (164, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
%>
return dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode});', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
%>
return dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\"\n}","headerData":[]}', '2020-06-10 15:18:23', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (165, 43, 'POST', '/pspc/device/bindingDefaultDevice', 0, 'DataQL', '// 参数说明 policeStation-警务站、keyPlaces-重点场所
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
return dataSet(${id}, ${deviceId});', '// 参数说明 policeStation-警务站、keyPlaces-重点场所
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
return dataSet(${id}, ${deviceId});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"id":{"type":"string"},"type":{"type":"string"},"deviceId":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"type\": \"policeStation\",\n  \"id\": \"JZ790\",\n  \"deviceId\": \"52030263001320300221\"\n}","headerData":[]}', '2020-06-10 15:47:58', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (166, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}), bindingSet(${id}));', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}), bindingSet(${id}));', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"id":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\"\n}","headerData":[]}', '2020-06-10 16:23:26', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (167, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"id":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\"\n}","headerData":[]}', '2020-06-10 17:23:19', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (168, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''11'')
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''11'')
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"id":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\"\n}","headerData":[]}', '2020-06-11 09:38:27', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (169, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''10'', ''11'')
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '// 拆包模式设置为：关闭
hint FRAGMENT_SQL_OPEN_PACKAGE = "off"
import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
import ''net.hasor.dataql.fx.basic.CollectionUdfSource'' as collect;
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id) <%
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''10'', ''11'')
%>
// 查询绑定设备信息
var bindingSet = @@sql(id) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id}
%>
return collect.merge(bindingSet(${id}), dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}));', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"id":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\"\n}","headerData":[]}', '2020-06-11 09:39:30', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (170, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id, deviceName) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id} AND b.device_name ~ #{deviceName}
    UNION ALL
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''10'', ''11'')
        AND a.device_name ~ #{deviceName}
%>
// 创建分页查询对象
var pageQuery = dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}, ${deviceName});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '// SQL 执行器切换为分页模式
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
        "message": "参数参数绑定ID不能为空！"
    };
}
// 根据经纬度查询附近设备
var dataSet = @@sql(longitude, latitude, spacing, shortOrgCode, id, deviceName) <%
    SELECT a.device_id AS "deviceId", b.device_name AS "deviceName", b.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", b.monitoring_direction AS "monitoringDirection", a.default_play AS "defaultPlay"
    FROM checkpoint_device a
    LEFT JOIN device_info b ON a.device_id = b.device_id
    LEFT JOIN nv_enumeration_view v ON b.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.checkpoint_id = #{id} AND b.device_name ~ #{deviceName}
    UNION ALL
    SELECT a.device_id AS "deviceId", a.device_name AS "deviceName", a.camera_type AS "cameraType",
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", '''' AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    WHERE a.device_id ~ #{shortOrgCode}
        AND ST_Distance(
            ST_Transform(a.geom, 3857),
            ST_Transform(ST_GeomFromText(''POINT(''||#{longitude}||'' ''||#{latitude}||'')'', 4326), 3857)
        ) <= ${spacing}
        AND a.device_id NOT IN (SELECT device_id FROM checkpoint_device WHERE checkpoint_id = #{id})
        AND a.camera_type IN (''1'', ''3'', ''10'', ''11'')
        AND a.device_name ~ #{deviceName}
%>
// 创建分页查询对象
var pageQuery = dataSet(${longitude}, ${latitude}, ${spacing}, ${shortOrgCode}, ${id}, ${deviceName});
// 设置分页信息
var pageInfo = {
    "pageSize": convert.toInt(${pageSize}),
    "pageNum" : convert.toInt(${pageNum})
}
run pageQuery.setPageInfo(pageInfo);
// 执行分页查询
return {
    "data": pageQuery.data(),
    "page": pageQuery.pageInfo()
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"pageSize":{"type":"number"},"id":{"type":"string"},"pageNum":{"type":"number"},"deviceName":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\",\n  \"pageNum\": 1,\n  \"pageSize\": 5,\n  \"deviceName\": \"岗亭\"\n}","headerData":[]}', '2020-06-11 14:16:57', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (171, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", COALESCE(b.default_play, '''') AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    LEFT JOIN checkpoint_device b ON a.device_id = b.device_id AND b.checkpoint_id = #{id}
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
};', '// SQL 执行器切换为分页模式
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
        v.dmxmc AS "deviceType", a.monitoring_direction AS "monitoringDirection", COALESCE(b.default_play, '''') AS "defaultPlay"
    FROM device_info a
    LEFT JOIN nv_enumeration_view v ON a.camera_type = v.dmxz AND v.dmbm = ''DEVICE_TYPE''
    LEFT JOIN checkpoint_device b ON a.device_id = b.device_id AND b.checkpoint_id = #{id}
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
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"pageSize":{"type":"number"},"id":{"type":"string"},"pageNum":{"type":"number"},"deviceName":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\",\n  \"pageNum\": 3,\n  \"pageSize\": 5,\n  \"deviceName\": \"\"\n}","headerData":[]}', '2020-06-11 16:03:20', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (172, 39, 'GET', '/pspc/policeStation/queryCheckInfo', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
};', '// SQL 执行器切换为分页模式
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
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"condition":{"type":"string"},"ssdw":{"type":"string"},"hclx":{"type":"string"},"pageSize":{"type":"number"},"hcjy":{"type":"string"},"startTime":{"type":"string"},"endTime":{"type":"string"},"pageNum":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"hcsj":{"type":"string"},"ssdw":{"type":"string"},"rylx":{"type":["string","boolean","number","object","array","null"]},"wjpm":{"type":["string","boolean","number","object","array","null"]},"qkjl":{"type":"string"},"rymc":{"type":"string"},"xb":{"type":"string"},"hcdd":{"type":"string"},"sfzh":{"type":"string"},"lb":{"type":["string","boolean","number","object","array","null"]},"hclx":{"type":"string"},"hcjy":{"type":"string"},"id":{"type":"string"},"cllx":{"type":["string","boolean","number","object","array","null"]},"cphm":{"type":["string","boolean","number","object","array","null"]},"jwzbh":{"type":["string","boolean","number","object","array","null"]}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"pageNum\": 1,\n  \"pageSize\": 10,\n  \"condition\": \"\",\n  \"hcjy\": \"\",\n  \"hclx\": \"1\",\n  \"ssdw\": \"\",\n  \"startTime\": \"2020-06-01 15:25:09\",\n  \"endTime\": \"2020-06-04 15:25:09\"\n}","headerData":[]}', '2020-06-11 16:03:37', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (181, 38, 'POST', '/pspc/policeStation/updatePoliceStation', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh}, ${ylzd4}, ${ylzd3}, ${ylzd2});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh}, ${ylzd4}, ${ylzd3}, ${ylzd2});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"number"},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\",\n  \"ylzd4\": \"\",\n  \"ylzd3\": \"\",\n  \"ylzd2\": \"\"\n}","headerData":[]}', '2020-06-17 11:18:05', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (187, 42, 'GET', '/pspc/device/queryNearDevice', 0, 'DataQL', '// SQL 执行器切换为分页模式
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
};', '// SQL 执行器切换为分页模式
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
};', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"spacing":{"type":"number"},"shortOrgCode":{"type":"string"},"latitude":{"type":"number"},"pageSize":{"type":"number"},"id":{"type":"string"},"pageNum":{"type":"number"},"deviceName":{"type":"string"},"longitude":{"type":"number"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"deviceType":{"type":"string"},"defaultPlay":{"type":"string"},"monitoringDirection":{"type":"string"},"deviceState":{"type":"string"},"deviceId":{"type":"string"},"deviceName":{"type":"string"},"cameraType":{"type":"string"}}}},"page":{"type":"object","properties":{"recordPosition":{"type":"number"},"enable":{"type":"boolean"},"totalPage":{"type":"number"},"pageSize":{"type":"number"},"totalCount":{"type":"number"},"currentPage":{"type":"number"}}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"longitude\": 106.919975,\n  \"latitude\": 27.688207,\n  \"spacing\": 100,\n  \"shortOrgCode\": \"5203\",\n  \"id\": \"JZ790\",\n  \"pageNum\": 3,\n  \"pageSize\": 5,\n  \"deviceName\": \"\"\n}","headerData":[]}', '2020-06-17 17:47:38', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (195, 32, 'GET', '/pspc/public/queryEnumType', 0, 'DataQL', '// LocationType--场所类型
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
return dataSet(${dmbm});', '// LocationType--场所类型
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
return dataSet(${dmbm});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"dmbm":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"data":{"type":"array","items":{"type":"object","properties":{"dmxmc":{"type":"string"},"dmxz":{"type":"string"}}}},"message":{"type":"string"},"status":{"type":"string"}}}}', '{"requestBody":"{\n  \"dmbm\": \"LocationType\"\n}","headerData":[]}', '2020-06-18 17:33:02', '{"resultStructure":false,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (199, 54, 'GET', '/pspc/policeStation/queryPolice135', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 查询警务站135快反
var dataSet = @@sql(jwzbh) <%
    SELECT jwzbh, ylzd4, ylzd3, ylzd2
    FROM t_police_station_infos
    WHERE jwzbh = #{jwzbh}
%>
return dataSet(${jwzbh});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 查询警务站135快反
var dataSet = @@sql(jwzbh) <%
    SELECT jwzbh, ylzd4, ylzd3, ylzd2
    FROM t_police_station_infos
    WHERE jwzbh = #{jwzbh}
%>
return dataSet(${jwzbh});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"},"value":{"type":"object","properties":{"data":{"type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"message":{"type":"string"},"status":{"type":"string"}}}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-19 17:54:36', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (200, 54, 'GET', '/pspc/policeStation/queryPolice135', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 查询警务站135快反
var dataSet = @@sql(jwzbh) <%
    SELECT jwzbh, ylzd4, ylzd3, ylzd2
    FROM t_police_station_infos
    WHERE jwzbh = #{jwzbh}
%>
return dataSet(${jwzbh});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
// 校验参数
if (string.isEmpty(${jwzbh})) {
    return {
        "message": "参数警务站编号不能为空！"
    };
}
// 查询警务站135快反
var dataSet = @@sql(jwzbh) <%
    SELECT jwzbh, ylzd4, ylzd3, ylzd2
    FROM t_police_station_infos
    WHERE jwzbh = #{jwzbh}
%>
return dataSet(${jwzbh});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"},"value":{"type":"object","properties":{"data":{"type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"}}},"message":{"type":"string"},"status":{"type":"string"}}}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-19 17:55:33', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');
INSERT INTO "public"."interface_release" VALUES (201, 54, 'GET', '/pspc/policeStation/queryPolice135', 0, 'DataQL', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', 'import ''net.hasor.dataql.fx.basic.StringUdfSource'' as string;
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
return dataSet(${jwzbh});', '{"requestSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"jwzbh":{"type":"string"}}},"responseSchema":{"$schema":"http://json-schema.org/draft-04/schema#","type":"object","properties":{"executionTime":{"type":"number"},"code":{"type":"number"},"success":{"type":"boolean"},"lifeCycleTime":{"type":"number"},"message":{"type":"string"},"value":{"type":"object","properties":{"data":{"type":"object","properties":{"ylzd2":{"type":"string"},"ylzd3":{"type":"string"},"ylzd4":{"type":"string"},"jwzbh":{"type":"string"},"jwzmc":{"type":"string"}}},"message":{"type":"string"},"status":{"type":"string"}}}}}}', '{"requestBody":"{\n  \"jwzbh\": \"JZ790\"\n}","headerData":[]}', '2020-06-19 18:03:11', '{"resultStructure":true,"responseFormat":"{\n  \"success\"      : \"@resultStatus\",\n  \"message\"      : \"@resultMessage\",\n  \"code\"         : \"@resultCode\",\n  \"lifeCycleTime\": \"@timeLifeCycle\",\n  \"executionTime\": \"@timeExecution\",\n  \"value\"        : \"@resultData\"\n}"}');

-- ----------------------------
-- Primary Key structure for table interface_release
-- ----------------------------
ALTER TABLE "public"."interface_release" ADD CONSTRAINT "interface_release_pkey" PRIMARY KEY ("pub_id");
