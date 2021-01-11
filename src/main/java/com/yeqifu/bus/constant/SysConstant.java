package com.yeqifu.bus.constant;

/**
 * 常量接口
 * @author yeqifu
 */
public interface SysConstant {

    String USER_LOGIN_ERROR_MSG = "用户名或密码不正确";
    String USER_LOGIN_CODE_ERROR_MSG = "验证码不正确";

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

    /**
     * 操作状态
     */
    String ADD_SUCCESS = "添加成功";
    String ADD_ERROR = "添加失败";

    String ADD_SUCCESS_RENT = "添加出租单成功，请等待审核！";
    String ADD_ERROR_RENT = "添加出租单失败";

    String CHECK_SUCCESS_RENT = "审核成功";
    String CHECK_ERROR_RENT = "审核失败";

    String UPDATE_SUCCESS = "更新成功";
    String UPDATE_ERROR = "更新失败";

    String DELETE_SUCCESS = "删除成功";
    String DELETE_ERROR = "删除失败";

    String RESET_SUCCESS = "重置成功";
    String RESET_ERROR = "重置失败";

    String DISPATCH_SUCCESS = "分配成功";
    String DISPATCH_ERROR = "分配失败";

    /**
     * 操作成功
     */
    Integer CODE_SUCCESS = 0;

    /**
     * 操作失败
     */
    Integer CODE_ERROR = -1;

    /**
     * 公用常量
     */
    Integer CODE_ZERO = 0;
    Integer CODE_ONE = 1;
    Integer CODE_TWO = 2;
    Integer CODE_THREE = 3;

    /**
     * 用户初始密码
     */
    String USER_DEFAULT_PWD="123456";
}
