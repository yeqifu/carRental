package com.yeqifu.sys.utils;

import com.yeqifu.bus.constant.SysConstant;

/**
 * @author luoyi-
 */
public class ResultObj {

    private Integer code;
    private String msg;

    /**
     * 添加成功
     */
    public static final ResultObj ADD_SUCCESS = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.ADD_SUCCESS);
    /**
     * 添加出租单
     */
    public static final ResultObj ADD_SUCCESS_RENT = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.ADD_SUCCESS_RENT);
    public static final ResultObj ADD_ERROR_RENT = new ResultObj(SysConstant.CODE_ERROR, SysConstant.ADD_ERROR_RENT);

    /**
     * 审核出租单
     */
    public static final ResultObj CHECK_SUCCESS_RENT = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.CHECK_SUCCESS_RENT);
    public static final ResultObj CHECK_ERROR_RENT = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.CHECK_ERROR_RENT);

    /**
     * 添加失败
     */
    public static final ResultObj ADD_ERROR = new ResultObj(SysConstant.CODE_ERROR, SysConstant.ADD_ERROR);
    /**
     * 更新成功
     */
    public static final ResultObj UPDATE_SUCCESS = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.UPDATE_SUCCESS);
    /**
     * 更新失败
     */
    public static final ResultObj UPDATE_ERROR = new ResultObj(SysConstant.CODE_ERROR, SysConstant.UPDATE_ERROR);
    /**
     * 删除成功
     */
    public static final ResultObj DELETE_SUCCESS = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.DELETE_SUCCESS);
    /**
     * 删除失败
     */
    public static final ResultObj DELETE_ERROR = new ResultObj(SysConstant.CODE_ERROR, SysConstant.DELETE_ERROR);
    /**
     * 重置成功
     */
    public static final ResultObj RESET_SUCCESS = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.RESET_SUCCESS);
    /**
     * 重置失败
     */
    public static final ResultObj RESET_ERROR = new ResultObj(SysConstant.CODE_ERROR, SysConstant.RESET_ERROR);
    /**
     * 分配成功
     */
    public static final ResultObj DISPATCH_SUCCESS = new ResultObj(SysConstant.CODE_SUCCESS, SysConstant.DISPATCH_SUCCESS);
    /**
     * 分配失败
     */
    public static final ResultObj DISPATCH_ERROR = new ResultObj(SysConstant.CODE_ERROR, SysConstant.DISPATCH_ERROR);

    /**
     * 状态码0 成功
     */
    public static final ResultObj STATUS_TRUE = new ResultObj(SysConstant.CODE_SUCCESS);

    /**
     * 状态码-1 失败
     */
    public static final ResultObj STATUS_FALSE = new ResultObj(SysConstant.CODE_ERROR);


    public ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private ResultObj(Integer code) {
        this.code = code;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
