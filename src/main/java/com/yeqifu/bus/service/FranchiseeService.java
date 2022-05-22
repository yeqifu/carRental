package com.yeqifu.bus.service;

import com.yeqifu.bus.vo.FranchiseeVo;
import com.yeqifu.sys.utils.DataGridView;

/**
 * @Author: 落亦-
 * @Date: 2022/5/22 13:50
 */
public interface FranchiseeService {
    /**
     * 查询所有加盟商
     *
     * @param franchiseeVo
     * @return
     */
    public DataGridView queryAllFranchisee(FranchiseeVo franchiseeVo);

    /**
     * 添加加盟商
     *
     * @param franchiseeVo
     */
    public void addFranchisee(FranchiseeVo franchiseeVo);

    /**
     * 修改加盟商
     *
     * @param franchiseeVo
     */
    public void updateFranchisee(FranchiseeVo franchiseeVo);

    /**
     * 删除加盟商
     *
     * @param id
     */
    public void deleteFranchisee(Integer id);
}
