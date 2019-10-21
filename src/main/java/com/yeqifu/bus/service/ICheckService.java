package com.yeqifu.bus.service;

import com.yeqifu.bus.vo.CheckVo;

import java.util.Map;

/**
 * 检查单服务管理的接口
 */
public interface ICheckService {
    /**
     * 根据出租单号加载检测单的表单数据
     * @param rentid
     * @return
     */
    Map<String,Object> initCheckFormData(String rentid);

    /**
     * 保存检查单数据
     * @param checkVo
     */
    void addCheck(CheckVo checkVo);
}
