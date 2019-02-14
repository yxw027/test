package com.linghang.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by i_it on 2019/01/09.
 * 路段桩号表 Model
 */
public class StakeGroupModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 组织架构id
     */
    private Long orgId;

    /**
     * 开始桩号
     */
    private BigDecimal startStake;

    /**
     * 结束桩号
     */
    private BigDecimal endStake;

    /**
     * 宽度
     */
    private BigDecimal width;

    /**
     * 名称
     */
    private String name;

    /**
     * 桩号类型
     */
    private String type;

    private List<StakeModel> stakeList = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public BigDecimal getStartStake() {
        return startStake;
    }

    public void setStartStake(BigDecimal startStake) {
        this.startStake = startStake;
    }

    public BigDecimal getEndStake() {
        return endStake;
    }

    public void setEndStake(BigDecimal endStake) {
        this.endStake = endStake;
    }

    public BigDecimal getWidth() {
        return width;
    }

    public void setWidth(BigDecimal width) {
        this.width = width;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public List<StakeModel> getStakeList() {
        return stakeList;
    }

    public void setStakeList(List<StakeModel> stakeList) {
        this.stakeList = stakeList;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orgId=").append(orgId);
        sb.append(", startStake=").append(startStake);
        sb.append(", endStake=").append(endStake);
        sb.append(", width=").append(width);
        sb.append(", name=").append(name);
        sb.append(", type=").append(type);
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
        StakeGroupModel other = (StakeGroupModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getStartStake() == null ? other.getStartStake() == null : this.getStartStake().equals(other.getStartStake()))
                && (this.getEndStake() == null ? other.getEndStake() == null : this.getEndStake().equals(other.getEndStake()))
                && (this.getWidth() == null ? other.getWidth() == null : this.getWidth().equals(other.getWidth()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getStartStake() == null) ? 0 : getStartStake().hashCode());
        result = prime * result + ((getEndStake() == null) ? 0 : getEndStake().hashCode());
        result = prime * result + ((getWidth() == null) ? 0 : getWidth().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        return result;
    }
}