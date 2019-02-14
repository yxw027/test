package com.linghang.model.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class KendoSheetModel implements Serializable {

    private String name;

    private String activeCell;

    private String selection;

    private List<Map<String, Object>> columns = new ArrayList<>();

    private List<String> mergedCells = new ArrayList<>();

    private List<KendoRowModel> rows = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getMergedCells() {
        return mergedCells;
    }

    public void setMergedCells(List<String> mergedCells) {
        this.mergedCells = mergedCells;
    }

    public List<KendoRowModel> getRows() {
        return rows;
    }

    public void setRows(List<KendoRowModel> rows) {
        this.rows = rows;
    }

    public KendoRowModel getRow(int rowIndex) {
        return rows.get(rowIndex);
    }

    public String getActiveCell() {
        if (this.activeCell == null && !this.rows.isEmpty()) {
            return "A1";
        }
        return activeCell;
    }

    public void setActiveCell(String activeCell) {
        this.activeCell = activeCell;
    }

    public List<Map<String, Object>> getColumns() {
        return columns;
    }

    public void setColumns(List<Map<String, Object>> columns) {
        this.columns = columns;
    }

    public String getSelection() {
        return selection;
    }

    public void setSelection(String selection) {
        this.selection = selection;
    }
}