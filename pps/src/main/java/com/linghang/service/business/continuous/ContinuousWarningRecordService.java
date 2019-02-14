package com.linghang.service.business.continuous;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.continuous.ContinuousWarningRecordMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.continuous.ContinuousWarningRecordModel;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen on 2019/01/28.
 */
@Service
public class ContinuousWarningRecordService {

    private Logger logger = LoggerFactory.getLogger(ContinuousWarningRecordService.class);


    @Autowired
    private ContinuousWarningRecordMapper continuousWarningRecordMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.continuousWarningRecordMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.continuousWarningRecordMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(ContinuousWarningRecordModel model) {
        return model != null && this.continuousWarningRecordMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<ContinuousWarningRecordModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<ContinuousWarningRecordModel> list : ListUtil.getSubList(models, 100)) {
                this.continuousWarningRecordMapper.insertList(list);
            }
        } else {
            return this.continuousWarningRecordMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(ContinuousWarningRecordModel model) {
        return model != null && this.continuousWarningRecordMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public ContinuousWarningRecordModel selectById(Long id) {
        return id == null ? null : this.continuousWarningRecordMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<ContinuousWarningRecordModel> selectByModel(ContinuousWarningRecordModel model) {
        return model == null ? new ArrayList<>(0) : this.continuousWarningRecordMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(ContinuousWarningRecordModel model) {
        return !(model == null || model.getId() == null) && this.continuousWarningRecordMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(ContinuousWarningRecordModel model) {
        return !(model == null || model.getId() == null) && this.continuousWarningRecordMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(ContinuousWarningRecordModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按预警id删除
     */
    public boolean deleteContinuousId(Long continuousId) {
        return continuousId != null && this.continuousWarningRecordMapper.deleteContinuousId(continuousId) > 0;
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<ContinuousWarningRecordModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.continuousWarningRecordMapper.selectByOptions(options));
    }
}