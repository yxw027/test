package com.linghang.enums;

/**
 * Copyright (C), 2018-2018, Shaanxi Navigation Software Technology Co.,Ltd
 * FileName: AtteStaffStatusEnum
 * Author:   wuqi
 * Date:     2018-07-06 16:14
 * Description: 人员打卡考勤状态枚举
 * History:
 * 武琦          2018-07-06
 * 作者姓名           修改时间           版本号              描述
 */
public enum AtteStaffStatusEnum {

    ATTE_STAFF {
        @Override
        public Integer getInt() {
            return 0;
        }

        @Override
        public String getMsg() {
            return "正常打卡";
        }

        @Override
        public String getStrFlag() {
            return "√";
        }
    },
    ATTE_NO_STAFF {
        @Override
        public Integer getInt() {
            return 1;
        }

        @Override
        public String getMsg() {
            return "未打卡";
        }

        @Override
        public String getStrFlag() {
            return "×";
        }
    },
    ATTE_LEAVE_STAFF {
        @Override
        public Integer getInt() {
            return 2;
        }

        @Override
        public String getMsg() {
            return "请假";
        }

        @Override
        public String getStrFlag() {
            return "!";
        }
    },
    ATTE_OFF_STAFF {
        @Override
        public Integer getInt() {
            return 3;
        }

        @Override
        public String getMsg() {
            return "离职";
        }

        @Override
        public String getStrFlag() {
            return "-";
        }
    },
    Atte_NO_ENTER {
        @Override
        public Integer getInt() {
            return 4;
        }

        @Override
        public String getMsg() {
            return "未入职";
        }

        @Override
        public String getStrFlag() {
            return "";
        }
    };


    public abstract Integer getInt();

    public abstract String getMsg();

    public abstract String getStrFlag();
}
