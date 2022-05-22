package com.yeqifu.sys.controller;

import com.yeqifu.sys.domain.Message;
import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.service.IMessageService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.utils.ResultObj;
import com.yeqifu.sys.utils.WebUtils;
import com.yeqifu.sys.vo.MessageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * 系统留言控制器
 */
@RestController
@RequestMapping("message")
public class MessageController {

    @Autowired
    private IMessageService messageService;

    /**
     * 加载留言列表返回DataGridView
     * @param messageVo
     * @return
     */
    @RequestMapping("loadAllMessage")
    public DataGridView loadAllMessage(MessageVo messageVo){
        return this.messageService.queryAllMessage(messageVo);
    }

    /**
     * 添加留言
     * @param messageVo
     * @return
     */
    @RequestMapping("addMessage")
    public ResultObj addMessage(MessageVo messageVo){
        try {
            messageVo.setCreatetime(new Date());
            User user=(User) WebUtils.getHttpSession().getAttribute("user");
            messageVo.setOpername(user.getRealname());
            this.messageService.addMessage(messageVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 删除留言
     * @param messageVo
     * @return
     */
    @RequestMapping("deleteMessage")
    public ResultObj deleteMessage(MessageVo messageVo){
        try {
            this.messageService.deleteMessage(messageVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除留言
     * @param messageVo
     * @return
     */
    @RequestMapping("deleteBatchMessage")
    public ResultObj deleteBatchMessage(MessageVo messageVo){
        try {
            this.messageService.deleteBatchMessage(messageVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 更新留言
     * @param messageVo
     * @return
     */
    @RequestMapping("updateMessage")
    public ResultObj updateMessage(MessageVo messageVo){
        try {
            this.messageService.updateMessage(messageVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 根据id查询留言
     */
    @RequestMapping("loadMessageById")
    public Message loadMessageById(Integer id) {
        return this.messageService.queryMessageById(id);
    }

}
