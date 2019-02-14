package com.linghang.serversocket.carlocation.enums;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ReplaceStrEnum
 * @Author: wuqi
 * @Date: 2019-01-04 15:06
 * @Description: 替换字符枚举
 */
public enum SendReplaceStrEnum {

    NUMBER_OX7D(0x7d, 0x7d, 0x01),
    NUMBER_OX7E(0x7e, 0x7d, 0x02);

    private Integer initNumber;
    private Integer firstInsertNumber;
    private Integer secondInsertNumber;

    private static Map<Integer, SendReplaceStrEnum> baseMap;

    static {
        baseMap = new LinkedHashMap<>();
        SendReplaceStrEnum[] enums = SendReplaceStrEnum.values();
        for (int i = 0; i < enums.length; i++) {
            baseMap.put(enums[i].getInitNumber(), enums[i]);
        }
    }

    public static List<Byte> sendInfoReplaceAll(List<Byte> list) {
        List<Byte> finalList = new LinkedList(list);
        for (Map.Entry<Integer, SendReplaceStrEnum> tmpMap : baseMap.entrySet()) {
            SendReplaceStrEnum tmpEnum = tmpMap.getValue();
            for (int i = 0; i < finalList.size(); i++) {
                if (finalList.get(i) == tmpEnum.getInitNumber().byteValue()) {
                    finalList.set(i, tmpEnum.getFirstInsertNumber().byteValue());
                    finalList.add(i + 1, tmpEnum.getSecondInsertNumber().byteValue());
                }
            }
        }
        return finalList;
    }

    SendReplaceStrEnum(int initNumber, int firstInsertNumber, int secondInsertNumber) {
        this.initNumber = initNumber;
        this.firstInsertNumber = firstInsertNumber;
        this.secondInsertNumber = secondInsertNumber;
    }

    public Integer getInitNumber() {
        return initNumber;
    }

    public Integer getFirstInsertNumber() {
        return firstInsertNumber;
    }

    public Integer getSecondInsertNumber() {
        return secondInsertNumber;
    }

    public static Map<Integer, SendReplaceStrEnum> getBaseMap() {
        return baseMap;
    }
}
