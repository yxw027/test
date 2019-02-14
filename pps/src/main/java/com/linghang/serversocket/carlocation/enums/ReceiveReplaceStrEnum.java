package com.linghang.serversocket.carlocation.enums;

import java.util.ArrayList;
import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ReplaceStrEnum
 * @Author: wuqi
 * @Date: 2019-01-04 15:06
 * @Description: 替换字符枚举
 */
public enum ReceiveReplaceStrEnum {

    NUMBER_OX7E(0x7d, 0x02, 0x7e),
    NUMBER_OX7D(0x7d, 0x01, 0x7d);

    private Integer firstNumber;
    private Integer afterNearNumber;
    private Integer replaceAfterNumber;

    ReceiveReplaceStrEnum(Integer firstNumber, Integer afterNearNumber, Integer replaceAfterNumber) {
        this.firstNumber = firstNumber;
        this.afterNearNumber = afterNearNumber;
        this.replaceAfterNumber = replaceAfterNumber;
    }

    public static byte[] receiveInfoReplaceAll(byte[] bytes) {
        List<Byte> list = new ArrayList<>();
        for (int i = 0; i < bytes.length; i++) {
            list.add(bytes[i]);
        }
        ReceiveReplaceStrEnum[] enums = ReceiveReplaceStrEnum.values();
        for (int i = 0; i < enums.length; i++) {
            int first = enums[i].getFirstNumber();
            int second = enums[i].getAfterNearNumber();
            int replaceAfterNumber = enums[i].getReplaceAfterNumber();
            for (int j = 0; j < list.size(); j++) {
                if (j != list.size() - 1 && first == list.get(j).intValue() && second == list.get(j + 1).intValue()) {
                    list.set(j + 1, (byte) replaceAfterNumber);
                    list.remove(j);
                    j--;
                }
            }
        }
        bytes = new byte[list.size()];
        for (int i = 0; i < list.size(); i++) {
            bytes[i] = list.get(i);
        }
        return bytes;
    }

    public Integer getFirstNumber() {
        return firstNumber;
    }

    public Integer getAfterNearNumber() {
        return afterNearNumber;
    }

    public Integer getReplaceAfterNumber() {
        return replaceAfterNumber;
    }
}
