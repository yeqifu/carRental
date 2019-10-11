package com.yeqifu.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yeqifu.sys.domain.LogInfo;
import com.yeqifu.sys.mapper.LogInfoMapper;
import com.yeqifu.sys.service.ILogInfoService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 日志管理
 */
@Service
public class LogInfoServiceImpl implements ILogInfoService {

    @Autowired
    private LogInfoMapper logInfoMapper;

    /**
     * 查询日志
     * @param logInfoVo
     * @return
     */
    @Override
    public DataGridView queryAllLogInfo(LogInfoVo logInfoVo) {
        Page<Object> page= PageHelper.startPage(logInfoVo.getPage(),logInfoVo.getLimit());
        List<LogInfo> data = this.logInfoMapper.queryAllLogInfo(logInfoVo);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加日志
     * @param logInfoVo
     */
    @Override
    public void addLogInfo(LogInfoVo logInfoVo) {
        this.logInfoMapper.insertSelective(logInfoVo);
    }

    /**
     * 删除单个日志
     * @param logInfoid
     */
    @Override
    public void deleteLogInfo(Integer logInfoid) {
        this.logInfoMapper.deleteByPrimaryKey(logInfoid);
    }

    /**
     * 批量删除日志
     * @param ids
     */
    @Override
    public void deleteBatchLogInfo(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteLogInfo(id);
        }
    }
}
