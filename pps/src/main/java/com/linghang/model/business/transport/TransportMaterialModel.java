package com.linghang.model.business.transport;

import java.io.Serializable;

/**
 * @author youp on 2019/01/02.
 * 记录当前车次的材料信息id集合， Model
 */
public class TransportMaterialModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 运输信息id，关联imp_transport_info
     */
    private Long transportId;


    /**
     * 材料id集合，逗号隔开，关联拌合材料数据信息
     */
    private String materialId;


    /**
     * 材料类型，沥青3，水稳1、混凝土2
     */
    private Integer type;

    public TransportMaterialModel(Long id, Long transportId, String materialId, Integer type) {
        this.id = id;
        this.transportId = transportId;
        this.materialId = materialId;
        this.type = type;
    }

    public TransportMaterialModel() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTransportId() {
        return transportId;
    }

    public void setTransportId(Long transportId) {
        this.transportId = transportId;
    }

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId == null ? null : materialId.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", transportId=").append(transportId);
        sb.append(", materialId=").append(materialId);
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
        TransportMaterialModel other = (TransportMaterialModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getTransportId() == null ? other.getTransportId() == null : this.getTransportId().equals(other.getTransportId()))
                && (this.getMaterialId() == null ? other.getMaterialId() == null : this.getMaterialId().equals(other.getMaterialId()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTransportId() == null) ? 0 : getTransportId().hashCode());
        result = prime * result + ((getMaterialId() == null) ? 0 : getMaterialId().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        return result;
    }
}