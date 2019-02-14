package com.linghang.enums;

/**
 * @author xiongbl
 * 层面
 */
public interface StakeImport {
    //序号	桩号	类型	X	Y	lon	lat		左面层	左上基层	左下基层	左底基层  右面层	右上基层	右下基层	右底基层
    public static final String INDEX = "序号";
    public static final String STAKE = "桩号";
    public static final String TYPE = "类型";
    public static final String X = "X";
    public static final String Y = "Y";
    public static final String LON = "lon";
    public static final String LAT = "lat";

    public static final String LAYER = "面层";
    public static final String UPPER_LEVEL = "上基层";
    public static final String LOWEST_LEVEL = "下基层";
    public static final String SUBBASE = "底基层";

    public static final String Z_LAYER = "左面层";
    public static final String Z_UPPER_LEVEL = "左上基层";
    public static final String Z_LOWEST_LEVEL = "左下基层";
    public static final String Z_SUBBASE = "左底基层";

    public static final String Y_LAYER = "右面层";
    public static final String Y_UPPER_LEVEL = "右上基层";
    public static final String Y_LOWEST_LEVEL = "右下基层";
    public static final String Y_SUBBASE = "右底基层";

}
