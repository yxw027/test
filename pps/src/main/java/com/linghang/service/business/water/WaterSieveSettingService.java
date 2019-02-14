package com.linghang.service.business.water;

import com.linghang.mapper.business.water.WaterSieveSettingMapper;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.util.Constant;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lvruixing on 2018/12/19.
 * 筛孔设置表 Service
 *
 * @author lvruixing
 */
@Service
public class WaterSieveSettingService {

    @Autowired
    private WaterSieveSettingMapper waterSieveSettingMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterSieveSettingMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterSieveSettingMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterSieveSettingModel model) {
        return model != null && this.waterSieveSettingMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterSieveSettingModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterSieveSettingModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterSieveSettingMapper.insertList(list);
            }
        } else {
            return this.waterSieveSettingMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterSieveSettingModel model) {
        return model != null && this.waterSieveSettingMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterSieveSettingModel selectById(Long id) {
        return id == null ? null : this.waterSieveSettingMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterSieveSettingModel> selectByModel(WaterSieveSettingModel model) {
        return model == null ? new ArrayList<>(0) : this.waterSieveSettingMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterSieveSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterSieveSettingMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterSieveSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterSieveSettingMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterSieveSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterSieveSettingMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterSieveSettingModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterSieveSettingMapper.insert(model) == 1;
        }
        return this.waterSieveSettingMapper.updateById(model) == 1;
    }

    public List<WaterSieveSettingModel> selectByFormulaId(Long formulaId) {
        return waterSieveSettingMapper.selectByFormulaId(formulaId);
    }

    /***
     * 新增筛孔值设置
     * @param list
     * @return
     */
    public Map<String, Object> addList(List<WaterSieveSettingModel> list) {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        if (!CollectionUtils.isEmpty(list)) {
            List<WaterSieveSettingModel> insertList = new ArrayList<>();
            boolean isUpdate = true;
            for (WaterSieveSettingModel settingModel : list) {
                if (settingModel.getId() != null) {
                    if (isUpdate) {
                        waterSieveSettingMapper.updateBeforeVersionVisible(settingModel.getFormulaId());
                        isUpdate = false;
                    }
                    settingModel.setDataVersion(settingModel.getDataVersion() + 1);
                } else {
                    settingModel.setDataVersion(1);
                }
                settingModel.setIsVisible(0);
                settingModel.setId(IdWorker.nextId());
                settingModel.setUpdateTime(new Date());
                settingModel.setUpdateUser(userModel.getId());
                insertList.add(settingModel);
            }
            this.insertList(insertList);
            return ResultUtil.getSuccessResultMap("保存成功");
        }
        return ResultUtil.getErrorResultMap("信息错误");
    }
}