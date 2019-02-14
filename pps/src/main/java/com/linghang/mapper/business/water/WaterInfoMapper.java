package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterStaticReportModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/12/19.
 * 沥青站基础信息 mapper
 */
public interface WaterInfoMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入数据
     */
    int insert(WaterInfoModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterInfoModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterInfoModel model);

    /**
     * 按主键选择
     */
    WaterInfoModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterInfoModel> selectByModel(WaterInfoModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterInfoModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterInfoModel model);

    WaterInfoModel selectByFormulaId(@Param("formulaId") Long formulaId);

    /**
     * 获取站点信息
     *
     * @param orgId
     * @return
     */
    List<WaterInfoModel> getWaterList(@Param("orgId") Long orgId);

    WaterInfoModel getCardOnly(@Param("cardMark") String cardMark);

    /**
     * 根据基站射频卡号获取基站信息
     *
     * @param cardMark
     * @return
     */
    WaterInfoModel selectByCardMark(@Param("cardMark") String cardMark);

    List<WaterStaticReportModel> geStatisticsSend();
}