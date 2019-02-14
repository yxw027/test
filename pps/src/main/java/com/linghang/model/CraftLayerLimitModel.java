package com.linghang.model;

import com.linghang.enums.Crafts;

/**
 * 施工工艺参数model
 *
 * @author youp
 * @date 2019-01-28
 **/
public class CraftLayerLimitModel extends CraftLayerModel {

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


    private Integer tanpuType = Crafts.PAVE.getInteger();
    private Integer chuyaType = Crafts.FIRST.getInteger();
    private Integer fuyaType = Crafts.AGAIN.getInteger();
    private Integer zhongyaType = Crafts.FINISH.getInteger();

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

    public Integer getTanpuType() {
        return tanpuType;
    }

    public void setTanpuType(Integer tanpuType) {
        this.tanpuType = tanpuType;
    }

    public Integer getChuyaType() {
        return chuyaType;
    }

    public void setChuyaType(Integer chuyaType) {
        this.chuyaType = chuyaType;
    }

    public Integer getFuyaType() {
        return fuyaType;
    }

    public void setFuyaType(Integer fuyaType) {
        this.fuyaType = fuyaType;
    }

    public Integer getZhongyaType() {
        return zhongyaType;
    }

    public void setZhongyaType(Integer zhongyaType) {
        this.zhongyaType = zhongyaType;
    }
}
