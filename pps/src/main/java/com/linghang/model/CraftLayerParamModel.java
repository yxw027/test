package com.linghang.model;

/**
 * 施工工艺参数model
 *
 * @author youp
 * @date 2019-01-28
 **/
public class CraftLayerParamModel {

    /**
     * 方法名称
     */
    private String action;
    /**
     * 工艺信息
     */
    private CraftLayerModel info;
    /**
     * 摊铺详细
     */
    private CraftDetailModel tanpu;
    /**
     * 初压详细
     */
    private CraftDetailModel chuya;
    /**
     * 复压详细
     */
    private CraftDetailModel fuya;
    /**
     * 终压详细
     */
    private CraftDetailModel zhongya;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public CraftLayerModel getInfo() {
        return info;
    }

    public void setInfo(CraftLayerModel info) {
        this.info = info;
    }

    public CraftDetailModel getTanpu() {
        return tanpu;
    }

    public void setTanpu(CraftDetailModel tanpu) {
        this.tanpu = tanpu;
    }

    public CraftDetailModel getChuya() {
        return chuya;
    }

    public void setChuya(CraftDetailModel chuya) {
        this.chuya = chuya;
    }

    public CraftDetailModel getFuya() {
        return fuya;
    }

    public void setFuya(CraftDetailModel fuya) {
        this.fuya = fuya;
    }

    public CraftDetailModel getZhongya() {
        return zhongya;
    }

    public void setZhongya(CraftDetailModel zhongya) {
        this.zhongya = zhongya;
    }
}
