package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.OrgType;
import com.linghang.mapper.business.asphalt.AsphaltWarningNoteConfigMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.AsphaltWarningNoteConfigModel;
import com.linghang.model.business.asphalt.param.AsphaltInfoPlanModel;
import com.linghang.model.business.asphalt.param.WarningNoteAsphaltTreeModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen on 2018/12/27.
 * 李轻沾报警短信配置 Service
 */
@Service
public class AsphaltWarningNoteConfigService {

    private Logger logger = LoggerFactory.getLogger(AsphaltWarningNoteConfigService.class);


    @Autowired
    private AsphaltWarningNoteConfigMapper asphaltWarningNoteConfigMapper;

    @Autowired
    private AsphaltInfoService asphaltInfoService;

    @Autowired
    private OrganizationService organizationService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltWarningNoteConfigMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltWarningNoteConfigMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltWarningNoteConfigModel model) {
        model.setProjectId(getProject(model.getProjectId()));
        return model != null && this.asphaltWarningNoteConfigMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltWarningNoteConfigModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AsphaltWarningNoteConfigModel> list : ListUtil.getSubList(models, 100)) {
                this.asphaltWarningNoteConfigMapper.insertList(list);
            }
        } else {
            return this.asphaltWarningNoteConfigMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltWarningNoteConfigModel model) {
        return model != null && this.asphaltWarningNoteConfigMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltWarningNoteConfigModel selectById(Long id) {
        return id == null ? null : this.asphaltWarningNoteConfigMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltWarningNoteConfigModel> selectByModel(AsphaltWarningNoteConfigModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltWarningNoteConfigMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltWarningNoteConfigModel model) {
        return !(model == null || model.getId() == null) && this.asphaltWarningNoteConfigMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltWarningNoteConfigModel model) {
        return !(model == null || model.getId() == null) && this.asphaltWarningNoteConfigMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltWarningNoteConfigModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltWarningNoteConfigModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltWarningNoteConfigMapper.selectByOptions(options));
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
                    List<AsphaltInfoPlanModel> asphaltList = asphaltInfoService.getAsphaltList(model.getId());
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

    public AsphaltWarningNoteConfigModel getWarningPhone(String phone, Long projectId, Long id) {
        if (id != null) {
            AsphaltWarningNoteConfigModel model = selectById(id);
            if (model != null) {
                if (phone.equals(model.getPhone())) {
                    return null;
                }
            }
        }
        return phone == null || projectId == null ? null : this.asphaltWarningNoteConfigMapper.getWarningPhone(phone, getProject(projectId));
    }

    public List<AsphaltWarningNoteConfigModel> getAsphaltPhone(String asphaltId, Integer level) {
        return asphaltId == null ? new ArrayList<>() : this.asphaltWarningNoteConfigMapper.getAsphaltPhone(asphaltId, level);
    }
}