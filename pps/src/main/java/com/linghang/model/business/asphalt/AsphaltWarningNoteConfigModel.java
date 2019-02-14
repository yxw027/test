package com.linghang.model.business.asphalt;

import java.io.Serializable;

/**
 * @author wuchen on 2018/12/27.
 * 李轻沾报警短信配置 Model
 */
public class AsphaltWarningNoteConfigModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键Id
     */
    private Long id;


    private Long projectId;


    /**
     * 标段Id
     */
    private String orgId;


    private String asphaltId;


    /**
     * 用户Id
     */
    private Long userId;


    /**
     * 用户名称
     */
    private String userName;


    /**
     * 接收电话
     */
    private String phone;


    /**
     * 一级接受开关
     */
    private Integer level1 = 0;


    /**
     * 二级
     */
    private Integer level2 = 0;


    /**
     * 三级
     */
    private Integer level3 = 0;


    /**
     * 开关
     */
    private Integer isOpen;


    /**
     * 类型
     */
    private Integer type;


    private String remark;

    /**
     * 拌合机名称
     */
    private String asphaltNames;


    public AsphaltWarningNoteConfigModel(Integer level1, Integer level2, Integer level3) {
        this.level1 = level1;
        this.level2 = level2;
        this.level3 = level3;
    }

    public AsphaltWarningNoteConfigModel(Long id, Long projectId, String orgId, String asphaltId, Long userId, String userName, String phone, Integer level1, Integer level2, Integer level3, Integer isOpen, Integer type, String remark) {
        this.id = id;
        this.projectId = projectId;
        this.orgId = orgId;
        this.asphaltId = asphaltId;
        this.userId = userId;
        this.userName = userName;
        this.phone = phone;
        this.level1 = level1;
        this.level2 = level2;
        this.level3 = level3;
        this.isOpen = isOpen;
        this.type = type;
        this.remark = remark;
    }

    public AsphaltWarningNoteConfigModel() {

    }

    public String getAsphaltNames() {
        return asphaltNames;
    }

    public void setAsphaltNames(String asphaltNames) {
        this.asphaltNames = asphaltNames;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getOrgId() {
        return orgId;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId == null ? null : orgId.trim();
    }

    public String getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(String asphaltId) {
        this.asphaltId = asphaltId == null ? null : asphaltId.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public Integer getLevel1() {
        return level1;
    }

    public void setLevel1(Integer level1) {
        this.level1 = level1;
    }

    public Integer getLevel2() {
        return level2;
    }

    public void setLevel2(Integer level2) {
        this.level2 = level2;
    }

    public Integer getLevel3() {
        return level3;
    }

    public void setLevel3(Integer level3) {
        this.level3 = level3;
    }

    public Integer getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(Integer isOpen) {
        this.isOpen = isOpen;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", projectId=").append(projectId);
        sb.append(", orgId=").append(orgId);
        sb.append(", asphaltId=").append(asphaltId);
        sb.append(", userId=").append(userId);
        sb.append(", userName=").append(userName);
        sb.append(", phone=").append(phone);
        sb.append(", level1=").append(level1);
        sb.append(", level2=").append(level2);
        sb.append(", level3=").append(level3);
        sb.append(", isOpen=").append(isOpen);
        sb.append(", type=").append(type);
        sb.append(", remark=").append(remark);
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
        AsphaltWarningNoteConfigModel other = (AsphaltWarningNoteConfigModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getProjectId() == null ? other.getProjectId() == null : this.getProjectId().equals(other.getProjectId()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getAsphaltId() == null ? other.getAsphaltId() == null : this.getAsphaltId().equals(other.getAsphaltId()))
                && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
                && (this.getUserName() == null ? other.getUserName() == null : this.getUserName().equals(other.getUserName()))
                && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
                && (this.getLevel1() == null ? other.getLevel1() == null : this.getLevel1().equals(other.getLevel1()))
                && (this.getLevel2() == null ? other.getLevel2() == null : this.getLevel2().equals(other.getLevel2()))
                && (this.getLevel3() == null ? other.getLevel3() == null : this.getLevel3().equals(other.getLevel3()))
                && (this.getIsOpen() == null ? other.getIsOpen() == null : this.getIsOpen().equals(other.getIsOpen()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getProjectId() == null) ? 0 : getProjectId().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getAsphaltId() == null) ? 0 : getAsphaltId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getUserName() == null) ? 0 : getUserName().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getLevel1() == null) ? 0 : getLevel1().hashCode());
        result = prime * result + ((getLevel2() == null) ? 0 : getLevel2().hashCode());
        result = prime * result + ((getLevel3() == null) ? 0 : getLevel3().hashCode());
        result = prime * result + ((getIsOpen() == null) ? 0 : getIsOpen().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }
}