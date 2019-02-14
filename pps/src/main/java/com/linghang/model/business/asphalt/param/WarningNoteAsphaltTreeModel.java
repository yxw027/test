package com.linghang.model.business.asphalt.param;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen
 */
public class WarningNoteAsphaltTreeModel {

    /**
     * id
     */
    private Long id;

    /**
     * parentId
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long parentId;

    /**
     * 名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String name;

    private Integer type;

    private List<WarningNoteAsphaltTreeModel> items = new ArrayList<>();

    public WarningNoteAsphaltTreeModel() {
    }

    public WarningNoteAsphaltTreeModel(Long id, Long parentId, String name) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
    }

    public WarningNoteAsphaltTreeModel(Long id, Long parentId, String name, Integer type) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
        this.type = type;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public List<WarningNoteAsphaltTreeModel> getItems() {
        return items;
    }

    public void setItems(List<WarningNoteAsphaltTreeModel> items) {
        this.items = items;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
