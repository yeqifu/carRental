package com.yeqifu.sys.controller;

import com.yeqifu.sys.domain.News;
import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.service.INewsService;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.utils.ResultObj;
import com.yeqifu.sys.utils.WebUtils;
import com.yeqifu.sys.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private INewsService newsService;

    /**
     * 加载公告列表返回DataGridView
     * @param newsVo
     * @return
     */
    @RequestMapping("loadAllNews")
    public DataGridView loadAllNews(NewsVo newsVo){
        return this.newsService.queryAllNews(newsVo);
    }

    /**
     * 添加公告
     * @param newsVo
     * @return
     */
    @RequestMapping("addNews")
    public ResultObj addNews(NewsVo newsVo){
        try {
            newsVo.setCreatetime(new Date());
            User user=(User) WebUtils.getHttpSession().getAttribute("user");
            newsVo.setOpername(user.getRealname());
            this.newsService.addNews(newsVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 删除公告
     * @param newsVo
     * @return
     */
    @RequestMapping("deleteNews")
    public ResultObj deleteNews(NewsVo newsVo){
        try {
            this.newsService.deleteNews(newsVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除公告
     * @param newsVo
     * @return
     */
    @RequestMapping("deleteBatchNews")
    public ResultObj deleteBatchNews(NewsVo newsVo){
        try {
            this.newsService.deleteBatchNews(newsVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 更新公告
     * @param newsVo
     * @return
     */
    @RequestMapping("updateNews")
    public ResultObj updateNews(NewsVo newsVo){
        try {
            this.newsService.updateNews(newsVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 根据id查询公告
     */
    @RequestMapping("loadNewsById")
    public News loadNewsById(Integer id) {
        return this.newsService.queryNewsById(id);
    }

}
