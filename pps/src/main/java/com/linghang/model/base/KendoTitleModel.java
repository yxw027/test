package com.linghang.model.base;


import java.io.Serializable;
import java.util.Map;

public class KendoTitleModel implements Serializable {

    private String title;
    private String modelFieldName;
    private String getMethodName;
    private String setMethodName;
    private String modelFieldType;
    private Integer excelColIndex;
    private Integer excelRowIndex;
    private Integer fieldIndex;
    /**
     * 可以为空
     */
    private Boolean allowNulls = true;

    private Boolean only = false;
    /**
     * 转换Map
     */
    private Map<Object, Object> changeMap;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getModelFieldName() {
        return modelFieldName;
    }

    public void setModelFieldName(String modelFieldName) {
        this.modelFieldName = modelFieldName;
        if (modelFieldName == null || modelFieldName.trim().length() == 0) {
            return;
        }
        this.getMethodName = "get" + modelFieldName.substring(0, 1).toUpperCase() + modelFieldName.substring(1);
        this.setMethodName = "set" + modelFieldName.substring(0, 1).toUpperCase() + modelFieldName.substring(1);
    }

    public String getModelFieldType() {
        return modelFieldType;
    }

    public void setModelFieldType(String modelFieldType) {
        this.modelFieldType = modelFieldType;
    }

    public Integer getExcelColIndex() {
        return excelColIndex;
    }

    public void setExcelColIndex(Integer excelColIndex) {
        this.excelColIndex = excelColIndex;
    }

    public Integer getExcelRowIndex() {
        return excelRowIndex;
    }

    public void setExcelRowIndex(Integer excelRowIndex) {
        this.excelRowIndex = excelRowIndex;
    }

    public Boolean getAllowNulls() {
        return allowNulls;
    }

    public void setAllowNulls(Boolean allowNulls) {
        this.allowNulls = allowNulls;
    }

    public Boolean getOnly() {
        return only;
    }

    public void setOnly(Boolean only) {
        this.only = only;
    }

    public Map<Object, Object> getChangeMap() {
        return changeMap;
    }

    public void setChangeMap(Map<Object, Object> changeMap) {
        this.changeMap = changeMap;
    }

    public Integer getFieldIndex() {
        return fieldIndex;
    }

    public void setFieldIndex(Integer fieldIndex) {
        this.fieldIndex = fieldIndex;
    }

    public String getGetMethodName() {
        return getMethodName;
    }

    public void setGetMethodName(String getMethodName) {
        this.getMethodName = getMethodName;
    }

    public String getSetMethodName() {
        return setMethodName;
    }

    public void setSetMethodName(String setMethodName) {
        this.setMethodName = setMethodName;
    }
}