package com.sailing.hasor.dataway.common;

/**
 * Title: 公共工具类
 * Company: 上海熙菱信息技术有限公司
 * @author guogang
 * @version V1.0
 * Date 2020/05/06 11:15:01
 */
public class FinalString {

    private FinalString() {
        throw new IllegalStateException("Utility class");
    }

    public static final String MESSAGE = "message";

    public static final String STATUS = "status";

    public static final String DATA = "data";

    public static final String PATTERN_YMD = "yyyy-MM-dd";

    public static final String EMPTY_START_TIME = " 00:00:00";

    public static final String EMPTY_END_TIME = " 23:59:59";

}
