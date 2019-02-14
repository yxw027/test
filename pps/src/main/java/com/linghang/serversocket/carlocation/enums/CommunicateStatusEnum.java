package com.linghang.serversocket.carlocation.enums;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: CommunicateEnums
 * @Author: wuqi
 * @Date: 2019-01-08 14:15
 * @Description: 通讯类型枚举
 */
public enum CommunicateStatusEnum {

    TYPE_SUCCESS {
        @Override
        public Integer getVal() {
            return 0;
        }

        @Override
        public String getMsg() {
            return "成功/确认";
        }
    },
    TYPE_fail {
        @Override
        public Integer getVal() {
            return 1;
        }

        @Override
        public String getMsg() {
            return "失败";
        }
    },
    TYPE_ERROR {
        @Override
        public Integer getVal() {
            return 2;
        }

        @Override
        public String getMsg() {
            return "消息有误";
        }
    }, TYPE_UNSUPPORT {
        @Override
        public Integer getVal() {
            return 3;
        }

        @Override
        public String getMsg() {
            return "不支持";
        }
    }, TYPE_ALARM {
        @Override
        public Integer getVal() {
            return 4;
        }

        @Override
        public String getMsg() {
            return "报警处理确认";
        }
    };

    public abstract Integer getVal();

    public abstract String getMsg();
}
