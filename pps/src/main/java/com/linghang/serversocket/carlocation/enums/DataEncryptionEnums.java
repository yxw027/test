package com.linghang.serversocket.carlocation.enums;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: DataEncryptionEnums
 * @Author: wuqi
 * @Date: 2019-01-07 14:08
 * @Description: 数据加密类型
 */
public enum DataEncryptionEnums {

    TYPE_RSA {
        @Override
        public Integer getVal() {
            return 1;
        }

        @Override
        public String getMsg() {
            return "RSA算法";
        }
    };

    public abstract Integer getVal();

    public abstract String getMsg();
}
