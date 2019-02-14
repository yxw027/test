package com.linghang.model.business.transport;

import java.io.Serializable;

/**
 * @author youp on 2019/01/02.
 * 射频扫描上传信息 Model
 */
public class RadiofrequencyDataModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 射频卡号
     */
    private String cardMark;


    /**
     * 时间戳，扫描时间
     */
    private Long time;
    /**
     * 射频扫描机器唯一标识
     */
    private String position;
    /**
     * 射频扫描机器类型
     */
    private Integer type;

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public RadiofrequencyDataModel(Long id, String cardMark, Long time, String position, Integer type) {
        this.id = id;
        this.cardMark = cardMark;
        this.time = time;
        this.type = type;
        this.position = position;
    }

    public RadiofrequencyDataModel() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCardMark() {
        return cardMark;
    }

    public void setCardMark(String cardMark) {
        this.cardMark = cardMark;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", cardMark=").append(cardMark);
        sb.append(", time=").append(time);
        sb.append(", position=").append(position);
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
        RadiofrequencyDataModel other = (RadiofrequencyDataModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getCardMark() == null ? other.getCardMark() == null : this.getCardMark().equals(other.getCardMark()))
                && (this.getTime() == null ? other.getTime() == null : this.getTime().equals(other.getTime()))
                && (this.getPosition() == null ? other.getPosition() == null : this.getPosition().equals(other.getPosition()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCardMark() == null) ? 0 : getCardMark().hashCode());
        result = prime * result + ((getTime() == null) ? 0 : getTime().hashCode());
        result = prime * result + ((getPosition() == null) ? 0 : getPosition().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        return result;
    }
}