package com.linghang.service.business.water;

import com.linghang.enums.OrgType;
import com.linghang.mapper.business.water.WaterWarningConfigMapper;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.param.WarningNoteAsphaltTreeModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterWarningConfigModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.util.Constant;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2018/12/19.
 * 告警设置表 Service
 *
 * @author lvruixing
 */
@Service
public class WaterWarningConfigService {

    @Autowired
    private WaterWarningConfigMapper waterWarningConfigMapper;

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private WaterInfoService infoService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterWarningConfigMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterWarningConfigMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterWarningConfigModel model) {
        return model != null && this.waterWarningConfigMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterWarningConfigModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterWarningConfigModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterWarningConfigMapper.insertList(list);
            }
        } else {
            return this.waterWarningConfigMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterWarningConfigModel model) {
        return model != null && this.waterWarningConfigMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterWarningConfigModel selectById(Long id) {
        return id == null ? null : this.waterWarningConfigMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterWarningConfigModel> selectByModel(WaterWarningConfigModel model) {
        return model == null ? new ArrayList<>(0) : this.waterWarningConfigMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterWarningConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningConfigMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterWarningConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningConfigMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterWarningConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningConfigMapper.deleteById(model.getId()) >= 0;
    }


    /**
     * 获取沥青站tree
     *
     * @param orgId
     * @return
     */
    public List<WarningNoteAsphaltTreeModel> getAsphaltTree(Long orgId) {
        List<OrganizationModel> projectDatas = organizationService.getProjectData(orgId, OrgType.PROJECT.getInteger());
        List<WarningNoteAsphaltTreeModel> result = new ArrayList<>();
        if (!CollectionUtils.isEmpty(projectDatas)) {
            OrganizationModel orgModel = projectDatas.get(0);
            WarningNoteAsphaltTreeModel projectWarningModel = new WarningNoteAsphaltTreeModel(orgModel.getId(), null, orgModel.getName());
            result.add(projectWarningModel);
            List<OrganizationModel> tenders = organizationService.getTendersData(orgModel.getId(), OrgType.TENDERS.getInteger());
            //标段
            if (!CollectionUtils.isEmpty(tenders)) {
                tenders.forEach(model -> {
                    WarningNoteAsphaltTreeModel tenderItem = new WarningNoteAsphaltTreeModel(model.getId(), orgModel.getId(), model.getName());
                    List<WaterInfoModel> asphaltList = infoService.getWaterList(model.getId());
                    if (!CollectionUtils.isEmpty(asphaltList)) {
                        asphaltList.forEach(asphaltModel -> {
                            //添加沥青站
                            tenderItem.getItems().add(new WarningNoteAsphaltTreeModel(asphaltModel.getId(), model.getId(), asphaltModel.getName(), 0));
                        });
                    }
                    //添加标段
                    projectWarningModel.getItems().add(tenderItem);
                });
            }
        }
        return result;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterWarningConfigModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterWarningConfigMapper.insert(model) == 1;
        }
        return this.waterWarningConfigMapper.updateById(model) == 1;
    }

    private static final int IS_VISIBLE = 0;
    private static final int NOT_VISIBLE = 1;

    public Integer updateStatusByFormulaId(Long formulaId, int isVisible) {
        List<WaterWarningConfigModel> list = this.selectByModel(new WaterWarningConfigModel(formulaId, isVisible));
        int dataVersion = list.size() == 0 ? 0 : list.get(list.size() - 1).getDataVersion();
        if (list.size() != 0) {
            this.waterWarningConfigMapper.updateStatusByFormulaId(formulaId, NOT_VISIBLE);
        }
        return dataVersion;
    }

    public List<WaterWarningConfigModel> selectByFormulaId(Long formulaId) {
        if (formulaId == null) {
            return new ArrayList<>();
        }
        return this.waterWarningConfigMapper.selectByFormulaId(formulaId);
    }

}