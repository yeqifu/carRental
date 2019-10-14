package com.yeqifu.sys.service;

import com.yeqifu.sys.domain.News;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.NewsVo;

public interface INewsService {

    /**
     * 查询所有公告
     * @param newsVo
     * @return
     */
    public DataGridView queryAllNews(NewsVo newsVo);

    /**
     * 添加公告
     * @param newsVo
     */
    public void addNews(NewsVo newsVo);

    /**
     * 删除公告
     * @param newsid
     */
    public void deleteNews(Integer newsid);

    /**
     * 批量删除公告
     * @param ids
     */
    public void deleteBatchNews(Integer[] ids);

    /**
     * 更新公告
     * @param newsVo
     */
    public void updateNews(NewsVo newsVo);

    News queryNewsById(Integer id);
}
