package com.linghang.model.base;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 预警处理表 Model
 */
public class AlarmDealModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 预警消息ID
     */
    private Long msgId;

    /**
     * 处理意见
     */
    private String suggestion;

    /**
     * 备注
     */
    private String remark;

    /**
     * 处理时间
     */
    private Date dealTime;

    /**
     * 处理人
     */
    private String dealPerson;
    /**
     * 处理人id--app接口参数（2019-01-15增加）
     */
    private Long dealPersonId;

    /**
     * 处理状态
     */
    private Integer status;

    /**
     * 附件ID
     */
    private String annexIds;

    /**
     * 发送状态
     */
    private Integer sendFlag;

    /**
     * 发送返回标记值
     */
    private String retuanKey;

    /**
     * 原始数据ID
     */
    private Long dataId;

    /**
     * 预警类型
     */
    private Integer msgType;
    /**
     * 附件信息
     */
    private List<AnnexModel> lstAnnexs;

    public AlarmDealModel() {
    }

    public AlarmDealModel(Long msgId, Integer msgType) {
        this.msgId = msgId;
        this.msgType = msgType;
    }

    public Long getDealPersonId() {
        return dealPersonId;
    }

    public void setDealPersonId(Long dealPersonId) {
        this.dealPersonId = dealPersonId;
    }

    public List<AnnexModel> getLstAnnexs() {
        return lstAnnexs;
    }

    public void setLstAnnexs(List<AnnexModel> lstAnnexs) {
        this.lstAnnexs = lstAnnexs;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMsgId() {
        return msgId;
    }

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion == null ? null : suggestion.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }

    public String getDealPerson() {
        return dealPerson;
    }

    public void setDealPerson(String dealPerson) {
        this.dealPerson = dealPerson == null ? null : dealPerson.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAnnexIds() {
        return annexIds;
    }

    public void setAnnexIds(String annexIds) {
        this.annexIds = annexIds == null ? null : annexIds.trim();
    }

    public Integer getSendFlag() {
        return sendFlag;
    }

    public void setSendFlag(Integer sendFlag) {
        this.sendFlag = sendFlag;
    }

    public String getRetuanKey() {
        return retuanKey;
    }

    public void setRetuanKey(String retuanKey) {
        this.retuanKey = retuanKey == null ? null : retuanKey.trim();
    }

    public Long getDataId() {
        return dataId;
    }

    public void setDataId(Long dataId) {
        this.dataId = dataId;
    }

    public Integer getMsgType() {
        return msgType;
    }

    public void setMsgType(Integer msgType) {
        this.msgType = msgType;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", msgId=").append(msgId);
        sb.append(", suggestion=").append(suggestion);
        sb.append(", remark=").append(remark);
        sb.append(", dealTime=").append(dealTime);
        sb.append(", dealPerson=").append(dealPerson);
        sb.append(", status=").append(status);
        sb.append(", annexIds=").append(annexIds);
        sb.append(", sendFlag=").append(sendFlag);
        sb.append(", retuanKey=").append(retuanKey);
        sb.append(", dataId=").append(dataId);
        sb.append(", msgType=").append(msgType);
        sb.append(", lstAnnexs=").append(lstAnnexs);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        AlarmDealModel other = (AlarmDealModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getMsgId() == null ? other.getMsgId() == null : this.getMsgId().equals(other.getMsgId()))
                && (this.getSuggestion() == null ? other.getSuggestion() == null : this.getSuggestion().equals(other.getSuggestion()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
                && (this.getDealTime() == null ? other.getDealTime() == null : this.getDealTime().equals(other.getDealTime()))
                && (this.getDealPerson() == null ? other.getDealPerson() == null : this.getDealPerson().equals(other.getDealPerson()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
                && (this.getAnnexIds() == null ? other.getAnnexIds() == null : this.getAnnexIds().equals(other.getAnnexIds()))
                && (this.getSendFlag() == null ? other.getSendFlag() == null : this.getSendFlag().equals(other.getSendFlag()))
                && (this.getRetuanKey() == null ? other.getRetuanKey() == null : this.getRetuanKey().equals(other.getRetuanKey()))
                && (this.getDataId() == null ? other.getDataId() == null : this.getDataId().equals(other.getDataId()))
                && (this.getMsgType() == null ? other.getMsgType() == null : this.getMsgType().equals(other.getMsgType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getMsgId() == null) ? 0 : getMsgId().hashCode());
        result = prime * result + ((getSuggestion() == null) ? 0 : getSuggestion().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getDealTime() == null) ? 0 : getDealTime().hashCode());
        result = prime * result + ((getDealPerson() == null) ? 0 : getDealPerson().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getAnnexIds() == null) ? 0 : getAnnexIds().hashCode());
        result = prime * result + ((getSendFlag() == null) ? 0 : getSendFlag().hashCode());
        result = prime * result + ((getRetuanKey() == null) ? 0 : getRetuanKey().hashCode());
        result = prime * result + ((getDataId() == null) ? 0 : getDataId().hashCode());
        result = prime * result + ((getMsgType() == null) ? 0 : getMsgType().hashCode());
        return result;
    }
}