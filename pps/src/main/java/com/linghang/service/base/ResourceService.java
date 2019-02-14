package com.linghang.service.base;

import com.linghang.enums.SourceType;
import com.linghang.enums.Status;
import com.linghang.mapper.base.ResourceMapper;
import com.linghang.model.base.ResourceModel;
import com.linghang.model.base.UserModel;
import com.linghang.util.LoginUtil;
import com.linghang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liuhao on 2017/04/26.
 * 系统资源 Service
 */
@Service
public class ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.resourceMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.resourceMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(ResourceModel model) {
        return model != null && this.resourceMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<ResourceModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<ResourceModel> list : Util.getSubList(models, 100)) {
                this.resourceMapper.insertList(list);
            }
        } else {
            return this.resourceMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public ResourceModel selectById(Long id) {
        return id == null ? null : this.resourceMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<ResourceModel> selectByModel(ResourceModel model) {
        return model == null ? new ArrayList<>(0) : this.resourceMapper.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    public boolean updateById(ResourceModel model) {
        if (model == null || model.getId() == null) {
            return false;
        }
        if (model.getHasChildren()) {
            ResourceModel sqlModel = this.resourceMapper.selectById(model.getId());
            if (!sqlModel.getStatus().equals(model.getStatus())) {
                this.resourceMapper.updateStatusByRootId(model);
            }
        }
        return this.resourceMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(ResourceModel model) {
        return !(model == null || model.getId() == null) && this.resourceMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(ResourceModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.resourceMapper.insert(model) == 1;
        }
        return this.resourceMapper.updateById(model) == 1;
    }

    public List<ResourceModel> getTreeDate() {
        ResourceModel sqlModel = new ResourceModel();
        sqlModel.setStatus(Status.ENABLE.getInteger());
        List<ResourceModel> all = this.resourceMapper.selectByModel(sqlModel);
        List<ResourceModel> result = new ArrayList<>();
        Map<Long, ResourceModel> modelMap = new HashMap<>(all.size());
        for (ResourceModel resourceModel : all) {
            modelMap.put(resourceModel.getId(), resourceModel);
        }
        for (ResourceModel resourceModel : all) {
            if (resourceModel.getParentId() == null) {
                result.add(resourceModel);
            } else if (modelMap.containsKey(resourceModel.getParentId())) {
                modelMap.get(resourceModel.getParentId()).getItems().add(resourceModel);
            }
        }
        return result;
    }

    public List<String> selectResourceByUserId(Long userId) {
        if (userId == null) {
            return new ArrayList<>(0);
        }
        return this.resourceMapper.selectResourceByUserId(userId);
    }

    public List<Long> selectIdByRoleId(Long roleId) {
        return roleId == null ? new ArrayList<>(0) : this.resourceMapper.selectIdByRoleId(roleId);
    }

    public Map<String, Object> updateOrder(List<ResourceModel> models) {
        Map<String, Object> resultMap = new HashMap<>();
        if (models == null || models.size() == 0) {
            resultMap.put("success", false);
            return resultMap;
        }
        for (int i = 0; i < models.size(); i++) {
            models.get(i).setOrderNum(i + 1);
            this.updateById(models.get(i));
        }
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 按登录用户获取 菜单
     *
     * @return
     */
    public List<Object> getMenuList() {
        UserModel userModel = LoginUtil.getLoginUser();
        List<ResourceModel> list = new ArrayList<>();
        if (userModel.getIsAdmin()) {
            ResourceModel resourceModel = new ResourceModel();
            resourceModel.setSourceType(SourceType.MENU.getInteger());
            list = resourceMapper.selectByModel(resourceModel);
        } else {
            list = resourceMapper.getMenuList(userModel.getId());
        }
        return menuDataFormat(null, list);
    }

    private List<Object> menuDataFormat(Long id, List<ResourceModel> models) {
        if (models.isEmpty()) {
            return new ArrayList<>(0);
        }
        HashMap<Long, ResourceModel> dataMap = new HashMap<>(models.size());
        for (ResourceModel model : models) {
            dataMap.put(model.getId(), model);
        }
        List<Object> list = new ArrayList<>();
        for (ResourceModel model : models) {
            if (model.getParentId() == null || model.getId().equals(id) || !dataMap.containsKey(model.getParentId())) {
                list.add(model);
            } else if (dataMap.containsKey(model.getParentId())) {
                dataMap.get(model.getParentId()).getItems().add(model);
            }
        }
        return list;
    }

    /**
     * 查询用户可以访问的资源
     *
     * @param id
     * @return
     */
    public Map<String, Boolean> selectUserResource(Long id) {
        Map<String, Boolean> appResource = getAppUserAllResource();
        List<ResourceModel> resource = resourceMapper.getMenuList(id);
        if (!CollectionUtils.isEmpty(resource)) {
            for (ResourceModel model : resource) {
                if (!StringUtils.isEmpty(model.getPath())) {
                    String path = model.getPath().replaceAll("/", "_").replaceAll(":", "_");
                    if (appResource.get(path) != null) {
                        appResource.put(path, true);
                    }
                }
            }
        }
        return appResource;
    }

    /**
     * 获取App端所有的权限集合
     *
     * @return
     */
    public Map<String, Boolean> getAppUserAllResource() {
        Map<String, Boolean> resource = new HashMap<>();
        //沥青-实时数据
        resource.put("asphaltMetadata_today", false);
        //沥青-产量统计
        resource.put("asphaltMetadata_statistical", false);
        //沥青-统计报表
        resource.put("asphaltMetadata_report", false);
        //沥青-报警监控
        resource.put("asphaltMetadata_warning", false);
        //沥青-报警监控-处理·审核·审批
        resource.put("asphaltWarning_deal", false);
        resource.put("asphaltWarning_review", false);
        resource.put("asphaltWarning_approval", false);
        //成品料运输
        resource.put("supply_page", false);
        //水稳-实时数据
        resource.put("waterMetaData_page", false);
        //水稳-产量统计
        resource.put("waterMetaData_staticPage", false);
        //水稳-报警监控
        resource.put("waterWarningMessage_page", false);
        //水稳-报警监控-处理·审核·审批
        resource.put("waterWarning_deal", false);
        resource.put("waterWarning_review", false);
        resource.put("waterWarning_approval", false);
        return resource;
    }
}