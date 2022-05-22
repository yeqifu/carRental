package com.yeqifu.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yeqifu.sys.domain.Message;
import com.yeqifu.sys.mapper.MessageMapper;
import com.yeqifu.sys.service.IMessageService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.MessageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements IMessageService {

    @Autowired
    private MessageMapper messageMapper;

    /**
     * 查询所有
     * @param messageVo
     * @return
     */
    @Override
    public DataGridView queryAllMessage(MessageVo messageVo) {
        Page<Object> page = PageHelper.startPage(messageVo.getPage(),messageVo.getLimit());
        List<Message> data = this.messageMapper.queryAllMessage(messageVo);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加留言
     * @param messageVo
     */
    @Override
    public void addMessage(MessageVo messageVo) {
        this.messageMapper.insertSelective(messageVo);
    }

    /**
     * 删除一条留言
     * @param messageid
     */
    @Override
    public void deleteMessage(Integer messageid) {
        this.messageMapper.deleteByPrimaryKey(messageid);
    }

    /**
     * 批量删除留言
     * @param ids
     */
    @Override
    public void deleteBatchMessage(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteMessage(id);
        }
    }

    /**
     * 更新留言
     * @param messageVo
     */
    @Override
    public void updateMessage(MessageVo messageVo) {
        this.messageMapper.updateByPrimaryKeySelective(messageVo);
    }

    /**
     * 通过id查询一条留言
     * @param id
     * @return
     */
    @Override
    public Message queryMessageById(Integer id) {
        return this.messageMapper.selectByPrimaryKey(id);
    }

}
