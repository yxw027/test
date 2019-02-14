package com.linghang.model.business.water;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wuchen on 2019/01/09.
 * 记录水稳及沥青统计短信 Model
 */
public class MachinePhoneNoteRecordModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * ID
     */
    private Long id;


    /**
     * 1:沥青 2：水稳
     */
    private Integer type;


    /**
     * 发送人
     */
    private String userName;


    /**
     * 电话
     */
    private String phone;


    /**
     * 设备名称
     */
    private String mixName;


    /**
     * 发送内容
     */
    private String content;


    /**
     * 发送时间
     */
    private Date sendTime;


    /**
     * 项目名称
     */
    private String projectName;


    private String success;


    private String sendType;

    public MachinePhoneNoteRecordModel(Long id, Integer type, String userName, String phone, String mixName, String content, Date sendTime, String projectName, String success, String sendType) {
        this.id = id;
        this.type = type;
        this.userName = userName;
        this.phone = phone;
        this.mixName = mixName;
        this.content = content;
        this.sendTime = sendTime;
        this.projectName = projectName;
        this.success = success;
        this.sendType = sendType;
    }

    public MachinePhoneNoteRecordModel() {

    }

    public MachinePhoneNoteRecordModel(Integer type, String userName, String phone, String mixName, String content, Date sendTime, String projectName, String success, String sendType) {
        this.type = type;
        this.userName = userName;
        this.phone = phone;
        this.mixName = mixName;
        this.content = content;
        this.sendTime = sendTime;
        this.projectName = projectName;
        this.success = success;
        this.sendType = sendType;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getMixName() {
        return mixName;
    }

    public void setMixName(String mixName) {
        this.mixName = mixName == null ? null : mixName.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
    }

    public String getSuccess() {
        return success;
    }

    public void setSuccess(String success) {
        this.success = success == null ? null : success.trim();
    }

    public String getSendType() {
        return sendType;
    }

    public void setSendType(String sendType) {
        this.sendType = sendType == null ? null : sendType.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", type=").append(type);
        sb.append(", userName=").append(userName);
        sb.append(", phone=").append(phone);
        sb.append(", mixName=").append(mixName);
        sb.append(", content=").append(content);
        sb.append(", sendTime=").append(sendTime);
        sb.append(", projectName=").append(projectName);
        sb.append(", success=").append(success);
        sb.append(", sendType=").append(sendType);
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
        MachinePhoneNoteRecordModel other = (MachinePhoneNoteRecordModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getUserName() == null ? other.getUserName() == null : this.getUserName().equals(other.getUserName()))
                && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
                && (this.getMixName() == null ? other.getMixName() == null : this.getMixName().equals(other.getMixName()))
                && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
                && (this.getSendTime() == null ? other.getSendTime() == null : this.getSendTime().equals(other.getSendTime()))
                && (this.getProjectName() == null ? other.getProjectName() == null : this.getProjectName().equals(other.getProjectName()))
                && (this.getSuccess() == null ? other.getSuccess() == null : this.getSuccess().equals(other.getSuccess()))
                && (this.getSendType() == null ? other.getSendType() == null : this.getSendType().equals(other.getSendType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getUserName() == null) ? 0 : getUserName().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getMixName() == null) ? 0 : getMixName().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getSendTime() == null) ? 0 : getSendTime().hashCode());
        result = prime * result + ((getProjectName() == null) ? 0 : getProjectName().hashCode());
        result = prime * result + ((getSuccess() == null) ? 0 : getSuccess().hashCode());
        result = prime * result + ((getSendType() == null) ? 0 : getSendType().hashCode());
        return result;
    }
}