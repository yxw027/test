package com.linghang.mina;

import com.linghang.model.GpsDataModel;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * ENH数据处理类
 */
@Component
public class DispatcherEnhImpl implements Dispatcher {

    @Override
    public List<GpsDataModel> getDataList(String massage) {
        return new ArrayList<>(0);
    }

    @Override
    public String response() {
        return null;
    }
}
