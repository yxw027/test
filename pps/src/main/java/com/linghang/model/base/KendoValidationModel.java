package com.linghang.model.base;

/**
 * @author liuhao on 2017/2/27.
 */
public class KendoValidationModel {

    private String dataType;
    private String from;
    private String to;
    private String comparerType;
    private String type;
    private Boolean allowNulls;
    private String messageTemplate;

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Boolean getAllowNulls() {
        return allowNulls;
    }

    public void setAllowNulls(Boolean allowNulls) {
        this.allowNulls = allowNulls;
    }

    public String getMessageTemplate() {
        return messageTemplate;
    }

    public void setMessageTemplate(String messageTemplate) {
        this.messageTemplate = messageTemplate;
    }

    public String getComparerType() {
        return comparerType;
    }

    public void setComparerType(String comparerType) {
        this.comparerType = comparerType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
