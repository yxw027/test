package com.linghang.mapper.business.transport;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.transport.TransportInfoModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author youp on 2019/01/02.
 * 车辆接料-运输-对接出料的过程数 mapper
 */
public interface TransportInfoMapper {
    /**
     * 按主键删除
     *
     * @param id 车辆接料-运输-对接出料的过程数ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 车辆接料-运输-对接出料的过程数ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入车辆接料-运输-对接出料的过程数数据
     *
     * @param model 车辆接料-运输-对接出料的过程数数据
     * @return 影响行数
     */
    int insert(TransportInfoModel model);

    /**
     * 按主键选择
     *
     * @param id 车辆接料-运输-对接出料的过程数ID
     * @return 车辆接料-运输-对接出料的过程数Model
     */
    TransportInfoModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 车辆接料-运输-对接出料的过程数集合
     */
    List<TransportInfoModel> selectByModel(TransportInfoModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 车辆接料-运输-对接出料的过程数集合
     */
    List<TransportInfoModel> selectByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId, @Param("starTime") String starTime, @Param("endTime") String endTime, @Param("carId") Long carId);

    /**
     * 按主键更新车辆接料-运输-对接出料的过程数
     *
     * @param model 车辆接料-运输-对接出料的过程数Model
     * @return 影响行数
     */
    int updateById(TransportInfoModel model);

    /**
     * 查询未完成的数据
     * 定时任务只扫描接料中及下料中的状态数据，其他状态数据在上传数据中更改
     *
     * @return
     */
    List<TransportInfoModel> selectUnfinishedData();

    /**
     * 查询当前卡号进行的运输信息
     *
     * @param cardMark
     * @return
     */
    TransportInfoModel selectByCardMark(@Param("cardMark") String cardMark);

    List<String> getTransportMessageDate(@Param("orgId") Long orgId);

    List<String> getCarMessageDate(@Param("carId") Long carId);

    /**
     * 查询今日当前车辆的运输时长、接料时长、摊铺时长平均值
     *
     * @param cardMark
     * @param orgId
     * @return
     */
    TransportInfoModel selectTodayDataByCardMark(@Param("cardMark") String cardMark, @Param("orgId") Long orgId);

    /**
     * 查询运输超时的数据
     *
     * @param time
     * @return
     */
    List<TransportInfoModel> selectErrorData(@Param("time") Long time);

    TransportInfoModel selectTodayMinTransportTime();
}