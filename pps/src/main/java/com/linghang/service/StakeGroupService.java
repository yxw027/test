package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.StakeGroupMapper;
import com.linghang.model.StakeGroupModel;
import com.linghang.model.StakeModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.util.ListUtil;
import org.apache.commons.compress.utils.Lists;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by i_it on 2018/11/21.
 * 路段桩号表 Service
 */
@Service
public class StakeGroupService {

    @Autowired
    private StakeGroupMapper stakeGroupMapper;
    @Autowired
    private StakeService stakeService;

    private static final String RESULT = "result";
    private static final String MESSAGE = "message";
    private static final String SHEET_NO = "sheetNo";

    //序号	桩号	类型	X	Y	lon	lat		左面层	左上基层	左下基层	左底基层  右面层	右上基层	右下基层	右底基层
    public static final String INDEX = "序号";
    public static final String STAKE = "桩号";
    public static final String TYPE = "类型";
    public static final String X = "x";
    public static final String Y = "y";
    public static final String LON = "lon";
    public static final String LAT = "lat";

    public static final String LAYER = "面层";
    public static final String UPPER_LEVEL = "上基层";
    public static final String LOWEST_LEVEL = "下基层";
    public static final String SUBBASE = "底基层";

    public static final String LEFT_LAYER = "左面层";
    public static final String LEFT_UPPER_LEVEL = "左上基层";
    public static final String LEFT_LOWEST_LEVEL = "左下基层";
    public static final String LEFT_SUBBASE = "左底基层";

    public static final String RIGHT_LAYER = "右面层";
    public static final String RIGHT_UPPER_LEVEL = "右上基层";
    public static final String RIGHT_LOWEST_LEVEL = "右下基层";
    public static final String RIGHT_SUBBASE = "右底基层";

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.stakeGroupMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.stakeGroupMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(StakeGroupModel model) {
        return model != null && this.stakeGroupMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<StakeGroupModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<StakeGroupModel> list : ListUtil.getSubList(models, 100)) {
                this.stakeGroupMapper.insertList(list);
            }
        } else {
            return this.stakeGroupMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(StakeGroupModel model) {
        return model != null && this.stakeGroupMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public StakeGroupModel selectById(Long id) {
        return id == null ? null : this.stakeGroupMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<StakeGroupModel> selectByModel(StakeGroupModel model) {
        return model == null ? new ArrayList<>(0) : this.stakeGroupMapper.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    public List<StakeGroupModel> selectWithDetailByModel(StakeGroupModel model) {
        return model == null ? new ArrayList<>(0) : this.stakeGroupMapper.selectWithDetailByModel(model);
    }

    /**
     * 按模型选择
     */
    public PageInfo<StakeGroupModel> selectByOptions(KendoOptions options, Long orgId) {
        if (options == null || orgId == null) {
            return new PageInfo<>();
        }
        StakeGroupModel model = new StakeGroupModel();
        model.setOrgId(orgId);
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.stakeGroupMapper.selectByModel(model));
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(StakeGroupModel model) {
        return !(model == null || model.getId() == null) && this.stakeGroupMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(StakeGroupModel model) {
        return !(model == null || model.getId() == null) && this.stakeGroupMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(StakeGroupModel model) {
        return !(model == null || model.getId() == null) && this.stakeGroupMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(StakeGroupModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.stakeGroupMapper.insert(model) == 1;
        }
        return this.stakeGroupMapper.updateById(model) == 1;
    }

    /**
     * 插入或更新
     */
    public boolean saveOrUpdate(StakeGroupModel model) {
        if (model == null) {
            return false;
        }
        if (this.stakeGroupMapper.updateByNameAndOrgId(model) == 1) {
            stakeService.deleteByGroupId(model.getId());
            return true;
        }
        return this.stakeGroupMapper.insert(model) == 1;
    }

    /**
     * @param cell 一个单元格的对象
     * @return 返回该单元格相应的类型的值
     */
    public static Object getRightTypeCell(Cell cell) {
        Object object = null;
        switch (cell.getCellType()) {
            case STRING: {
                object = cell.getStringCellValue();
                break;
            }
            case NUMERIC: {
                cell.setCellType(CellType.NUMERIC);
                object = cell.getNumericCellValue();
                break;
            }
            case FORMULA: {
                cell.setCellType(CellType.NUMERIC);
                object = cell.getNumericCellValue();
                break;
            }
            case BLANK: {
                cell.setCellType(CellType.BLANK);
                object = cell.getStringCellValue();
                break;
            }
            default: {
                break;
            }
        }
        return object;
    }

    /**
     * 插入或更新
     */
    public boolean uploadFileTxt(MultipartFile file, Long groupId) {
        List<StakeModel> list = Lists.newArrayList();
        try {
            InputStreamReader is = new InputStreamReader(file.getInputStream(), "utf-8");
            BufferedReader br = new BufferedReader(is);
            String text = null;
            while ((text = br.readLine()) != null) {
                System.out.println(text);
                StakeModel stakeModel = dealTextData(text);
                if (stakeModel != null) {
                    stakeModel.setStakeGroupId(groupId);
                    list.add(stakeModel);
                }
            }
            is.close();
            br.close();
        } catch (Exception e) {
            System.out.println("文件读取错误!");
        }
        stakeService.insertList(list);
        return true;
    }

    /**
     * 插入或更新
     */
    public Map<String, Object> uploadFileExcel(MultipartFile file, Long orgId) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result", true);
        if (orgId == null) {
            resultMap.put(RESULT, false);
            resultMap.put(MESSAGE, "组织机构不能为空！");
            return resultMap;
        }
        InputStream is = null;
        Workbook workbook = null;
        try {
            String filename = file.getOriginalFilename();
            if (!filename.matches("^.+\\.(?i)(xls)$") && !filename.matches("^.+\\.(?i)(xlsx)$")) {
                resultMap.put("result", false);
                resultMap.put("message", "上传文件格式不正确!");
                return resultMap;
            }
            //判断Excel文件的版本
            boolean isExcel2003 = true;
            if (filename.matches("^.+\\.(?i)(xlsx)$")) {
                isExcel2003 = false;
            }
            is = file.getInputStream();
            if (isExcel2003) {
                workbook = new HSSFWorkbook(is);
            } else {
                workbook = new XSSFWorkbook(is);
            }

            int numberOfSheets = workbook.getNumberOfSheets();
            for (int i = 0; i < numberOfSheets; i++) {
                try {
                    Sheet sheet = workbook.getSheetAt(i);
                    if (sheet == null) {
                        continue;
                    }
                    dealSheet(orgId, sheet, resultMap);
                    if (!(Boolean) resultMap.get(RESULT)) {
                        resultMap.put(SHEET_NO, i + 1);
                        return resultMap;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    resultMap.put(SHEET_NO, i + 1);
                    resultMap.put(RESULT, false);
                    resultMap.put(MESSAGE, "解析异常");
                    return resultMap;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            resultMap.put(RESULT, false);
            resultMap.put(MESSAGE, "解析异常");
            return resultMap;
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return resultMap;
    }

    private void dealSheet(Long orgId, Sheet sheet, Map<String, Object> resultMap) {
        //遍历Excel文件
        int totalRows = sheet.getPhysicalNumberOfRows();    //获取行数，第一行是标题

        StakeGroupModel stakeGroupModel = new StakeGroupModel();

        dealSheetName(stakeGroupModel, sheet.getSheetName(), resultMap);
        if (!(boolean) resultMap.get(RESULT)) {
            return;
        }
        stakeGroupModel.setOrgId(orgId);
        this.saveOrUpdate(stakeGroupModel);

        //表头解析
        Map<String, Integer> headMap = dealHead(sheet.getRow(0), resultMap);
        if (!headMap.containsKey(STAKE)) {
            errorMessage(resultMap, STAKE);
            return;
        }
        if (!headMap.containsKey(X)) {
            errorMessage(resultMap, X);
            return;
        }
        if (!headMap.containsKey(Y)) {
            errorMessage(resultMap, Y);
            return;
        }
        if (!headMap.containsKey(LON)) {
            errorMessage(resultMap, LON);
            return;
        }
        if (!headMap.containsKey(LAT)) {
            errorMessage(resultMap, LAT);
            return;
        }
        if (!headMap.containsKey(LEFT_LAYER)) {
            errorMessage(resultMap, LAYER);
            return;
        }
        if (!headMap.containsKey(LEFT_UPPER_LEVEL)) {
            errorMessage(resultMap, UPPER_LEVEL, LEFT_UPPER_LEVEL);
            return;
        }
        if (!headMap.containsKey(LEFT_LOWEST_LEVEL)) {
            errorMessage(resultMap, LOWEST_LEVEL, LEFT_LOWEST_LEVEL);
            return;
        }
        if (!headMap.containsKey(LEFT_SUBBASE)) {
            errorMessage(resultMap, SUBBASE, LEFT_SUBBASE);
            return;
        }

        List<StakeModel> stakeModelList = new ArrayList<>();
        Row row = null;
        for (int i = 1; i < totalRows; i++) {
            row = sheet.getRow(i);
            StakeModel stakeModel = new StakeModel();
            stakeModel.setStakeGroupId(stakeGroupModel.getId());
            stakeModel.setStakeNo(row.getCell(headMap.get(STAKE)).getStringCellValue());
            stakeModel.setMile(new BigDecimal(stakeModel.getStakeNo().replaceAll("[^\\d^\\.]", "")).intValue());
            stakeModel.setX(new BigDecimal(row.getCell(headMap.get(X)).getStringCellValue()));
            stakeModel.setY(new BigDecimal(row.getCell(headMap.get(Y)).getStringCellValue()));
            stakeModel.setLon(Double.parseDouble(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LON))))));
            stakeModel.setLat(Double.parseDouble(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LAT))))));

            stakeModel.setLeftLayer(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LEFT_LAYER))))));
            stakeModel.setLeftUpperLevel((new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LEFT_UPPER_LEVEL)))))));
            stakeModel.setLeftLowestLevel(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LEFT_LOWEST_LEVEL))))));
            stakeModel.setLeftSubbase(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(LEFT_SUBBASE))))));

            if (headMap.containsKey(TYPE)) {
                stakeModel.setStakeType(String.valueOf(getRightTypeCell(row.getCell(headMap.get(TYPE)))));
            }
            if (headMap.containsKey(RIGHT_LAYER)) {
                stakeModel.setRightLayer(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(RIGHT_LAYER))))));
            }
            if (headMap.containsKey(RIGHT_UPPER_LEVEL)) {
                stakeModel.setRightUpperLevel((new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(RIGHT_UPPER_LEVEL)))))));
            }
            if (headMap.containsKey(RIGHT_LOWEST_LEVEL)) {
                stakeModel.setRightLowestLevel(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(RIGHT_LOWEST_LEVEL))))));
            }
            if (headMap.containsKey(RIGHT_SUBBASE)) {
                stakeModel.setRightSubbase(new BigDecimal(String.valueOf(getRightTypeCell(row.getCell(headMap.get(RIGHT_SUBBASE))))));
            }
            stakeModelList.add(stakeModel);
        }
        stakeService.insertList(stakeModelList);


    }

    private void dealSheetName(StakeGroupModel stakeGroupModel, String name, Map<String, Object> resultMap) {
        try {
            //K157+690~K162+900
            String[] arr = name.split("~");
            if (arr.length == 1) {
                resultMap.put(RESULT, false);
                resultMap.put(MESSAGE, "sheet名称无法解析！");
                return;
            }
            stakeGroupModel.setName(name);
            String type = arr[0].replaceAll("[\\d\\+\\.]", "");
            stakeGroupModel.setType(type);
            stakeGroupModel.setStartStake(new BigDecimal(arr[0].replaceAll("[^\\d^\\.]", "")));
            stakeGroupModel.setEndStake(new BigDecimal(arr[1].replaceAll("[^\\d^\\.]", "")));
        } catch (Exception e) {
            System.out.println("sheet名称无法解析");
            resultMap.put(RESULT, false);
            resultMap.put(MESSAGE, "sheet名称无法解析！");
        }
    }

    /**
     * 序号	桩号	类型	X	Y	lon	lat		左面层	左上基层	左下基层	左底基层  右面层	右上基层	右下基层	右底基层
     *
     * @param headRow
     * @param resultMap
     * @return
     */
    private Map<String, Integer> dealHead(Row headRow, Map<String, Object> resultMap) {
        Map<String, Integer> map = new HashMap<>();
        headRow.getPhysicalNumberOfCells();
        for (int i = 0, l = headRow.getPhysicalNumberOfCells(); i <= l; i++) {
            if (headRow.getCell(i) == null) {
                continue;
            }
            switch (headRow.getCell(i).getStringCellValue().toLowerCase().trim()) {
                case INDEX:
                    map.put(INDEX, i);
                    break;
                case STAKE:
                    map.put(STAKE, i);
                    break;
                case TYPE:
                    map.put(TYPE, i);
                    break;
                case X:
                    map.put(X, i);
                    break;
                case Y:
                    map.put(Y, i);
                    break;
                case LON:
                    map.put(LON, i);
                    break;
                case LAT:
                    map.put(LAT, i);
                    break;
                case LAYER:
                    map.put(LEFT_LAYER, i);
                    break;
                case UPPER_LEVEL:
                    map.put(LEFT_UPPER_LEVEL, i);
                    break;
                case LOWEST_LEVEL:
                    map.put(LEFT_LOWEST_LEVEL, i);
                    break;
                case SUBBASE:
                    map.put(LEFT_SUBBASE, i);
                    break;
                case LEFT_LAYER:
                    map.put(LEFT_LAYER, i);
                    break;
                case LEFT_UPPER_LEVEL:
                    map.put(LEFT_UPPER_LEVEL, i);
                    break;
                case LEFT_LOWEST_LEVEL:
                    map.put(LEFT_LOWEST_LEVEL, i);
                    break;
                case LEFT_SUBBASE:
                    map.put(LEFT_SUBBASE, i);
                    break;
                case RIGHT_LAYER:
                    map.put(RIGHT_LAYER, i);
                    break;
                case RIGHT_UPPER_LEVEL:
                    map.put(RIGHT_UPPER_LEVEL, i);
                    break;
                case RIGHT_LOWEST_LEVEL:
                    map.put(RIGHT_LOWEST_LEVEL, i);
                    break;
                case RIGHT_SUBBASE:
                    map.put(RIGHT_SUBBASE, i);
                    break;
                default:
                    break;
            }
        }
        return map;
    }

    private void errorMessage(Map<String, Object> resultMap, String column) {
        errorMessage(resultMap, column, null);
    }

    private void errorMessage(Map<String, Object> resultMap, String column1, String column2) {
        resultMap.put(RESULT, false);
        if (column2 == null) {
            resultMap.put(MESSAGE, "无法识别“" + column1 + "”");
        } else {
            resultMap.put(MESSAGE, "无法识别“" + column1 + "”或者“" + column2 + "”");
        }

    }

    private StakeModel dealTextData(String text) throws Exception {
        //K157+930,中桩,3885236.5715,503520.6606,35.083885084,104.540259311,
        if (StringUtils.isEmpty(text)) {
            return null;
        }
        String[] array = text.split(",");
        if (array.length < 6) {
            return null;
        }
        StakeModel stakeModel = new StakeModel();
        stakeModel.setStakeNo(StringUtils.isEmpty(array[0]) ? null : array[0]);
        stakeModel.setX(new BigDecimal(array[2]));
        stakeModel.setY(new BigDecimal(array[3]));
        stakeModel.setLat(Double.parseDouble(array[4]));
        stakeModel.setLon(Double.parseDouble(array[5]));
        stakeModel.setMile(Integer.parseInt(array[0].replaceAll("[^\\d]", "")));
        return stakeModel;
    }

    /**
     * 查询桩号信息
     */
    public List<StakeGroupModel> selectStakeGroupList(Long orgId) {
        List<StakeGroupModel> list = new ArrayList<>();
        if (orgId == null) {
            return list;
        }
        StakeGroupModel stakeGroupModel = new StakeGroupModel();
        stakeGroupModel.setOrgId(orgId);
        list = this.selectWithDetailByModel(stakeGroupModel);
//        list.forEach(modelGroup ->{
//            modelGroup.getStakeList().forEach(model->{
//                double[] gps = GpsUtils.wgs84togcj02(model.getLon().doubleValue(), model.getLat().doubleValue());
//
//
//                model.setLon(new BigDecimal(gps[0]));
//                model.setLat(new BigDecimal(gps[1]));
////                model.setLon(new BigDecimal(gps[0] + 0.001231626d));
////                model.setLat(new BigDecimal(gps[1] + 0.000759481d));
//            });
//        });
        return list;
    }


}