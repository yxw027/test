package com.linghang.model.base;

public class UserHomePanelModel {
    private Integer userid;

    private Integer homepanelid;

    private Integer isShow;

    private Integer indexNo;

    private String name;

    private String groupName;

    private String groupClassName;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getHomepanelid() {
        return homepanelid;
    }

    public void setHomepanelid(Integer homepanelid) {
        this.homepanelid = homepanelid;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer getIndexNo() {
        return indexNo;
    }

    public void setIndexNo(Integer indexNo) {
        this.indexNo = indexNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupClassName() {
        return groupClassName;
    }

    public void setGroupClassName(String groupClassName) {
        this.groupClassName = groupClassName;
    }
}