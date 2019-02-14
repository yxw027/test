package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.TrimbleInfoMapper;
import com.linghang.model.TrimbleInfoModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.UserModel;
import com.linghang.util.ListUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liuhao on 2018/11/01.
 * 移动端基础信息 Service
 */
@Service
public class TrimbleInfoService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private TrimbleInfoMapper trimbleInfoMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.trimbleInfoMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.trimbleInfoMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(TrimbleInfoModel model) {
        if (model == null) {
            return false;
        }
        model.setCreateTime(new Date());
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        model.setCreateUserId(userModel.getId());
        return this.trimbleInfoMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<TrimbleInfoModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<TrimbleInfoModel> list : ListUtil.getSubList(models, 100)) {
                this.trimbleInfoMapper.insertList(list);
            }
        } else {
            return this.trimbleInfoMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public TrimbleInfoModel selectById(String id) {
        return id == null ? null : this.trimbleInfoMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<TrimbleInfoModel> selectByModel(TrimbleInfoModel model) {
        return model == null ? new ArrayList<>(0) : this.trimbleInfoMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(TrimbleInfoModel model) {
        return !(model == null || model.getId() == null) && this.trimbleInfoMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(TrimbleInfoModel model) {
        return !(model == null || model.getId() == null) && this.trimbleInfoMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(TrimbleInfoModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<TrimbleInfoModel> selectByOptions(KendoOptions options, Long orgId) {
        if (options == null || orgId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.trimbleInfoMapper.selectByOptions(options, orgId));
    }

    /**
     * SN 唯一性校验
     *
     * @param id ID
     * @param sn SN
     * @return
     */
    public boolean checkSn(Long id, String sn) {
        if (StringUtils.isEmpty(sn)) {
            return false;
        }
        TrimbleInfoModel trimbleInfoModel = new TrimbleInfoModel();
        trimbleInfoModel.setSn(sn);
        List<TrimbleInfoModel> models = this.selectByModel(trimbleInfoModel);
        if (models.size() == 1 && models.get(0).getId().equals(id)) {
            return true;
        }
        return models.isEmpty();
    }
}