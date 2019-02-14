package com.linghang.service.car;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.car.CarAlamMessageMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarAlamMessageModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/14.
 * 车辆报警 Service
 */
@Service
public class CarAlamMessageService {

    @Autowired
    private CarAlamMessageMapper carAlamMessageMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carAlamMessageMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carAlamMessageMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarAlamMessageModel model) {
        return model != null && this.carAlamMessageMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarAlamMessageModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarAlamMessageModel> list : ListUtil.getSubList(models, 100)) {
                this.carAlamMessageMapper.insertList(list);
            }
        } else {
            return this.carAlamMessageMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarAlamMessageModel model) {
        return model != null && this.carAlamMessageMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarAlamMessageModel selectById(Long id) {
        return id == null ? null : this.carAlamMessageMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarAlamMessageModel> selectByModel(CarAlamMessageModel model) {
        return model == null ? new ArrayList<>(0) : this.carAlamMessageMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarAlamMessageModel model) {
        return !(model == null || model.getId() == null) && this.carAlamMessageMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarAlamMessageModel model) {
        return !(model == null || model.getId() == null) && this.carAlamMessageMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarAlamMessageModel model) {
        return !(model == null || model.getId() == null) && this.carAlamMessageMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarAlamMessageModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carAlamMessageMapper.insert(model) == 1;
        }
        return this.carAlamMessageMapper.updateById(model) == 1;
    }

    public PageInfo<CarAlamMessageModel> selectMoldeByOptions(Long orgId, String startTime, String endTime, Integer alamType, KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.carAlamMessageMapper.selectMoldeByOptions(orgId, startTime, endTime, alamType, options));
    }
}