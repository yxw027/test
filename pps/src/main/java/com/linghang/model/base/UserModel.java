package com.linghang.model.base;

import com.alibaba.fastjson.annotation.JSONField;
import com.linghang.enums.Gender;
import com.linghang.enums.Status;
import com.linghang.interfaces.Excel;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author liuhao on 2017/04/27.
 * 用户表 Model
 */
public class UserModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID（用户不感知）
     */
    private Long id;

    /**
     * 用户名
     */
    @Excel(title = "用户名", allowNulls = false)
    private String name;

    /**
     * 性别
     */
    @Excel(title = "性别", enumClass = Gender.class)
    private Integer sex;

    /**
     * 登录名
     */
    @Excel(title = "登录名", isOnly = true, allowNulls = false)
    private String loginName;

    /**
     * 工号
     */
    @Excel(title = "工号")
    private String userNo;

    /**
     * 关键字
     */
    @Excel(title = "关键字")
    private String keyword;

    /**
     * 所在组织机构
     */
    private Long orgId;

    /**
     * 所在岗位
     */
    private String station;

    /**
     * 手机号
     */
    @Excel(title = "手机号")
    private String mobileNo;

    /**
     * 工作电话
     */
    @Excel(title = "工作电话")
    private String workPhone;

    /**
     * email
     */
    @Excel(title = "Email")
    private String email;

    /**
     * qq
     */
    @Excel(title = "QQ")
    private String qq;

    /**
     * 微信号
     */
    @Excel(title = "微信")
    private String weChat;

    /**
     * 创建人ID
     */
    private Long createUserId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 备注
     */
    @Excel(title = "备注")
    private String remark;

    /**
     * 证号
     */
    @Excel(title = "证号")
    private String cardNumber;

    /**
     * 用户状态
     */
    @Excel(title = "状态", enumClass = Status.class)
    private Integer status;

    /**
     * 密码
     */
    @JSONField(serialize = false)
    private String password;

    /**
     * 密码（加密方式不同）
     */
    @JSONField(serialize = false)
    private String softDog;

    @JSONField(serialize = false)
    private Boolean isAdmin = false;

    private String createUserName;

    private String orgName;

    private Integer orgType;

    private Long userRoleLinkId;

    private String roles;

    private List<UserOrgLinkModel> userOrgLinkList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo == null ? null : userNo.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station == null ? null : station.trim();
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo == null ? null : mobileNo.trim();
    }

    public String getWorkPhone() {
        return workPhone;
    }

    public void setWorkPhone(String workPhone) {
        this.workPhone = workPhone == null ? null : workPhone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getWeChat() {
        return weChat;
    }

    public void setWeChat(String weChat) {
        this.weChat = weChat == null ? null : weChat.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber == null ? null : cardNumber.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSoftDog() {
        return softDog;
    }

    public void setSoftDog(String softDog) {
        this.softDog = softDog == null ? null : softDog.trim();
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public Integer getOrgType() {
        return orgType;
    }

    public void setOrgType(Integer orgType) {
        this.orgType = orgType;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public Long getUserRoleLinkId() {
        return userRoleLinkId;
    }

    public void setUserRoleLinkId(Long userRoleLinkId) {
        this.userRoleLinkId = userRoleLinkId;
    }

    public List<UserOrgLinkModel> getUserOrgLinkList() {
        return userOrgLinkList;
    }

    public void setUserOrgLinkList(List<UserOrgLinkModel> userOrgLinkList) {
        this.userOrgLinkList = userOrgLinkList;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", sex=").append(sex);
        sb.append(", loginName=").append(loginName);
        sb.append(", userNo=").append(userNo);
        sb.append(", keyword=").append(keyword);
        sb.append(", orgId=").append(orgId);
        sb.append(", station=").append(station);
        sb.append(", mobileNo=").append(mobileNo);
        sb.append(", workPhone=").append(workPhone);
        sb.append(", email=").append(email);
        sb.append(", qq=").append(qq);
        sb.append(", webchar=").append(weChat);
        sb.append(", status=").append(status);
        sb.append(", createUserId=").append(createUserId);
        sb.append(", createTime=").append(createTime);
        sb.append(", remark=").append(remark);
        sb.append(", cardNumber=").append(cardNumber);
        sb.append(", password=").append(password);
        sb.append(", softDog=").append(softDog);
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
        UserModel other = (UserModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
                && (this.getLoginName() == null ? other.getLoginName() == null : this.getLoginName().equals(other.getLoginName()))
                && (this.getUserNo() == null ? other.getUserNo() == null : this.getUserNo().equals(other.getUserNo()))
                && (this.getKeyword() == null ? other.getKeyword() == null : this.getKeyword().equals(other.getKeyword()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getStation() == null ? other.getStation() == null : this.getStation().equals(other.getStation()))
                && (this.getMobileNo() == null ? other.getMobileNo() == null : this.getMobileNo().equals(other.getMobileNo()))
                && (this.getWorkPhone() == null ? other.getWorkPhone() == null : this.getWorkPhone().equals(other.getWorkPhone()))
                && (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
                && (this.getQq() == null ? other.getQq() == null : this.getQq().equals(other.getQq()))
                && (this.getWeChat() == null ? other.getWeChat() == null : this.getWeChat().equals(other.getWeChat()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
                && (this.getCreateUserId() == null ? other.getCreateUserId() == null : this.getCreateUserId().equals(other.getCreateUserId()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
                && (this.getCardNumber() == null ? other.getCardNumber() == null : this.getCardNumber().equals(other.getCardNumber()))
                && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
                && (this.getSoftDog() == null ? other.getSoftDog() == null : this.getSoftDog().equals(other.getSoftDog()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
        result = prime * result + ((getLoginName() == null) ? 0 : getLoginName().hashCode());
        result = prime * result + ((getUserNo() == null) ? 0 : getUserNo().hashCode());
        result = prime * result + ((getKeyword() == null) ? 0 : getKeyword().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getStation() == null) ? 0 : getStation().hashCode());
        result = prime * result + ((getMobileNo() == null) ? 0 : getMobileNo().hashCode());
        result = prime * result + ((getWorkPhone() == null) ? 0 : getWorkPhone().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getQq() == null) ? 0 : getQq().hashCode());
        result = prime * result + ((getWeChat() == null) ? 0 : getWeChat().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getCreateUserId() == null) ? 0 : getCreateUserId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getCardNumber() == null) ? 0 : getCardNumber().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getSoftDog() == null) ? 0 : getSoftDog().hashCode());
        return result;
    }
}