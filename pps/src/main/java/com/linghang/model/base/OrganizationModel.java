package com.linghang.model.base;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liuhao on 2017/05/02.
 * 组织机构 Model
 */
public class OrganizationModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 组织机构ID
     */
    private Long id;

    /**
     * 组织机构名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String name;

    /**
     * 组织机构类型
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer type;

    /**
     * 组织机构编号
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String number;

    /**
     * 组织机构关键字
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String keyword;

    /**
     * 创建人ID
     */
    private Long createUserId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 组织机构地址
     */
    private String address;

    /**
     * 电话
     */
    private String phone;

    /**
     * 主页
     */
    private String web;

    /**
     * 备注
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String remark;

    /**
     * 上级组织机构ID
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long parentId;

    /**
     * 邮编
     */
    private String postcode;

    /**
     * 标段号
     */
    private String tenderNo;

    /**
     * 单位
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String units;

    /**
     * 工程类型
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String workType;

    /**
     * 合同类型
     */
    private String contractType;

    /**
     * 起始位置
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String startPoint;

    /**
     * 结束位置
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String endPoint;

    /**
     * 全长
     */
    private String fullLength;

    /**
     * 开工时间
     */
    private String startDate;

    /**
     * 预计完工时间
     */
    private String estimateEndDate;

    /**
     * 期次(月)
     */
    private String sub;

    /**
     * 业务上报日
     */
    private String submitDate;

    /**
     * 树层级
     */
    private Integer level;
    /**
     * 图标
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String logo;

    private Boolean hasChildren;

    private String projectName;

    private String ownName;

    private String supName;

    private String typeName;

    private String createUserName;

    private Boolean enabled;

    /**
     * 简介
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String synopsis;

    private List<OrganizationModel> items = new ArrayList<>(0);


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web == null ? null : web.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getTenderNo() {
        return tenderNo;
    }

    public void setTenderNo(String tenderNo) {
        this.tenderNo = tenderNo == null ? null : tenderNo.trim();
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units == null ? null : units.trim();
    }

    public String getWorkType() {
        return workType;
    }

    public void setWorkType(String workType) {
        this.workType = workType == null ? null : workType.trim();
    }

    public String getContractType() {
        return contractType;
    }

    public void setContractType(String contractType) {
        this.contractType = contractType == null ? null : contractType.trim();
    }

    public String getStartPoint() {
        return startPoint;
    }

    public void setStartPoint(String startPoint) {
        this.startPoint = startPoint == null ? null : startPoint.trim();
    }

    public String getEndPoint() {
        return endPoint;
    }

    public void setEndPoint(String endPoint) {
        this.endPoint = endPoint == null ? null : endPoint.trim();
    }

    public String getFullLength() {
        return fullLength;
    }

    public void setFullLength(String fullLength) {
        this.fullLength = fullLength == null ? null : fullLength.trim();
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate == null ? null : startDate.trim();
    }

    public String getEstimateEndDate() {
        return estimateEndDate;
    }

    public void setEstimateEndDate(String estimateEndDate) {
        this.estimateEndDate = estimateEndDate == null ? null : estimateEndDate.trim();
    }

    public String getSub() {
        return sub;
    }

    public void setSub(String sub) {
        this.sub = sub == null ? null : sub.trim();
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate == null ? null : submitDate.trim();
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Boolean getHasChildren() {
        return hasChildren;
    }

    public void setHasChildren(Boolean hasChildren) {
        this.hasChildren = hasChildren;
    }

    public List<OrganizationModel> getItems() {
        return items;
    }

    public void setItems(List<OrganizationModel> items) {
        this.items = items;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getOwnName() {
        return ownName;
    }

    public void setOwnName(String ownName) {
        this.ownName = ownName;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }


    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", type=").append(type);
        sb.append(", number=").append(number);
        sb.append(", keyword=").append(keyword);
        sb.append(", createUserId=").append(createUserId);
        sb.append(", createTime=").append(createTime);
        sb.append(", status=").append(status);
        sb.append(", address=").append(address);
        sb.append(", phone=").append(phone);
        sb.append(", web=").append(web);
        sb.append(", remark=").append(remark);
        sb.append(", parentId=").append(parentId);
        sb.append(", postcode=").append(postcode);
        sb.append(", tenderNo=").append(tenderNo);
        sb.append(", units=").append(units);
        sb.append(", workType=").append(workType);
        sb.append(", contractType=").append(contractType);
        sb.append(", startPoint=").append(startPoint);
        sb.append(", endPoint=").append(endPoint);
        sb.append(", fullLength=").append(fullLength);
        sb.append(", startDate=").append(startDate);
        sb.append(", estimateEndDate=").append(estimateEndDate);
        sb.append(", sub=").append(sub);
        sb.append(", submitDate=").append(submitDate);
        sb.append(", level=").append(level);
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
        OrganizationModel other = (OrganizationModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getNumber() == null ? other.getNumber() == null : this.getNumber().equals(other.getNumber()))
                && (this.getKeyword() == null ? other.getKeyword() == null : this.getKeyword().equals(other.getKeyword()))
                && (this.getCreateUserId() == null ? other.getCreateUserId() == null : this.getCreateUserId().equals(other.getCreateUserId()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
                && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
                && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
                && (this.getWeb() == null ? other.getWeb() == null : this.getWeb().equals(other.getWeb()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
                && (this.getParentId() == null ? other.getParentId() == null : this.getParentId().equals(other.getParentId()))
                && (this.getPostcode() == null ? other.getPostcode() == null : this.getPostcode().equals(other.getPostcode()))
                && (this.getTenderNo() == null ? other.getTenderNo() == null : this.getTenderNo().equals(other.getTenderNo()))
                && (this.getUnits() == null ? other.getUnits() == null : this.getUnits().equals(other.getUnits()))
                && (this.getWorkType() == null ? other.getWorkType() == null : this.getWorkType().equals(other.getWorkType()))
                && (this.getContractType() == null ? other.getContractType() == null : this.getContractType().equals(other.getContractType()))
                && (this.getStartPoint() == null ? other.getStartPoint() == null : this.getStartPoint().equals(other.getStartPoint()))
                && (this.getEndPoint() == null ? other.getEndPoint() == null : this.getEndPoint().equals(other.getEndPoint()))
                && (this.getFullLength() == null ? other.getFullLength() == null : this.getFullLength().equals(other.getFullLength()))
                && (this.getStartDate() == null ? other.getStartDate() == null : this.getStartDate().equals(other.getStartDate()))
                && (this.getEstimateEndDate() == null ? other.getEstimateEndDate() == null : this.getEstimateEndDate().equals(other.getEstimateEndDate()))
                && (this.getSub() == null ? other.getSub() == null : this.getSub().equals(other.getSub()))
                && (this.getSubmitDate() == null ? other.getSubmitDate() == null : this.getSubmitDate().equals(other.getSubmitDate()))
                && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getNumber() == null) ? 0 : getNumber().hashCode());
        result = prime * result + ((getKeyword() == null) ? 0 : getKeyword().hashCode());
        result = prime * result + ((getCreateUserId() == null) ? 0 : getCreateUserId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getWeb() == null) ? 0 : getWeb().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getParentId() == null) ? 0 : getParentId().hashCode());
        result = prime * result + ((getPostcode() == null) ? 0 : getPostcode().hashCode());
        result = prime * result + ((getTenderNo() == null) ? 0 : getTenderNo().hashCode());
        result = prime * result + ((getUnits() == null) ? 0 : getUnits().hashCode());
        result = prime * result + ((getWorkType() == null) ? 0 : getWorkType().hashCode());
        result = prime * result + ((getContractType() == null) ? 0 : getContractType().hashCode());
        result = prime * result + ((getStartPoint() == null) ? 0 : getStartPoint().hashCode());
        result = prime * result + ((getEndPoint() == null) ? 0 : getEndPoint().hashCode());
        result = prime * result + ((getFullLength() == null) ? 0 : getFullLength().hashCode());
        result = prime * result + ((getStartDate() == null) ? 0 : getStartDate().hashCode());
        result = prime * result + ((getEstimateEndDate() == null) ? 0 : getEstimateEndDate().hashCode());
        result = prime * result + ((getSub() == null) ? 0 : getSub().hashCode());
        result = prime * result + ((getSubmitDate() == null) ? 0 : getSubmitDate().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        return result;
    }
}