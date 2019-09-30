package com.yeqifu.sys.mapper;

import com.yeqifu.sys.domain.News;
import org.springframework.stereotype.Repository;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
}