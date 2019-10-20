package com.yeqifu.bus.service;

import com.yeqifu.bus.domain.Customer;
import com.yeqifu.sys.utils.DataGridView;
import com.yeqifu.bus.vo.CustomerVo;

public interface ICustomerService {

    /**
     * 查询所有客户
     * @param customerVo
     * @return
     */
    public DataGridView queryAllCustomer(CustomerVo customerVo);

    /**
     * 添加客户
     * @param customerVo
     */
    public void addCustomer(CustomerVo customerVo);

    /**
     * 修改客户
     * @param customerVo
     */
    public void updateCustomer(CustomerVo customerVo);

    /**
     * 删除客户
     * @param identity
     */
    public void deleteCustomer(String identity);

    /**
     * 批量删除客户
     * @param identitys
     */
    public void deleteBatchCustomer(String [] identitys);

    /**
     * 根据身份号查询客户信息
     * @param identity
     * @return
     */
    public Customer queryCustomerByIdentity(String identity);
}
