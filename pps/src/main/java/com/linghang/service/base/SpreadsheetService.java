package com.linghang.service.base;

import com.linghang.interfaces.Excel;
import com.linghang.model.base.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @author liuhao on 2017/2/24.
 */
@Service
public class SpreadsheetService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public KendoWorkbookModel getKendoWorkbookModelByFile(CommonsMultipartFile uploadExcel, Class modelClass) {

        Map<String, KendoTitleModel> kendoTitleModelMap = getKendoTitleModel(modelClass);

        InputStream in = null;
        Workbook workbook = null;
        try {
            in = uploadExcel.getInputStream();
            workbook = new XSSFWorkbook(in);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (workbook == null) {
            return new KendoWorkbookModel();
        }
        KendoWorkbookModel model = workbookToKendoWorkbook(workbook, kendoTitleModelMap);
        return model;

    }

    public KendoWorkbookModel getKendoWorkbookModel(CommonsMultipartFile uploadExcel) {
        InputStream in = null;
        String fileName = uploadExcel.getName().toLowerCase();
        //IE浏览器部分版本获取文件名为全路径，导致上传错误
        int index = fileName.lastIndexOf("\\");
        if (index != -1) {
            fileName = fileName.substring(index + 1);
        }
        Workbook workbook = null;
        try {
            // 获取前台exce的输入流
            in = uploadExcel.getInputStream();
            if (fileName.endsWith(".xlsx")) {
                workbook = new XSSFWorkbook(in);
            } else {
                workbook = new HSSFWorkbook(in);
            }
        } catch (IOException e) {
            logger.error("读取excel错误", e);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                    logger.error("关闭流失败", e);
                }
            }
        }
        if (workbook == null) {
            return new KendoWorkbookModel();
        }
//        KendoWorkbookModel model = workbookToKendoWorkbook(workbook);
        return null;
    }

    /**
     * @param modelClass
     * @return
     */
    public Map<String, KendoTitleModel> getKendoTitleModel(Class modelClass) {
        Map<String, KendoTitleModel> titleMap = new HashMap<>(16);
        Field[] fields = modelClass.getDeclaredFields();
        KendoTitleModel kendoTitleModel;
        Excel excel;
        for (Field field : fields) {
            excel = field.getAnnotation(Excel.class);
            if (excel == null) {
                continue;
            }
            kendoTitleModel = new KendoTitleModel();
            kendoTitleModel.setTitle(excel.title());
            kendoTitleModel.setAllowNulls(excel.allowNulls());
            kendoTitleModel.setOnly(excel.isOnly());
            kendoTitleModel.setModelFieldName(field.getName());
            kendoTitleModel.setModelFieldType(field.getGenericType().getTypeName());
            if (!"java.lang.NullPointerException".equals(excel.enumClass().getTypeName())) {
                Method declaredMethod;
                HashMap<Object, Object> map = null;
                try {
                    declaredMethod = excel.enumClass().getDeclaredMethod("getToIntegerMap");
                    map = (HashMap<Object, Object>) declaredMethod.invoke(excel.enumClass());
                } catch (Exception e) {
                    logger.error("获取枚举Map失败", e);
                    e.printStackTrace();
                }
                if (map == null) {
                    continue;
                }
                kendoTitleModel.setChangeMap(map);
            }
            titleMap.put(kendoTitleModel.getTitle(), kendoTitleModel);
        }
        return titleMap;
    }

    private KendoCellModel cellToKendoCell(Cell cell, Integer titleRowNumber, Map<Integer, KendoTitleModel> kendoTitleMap) {
        if (cell == null) {
            return null;
        }
        KendoCellModel model = new KendoCellModel();
        CellReference cellReference;
        model.setIndex(cell.getColumnIndex());
        if (CellType.STRING.equals(cell.getCellType())) {
            model.setValue(cell.getStringCellValue().trim().replace(" ", ""));
        } else if (CellType.NUMERIC.equals(cell.getCellType())) {
            model.setValue(cell.getNumericCellValue());
        } else {
            model.setValue(cell.toString());
        }
        if (cell.toString().length() == 0 || titleRowNumber == null) {
            return model;
        }
        KendoTitleModel kendoTitleModel;
        KendoValidationModel kendoValidationModel;
        if (cell.getRowIndex() == titleRowNumber) {
            model.setColor("#72c5fc");
        } else if (cell.getRowIndex() > titleRowNumber && kendoTitleMap.containsKey(cell.getColumnIndex())) {
            kendoTitleModel = kendoTitleMap.get(cell.getColumnIndex());
            if (kendoTitleModel.getModelFieldType().endsWith("Integer") || kendoTitleModel.getModelFieldType().endsWith("Double") || kendoTitleModel.getModelFieldType().endsWith("BigDecimal")) {
                cellReference = new CellReference(cell.getRowIndex(), cell.getColumnIndex());
                kendoValidationModel = new KendoValidationModel();
                kendoValidationModel.setAllowNulls(kendoTitleModel.getAllowNulls());
                kendoValidationModel.setDataType("custom");
                kendoValidationModel.setFrom("ISNUMBER(" + cellReference.formatAsString() + ")");
                kendoValidationModel.setMessageTemplate("此列为数字类型");
                if (!kendoValidationModel.getAllowNulls()) {
                    kendoValidationModel.setMessageTemplate(kendoValidationModel.getMessageTemplate() + ",不能未空");
                }
                model.setValidation(kendoValidationModel);
            } else if (kendoTitleModel.getModelFieldType().endsWith("String") && !kendoTitleModel.getAllowNulls()) {
                cellReference = new CellReference(cell.getRowIndex(), cell.getColumnIndex());
                kendoValidationModel = new KendoValidationModel();
                kendoValidationModel.setAllowNulls(kendoTitleModel.getAllowNulls());
                kendoValidationModel.setDataType("custom");
                kendoValidationModel.setFrom("LEN(" + cellReference.formatAsString() + ")>0");
                kendoValidationModel.setMessageTemplate("此列不能未空");
                model.setValidation(kendoValidationModel);
            }
        }
        return model;
    }

    private KendoRowModel rowToKendoRow(Row row, Integer titleRowNumber, Map<Integer, KendoTitleModel> kendoTitleMap) {
        if (row == null) {
            return null;
        }
        Cell cell;
        KendoCellModel kendoCellModel;
        KendoRowModel rowModel = new KendoRowModel();
        Iterator<Cell> cellIterator = row.cellIterator();
        while (cellIterator.hasNext()) {
            cell = cellIterator.next();
            if (cell == null) {
                continue;
            }
            kendoCellModel = this.cellToKendoCell(cell, titleRowNumber, kendoTitleMap);
            rowModel.getCells().add(kendoCellModel);
        }
        rowModel.setIndex(row.getRowNum());
        return rowModel;
    }

    private KendoSheetModel sheetToKendoSheet(Sheet sheet, Map<String, KendoTitleModel> kendoTitleModelMap) {
        if (sheet == null) {
            return null;
        }
        Map<Integer, KendoTitleModel> kendoTitleMap = new HashMap<>(kendoTitleModelMap.size());
        Integer excelTitleRowNumber = findExcelTitle(kendoTitleModelMap, sheet);
        if (excelTitleRowNumber != null) {
            for (KendoTitleModel kendoTitleModel : kendoTitleModelMap.values()) {
                kendoTitleMap.put(kendoTitleModel.getExcelColIndex(), kendoTitleModel);
            }
        }
        Row row;
        KendoRowModel kendoRowModel;
        KendoSheetModel sheetModel = new KendoSheetModel();
        Iterator<Row> rowIterator = sheet.rowIterator();
        while (rowIterator.hasNext()) {
            row = rowIterator.next();
            if (row == null) {
                continue;
            }
            kendoRowModel = this.rowToKendoRow(row, excelTitleRowNumber, kendoTitleMap);
            sheetModel.getRows().add(kendoRowModel);
        }
        return sheetModel;
    }

    private KendoWorkbookModel workbookToKendoWorkbook(Workbook workbook, Map<String, KendoTitleModel> kendoTitleModelMap) {
        if (workbook == null) {
            return null;
        }
        Sheet sheet;
        KendoSheetModel sheetModel;
        KendoWorkbookModel workbookModel = new KendoWorkbookModel();
        Iterator<Sheet> sheetIterator = workbook.sheetIterator();
        while (sheetIterator.hasNext()) {
            sheet = sheetIterator.next();
            if (sheet == null) {
                continue;
            }
            sheetModel = this.sheetToKendoSheet(sheet, kendoTitleModelMap);
            workbookModel.getSheets().add(sheetModel);
        }
        return workbookModel;
    }

    /**
     * 查找excel的标题
     */
    private Integer findExcelTitle(Map<String, KendoTitleModel> kendoTitleModelMap, Sheet sheet) {
        Iterator<Row> rowIterator1 = sheet.rowIterator();
        Map<String, Integer> indexMap;
        Row row;
        Cell cell;
        Iterator<Cell> cellIterator;
        boolean isTitle;
        String cellStringContent;
        while (rowIterator1.hasNext()) {
            indexMap = new HashMap<>(kendoTitleModelMap.size());
            row = rowIterator1.next();
            isTitle = true;
            cellIterator = row.cellIterator();
            while (cellIterator.hasNext()) {
                cell = cellIterator.next();
                cellStringContent = cell.getStringCellValue();
                if (cellStringContent == null) {
                    continue;
                }
                cellStringContent = cellStringContent.trim().replace(" ", "");
                if (cellStringContent.length() != 0) {
                    indexMap.put(cellStringContent, cell.getColumnIndex());
                }
            }
            for (String baseTitle : kendoTitleModelMap.keySet()) {
                if (!indexMap.keySet().contains(baseTitle)) {
                    isTitle = false;
                    break;
                }
            }
            if (isTitle) {
                for (KendoTitleModel kendoTitleModel : kendoTitleModelMap.values()) {
                    kendoTitleModel.setExcelColIndex(indexMap.get(kendoTitleModel.getTitle()));
                    kendoTitleModel.setExcelRowIndex(row.getRowNum());
                }
                return row.getRowNum();
            }
        }
        return null;
    }

    /**
     * 查找excel的标题
     */
    public Integer findExcelTitle(Map<String, KendoTitleModel> kendoTitleModelMap, KendoSheetModel sheet) {
        Iterator<KendoRowModel> rowIterator1 = sheet.getRows().iterator();
        Map<String, Integer> indexMap;
        KendoRowModel row;
        KendoCellModel cell;
        Iterator<KendoCellModel> cellIterator;
        boolean isTitle;
        String cellStringContent;
        while (rowIterator1.hasNext()) {
            indexMap = new HashMap<>(kendoTitleModelMap.size());
            row = rowIterator1.next();
            isTitle = true;
            cellIterator = row.getCells().iterator();
            while (cellIterator.hasNext()) {
                cell = cellIterator.next();
                if (cell == null || cell.getValue() == null) {
                    continue;
                }
                cellStringContent = cell.getValue().toString();
                if (cellStringContent == null) {
                    continue;
                }
                cellStringContent = cellStringContent.trim().replace(" ", "");
                if (cellStringContent.length() != 0) {
                    indexMap.put(cellStringContent, cell.getIndex());
                }
            }
            for (String baseTitle : kendoTitleModelMap.keySet()) {
                if (!indexMap.keySet().contains(baseTitle)) {
                    isTitle = false;
                    break;
                }
            }
            if (isTitle) {
                for (KendoTitleModel kendoTitleModel : kendoTitleModelMap.values()) {
                    kendoTitleModel.setExcelColIndex(indexMap.get(kendoTitleModel.getTitle()));
                    kendoTitleModel.setExcelRowIndex(row.getIndex());
                }
                return row.getIndex();
            }
        }
        return null;
    }

    /**
     * 检测数据
     *
     * @param workbookModel
     * @param saveList
     * @param clazz
     * @param <T>
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws NoSuchMethodException
     * @throws InvocationTargetException
     */
    public <T> boolean checkData(KendoWorkbookModel workbookModel, ArrayList<T> saveList, Class<T> clazz) throws IllegalAccessException, InstantiationException, NoSuchMethodException, InvocationTargetException {
        if (workbookModel == null) {
            return false;
        }
        boolean checkResult = true;
        Map<String, KendoTitleModel> kendoTitleModel = this.getKendoTitleModel(clazz);
        Long sheetIndex = 1L;
        Long dataId;
        Method method;
        KendoCellModel cellModel;
        T t;
        List<String> onlyList = new ArrayList<>();
        for (KendoSheetModel sheetModel : workbookModel.getSheets()) {
            sheetIndex += 10000L;
            Integer excelTitleIndex = this.findExcelTitle(kendoTitleModel, sheetModel);
            if (excelTitleIndex == null) {
                sheetModel.setName(sheetModel.getName() + "(未找到标题)");
                checkResult = false;
                continue;
            }
            for (KendoRowModel rowModel : sheetModel.getRows()) {
                if (rowModel.getIndex() <= excelTitleIndex) {
                    continue;
                }
                dataId = sheetIndex + rowModel.getIndex();
                t = clazz.newInstance();
                method = clazz.getDeclaredMethod("setId", Long.class);
                if (method != null) {
                    method.invoke(t, dataId);
                }
                for (KendoTitleModel titleModel : kendoTitleModel.values()) {
                    if (titleModel.getExcelColIndex() >= rowModel.getCells().size()) {
                        if (!titleModel.getAllowNulls()) {
                            cellModel = new KendoCellModel();
                            cellModel.setErrorStyle(true);
                            cellModel.setValue("(字段不能为空)");
                            rowModel.getCells().add(cellModel);
                            checkResult = false;
                        }
                        continue;
                    }
                    method = clazz.getDeclaredMethod(titleModel.getSetMethodName(), getParameterTypes(titleModel.getModelFieldType()));
                    cellModel = rowModel.getCells().get(titleModel.getExcelColIndex());
                    if (cellModel != null) {
                        if (cellModel.getValue() != null && cellModel.getValue().toString().trim().length() != 0) {
                            method.invoke(t, cellModel.getValue());
                            /**
                             * 判断字段内容是否重复
                             */
                            if (titleModel.getOnly()) {
                                if (onlyList.contains(titleModel.getModelFieldName() + cellModel.getValue())) {
                                    cellModel.setValue(cellModel.getValue() + "(内容存在重复)");
                                    cellModel.setErrorStyle(true);
                                    checkResult = false;
                                } else {
                                    onlyList.add(titleModel.getModelFieldName() + cellModel.getValue());
                                }
                            }
                        }
                        /**
                         * 判断字段内容是否为空
                         */
                        else if (!titleModel.getAllowNulls()) {
                            cellModel.setValue("(字段不能为空)");
                            cellModel.setErrorStyle(true);
                            checkResult = false;
                        }
                    }
                }
                saveList.add(t);
            }
        }
        return checkResult;
    }


    private Class<?> getParameterTypes(String typeString) {
        if ("java.lang.String".equals(typeString)) {
            return String.class;
        }
        return null;
    }


    public <T> void writeWorkbook(Workbook workbook, List<T> dataList) {
        if (dataList == null || dataList.isEmpty()) {
            return;
        }
        T data = dataList.get(0);
        Field[] fields = data.getClass().getDeclaredFields();
        Excel excel;
        KendoTitleModel kendoTitleModel;
        int fieldIndex = 0;
        List<KendoTitleModel> titleList = new ArrayList<>();
        for (Field field : fields) {
            excel = field.getAnnotation(Excel.class);
            if (excel == null) {
                continue;
            }
            kendoTitleModel = new KendoTitleModel();
            kendoTitleModel.setTitle(excel.title());
            kendoTitleModel.setFieldIndex(fieldIndex);
            fieldIndex++;
            kendoTitleModel.setModelFieldName(field.getName());
//            kendoTitleModel.setMethodGetName("get" + field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1));
            kendoTitleModel.setModelFieldType(field.getGenericType().getTypeName());
            if (!"java.lang.NullPointerException".equals(excel.enumClass().getTypeName())) {
                Method declaredMethod;
                HashMap<Object, Object> map = null;
                try {
                    declaredMethod = excel.enumClass().getDeclaredMethod("getToStringMap");
                    map = (HashMap<Object, Object>) declaredMethod.invoke(excel.enumClass());
                } catch (Exception e) {
                    logger.error("获取枚举Map失败", e);
                    e.printStackTrace();
                }
                if (map == null) {
                    continue;
                }
                kendoTitleModel.setChangeMap(map);
            }
            titleList.add(kendoTitleModel);
        }

        Sheet sheet = workbook.createSheet();
        Row row = sheet.createRow(0);
        row.setHeight((short) 500);
        Cell cell;
        Method method;
        Object invoke;
        CellStyle titleCellStyle = workbook.createCellStyle();
        titleCellStyle.setFillForegroundColor(IndexedColors.GREEN.index);
        titleCellStyle.setFillBackgroundColor(IndexedColors.GREEN.index);
        titleCellStyle.setAlignment(HorizontalAlignment.CENTER); // 居中
        for (KendoTitleModel kendoTitle : titleList) {
            cell = row.createCell(kendoTitle.getFieldIndex());
            cell.setCellValue(kendoTitle.getTitle());
            cell.setCellStyle(titleCellStyle);
        }
        try {
            for (T t : dataList) {
                row = sheet.createRow(sheet.getLastRowNum() + 1);
                for (KendoTitleModel titleModel : titleList) {
                    cell = row.createCell(titleModel.getFieldIndex());
                    method = t.getClass().getMethod(titleModel.getGetMethodName());
                    invoke = method.invoke(t);
                    if (invoke != null) {
                        if (titleModel.getChangeMap() == null) {
                            cell.setCellValue(invoke.toString());
                        } else {
                            Object changeValue = titleModel.getChangeMap().getOrDefault(invoke, "");
                            cell.setCellValue(changeValue.toString());
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        /**
         * 调整宽度
         */
        row = sheet.getRow(0);
        for (int i = 0; i < row.getLastCellNum(); i++) {
            sheet.autoSizeColumn(i);
        }
        /**
         *冻结首行首列
         */
        sheet.createFreezePane(1, 1, 1, 1);

    }


}
