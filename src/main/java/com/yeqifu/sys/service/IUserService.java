package com.yeqifu.sys.service;

import com.yeqifu.sys.domain.User;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.sys.vo.UserVo;

/**
 * 用户服务接口
 */
public interface IUserService {

    /**
     * 用户登陆
     * @param userVo
     * @return
     */
    User login(UserVo userVo);

    /**
     * 查询所有用户
     * @param userVo
     * @return
     */
    public DataGridView queryAllUser(UserVo userVo);

    /**
     * 添加用户
     * @param userVo
     */
    public void addUser(UserVo userVo);

    /**
     * 修改用户
     * @param userVo
     */
    public void updateUser(UserVo userVo);

    /**
     * 根据id删除用户
     * @param userid
     */
    public void deleteUser(Integer userid);

    /**
     * 批量删除用户
     * @param ids
     */
    public void deleteBatchUser(Integer [] ids);

    /**
     * 重置密码
     * @param userid
     */
    public void resetUserPwd(Integer userid);

    /**
     * 加载用户管理分配角色的数据
     * @param userid
     * @return
     */
    DataGridView queryUserRole(Integer userid);

    /**
     * 保存用户和角色的关系
     * @param userVo
     */
    void saveUserRole(UserVo userVo);
}
