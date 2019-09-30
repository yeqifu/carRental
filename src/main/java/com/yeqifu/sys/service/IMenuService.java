package com.yeqifu.sys.service;

import com.yeqifu.sys.domain.Menu;
import com.yeqifu.sys.vo.MenuVo;

import java.util.List;

/**
 * 菜单管理的服务接口
 */
public interface IMenuService {

    /**
     * 查询所有菜单返回
     * @param menuVo
     * @return
     */
    public List<Menu> queryAllMenuForList(MenuVo menuVo);

    /**
     * 根据用户id查询用户的可用菜单
     */
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo,Integer userId);

}
