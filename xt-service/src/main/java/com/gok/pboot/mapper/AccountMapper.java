package com.gok.pboot.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.gok.pboot.auth.Account;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * 用户数据访问
 *
 */
@Mapper
public interface AccountMapper extends BaseMapper<Account> {


    /**
     * 获取账户信息
     *
     * @param username 账户登入账号
     *
     * @return 账户
     */
    Account getByUsername(@Param("username") String username);

    /**
     * 获取账户信息
     *
     * @param username 账户登入账号
     *
     * @return 账户
     */
    Account getAccountByUsername(@Param("username") String username, @Param("id") Long id);

    /**
     * 获取账户信息
     *
     * @param username 账户账号
     * @param username 账户手机号
     *
     * @return 账户
     */
    Account getByUsernameAndPhone(@Param("username") String username, @Param("phone") String phone);
    /**
     * 昵称获取账户
     * @param nickname
     * @return
     */
    List<Account> findAccountsByNickname(@Param("nickname") String nickname);


    /**
     * 修改密码 手势  指纹，手机，openId,默认信息
     * @param entity
     */
    int updateEntity (@Param("entity") Account entity);


    /**
     * 查询用户
     *
     * @param filter 查询条件
     *
     * @return 账号实体 Map集合
     */
    Page<Account> find(Page<Account> page, @Param("filter") Map<String, Object> filter);

    /**
     * 批量插入
     * @param accounts 账户对象
     */
    void insertBatch(@Param("accounts") List<Account> accounts);

    /**
     * 批量伪删
     * @param ids
     * @return
     */
    Integer delBatchByLogic(@Param("ids") List<Long> ids);

    /**
     * 根据账户名设置openId
     * @param username  账户名
     * @param openId
     */
    void setOpenIdByUsername(@Param("username") String username, @Param("openId") String openId);

    /**
     * 获取手机号注册的用户数
     * @param phone
     * @return
     */
    int getCountByPhone(@Param("phone") String phone);

    /**
     * 更新密码
     *
     * @param id       用户主键 ID
     * @param password 密码
     */
    void updatePassword(@Param("id") Long id, @Param("password") String password);
    /**
     * 更新电话
     *
     * @param id       用户主键 ID
     * @param phone   电话
     */
    int updatePhone(@Param("id") Long id, @Param("phone") String phone);

    /**
     *根据手机号码集合
     * @author: yzs
     * @param phoneList
     * @return java.util.List<com.gok.pboot.auth.Account>
     */
    List<Account> getByPhoneList (@Param("list") List<String> phoneList);


    Account findByOpenId(@Param("openId") String openId);

    /**
     * 根据用户id编辑账号实名信息
     * @author chx
     * @date 2024/7/15
     * @param account 请求参数
     * @return void
     */
    void updateAuthInformationByUserId(Account account);

    /**
     * 校验手机号是否已存在啊
     * @author chx
     * @date 2024/7/17
     * @param phone 手机号
     * @return com.gok.pboot.auth.Account
     */
    Account getAccountByPhone(@Param("phone") String phone);

    /**
     * 根据手机号以及账号id获取账号信息
     * @author chx
     * @date 2024/7/18
     * @param phone 手机号
     * @param accountId 账号id
     * @return com.gok.pboot.auth.Account
     */
    Account getAccountByPhoneAndAccountId(@Param("phone") String phone, @Param("accountId") Long accountId);

    /**
     * 校验身份证号是否已存在
     * @author chx
     * @date 2024/7/18
     * @param idNumber 身份证号
     * @return com.gok.pboot.auth.Account
     */
    Account getAccountByIdNumber(@Param("idNumber") String idNumber, @Param("accountId") Long accountId);

    /**
     * 根据司机id校验身份证号是否已存在
     * @author chx
     * @date 2024/7/18
     * @param idNumber
     * @param driverId
     * @return com.gok.pboot.auth.Account
     */
    Account getAccountByIdNumberAndDriverId(@Param("idNumber") String idNumber, @Param("accountId") Long driverId);

    /**
     * 根据账号id查询实名认证状态
     * @param accountId 账号id
     * @return  实名认证状态
     */
    Account getAuthStatusById(Long accountId);

    /**
     * 修改用户实名信息
     * @param authAccount   实名信息
     */
    void updateAuthByAccountId(Account authAccount);

    /**
     * 根据身份证获取账号数量
     * @author lpj
     * @date 2024/7/22
     * @param account 请求参数
     * @return java.lang.Integer
     */
    Integer getCountByIdNumber(Account account);

    /**
     * 根据手机号获取账号数量
     * @author lpj
     * @date 2024/7/22
     * @param account 请求参数
     * @return java.lang.Integer
     */
    Integer getCountNumberByPhone(Account account);
}
