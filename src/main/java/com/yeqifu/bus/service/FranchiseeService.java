package com.yeqifu.bus.service;

import com.yeqifu.bus.domain.Franchisee;
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
     * @param franchisee
     */
    public void addFranchisee(Franchisee franchisee);

    /**
     * 修改加盟商
     *
     * @param franchisee
     */
    public void updateFranchisee(Franchisee franchisee);

    /**
     * 删除加盟商
     *
     * @param id
     */
    public void deleteFranchisee(Integer id);
}
