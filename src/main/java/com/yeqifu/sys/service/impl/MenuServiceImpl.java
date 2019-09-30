package com.yeqifu.sys.service.impl;

import com.yeqifu.sys.domain.Menu;
import com.yeqifu.sys.mapper.MenuMapper;
import com.yeqifu.sys.service.IMenuService;
import com.yeqifu.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }

    @Override
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
        return menuMapper.queryAllMenu(menuVo);
    }
}
