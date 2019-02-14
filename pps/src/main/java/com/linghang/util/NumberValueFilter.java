package com.linghang.util;

import com.alibaba.fastjson.serializer.ValueFilter;

import java.math.BigDecimal;

/**
 * 自定义序列化,Long,double,BigDecimal类型自动转string
 * 大于9007199254740992发生精度丢失
 *
 * @author liuhao
 */
public class NumberValueFilter implements ValueFilter {

    @Override
    public Object process(Object object, String name, Object value) {
        if (value instanceof Long || value instanceof Double || value instanceof BigDecimal) {
            return value.toString();
        }
        return value;
    }

}
