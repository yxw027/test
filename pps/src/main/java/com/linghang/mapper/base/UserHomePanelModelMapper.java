package com.linghang.mapper.base;

import com.linghang.model.base.UserHomePanelModel;

import java.util.List;

public interface UserHomePanelModelMapper {

    int insert(UserHomePanelModel record);

    int deleteByUserId(Integer userId);

    int insertShowList(List<UserHomePanelModel> list);

    int updatePanelSelective(UserHomePanelModel record);

    int updatePanelPosition(UserHomePanelModel record);

    List<UserHomePanelModel> queryPanelIdByUserId(int userId);

    List<Integer> queryUserId();

}