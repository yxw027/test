package com.linghang.model;

import java.io.Serializable;

/**
 * @author Dell on 2019/01/28.
 * 工艺层级 Model
 */
public class CraftLayerModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 序号
     */
    private Integer index;


    /**
     * 材料类型（0：水稳，1:沥青）
     */
    private Integer materialType;


    /**
     * 工艺层级
     */
    private Integer layer;


    /**
     * 工艺版本
     */
    private String version;


    /**
     * 标段Id
     */
    private Long orgId;

    public CraftLayerModel(Long id, Integer index, Integer materialType, Integer layer, String version, Long orgId) {
        this.id = id;
        this.index = index;
        this.materialType = materialType;
        this.layer = layer;
        this.version = version;
        this.orgId = orgId;
    }

    public CraftLayerModel() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getMaterialType() {
        return materialType;
    }

    public void setMaterialType(Integer materialType) {
        this.materialType = materialType;
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", index=").append(index);
        sb.append(", materialType=").append(materialType);
        sb.append(", layer=").append(layer);
        sb.append(", version=").append(version);
        sb.append(", orgId=").append(orgId);
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
        CraftLayerModel other = (CraftLayerModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getIndex() == null ? other.getIndex() == null : this.getIndex().equals(other.getIndex()))
                && (this.getMaterialType() == null ? other.getMaterialType() == null : this.getMaterialType().equals(other.getMaterialType()))
                && (this.getLayer() == null ? other.getLayer() == null : this.getLayer().equals(other.getLayer()))
                && (this.getVersion() == null ? other.getVersion() == null : this.getVersion().equals(other.getVersion()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getIndex() == null) ? 0 : getIndex().hashCode());
        result = prime * result + ((getMaterialType() == null) ? 0 : getMaterialType().hashCode());
        result = prime * result + ((getLayer() == null) ? 0 : getLayer().hashCode());
        result = prime * result + ((getVersion() == null) ? 0 : getVersion().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        return result;
    }
}