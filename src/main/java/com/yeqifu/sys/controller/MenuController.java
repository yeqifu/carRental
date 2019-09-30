package com.yeqifu.sys.controller;

import com.yeqifu.sys.constast.SysConstast;
import com.yeqifu.sys.domain.Menu;
import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.service.IMenuService;
import com.yeqifu.sys.utils.TreeNode;
import com.yeqifu.sys.utils.TreeNodeBuilder;
import com.yeqifu.sys.utils.WebUtils;
import com.yeqifu.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单管理控制器
 */
@RestController
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @RequestMapping("loadIndexleftMenuJson")
    public List<TreeNode> loadIndexLeftMenuJson(MenuVo menuVo){
        //得到当前登陆的用户对象
        User user =(User) WebUtils.getHttpSession().getAttribute("user");

        List<Menu> list = null;
        menuVo.setAvailable(SysConstast.AVAILABLE_TRUE);//只查询可用的
        if(user.getType()==SysConstast.USER_TYPE_SUPER){
            list = this.menuService.queryAllMenuForList(menuVo);
        }else {
            list = this.menuService.queryMenuByUserIdForList(menuVo,user.getUserid());
        }

        List<TreeNode> nodes = new ArrayList<>();

        //把list里面的数据放到nodes中
        for (Menu menu: list) {
            Integer id = menu.getId();
            Integer pid = menu.getPid();
            String title = menu.getTitle();
            String icon = menu.getIcon();
            String href = menu.getHref();
            Boolean spread = menu.getSpread()==SysConstast.SPREAD_TRUE?true:false;
            String target = menu.getTarget();
            nodes.add(new TreeNode(id,pid,title,icon,href,spread,target));
        }

        return TreeNodeBuilder.builder(nodes,1);
    }

}
