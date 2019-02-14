package com.linghang.model.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2017/2/24.
 */
public class KendoRowModel implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer index;
    private Integer height;
    private List<KendoCellModel> cells = new ArrayList<>();

    public KendoRowModel(Integer index, Integer height) {
        this.index = index;
        this.height = height;
    }

    public KendoRowModel() {

    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public List<KendoCellModel> getCells() {
        return cells;
    }

    public void setCells(List<KendoCellModel> cells) {
        this.cells = cells;
    }

    public KendoCellModel getCell(int cellIndex) {
        return cells.get(cellIndex);
    }

    @Override
    public String toString() {
        return "KendoRowModel{" +
                ", index=" + index +
                ", height=" + height +
                ", cells=" + cells +
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
        KendoRowModel that = (KendoRowModel) o;
        return (index != null ? index.equals(that.index) : that.index == null) && (height != null ? height.equals(that.height) : that.height == null) && (cells != null ? cells.equals(that.cells) : that.cells == null);
    }

    @Override
    public int hashCode() {
        int result = index != null ? index.hashCode() : 0;
        result = 31 * result + (height != null ? height.hashCode() : 0);
        result = 31 * result + (cells != null ? cells.hashCode() : 0);
        return result;
    }
}
