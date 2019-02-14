package com.linghang.service.base;

import com.linghang.mapper.base.AnnexMapper;
import com.linghang.model.base.AnnexModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/09.
 * 附件信息表 Service
 */
@Service
public class AnnexService {

    @Autowired
    private AnnexMapper annexMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.annexMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.annexMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AnnexModel model) {
        return model != null && this.annexMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AnnexModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AnnexModel> list : ListUtil.getSubList(models, 100)) {
                this.annexMapper.insertList(list);
            }
        } else {
            return this.annexMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AnnexModel model) {
        return model != null && this.annexMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AnnexModel selectById(Long id) {
        return id == null ? null : this.annexMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AnnexModel> selectByModel(AnnexModel model) {
        return model == null ? new ArrayList<>(0) : this.annexMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AnnexModel model) {
        return !(model == null || model.getId() == null) && this.annexMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AnnexModel model) {
        return !(model == null || model.getId() == null) && this.annexMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AnnexModel model) {
        return !(model == null || model.getId() == null) && this.annexMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(AnnexModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.annexMapper.insert(model) == 1;
        }
        return this.annexMapper.updateById(model) == 1;
    }

    public List<AnnexModel> selectAnnexByIds(String[] idsArray) {
        return this.annexMapper.selectAnnexByIds(idsArray);
    }
}