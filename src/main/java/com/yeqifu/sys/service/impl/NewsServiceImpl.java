package com.yeqifu.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yeqifu.sys.domain.News;
import com.yeqifu.sys.mapper.NewsMapper;
import com.yeqifu.sys.service.INewsService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements INewsService {

    @Autowired
    private NewsMapper newsMapper;

    /**
     * 查询所有
     * @param newsVo
     * @return
     */
    @Override
    public DataGridView queryAllNews(NewsVo newsVo) {
        Page<Object> page = PageHelper.startPage(newsVo.getPage(),newsVo.getLimit());
        List<News> data = this.newsMapper.queryAllNews(newsVo);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 添加公告
     * @param newsVo
     */
    @Override
    public void addNews(NewsVo newsVo) {
        this.newsMapper.insertSelective(newsVo);
    }

    /**
     * 删除一条公告
     * @param newsid
     */
    @Override
    public void deleteNews(Integer newsid) {
        this.newsMapper.deleteByPrimaryKey(newsid);
    }

    /**
     * 批量删除公告
     * @param ids
     */
    @Override
    public void deleteBatchNews(Integer[] ids) {
        for (Integer id : ids) {
            this.deleteNews(id);
        }
    }

    /**
     * 更新公告
     * @param newsVo
     */
    @Override
    public void updateNews(NewsVo newsVo) {
        this.newsMapper.updateByPrimaryKeySelective(newsVo);
    }

    /**
     * 通过id查询一条公告
     * @param id
     * @return
     */
    @Override
    public News queryNewsById(Integer id) {
        return this.newsMapper.selectByPrimaryKey(id);
    }
}
