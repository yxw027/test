package com.linghang.util;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.BigDecimalConverter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.*;

/**
 * 工具类
 *
 * @author youp
 * @date 2018-12-17
 **/
public class BeanUtil {

    private static Logger LOG = LoggerFactory.getLogger(BeanUtil.class);

    /**
     * 将bean转换为map
     *
     * @param obj
     * @return
     */
    public static Map<String, Object> transBean2Map(Object obj) {
        return transBean2MapFormatNull(obj, false);
    }

    /**
     * 格式化null为空字符串
     *
     * @param obj
     * @param formatNull
     * @return
     */
    public static Map<String, Object> transBean2MapFormatNull(Object obj, boolean formatNull) {
        if (obj == null) {
            return null;
        } else {
            Map<String, Object> map = new HashMap(16);
            Field[] declaredFields = obj.getClass().getDeclaredFields();
            for (int i = 0; i < declaredFields.length; ++i) {
                Field field = declaredFields[i];
                field.setAccessible(true);
                try {
                    if (field.get(obj) == null && formatNull) {
                        if ("java.lang.Map".equals(field.getGenericType().getTypeName()) || "java.lang.HashMap".equals(field.getGenericType().getTypeName())) {
                            map.put(field.getName(), new HashMap<>(16));
                        } else if ("java.util.List".equals(field.getGenericType().getTypeName()) || "java.util.ArrayList".equals(field.getGenericType().getTypeName())) {
                            map.put(field.getName(), new ArrayList<>());
                        } else if ("java.util.Set".equals(field.getGenericType().getTypeName()) || "java.lang.HashSet".equals(field.getGenericType().getTypeName())) {
                            map.put(field.getName(), new HashSet<>());
                        } else {
                            map.put(field.getName(), "");
                        }
                    } else {
                        map.put(field.getName(), field.get(obj));
                    }
                } catch (IllegalAccessException | IllegalArgumentException e) {
                    LOG.warn(e.getMessage(), e.fillInStackTrace());
                }
            }
            return map;
        }
    }

    /**
     * map 转 bean
     *
     * @param map
     * @param c
     * @param <T>
     * @return
     */
    public static <T> T mapToBean(Map<String, Object> map, Class<T> c) {
        Object t = null;
        try {
            t = c.newInstance();
            BigDecimalConverter bd = new BigDecimalConverter(BigDecimal.ZERO);
            ConvertUtils.register(bd, java.math.BigDecimal.class);
            BeanUtils.populate(t, map);
        } catch (IllegalAccessException | InvocationTargetException | InstantiationException e) {
            LOG.error(e.getMessage(), e.fillInStackTrace());
        }

        return (T) t;
    }

    /**
     * 将listbean转换为kendo下拉框数据格式[{name:"",value:""}]
     *
     * @param list  数据源
     * @param value key为 value的对应bean的name
     * @param name  key为 name 的对应bean的name
     * @return
     */
    public static List<Map<String, Object>> formatBeanToKendoList(List<?> list, String value, String name) {
        if (CollectionUtils.isEmpty(list)) {
            return new ArrayList<>();
        } else {
            List<Map<String, Object>> result = new ArrayList<>();
            for (Object obj : list) {
                Map<String, Object> map = new HashMap(16);
                Field[] declaredFields = obj.getClass().getDeclaredFields();
                for (int i = 0; i < declaredFields.length; ++i) {
                    Field field = declaredFields[i];
                    field.setAccessible(true);
                    try {
                        if (field.getName().equals(value)) {
                            map.put("value", field.get(obj));
                        } else if (field.getName().equals(name)) {
                            map.put("name", field.get(obj));
                        }
                    } catch (IllegalAccessException | IllegalArgumentException e) {
                        LOG.warn(e.getMessage(), e.fillInStackTrace());
                    }
                }
                if (!CollectionUtils.isEmpty(map)) {
                    result.add(map);
                }
            }
            return result;
        }
    }

    /**
     * 将listmap转换为listbean
     *
     * @param list 集合
     * @param c    bean的class
     * @param <T>  范型
     * @return
     */
    public static <T> List<T> transferListMapToListBean(List<Map<String, Object>> list, Class<T> c) {
        List<T> listReturn = new ArrayList();
        if (list != null && !list.isEmpty()) {
            Iterator var3 = list.iterator();

            while (var3.hasNext()) {
                Map<String, Object> map = (Map) var3.next();
                listReturn.add(createEntity(map, c));
            }
        }

        return listReturn;
    }

    public static <T> T createEntity(Map<String, Object> map, Class<T> c) {
        Object t = null;

        try {
            t = c.newInstance();
            BeanUtils.populate(t, map);
        } catch (IllegalAccessException | InvocationTargetException | InstantiationException var4) {
            LOG.error(var4.getMessage(), var4.fillInStackTrace());
        }

        return (T) t;
    }

    /**
     * 获取uuid
     *
     * @return
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "").toLowerCase();
    }

}
