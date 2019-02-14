package com.linghang.service.base;

import com.linghang.mapper.base.RoleResourceLinkMapper;
import com.linghang.model.base.RoleResourceLinkModel;
import com.linghang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2017/08/04.
 * 角色资源链接表 Service
 */
@Service
public class RoleResourceLinkService {

    @Autowired
    private RoleResourceLinkMapper roleResourceLinkMapper;

    /**
     * 插入多条数据
     */
    public boolean insertList(List<RoleResourceLinkModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 200) {
            for (List<RoleResourceLinkModel> list : Util.getSubList(models, 200)) {
                this.roleResourceLinkMapper.insertList(list);
            }
        } else {
            return this.roleResourceLinkMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按模型选择
     */
    public List<RoleResourceLinkModel> selectByModel(RoleResourceLinkModel model) {
        return model == null ? new ArrayList<>(0) : this.roleResourceLinkMapper.selectByModel(model);
    }


    /**
     * 删除角色数据
     */
    public boolean deleteByRoleId(Long roleId) {
        return roleId != null && this.roleResourceLinkMapper.deleteByRoleId(roleId) >= 0;
    }

    /**
     * 更新角色权限数据
     */
    public boolean updateRoleLinks(List<RoleResourceLinkModel> list) {
        return !list.isEmpty() && this.deleteByRoleId(list.get(0).getRoleId()) && this.insertList(list);
    }
}