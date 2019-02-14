package com.linghang.model.base;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class KendoWorkbookModel implements Serializable {

    private String activeSheet;

    private List<KendoSheetModel> sheets = new ArrayList<>();

    public String getActiveSheet() {

        if (this.activeSheet == null && !this.sheets.isEmpty()) {
            return this.sheets.get(0).getName();
        }
        return activeSheet;
    }

    public void setActiveSheet(String activeSheet) {
        this.activeSheet = activeSheet;
    }

    public List<KendoSheetModel> getSheets() {
        return sheets;
    }

    public void setSheets(List<KendoSheetModel> sheets) {
        this.sheets = sheets;
    }

    public KendoSheetModel getSheet(int sheetIndex) {
        return sheets.get(sheetIndex);
    }
}