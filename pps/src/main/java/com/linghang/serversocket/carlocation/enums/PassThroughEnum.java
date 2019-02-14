package com.linghang.serversocket.carlocation.enums;

import com.alibaba.fastjson.JSON;
import org.apache.commons.collections.map.HashedMap;

import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PassThroughEnums
 * @Author: wuqi
 * @Date: 2019-01-23 9:29
 * @Description: 透传枚举
 */
public enum PassThroughEnum {

    /**
     * 字符串类型
     */
    TYPE_STRING {
        @Override
        public Integer getValue() {
            return 0;
        }

        @Override
        public String getStr() {
            return "字符串类型";
        }

        @Override
        public byte[] translateObjectToTargetType(Object obj, Class targetClass) {
            try {
                return JSON.toJSONString(targetClass.cast(obj)).getBytes("gbk");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return new byte[0];
        }
    };

    private static Map<Integer, PassThroughEnum> baseInfoMap;

    static {
        baseInfoMap = new HashedMap();
        PassThroughEnum[] enums = PassThroughEnum.values();
        for (int i = 0; i < enums.length; i++) {
            baseInfoMap.put(enums[i].getValue(), enums[i]);
        }
    }

    public static Map<Integer, PassThroughEnum> getBaseInfoMap() {
        return baseInfoMap;
    }

    public abstract Integer getValue();

    public abstract String getStr();

    public abstract byte[] translateObjectToTargetType(Object obj, Class targetClass);
}
