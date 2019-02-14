package com.linghang.service.base;

import com.linghang.mapper.base.NewsMapper;
import com.linghang.model.base.NewsModel;
import com.linghang.model.base.UserModel;
import com.linghang.util.Util;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liuhao on 2017/04/20.
 * 新闻表 Service
 */
@Service
public class NewsService {

    @Autowired
    private NewsMapper newsMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.newsMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Integer> ids) {
        return ids != null && (ids.isEmpty() || this.newsMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(NewsModel model) {
        if (model == null) {
            return false;
        }
        model.setCreateTime(new Date());
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        model.setCreateUserId(userModel.getId());
        return this.newsMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<NewsModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<NewsModel> list : Util.getSubList(models, 100)) {
                this.newsMapper.insertList(list);
            }
        } else {
            return this.newsMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(NewsModel model) {
        return model != null && this.newsMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public NewsModel selectById(Integer id) {
        return id == null ? null : this.newsMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<NewsModel> selectByModel(NewsModel model) {
        return model == null ? new ArrayList<>(0) : this.newsMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(NewsModel model) {
        return !(model == null || model.getId() == null) && this.newsMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(NewsModel model) {
        return !(model == null || model.getId() == null) && this.newsMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(NewsModel model) {
        return !(model == null || model.getId() == null) && this.newsMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(NewsModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.newsMapper.insert(model) == 1;
        }
        return this.newsMapper.updateById(model) == 1;
    }
}