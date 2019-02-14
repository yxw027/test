package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltInfoMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.AsphaltDetailModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.asphalt.param.AsphaltInfoPlanModel;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青站基础信息 Service
 */
@Service
public class AsphaltInfoService {

    private Logger logger = LoggerFactory.getLogger(AsphaltInfoService.class);


    @Autowired
    private AsphaltInfoMapper asphaltInfoMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltInfoMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltInfoMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public AsphaltInfoModel insert(AsphaltInfoModel model) {
        model.setUpdateTime(new Date());
        if (model != null && model.getId() == null) {
            this.asphaltInfoMapper.insert(model);
        } else {
            this.asphaltInfoMapper.updateById(model);
        }
        return model;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltInfoModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AsphaltInfoModel> list : ListUtil.getSubList(models, 100)) {
                this.asphaltInfoMapper.insertList(list);
            }
        } else {
            return this.asphaltInfoMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltInfoModel model) {
        return model != null && this.asphaltInfoMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltInfoModel selectById(Long id) {
        return id == null ? null : this.asphaltInfoMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltInfoModel> selectByModel(AsphaltInfoModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltInfoMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltInfoModel model) {
        return !(model == null || model.getId() == null) && this.asphaltInfoMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltInfoModel model) {
        return !(model == null || model.getId() == null) && this.asphaltInfoMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltInfoModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltInfoModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltInfoMapper.selectByOptions(options));
    }

    /**
     * 那沥青站Id查询沥青站基本信息
     *
     * @param asphaltId
     */
    public AsphaltDetailModel getAsphaltDetail(Long asphaltId) {
        return this.asphaltInfoMapper.getAsphaltDetail(asphaltId);
    }

    /**
     * 获取沥青站配方统计信息
     *
     * @param asphaltId 沥青站ID
     * @return 返回统计信息结果
     */
    public List<AsphaltStatisticsModel> getAsphaltFormulaStatistical(Long asphaltId) {
        return this.asphaltInfoMapper.getAsphaltFormulaStatistical(asphaltId);
    }

    public AsphaltInfoModel selectByFormulaId(Long formulaId) {
        return this.asphaltInfoMapper.selectByFormulaId(formulaId);
    }

    public List<AsphaltInfoPlanModel> getAsphaltList(Long orgId) {
        return orgId == null ? new ArrayList<>() : this.asphaltInfoMapper.getAsphaltList(orgId);
    }

    public List<AsphaltInfoModel> getByOrgId(Long orgId) {
        return orgId == null ? new ArrayList<>() : this.asphaltInfoMapper.getByOrgId(orgId);
    }

    public List<AsphaltStatisticsReportModel> geStatisticsSend() {
        return this.asphaltInfoMapper.geStatisticsSend();
    }

    public AsphaltInfoModel selectByCardMark(String cardMark) {
        return asphaltInfoMapper.selectByCardMark(cardMark);
    }

    public AsphaltInfoModel getCardOnly(String cardMark, Long id) {
        if (cardMark == null) {
            return null;
        }
        if (id != null) {
            AsphaltInfoModel asphaltInfoModel = selectById(id);
            if (asphaltInfoModel != null && cardMark.equals(asphaltInfoModel.getCardMark())) {
                return null;
            }
        }
        return this.asphaltInfoMapper.getCardOnly(cardMark);
    }

    /***
     * 查询所有管理的拌合站
     * @param orgList
     * @return
     */
    public List<Map<String, Object>> selectAsphaltAndWaterBidByOrgId(List<OrganizationModel> orgList) {
        return asphaltInfoMapper.selectAsphaltAndWaterBidByOrgId(orgList);
    }

    /**
     * 查询所有配方的统计信息
     *
     * @param bidInfo
     * @return
     */
    public List<Map<String, Object>> selectAllFormulaStatistic(List<Map<String, Object>> bidInfo) {
        return asphaltInfoMapper.selectAllFormulaStatistic(bidInfo);
    }
}