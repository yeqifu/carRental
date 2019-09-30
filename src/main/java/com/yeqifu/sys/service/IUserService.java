package com.yeqifu.sys.service;

import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.vo.UserVo;
import org.springframework.stereotype.Service;

/**
 * 用户服务接口
 */
@Service
public interface IUserService {
    User login(UserVo userVo);
}
