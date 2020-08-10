package com.sailing.hasor.dataway.common;

import lombok.extern.slf4j.Slf4j;
import net.hasor.dataql.DimUdfSource;
import net.hasor.dataql.UdfSourceAssembly;
import org.springframework.beans.factory.annotation.Value;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Title: 公共UdfSource类
 * Company: 上海熙菱信息技术有限公司
 * @author guogang
 * @version V1.0
 * Date 2020/05/26 17:18:01
 */
@Slf4j
@DimUdfSource("utils")
public class UtilsUdfSource implements UdfSourceAssembly {

    public UtilsUdfSource() {

    }

    /**
     * 获取字符串长度
     * @param str 字符串
     * @return int
     */
    public static int length(String str) {
        return str != null ? str.length() : 0;
    }

    /**
     * 分割字符串转数组
     * @param str 字符串
     * @return String[]
     */
    public static String[] split(String str) {
        return str != null ? str.split(",") : new String[]{};
    }

    /**
     * 转换撒点数据格式
     * @param list 数据
     * @param iconImageUrl 地图图片地址
     * @param scale 图标大小
     * @return List
     */
    public static List<Map> scatterPointDataFormat(List<Map> list, String iconImageUrl, float scale) {
        List<Map> result = new ArrayList<>();
        try {
            for (Map map : list) {
                String imgUrl = iconImageUrl + map.get("iconName");
                map.put("imgUrl", imgUrl);

                Map<String, Object> geom = new HashMap<>();
                geom.put("type", "Point");
                geom.put("points", map.get("longitude") + "," + map.get("latitude"));

                Map<String, Object> image = new HashMap<>();
                image.put("src", imgUrl);
                image.put("rotation", 0);
                image.put("scale", scale);
                image.put("radius", 10);
                image.put("opacity", "1");

                Map<String, Object> symbol = new HashMap<>();
                symbol.put("image", image);

                Map<String, Object> item = new HashMap<>();
                item.put("id", map.get("id"));
                item.put("showFlg", 0);
                item.put("lng", map.get("longitude"));
                item.put("lat", map.get("latitude"));
                item.put("geom", geom);
                item.put("symbol", symbol);
                item.put("attributes", map);
                result.add(item);
            }
        } catch (Exception e) {
            log.error("转换撒点数据格式异常:{}", e);
        }
        return result;
    }

    /**
     * 根据类型获取时间段
     * @param type 类型
     * @return Map
     */
    public static Map getStartEndTime(String type) {
        Map<String, Object> result = new HashMap<>();
        String startTime;
        String endTime;
        try {
            switch (type) {
                case "day":
                    startTime = getCurrentDate() + FinalString.EMPTY_START_TIME;
                    endTime = getCurrentDate() + FinalString.EMPTY_END_TIME; break;
                case "month":
                    startTime = getMonthFirstDay() + FinalString.EMPTY_START_TIME;
                    endTime = getMonthLastDay() + FinalString.EMPTY_END_TIME; break;
                case "season":
                    startTime = getSeasonStartEndDay("start");
                    endTime = getSeasonStartEndDay("end"); break;
                case "year":
                    startTime = getCurrentDate().substring(0, 4) + "-01-01 00:00:00";
                    endTime = getCurrentDate().substring(0, 4) + "-12-31 23:59:59"; break;
                default: return result;
            }
            result.put("startTime", startTime);
            result.put("endTime", endTime);
        } catch (Exception e) {
            log.error("根据类型获取时间段异常:{}", e);
        }
        return result;
    }

    /**
     * 获取当前日期
     * @return String
     */
    private static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat(FinalString.PATTERN_YMD);
        return sdf.format(new Date());
    }

    /**
     * 获取本月第一天
     * @return String
     */
    private static String getMonthFirstDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
        SimpleDateFormat firstDay= new SimpleDateFormat(FinalString.PATTERN_YMD);
        return firstDay.format(calendar.getTime());
    }

    /**
     * 获取本月最后一天
     * @return String
     */
    private static String getMonthLastDay() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        SimpleDateFormat lastDay= new SimpleDateFormat(FinalString.PATTERN_YMD);
        return lastDay.format(calendar.getTime());
    }

    /**
     * 获取季度开始或者结束时间
     * @param type 类型 start  end
     * @return String
     */
    private static String getSeasonStartEndDay(String type) {
        String startDay = "";
        String endDay = "";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar now = Calendar.getInstance();
        int minDay = now.getActualMinimum(Calendar.DAY_OF_MONTH);
        int maxDay = now.getActualMaximum(Calendar.DAY_OF_MONTH);
        int month = now.get(Calendar.MONTH) + 1;
        if (month == 1 || month ==2 || month ==3) {
            now.set(now.get(Calendar.YEAR), 0, minDay, 00, 00, 00);
            startDay = sdf.format(now.getTime());
            now.set(now.get(Calendar.YEAR), 2, maxDay, 23, 59, 59);
            endDay = sdf.format(now.getTime());
        } else if (month == 4 || month ==5 || month ==6) {
            now.set(now.get(Calendar.YEAR), 3, minDay, 00, 00, 00);
            startDay = sdf.format(now.getTime());
            now.set(now.get(Calendar.YEAR), 5, maxDay, 23, 59, 59);
            endDay = sdf.format(now.getTime());
        } else if (month == 7 || month ==8 || month ==9) {
            now.set(now.get(Calendar.YEAR), 6, minDay, 00, 00, 00);
            startDay = sdf.format(now.getTime());
            now.set(now.get(Calendar.YEAR), 8, maxDay, 23, 59, 59);
            endDay = sdf.format(now.getTime());
        } else if (month == 10 || month ==11 || month ==12) {
            now.set(now.get(Calendar.YEAR), 9, minDay, 00, 00, 00);
            startDay = sdf.format(now.getTime());
            now.set(now.get(Calendar.YEAR), 11, maxDay, 23, 59, 59);
            endDay = sdf.format(now.getTime());
        }
        if ("start".equals(type)) {
            return startDay;
        }
        if ("end".equals(type)) {
            return endDay;
        }
        return "";
    }


}
