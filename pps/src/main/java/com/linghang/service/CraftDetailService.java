package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.CraftDetailMapper;
import com.linghang.model.CraftDetailModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Dell on 2019/01/28.
 * 工艺明细表 Service
 */
@Service
public class CraftDetailService {

    private Logger logger = LoggerFactory.getLogger(CraftDetailService.class);


    @Autowired
    private CraftDetailMapper craftDetailModelMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.craftDetailModelMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.craftDetailModelMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CraftDetailModel model) {
        return model != null && this.craftDetailModelMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CraftDetailModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CraftDetailModel> list : ListUtil.getSubList(models, 100)) {
                this.craftDetailModelMapper.insertList(list);
            }
        } else {
            return this.craftDetailModelMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CraftDetailModel model) {
        return model != null && this.craftDetailModelMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CraftDetailModel selectById(Long id) {
        return id == null ? null : this.craftDetailModelMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CraftDetailModel> selectByModel(CraftDetailModel model) {
        return model == null ? new ArrayList<>(0) : this.craftDetailModelMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CraftDetailModel model) {
        return !(model == null || model.getId() == null) && this.craftDetailModelMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CraftDetailModel model) {
        return !(model == null || model.getId() == null) && this.craftDetailModelMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CraftDetailModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<CraftDetailModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.craftDetailModelMapper.selectByOptions(options));
    }

    public boolean deleteByCraftId(Long craftLayerId) {
        return craftLayerId == null ? false : craftDetailModelMapper.deleteByCraftId(craftLayerId) > 0;
    }
}