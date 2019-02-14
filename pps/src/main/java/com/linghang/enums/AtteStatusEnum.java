package com.linghang.enums;

import org.apache.commons.collections.map.HashedMap;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Copyright (C), 2018-2018, Shaanxi Navigation Software Technology Co.,Ltd
 * FileName: AtteStatusEnum
 * Author:   wuqi
 * Date:     2018-06-26 14:22
 * Description: 考勤状态枚举
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
public enum AtteStatusEnum {

    ON_ATTE {
        @Override
        public String getValue() {
            return "01";
        }

        @Override
        public String getMsg() {
            return "在职";
        }
    },
    OFF_ATTE {
        @Override
        public String getValue() {
            return "02";
        }

        @Override
        public String getMsg() {
            return "离职";
        }
    },
    LEAVE_ATTE {
        @Override
        public String getValue() {
            return "03";
        }

        @Override
        public String getMsg() {
            return "请假";
        }
    };

    public static List<Map<String, String>> getAllInfoMap() {
        List<Map<String, String>> resultList = new ArrayList();
        Map<String, String> map = null;
        AtteStatusEnum[] atteStatusEna = AtteStatusEnum.values();
        for (AtteStatusEnum tmpEnum : atteStatusEna) {
            map = new HashedMap();
            map.put("codeName", tmpEnum.getMsg());
            map.put("id", tmpEnum.getValue());
            resultList.add(map);
        }
        return resultList;
    }


    public abstract String getValue();

    public abstract String getMsg();

}
