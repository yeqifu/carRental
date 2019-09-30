package com.yeqifu.sys.constast;

/**
 * 常量接口
 */
public interface SysConstast {
    String USER_LOGIN_ERROR_MSG = "用户名或密码不正确";

    /**
     * 可用状态
     */
    Integer AVAILABLE_TRUE = 1;
    Integer AVAILABLE_FALSE = 0;

    /**
     * 用户类型
     */
    Integer USER_TYPE_SUPER = 1;
    Integer USER_TYPE_NORMAL = 2;

    /**
     * 是否展开
     */
    Integer SPREAD_TRUE = 1;
    Integer SPREAD_FALSE = 0;

}
