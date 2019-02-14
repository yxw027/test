package com.linghang.service.business.water;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.water.WaterMetadataAggregateMapper;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterMetadataAggregateModel;
import com.linghang.util.Constant;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2018/12/26.
 * 元数据计算结果表 Service
 *
 * @author 田朋
 */
@Service
public class WaterMetadataAggregateService {

    @Autowired
    private WaterMetadataAggregateMapper waterMetadataAggregateMapper;

    /**
     * 获取实时数据级配信息
     *
     * @param metaDataModel
     * @return
     */
    public PageInfo<WaterMetadataAggregateModel> selectByOptions(WaterMetaDataModel metaDataModel) {
        if (metaDataModel == null) {
            return new PageInfo<>();
        }
        if (metaDataModel.getPageSize() == null) {
            metaDataModel.setPageSize(1);
            PageHelper.startPage(metaDataModel.getPage(), metaDataModel.getPageSize());
            PageInfo<WaterMetadataAggregateModel> info = new PageInfo<WaterMetadataAggregateModel>(this.waterMetadataAggregateMapper.selectByOptions(metaDataModel));
            metaDataModel.setPageSize((int) info.getTotal());
        }
        PageHelper.startPage(metaDataModel.getPage(), metaDataModel.getPageSize());
        return new PageInfo<WaterMetadataAggregateModel>(this.waterMetadataAggregateMapper.selectByOptions(metaDataModel));
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterMetadataAggregateMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterMetadataAggregateMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterMetadataAggregateModel model) {
        return model != null && this.waterMetadataAggregateMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterMetadataAggregateModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterMetadataAggregateModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterMetadataAggregateMapper.insertList(list);
            }
        } else {
            return this.waterMetadataAggregateMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterMetadataAggregateModel model) {
        return model != null && this.waterMetadataAggregateMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterMetadataAggregateModel selectById(Long id) {
        return id == null ? null : this.waterMetadataAggregateMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterMetadataAggregateModel> selectByModel(WaterMetadataAggregateModel model) {
        return model == null ? new ArrayList<>(0) : this.waterMetadataAggregateMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterMetadataAggregateModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataAggregateMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterMetadataAggregateModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataAggregateMapper.updateById(model) == 1;
    }

    public boolean updateByDataId(WaterMetadataAggregateModel model) {
        return !(model == null || model.getDataId() == null) && this.waterMetadataAggregateMapper.updateByDataId(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterMetadataAggregateModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataAggregateMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterMetadataAggregateModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterMetadataAggregateMapper.insert(model) == 1;
        }
        return this.waterMetadataAggregateMapper.updateById(model) == 1;
    }
}