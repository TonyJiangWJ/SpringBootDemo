package com.tony.billing.entity;

import java.util.Date;

/**
 * @author jiangwj20966 2018/04/24
 */
public class AssetParentType {

    private Integer id;
    /**
     * 类型code
     */
    private String typeCode;
    /**
     * 说明
     */
    private String typeDesc;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date modifyTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

}