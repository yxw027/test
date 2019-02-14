package com.linghang.service;

import com.linghang.mapper.WorkAreaMapper;
import com.linghang.model.WorkAreaModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author i_it on 2019/01/08.
 * 工区表 Service
 */
@Service
public class WorkAreaService {

    @Autowired
    private WorkAreaMapper workAreaMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.workAreaMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.workAreaMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WorkAreaModel model) {
        if(model != null){
            model.setUpdateTime(new Date());
        }
        return model != null && this.workAreaMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WorkAreaModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<WorkAreaModel> list : ListUtil.getSubList(models, 100)) {
                this.workAreaMapper.insertList(list);
            }
        } else {
            return this.workAreaMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WorkAreaModel model) {
        if(model != null){
            model.setUpdateTime(new Date());
        }
        return model != null && this.workAreaMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WorkAreaModel selectById(Long id) {
        return id == null ? null : this.workAreaMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WorkAreaModel> selectByModel(WorkAreaModel model) {
        return model == null ? new ArrayList<>(0) : this.workAreaMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WorkAreaModel model) {
        if(model != null){
            model.setUpdateTime(new Date());
        }
        return !(model == null || model.getId() == null) && this.workAreaMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WorkAreaModel model) {
        if(model != null){
            model.setUpdateTime(new Date());
        }
        return !(model == null || model.getId() == null) && this.workAreaMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WorkAreaModel model) {
        return !(model == null || model.getId() == null) && this.workAreaMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WorkAreaModel model) {
        if (model == null) {
            return false;
        }
        model.setUpdateTime(new Date());
        if (model.getId() == null) {
            return this.workAreaMapper.insert(model) == 1;
        }
        return this.workAreaMapper.updateById(model) == 1;
    }
}