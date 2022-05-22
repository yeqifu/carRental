package com.yeqifu.bus.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yeqifu.bus.domain.Customer;
import com.yeqifu.bus.domain.Franchisee;
import com.yeqifu.bus.domain.Franchisee;
import com.yeqifu.bus.vo.FranchiseeVo;

import java.util.List;

/**
 * @Author: 落亦-
 * @Date: 2022/5/22 13:57
 */
public interface FranchiseeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Franchisee franchisee);

    int insertSelective(Franchisee franchisee);

    Franchisee selectByPrimaryKey(String identity);

    int updateByPrimaryKey(Franchisee record);

    int updateByPrimaryKeySelective(Franchisee franchisee);


    List<Franchisee> queryAllFranchisee(Franchisee franchisee);

}
