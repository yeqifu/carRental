package com.yeqifu.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yeqifu.sys.domain.Menu;
import com.yeqifu.sys.mapper.MenuMapper;
import com.yeqifu.sys.service.IMenuService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 查询所有菜单返回
     * @param menuVo
     * @return
     */
    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }

    /**
     * @param menuVo
     * @param userId
     * @return
     */
    @Override
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
        return menuMapper.queryMenuByUid(menuVo.getAvailable(),userId);
    }

    /**
     * 查询所有菜单列表
     * @param menuVo
     * @return
     */
    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page = PageHelper.startPage(menuVo.getPage(),menuVo.getLimit());
        List<Menu> data = this.menuMapper.queryAllMenu(menuVo);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加菜单
     * @param menuVo
     */
    @Override
    public void addMenu(MenuVo menuVo) {
        this.menuMapper.insertSelective(menuVo);
    }

    /**
     * 更新菜单
     * @param menuVo
     */
    @Override
    public void updateMenu(MenuVo menuVo) {
        this.menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    /**
     * 根据pid查询菜单数量
     * @param pid
     * @return
     */
    @Override
    public Integer queryMenuByPid(Integer pid) {
        return this.menuMapper.queryMenuByPid(pid);
    }

    /**
     * 删除菜单
     * @param menuVo
     */
    @Override
    public void deleteMenu(MenuVo menuVo) {
        //删除菜单表的数据
        this.menuMapper.deleteByPrimaryKey(menuVo.getId());
        //根据菜单id删除sys_role_menu里面的数据
        this.menuMapper.deleteRoleMenuByMid(menuVo.getId());

    }
}
