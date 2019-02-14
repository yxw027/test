package com.linghang.service.business.water;


import com.linghang.mapper.business.water.WaterInfoMapper;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterStaticReportModel;
import com.linghang.util.Constant;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2018/12/19.
 * 沥青站基础信息 Service
 *
 * @author 田朋
 */
@Service
public class WaterInfoService {

    @Autowired
    private WaterInfoMapper waterInfoMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterInfoMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterInfoMapper.deleteByIds(ids) > 0);
    }

    /**
     * 自动补齐骨料名称
     *
     * @param model
     */
    private void validateAggregateName(WaterInfoModel model) {
        int num = model.getAggregateNum();
        String name = model.getAggregateName();
        StringBuilder builder = new StringBuilder();
        String[] nameArray = name.replaceAll("，", ",").split(",");
        String newName = "";
        int length = name.replaceAll("，", ",").split(",").length;
        if (num > length) {
            builder.append(name);
            for (int i = 1; i <= num - length; i++) {
                builder.append(",g").append(length + i);
            }
            newName = builder.toString().replaceAll("，", ",");
        }
        if (num <= length) {
            for (int i = 0; i < num; i++) {
                builder.append(nameArray[i]).append(",");
            }
            newName = builder.substring(0, builder.length() - 1);
        }
        model.setAggregateName(newName);
    }

    /**
     * 插入数据
     */
    public WaterInfoModel insert(WaterInfoModel model) {
        if (model != null) {
            validateAggregateName(model);
            if (model.getId() == null) {
                this.waterInfoMapper.insert(model);
            } else {
                this.waterInfoMapper.updateById(model);
            }
        }
        return model;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterInfoModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterInfoModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterInfoMapper.insertList(list);
            }
        } else {
            return this.waterInfoMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterInfoModel model) {
        return model != null && this.waterInfoMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterInfoModel selectById(Long id) {
        return id == null ? null : this.waterInfoMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterInfoModel> selectByModel(WaterInfoModel model) {
        return model == null ? new ArrayList<>(0) : this.waterInfoMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterInfoModel model) {
        return !(model == null || model.getId() == null) && this.waterInfoMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterInfoModel model) {
        return !(model == null || model.getId() == null) && this.waterInfoMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterInfoModel model) {
        return !(model == null || model.getId() == null) && this.waterInfoMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterInfoModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterInfoMapper.insert(model) == 1;
        }
        return this.waterInfoMapper.updateById(model) == 1;
    }

    public List<WaterInfoModel> getWaterList(Long orgId) {
        return orgId == null ? new ArrayList<>() : this.waterInfoMapper.getWaterList(orgId);
    }

    public WaterInfoModel selectByFormulaId(Long formulaId) {
        return waterInfoMapper.selectByFormulaId(formulaId);
    }

    public WaterInfoModel getCardOnly(String cardMark, Long id) {
        if (cardMark == null) {
            return null;
        }
        if (id != null) {
            WaterInfoModel waterInfoModel = selectById(id);
            if (waterInfoModel != null && cardMark.equals(waterInfoModel.getCardMark())) {
                return null;
            }
        }
        return this.waterInfoMapper.getCardOnly(cardMark);
    }

    public List<WaterStaticReportModel> geStatisticsSend() {
        return this.waterInfoMapper.geStatisticsSend();
    }

    public WaterInfoModel selectByCardMark(String cardMark) {
        return waterInfoMapper.selectByCardMark(cardMark);
    }
}