package com.yeqifu.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yeqifu.bus.domain.Franchisee;
import com.yeqifu.bus.mapper.FranchiseeMapper;
import com.yeqifu.bus.service.FranchiseeService;
import com.yeqifu.bus.vo.FranchiseeVo;
import com.yeqifu.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: 落亦-
 * @Date: 2022/5/22 13:56
 */
@Service
public class FranchiseeServiceImpl implements FranchiseeService {

    @Autowired
    private FranchiseeMapper franchiseeMapper;

    /**
     * 查询所有加盟商信息 分页
     *
     * @param franchiseeVo
     * @return
     */
    @Override
    public DataGridView queryAllFranchisee(FranchiseeVo franchiseeVo) {
        Page<Object> page = PageHelper.startPage(franchiseeVo.getPage(), franchiseeVo.getLimit());
        List<Franchisee> data = this.franchiseeMapper.queryAllFranchisee(franchiseeVo);
        return new DataGridView(page.getTotal(), data);
    }

    /**
     * 添加一个加盟商
     *
     * @param franchiseeVo
     */
    @Override
    public void addFranchisee(FranchiseeVo franchiseeVo) {
        this.franchiseeMapper.insertSelective(franchiseeVo);
    }

    /**
     * 更新一个加盟商
     *
     * @param franchiseeVo
     */
    @Override
    public void updateFranchisee(FranchiseeVo franchiseeVo) {
        this.franchiseeMapper.updateByPrimaryKeySelective(franchiseeVo);
    }

    @Override
    public void deleteFranchisee(Integer id) {
        this.franchiseeMapper.deleteByPrimaryKey(id);
    }

}
