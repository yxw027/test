package com.linghang.enums;

/**
 * 导入时的错误信息
 *
 * @author liuhao on 2015/11/20.
 */
public enum InvImportErrMsg {
    /**
     * 表头不存在
     */
    notTitleAs {
        @Override
        public String getMsg() {
            return "表头不存在";
        }
    },
    /**
     * 该编号存在重复
     */
    noIsRepeat {
        @Override
        public String getMsg() {
            return "该编号存在重复:";
        }
    },
    /**
     * 名称为空
     */
    nameIsEmpty {
        @Override
        public String getMsg() {
            return "名称为空";
        }
    },
    /**
     * 编号为空
     */
    noIsEmpty {
        @Override
        public String getMsg() {
            return "编号为空";
        }
    },
    /**
     * 该台帐自动生成,请修改属性
     */
    editProperty {
        @Override
        public String getMsg() {
            return "该台帐自动生成,请修改属性";
        }
    },
    /**
     * 单元格格式不正确
     */
    errCell {
        @Override
        public String getMsg() {
            return "单元格格式不正确,请检查";
        }
    },
    /**
     * 清单错误
     */
    boqIsErr {
        @Override
        public String getMsg() {
            return "清单错误";
        }
    };

    public abstract String getMsg();
}
