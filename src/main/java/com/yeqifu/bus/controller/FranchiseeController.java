package com.yeqifu.bus.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yeqifu.bus.domain.Franchisee;
import com.yeqifu.bus.service.FranchiseeService;
import com.yeqifu.bus.vo.FranchiseeVo;
import com.yeqifu.bus.vo.FranchiseeVo;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.utils.ResultObj;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 加盟商控制器
 *
 * @Author: 落亦-
 * @Date: 2022/5/22 9:45
 */
@RestController
@RequestMapping("/franchisee")
public class FranchiseeController {
    @Autowired
    private FranchiseeService franchiseeService;

    /**
     * 加载加盟商列表返回DataGridView
     *
     * @param franchiseeVo
     * @return
     */
    @RequestMapping("loadAllFranchisee")
    public DataGridView loadAllFranchisee(FranchiseeVo franchiseeVo) {
        return this.franchiseeService.queryAllFranchisee(franchiseeVo);
    }

    /**
     * 添加一个加盟商
     *
     * @param franchiseeVo
     * @return
     */
    @RequestMapping("addFranchisee")
    public ResultObj addFranchisee(FranchiseeVo franchiseeVo) {
        try {
            this.franchiseeService.addFranchisee(franchiseeVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改一个加盟商
     *
     * @param franchisee
     * @return
     */
    @RequestMapping("updateFranchisee")
    public ResultObj updateFranchisee(Franchisee franchisee) {
        System.out.println(franchisee.toString());
        try {
            this.franchiseeService.updateFranchisee(franchisee);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除一个加盟商
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteFranchisee")
    public ResultObj deleteFranchisee(Integer id) {
        try {
            this.franchiseeService.deleteFranchisee(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}

