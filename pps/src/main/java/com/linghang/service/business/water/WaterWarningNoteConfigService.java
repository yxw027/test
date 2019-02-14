package com.linghang.service.business.water;

import com.linghang.enums.OrgType;
import com.linghang.mapper.business.water.WaterWarningNoteConfigMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.param.WarningNoteAsphaltTreeModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterWarningNoteConfigModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lvruixing on 2019/01/02.
 * 李轻沾报警短信配置 Service
 */
@Service
public class WaterWarningNoteConfigService {

    @Autowired
    private WaterWarningNoteConfigMapper waterWarningNoteConfigMapper;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private WaterInfoService waterInfoService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterWarningNoteConfigMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterWarningNoteConfigMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterWarningNoteConfigModel model) {
        model.setProjectId(getProject(model.getProjectId()));
        return model != null && this.waterWarningNoteConfigMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterWarningNoteConfigModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<WaterWarningNoteConfigModel> list : ListUtil.getSubList(models, 100)) {
                this.waterWarningNoteConfigMapper.insertList(list);
            }
        } else {
            return this.waterWarningNoteConfigMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterWarningNoteConfigModel model) {
        return model != null && this.waterWarningNoteConfigMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterWarningNoteConfigModel selectById(Long id) {
        return id == null ? null : this.waterWarningNoteConfigMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterWarningNoteConfigModel> selectByModel(KendoOptions options, Long orgId) {
        if (orgId == null) {
            return new ArrayList<>();
        }
        return this.waterWarningNoteConfigMapper.selectByOptions(options, getProject(orgId));
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterWarningNoteConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningNoteConfigMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterWarningNoteConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningNoteConfigMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterWarningNoteConfigModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningNoteConfigMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterWarningNoteConfigModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterWarningNoteConfigMapper.insert(model) == 1;
        }
        return this.waterWarningNoteConfigMapper.updateById(model) == 1;
    }


    public List<WaterWarningNoteConfigModel> getPhone(String stationId, Integer level) {
        return stationId == null ? new ArrayList<>() : this.waterWarningNoteConfigMapper.getPhone(stationId, level);
    }


    /**
     * 获取水稳站tree
     *
     * @param orgId
     * @return
     */
    public List<WarningNoteAsphaltTreeModel> getTree(Long orgId) {
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
                    List<WaterInfoModel> asphaltList = waterInfoService.getWaterList(model.getId());
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

    public Long getProject(Long orgId) {
        List<OrganizationModel> projectDatas = organizationService.getProjectData(orgId, OrgType.PROJECT.getInteger());
        List<WarningNoteAsphaltTreeModel> result = new ArrayList<>();
        if (!CollectionUtils.isEmpty(projectDatas)) {
            return projectDatas.get(0).getId();
        }
        return 0L;
    }

    public WaterWarningNoteConfigModel getWarningPhone(String phone, Long projectId) {
        return phone == null || projectId == null ? null : this.waterWarningNoteConfigMapper.getWarningPhone(phone, getProject(projectId));
    }
}