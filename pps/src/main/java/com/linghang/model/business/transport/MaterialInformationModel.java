package com.linghang.model.business.transport;

import java.util.Date;

/**
 * @description: 材料信息
 * @author: xuqiang
 * @createDate: 2019-01-04 16:36
 **/
public class MaterialInformationModel {
    /**
     * 生产时间
     */
    private Date time;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 拌合时长
     */

    private Long mixingTime;
    /**
     * 总重
     */

    private Double weight;
    /**
     * 合格
     */

    private Integer isPass;
    /**
     * 配方名称
     */
    private String name;

    /**
     * 拌合机名称
     */
    private String bhName;

    /**
     * 层面
     */
    private Integer pavingLevel;
    /**
     * 材料状态
     */
    private String content;

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Long getMixingTime() {
        return mixingTime;
    }

    public void setMixingTime(Long mixingTime) {
        this.mixingTime = mixingTime;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Integer getIsPass() {
        return isPass;
    }

    public void setIsPass(Integer isPass) {
        this.isPass = isPass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBhName() {
        return bhName;
    }

    public void setBhName(String bhName) {
        this.bhName = bhName;
    }

    public Integer getPavingLevel() {
        return pavingLevel;
    }

    public void setPavingLevel(Integer pavingLevel) {
        this.pavingLevel = pavingLevel;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
