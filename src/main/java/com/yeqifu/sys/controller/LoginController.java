package com.yeqifu.sys.controller;

import com.yeqifu.sys.constast.SysConstast;
import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.service.ILogInfoService;
import com.yeqifu.sys.service.IUserService;
import com.yeqifu.sys.utils.WebUtils;
import com.yeqifu.sys.vo.LogInfoVo;
import com.yeqifu.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * 用户登陆控制器
 */
@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ILogInfoService logInfoService;

    /**
     * 跳转到登陆页面
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "system/main/login";
    }

    /**
     * 登陆方法
     * @param userVo
     * @return
     */
    @RequestMapping("login")
    public String login(UserVo userVo,Model model){
        User user = this.userService.login(userVo);
        System.out.println(user);
        if (null!=user){
            //放到session
            WebUtils.getHttpSession().setAttribute("user",user);

            //记录登陆日志 向sys_log_login里面插入数据
            LogInfoVo logInfoVo=new LogInfoVo();
            logInfoVo.setLogintime(new Date());
            logInfoVo.setLoginname(user.getRealname()+"-"+user.getLoginname());
            logInfoVo.setLoginip(WebUtils.getHttpServletRequest().getRemoteAddr());
            logInfoService.addLogInfo(logInfoVo);

            return "system/main/index";
        }else {
            model.addAttribute("error", SysConstast.USER_LOGIN_ERROR_MSG);
            return "system/main/login";
        }

    }

}
