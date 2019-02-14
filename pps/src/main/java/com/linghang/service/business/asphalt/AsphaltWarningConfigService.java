package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltWarningConfigMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警设置表 Service
 */
@Service
public class AsphaltWarningConfigService {

    private Logger logger = LoggerFactory.getLogger(AsphaltWarningConfigService.class);


    @Autowired
    private AsphaltWarningConfigMapper asphaltWarningConfigMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltWarningConfigMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltWarningConfigMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltWarningConfigModel model) {
        return model != null && this.asphaltWarningConfigMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltWarningConfigModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AsphaltWarningConfigModel> list : ListUtil.getSubList(models, 100)) {
                this.asphaltWarningConfigMapper.insertList(list);
            }
        } else {
            return this.asphaltWarningConfigMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltWarningConfigModel model) {
        return model != null && this.asphaltWarningConfigMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltWarningConfigModel selectById(Long id) {
        return id == null ? null : this.asphaltWarningConfigMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltWarningConfigModel> selectByModel(AsphaltWarningConfigModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltWarningConfigMapper.selectByModel(model);
    }


    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltWarningConfigModel model) {
        return !(model == null || model.getId() == null) && this.asphaltWarningConfigMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltWarningConfigModel model) {
        return !(model == null || model.getId() == null) && this.asphaltWarningConfigMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltWarningConfigModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltWarningConfigModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltWarningConfigMapper.selectByOptions(options));
    }

    /**
     * 查询配方所属告警设置
     *
     * @param formulaId
     * @return
     */
    public List<AsphaltWarningConfigModel> selectByFormulaId(Long formulaId) {
        return asphaltWarningConfigMapper.selectByFormulaId(formulaId);
    }

    public int updateUnIsVisible(Long id) {
        return asphaltWarningConfigMapper.updateUnIsVisible(id);
    }
}