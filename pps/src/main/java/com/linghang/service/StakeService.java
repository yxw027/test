package com.linghang.service;

import com.linghang.mapper.StakeMapper;
import com.linghang.model.StakeModel;
import com.linghang.util.GpsUtils;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by i_it on 2018/12/06.
 * 桩号详情列表 Service
 */
@Service
public class StakeService {

    private static Map<Long, List<StakeModel>> groupMap = new HashMap<>();
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private StakeMapper stakeMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.stakeMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.stakeMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(StakeModel model) {
        return model != null && this.stakeMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<StakeModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<StakeModel> list : ListUtil.getSubList(models, 100)) {
                this.stakeMapper.insertList(list);
            }
        } else {
            return this.stakeMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(StakeModel model) {
        return model != null && this.stakeMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public StakeModel selectById(Long id) {
        return id == null ? null : this.stakeMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<StakeModel> selectByModel(StakeModel model) {
        return model == null ? new ArrayList<>(0) : this.stakeMapper.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    public List<StakeModel> selectByGroupId(Long stakeGroupId) {
        if (stakeGroupId == null) {
            return new ArrayList<>();
        }
        List<StakeModel> stakes;
        if (groupMap.containsKey(stakeGroupId)) {
            stakes = groupMap.get(stakeGroupId);
        } else {
            stakes = this.stakeMapper.selectByGroupId(stakeGroupId);
            if (stakes.isEmpty()) {
                logger.warn("桩号组ID[{}]数量为空,请检查桩号设置.", stakeGroupId);
                return new ArrayList<>();
            }
            groupMap.put(stakeGroupId, stakes);
        }
        return stakes;
    }

    /**
     * 根据坐标点获取最接近桩号里程
     */
    public Integer getMile(Long stakeGroupId, double carLat, double catLng) {
        List<StakeModel> stakes = selectByGroupId(stakeGroupId);
        if (stakes.isEmpty()) {
            return null;
        }
        int index = 0;
        double previousDistance = Double.MAX_VALUE;
        double distance;
        for (StakeModel stake : stakes) {
            distance = GpsUtils.getDistance(carLat, catLng, stake.getLat(), stake.getLon());
            if (distance > previousDistance) {
                break;
            }
            previousDistance = distance;
            ++index;
        }
        double nextDistance = GpsUtils.getDistance(carLat, catLng, stakes.get(++index).getLat(), stakes.get(++index).getLon());
        int mileLength;
        /**
         * 后一桩号
         */
        if (nextDistance > previousDistance) {
            StakeModel stakeModel = stakes.get(index);
            StakeModel previousModel = stakes.get(index - 1);
            mileLength = stakeModel.getMile() - previousModel.getMile();
            double stakeRatio = GpsUtils.getStakeRatio(previousModel.getLat(), previousModel.getLon(), stakeModel.getLat(), stakeModel.getLon(), carLat, catLng);
            int round = (int) Math.round(mileLength * stakeRatio);
            return previousModel.getMile() + round;
        } else {
            StakeModel stakeModel = stakes.get(index);
            StakeModel nextModel = stakes.get(index + 1);
            mileLength = nextModel.getMile() - stakeModel.getMile();
            double stakeRatio = GpsUtils.getStakeRatio(stakeModel.getLat(), stakeModel.getLon(), nextModel.getLat(), nextModel.getLon(), carLat, catLng);
            int round = (int) Math.round(mileLength * stakeRatio);
            return stakeModel.getMile() + round;
        }
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(StakeModel model) {
        return !(model == null || model.getId() == null) && this.stakeMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(StakeModel model) {
        return !(model == null || model.getId() == null) && this.stakeMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(StakeModel model) {
        if (model == null) {
            return false;
        }
        if (model.getStakeGroupId() != null) {
            groupMap.remove(model.getStakeGroupId());
        }
        return model.getId() != null && this.stakeMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 按组主键删除
     */
    public boolean deleteByGroupId(Long stakeGroupId) {
        if (stakeGroupId == null) {
            return false;
        }
        groupMap.remove(stakeGroupId);
        return this.stakeMapper.deleteByGroupId(stakeGroupId) >= 0;
    }

}