package com.linghang.service.base;

import com.linghang.mapper.base.UserOrgLinkMapper;
import com.linghang.model.base.UserOrgLinkModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by i_it on 2018/12/14.
 * 用户组织机构权限 Service
 */
@Service
public class UserOrgLinkService {

    @Autowired
    private UserOrgLinkMapper userOrgLinkMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.userOrgLinkMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.userOrgLinkMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(UserOrgLinkModel model) {
        return model != null && this.userOrgLinkMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<UserOrgLinkModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<UserOrgLinkModel> list : ListUtil.getSubList(models, 100)) {
                this.userOrgLinkMapper.insertList(list);
            }
        } else {
            return this.userOrgLinkMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(UserOrgLinkModel model) {
        return model != null && this.userOrgLinkMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public UserOrgLinkModel selectById(Long id) {
        return id == null ? null : this.userOrgLinkMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<UserOrgLinkModel> selectByModel(UserOrgLinkModel model) {
        return model == null ? new ArrayList<>(0) : this.userOrgLinkMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(UserOrgLinkModel model) {
        return !(model == null || model.getId() == null) && this.userOrgLinkMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(UserOrgLinkModel model) {
        return !(model == null || model.getId() == null) && this.userOrgLinkMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(UserOrgLinkModel model) {
        return !(model == null || model.getId() == null) && this.userOrgLinkMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(UserOrgLinkModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.userOrgLinkMapper.insert(model) == 1;
        }
        return this.userOrgLinkMapper.updateById(model) == 1;
    }

    /**
     * 按模型选择
     */
    public List<UserOrgLinkModel> selectByUserId(Long userId) {
        return userId == null ? new ArrayList<>(0) : this.userOrgLinkMapper.selectByUserId(userId);
    }


}