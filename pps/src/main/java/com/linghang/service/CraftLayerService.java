package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.CraftLayerMapper;
import com.linghang.model.CraftDetailModel;
import com.linghang.model.CraftLayerLimitModel;
import com.linghang.model.CraftLayerModel;
import com.linghang.model.CraftLayerParamModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import com.linghang.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author Dell on 2019/01/28.
 * 工艺层级 Service
 */
@Service
public class CraftLayerService {

    private static String ADD = "add";
    private static String UPDATE = "update";
    private Logger logger = LoggerFactory.getLogger(CraftLayerService.class);
    @Autowired
    private CraftLayerMapper craftLayerModelMapper;
    @Autowired
    private CraftDetailService craftDetailService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.craftLayerModelMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.craftLayerModelMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CraftLayerModel model) {
        return model != null && this.craftLayerModelMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CraftLayerModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CraftLayerModel> list : ListUtil.getSubList(models, 100)) {
                this.craftLayerModelMapper.insertList(list);
            }
        } else {
            return this.craftLayerModelMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CraftLayerModel model) {
        return model != null && this.craftLayerModelMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CraftLayerModel selectById(Long id) {
        return id == null ? null : this.craftLayerModelMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CraftLayerModel> selectByModel(CraftLayerModel model) {
        return model == null ? new ArrayList<>(0) : this.craftLayerModelMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CraftLayerModel model) {
        return !(model == null || model.getId() == null) && this.craftLayerModelMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CraftLayerModel model) {
        return !(model == null || model.getId() == null) && this.craftLayerModelMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CraftLayerModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<CraftLayerLimitModel> selectByOptions(KendoOptions options, Long orgId) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.craftLayerModelMapper.selectByOptions(options, orgId));
    }

    /**
     * 新增施工工艺
     *
     * @param model
     * @return
     */
    public Map<String, Object> addCraftLayer(CraftLayerParamModel model) {
        if (model == null || StringUtil.isEmpty(model.getAction())) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        CraftLayerModel info = model.getInfo();
        CraftDetailModel tanpu = model.getTanpu();
        CraftDetailModel chuya = model.getChuya();
        CraftDetailModel fuya = model.getFuya();
        CraftDetailModel zhongya = model.getZhongya();
        if (ADD.equals(model.getAction()) && info != null && info.getId() == null) {
            info.setId(IdWorker.nextId());
            craftLayerModelMapper.insert(info);
            if (tanpu != null) {
                tanpu.setId(IdWorker.nextId());
                tanpu.setCraftLayerId(info.getId());
                craftDetailService.insert(tanpu);
            }
            if (chuya != null) {
                chuya.setId(IdWorker.nextId());
                chuya.setCraftLayerId(info.getId());
                craftDetailService.insert(chuya);
            }
            if (fuya != null) {
                fuya.setId(IdWorker.nextId());
                fuya.setCraftLayerId(info.getId());
                craftDetailService.insert(fuya);
            }
            if (zhongya != null) {
                zhongya.setId(IdWorker.nextId());
                zhongya.setCraftLayerId(info.getId());
                craftDetailService.insert(zhongya);
            }
            return ResultUtil.getSuccessResultMap("新增成功");
        } else if (UPDATE.equals(model.getAction()) && info.getId() != null && info.getId() != null) {
            craftLayerModelMapper.updateById(info);
            if (tanpu != null && tanpu.getId() != null) {
                tanpu.setCraftLayerId(info.getId());
                craftDetailService.updateById(tanpu);
            }
            if (chuya != null && chuya.getId() != null) {
                chuya.setCraftLayerId(info.getId());
                craftDetailService.updateById(chuya);
            }
            if (fuya != null && fuya.getId() != null) {
                fuya.setCraftLayerId(info.getId());
                craftDetailService.updateById(fuya);
            }
            if (zhongya != null && zhongya.getId() != null) {
                zhongya.setCraftLayerId(info.getId());
                craftDetailService.updateById(zhongya);
            }
            return ResultUtil.getSuccessResultMap("修改成功");
        } else {
            return ResultUtil.getErrorResultMap("参数错误");
        }
    }

    /**
     * 删除
     *
     * @param model
     * @return
     */
    public boolean delete(CraftLayerModel model) {
        if (model != null && model.getId() != null) {
            craftDetailService.deleteByCraftId(model.getId());
            craftLayerModelMapper.deleteById(model.getId());
            return true;
        }
        return false;
    }
}