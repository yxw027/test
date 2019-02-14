package com.linghang.service.base;

import com.linghang.mapper.base.UserRoleLinkMapper;
import com.linghang.model.base.UserRoleLinkModel;
import com.linghang.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2017/05/17.
 * 用户权限关联 Service
 */
@Service
public class UserRoleLinkService {

    @Autowired
    private UserRoleLinkMapper userRoleLinkMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.userRoleLinkMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.userRoleLinkMapper.deleteByIds(ids) > 0);
    }

    /**
     * 按主键删除
     */
    public boolean deleteByModel(UserRoleLinkModel model) {
        return model != null && this.userRoleLinkMapper.deleteByModel(model) > 0;
    }

    /**
     * 插入数据
     */
    public boolean insert(UserRoleLinkModel model) {
        return model != null && this.userRoleLinkMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<UserRoleLinkModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<UserRoleLinkModel> list : Util.getSubList(models, 100)) {
                this.userRoleLinkMapper.insertList(list);
            }
        } else {
            return this.userRoleLinkMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入多条数据
     */
    public boolean insertVerifyList(List<UserRoleLinkModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        for (UserRoleLinkModel model : models) {
            if (this.selectByModel(model).isEmpty()) {
                this.insert(model);
            }
        }
        return true;
    }

    /**
     * 删除多条数据
     */
    public boolean deleteVerifyList(List<UserRoleLinkModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        for (UserRoleLinkModel model : models) {
            this.deleteByModel(model);
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public UserRoleLinkModel selectById(Long id) {
        return id == null ? null : this.userRoleLinkMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<UserRoleLinkModel> selectByModel(UserRoleLinkModel model) {
        return model == null ? new ArrayList<>(0) : this.userRoleLinkMapper.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    public boolean updateById(UserRoleLinkModel model) {
        return !(model == null || model.getId() == null) && this.userRoleLinkMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(UserRoleLinkModel model) {
        return !(model == null || model.getId() == null) && this.userRoleLinkMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(UserRoleLinkModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.userRoleLinkMapper.insert(model) == 1;
        }
        return this.userRoleLinkMapper.updateById(model) == 1;
    }
}