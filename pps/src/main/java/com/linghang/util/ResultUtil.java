package com.linghang.util;

import org.apache.commons.collections.map.HashedMap;

import java.util.Map;

/**
 * 统一的返回参数格式封装
 *
 * @author youp
 * @date 2018-08-07
 */
public class ResultUtil {
    /**
     * 统一格式
     *
     * @param isSuccess
     * @param data
     * @param msg
     * @return
     */
    public static Map<String, Object> getResult(boolean isSuccess, Object data, String msg, String errCode) {
        Map<String, Object> map = new HashedMap();
        map.put("errCode", errCode);
        map.put("success", isSuccess);
        map.put("data", data == null ? new Object() : data);
        map.put("msg", msg);
        return map;
    }

    /**
     * 成功返回查询数据
     *
     * @param obj
     * @return
     */
    public static Map<String, Object> getSuccessResultMap(Object obj) {
        return getResult(true, obj, "查询成功", "001000");
    }

    /**
     * 成功返回操作信息
     *
     * @param msg
     * @return
     */
    public static Map<String, Object> getSuccessResultMap(String msg) {
        return getResult(true, null, msg, "001000");
    }

    public static Map<String, Object> getSuccessResultMap(Object data, String msg) {
        return getResult(true, data, msg, "001000");
    }

    /**
     * 查询失败返回查询信息
     *
     * @return
     */
    public static Map<String, Object> getErrorResultMap() {
        return getResult(false, null, "查询异常", "901000");
    }

    /**
     * 操作失败返回查询信息
     *
     * @return
     */
    public static Map<String, Object> getErrorResultMap(String msg) {
        return getResult(false, null, msg, "901000");
    }


}
