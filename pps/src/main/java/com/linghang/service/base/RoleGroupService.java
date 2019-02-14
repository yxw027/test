package com.linghang.service.base;


import com.linghang.mapper.base.RoleGroupMapper;
import com.linghang.mapper.base.RoleMapper;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.RoleGroupModel;
import com.linghang.model.base.RoleModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by i_it on 2018/07/13.
 * 角色组 Service
 */
@Service
public class RoleGroupService {

    @Autowired
    private RoleGroupMapper roleGroupMapper;
    @Autowired
    private RoleMapper roleMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.roleGroupMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.roleGroupMapper.deleteByIds(ids) > 0);
    }

    /**
     * 按主键批量删除角色成员关系表
     */
    public boolean deleteUserRoleLinkByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.roleGroupMapper.deleteUserRoleLinkByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(RoleGroupModel model) {
        return model != null && this.roleGroupMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<RoleGroupModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<RoleGroupModel> list : ListUtil.getSubList(models, 100)) {
                this.roleGroupMapper.insertList(list);
            }
        } else {
            return this.roleGroupMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(RoleGroupModel model) {
        return model != null && this.roleGroupMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public RoleGroupModel selectById(Long id) {
        return id == null ? null : this.roleGroupMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<RoleGroupModel> selectByModel(RoleGroupModel model) {
        return model == null ? new ArrayList<>(0) : this.roleGroupMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(RoleGroupModel model) {
        return !(model == null || model.getId() == null) && this.roleGroupMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(RoleGroupModel model) {
        return !(model == null || model.getId() == null) && this.roleGroupMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(RoleGroupModel model) {
        return !(model == null || model.getId() == null) && this.roleGroupMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(RoleGroupModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.roleGroupMapper.insert(model) == 1;
        }
        return this.roleGroupMapper.updateById(model) == 1;
    }

    public List<Object> selectAllToTreeList() {
        List<RoleGroupModel> roleGroupModels = this.roleGroupMapper.selectByModel(new RoleGroupModel());
        List<RoleModel> roleModels = this.roleMapper.selectByModel(new RoleModel());
        List<Object> list = new ArrayList<>();
        HashMap<Long, RoleGroupModel> dataMap = new HashMap<>(roleGroupModels.size());
        for (RoleGroupModel groupModel : roleGroupModels) {
            list.add(groupModel);
            dataMap.put(groupModel.getId(), groupModel);
        }
        List<OrganizationModel> models = new ArrayList<>();
        for (RoleModel roleModel : roleModels) {
            if (roleModel.getGroupId() == null) {
                list.add(roleModel);
            } else if (dataMap.containsKey(roleModel.getGroupId())) {
                dataMap.get(roleModel.getGroupId()).getItems().add(roleModel);
            }
        }
        return list;
    }
}