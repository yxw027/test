package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltSieveSettingMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 筛孔设置表 Service
 */
@Service
public class AsphaltSieveSettingService {

    private Logger logger = LoggerFactory.getLogger(AsphaltSieveSettingService.class);


    @Autowired
    private AsphaltSieveSettingMapper asphaltSieveSettingMapper;
    /**
     * 筛孔数量
     */
    private static int sieveNum = 13;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltSieveSettingMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltSieveSettingMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltSieveSettingModel model) {
        return model != null && this.asphaltSieveSettingMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltSieveSettingModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        int limit = 100;
        if (models.size() > limit) {
            for (List<AsphaltSieveSettingModel> list : ListUtil.getSubList(models, limit)) {
                this.asphaltSieveSettingMapper.insertList(list);
            }
        } else {
            return this.asphaltSieveSettingMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltSieveSettingModel model) {
        return model != null && this.asphaltSieveSettingMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltSieveSettingModel selectById(Long id) {
        return id == null ? null : this.asphaltSieveSettingMapper.selectById(id);
    }

    /**
     * 按模型选择
     *
     * @param formulaId
     */
    public List<AsphaltSieveSettingModel> selectByModel(Long formulaId) {
        AsphaltSieveSettingModel model = new AsphaltSieveSettingModel();
        model.setFormulaId(formulaId);
        List<AsphaltSieveSettingModel> list = this.asphaltSieveSettingMapper.selectByModel(model);
        if (CollectionUtils.isEmpty(list)) {
            list = new ArrayList<>();
            for (int i = 1; i <= sieveNum; i++) {
                model = new AsphaltSieveSettingModel();
                model.setLevel(i);
                model.setUpdateTime(new Date());
                model.setIsVisible(0);
                list.add(i - 1, model);
            }
        }
        return list;
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltSieveSettingModel model) {
        return !(model == null || model.getId() == null) && this.asphaltSieveSettingMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltSieveSettingModel model) {
        return !(model == null || model.getId() == null) && this.asphaltSieveSettingMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltSieveSettingModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltSieveSettingModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltSieveSettingMapper.selectByOptions(options));
    }

    public List<AsphaltSieveSettingModel> selectByFormulaId(Long formulaId) {
        return asphaltSieveSettingMapper.selectByFormulaId(formulaId);
    }

    /***
     * 新增筛孔值设置
     * @param list
     * @return
     */
    public Map<String, Object> addList(List<AsphaltSieveSettingModel> list) {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        if (!CollectionUtils.isEmpty(list)) {
            List<AsphaltSieveSettingModel> insertList = new ArrayList<>();
            boolean isUpdate = true;
            for (AsphaltSieveSettingModel settingModel : list) {
                if (settingModel.getId() != null) {
                    if (isUpdate) {
                        asphaltSieveSettingMapper.updateBeforeVersionVisible(settingModel.getFormulaId());
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