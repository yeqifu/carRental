package com.yeqifu.sys.service;

import com.yeqifu.sys.domain.Message;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.MessageVo;

public interface IMessageService {

    /**
     * 查询所有留言
     * @param messageVo
     * @return
     */
    public DataGridView queryAllMessage(MessageVo messageVo);

    /**
     * 添加留言
     * @param messageVo
     */
    public void addMessage(MessageVo messageVo);

    /**
     * 删除留言
     * @param messageid
     */
    public void deleteMessage(Integer messageid);

    /**
     * 批量删除留言
     * @param ids
     */
    public void deleteBatchMessage(Integer[] ids);

    /**
     * 更新留言
     * @param messageVo
     */
    public void updateMessage(MessageVo messageVo);

    /**
     * 通过id查询一条留言
     * @param id
     * @return
     */
    Message queryMessageById(Integer id);

}
