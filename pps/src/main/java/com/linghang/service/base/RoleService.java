package com.linghang.service.base;

import com.linghang.mapper.base.RoleMapper;
import com.linghang.model.base.RoleModel;
import com.linghang.model.base.UserRoleLinkModel;
import com.linghang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2017/05/10.
 * 角色 Service
 */
@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RoleResourceLinkService roleResourceLinkService;
    @Autowired
    private UserRoleLinkService userRoleLinkService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        if (id == null) {
            return false;
        }
        boolean result = this.roleMapper.deleteById(id) >= 0;
        if (result) {
            this.roleResourceLinkService.deleteByRoleId(id);
            this.userRoleLinkService.deleteByModel(new UserRoleLinkModel(null, id));
        }

        return result;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.roleMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(RoleModel model) {
        return model != null && this.roleMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<RoleModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<RoleModel> list : Util.getSubList(models, 100)) {
                this.roleMapper.insertList(list);
            }
        } else {
            return this.roleMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public RoleModel selectById(Long id) {
        return id == null ? null : this.roleMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<RoleModel> selectByModel(RoleModel model) {
        return model == null ? new ArrayList<>(0) : this.roleMapper.selectByModel(model);
    }


    /**
     * 按角色组ID选择
     */
    List<RoleModel> selectByGroupId(Long groupId) {
        return groupId == null ? new ArrayList<>(0) : this.roleMapper.selectByGroupId(groupId);
    }

    /**
     * 按主键更新
     */
    public boolean updateById(RoleModel model) {
        return !(model == null || model.getId() == null) && this.roleMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(RoleModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(RoleModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.roleMapper.insert(model) == 1;
        }
        return this.roleMapper.updateById(model) == 1;
    }


}