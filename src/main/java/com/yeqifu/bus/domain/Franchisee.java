package com.yeqifu.bus.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 加盟商表
 * @author yeqifu
 * @TableName bus_franchisee
 */
public class Franchisee implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 加盟商名字
     */
    private String name;

    /**
     * 加盟商电话
     */
    private String phone;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Franchisee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
