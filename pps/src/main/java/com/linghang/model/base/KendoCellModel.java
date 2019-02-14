package com.linghang.model.base;

import java.io.Serializable;

/**
 * @author liuhao on 2017/2/24.
 */
public class KendoCellModel implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer index;
    private String background;
    private String color;
    private Object value;
    private Boolean bold;

    private KendoValidationModel validation;

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public KendoValidationModel getValidation() {
        return validation;
    }

    public void setValidation(KendoValidationModel validation) {
        this.validation = validation;
    }

    public Boolean getBold() {
        return bold;
    }

    public void setBold(Boolean bold) {
        this.bold = bold;
    }

    public void setErrorStyle(boolean isError) {
        this.bold = isError;
        this.color = isError ? "#ed5565" : null;
    }

    @Override
    public String toString() {
        return "SpreadsheetCellModel{" +
                "index=" + index +
                ", background='" + background + '\'' +
                ", color='" + color + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        KendoCellModel that = (KendoCellModel) o;
        return (index != null ? index.equals(that.index) : that.index == null) && (background != null ? background.equals(that.background) : that.background == null) && (color != null ? color.equals(that.color) : that.color == null) && (value != null ? value.equals(that.value) : that.value == null);
    }

    @Override
    public int hashCode() {
        int result = index != null ? index.hashCode() : 0;
        result = 31 * result + (background != null ? background.hashCode() : 0);
        result = 31 * result + (color != null ? color.hashCode() : 0);
        result = 31 * result + (value != null ? value.hashCode() : 0);
        return result;
    }
}
