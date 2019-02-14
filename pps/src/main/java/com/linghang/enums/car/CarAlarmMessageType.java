package com.linghang.enums.car;

/**
 * @description: 车辆报警类型
 * @author: xuqiang
 * @createDate: 2019-01-14 11:00
 **/
public enum CarAlarmMessageType {
    OUTOFTHEBOX_ALARM {
        @Override
        public Integer getAlamMessageType() {
            return 1;
        }
    },
    SPEED_ALARM {
        @Override
        public Integer getAlamMessageType() {
            return 2;
        }
    },
    WEB_OUTO_FTHEBOX_ALARM {
        @Override
        public Integer getAlamMessageType() {
            return 3;
        }
    },
    WEB_IN_FTHEBOX_ALARM {
        @Override
        public Integer getAlamMessageType() {
            return 4;
        }
    };


    public abstract Integer getAlamMessageType();
}
