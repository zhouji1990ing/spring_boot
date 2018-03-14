package cn.com.konyo.user.service;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import cn.com.konyo.user.domain.LoginUser;

public interface UserService {

    public LoginUser loginUser(LoginUser loginUser) throws RuntimeException;

    public List<LoginUser> list(LoginUser user) throws RuntimeException;

    public List<LoginUser> listNopage(LoginUser user) throws RuntimeException;

    public LoginUser add(LoginUser user) throws RuntimeException;

    public int remove(LoginUser user) throws RuntimeException;

    public LoginUser get(LoginUser loginUser) throws RuntimeException;

    public int modify(LoginUser user) throws RuntimeException;

    /**
     * 根据OpenID 查询用户 是否已经注册，true:已经注册，false:未注册
     * 
     * @param user
     * @return
     * @throws RuntimeException
     */
    public boolean checkUserByWxcode(String wxcode) throws RuntimeException;

    /**
     * 设定第几个人中奖
     * 
     * @param num
     * @return
     * @throws RuntimeException
     */
    public int setAdmincreateuserNum(Integer num) throws RuntimeException;

    /**
     * 获取第几个人中奖
     * 
     * @param num
     * @return
     * @throws RuntimeException
     */
    public long getAdmincreateuserNum(LoginUser loginUser) throws RuntimeException;

    /**
     * 修改用户的类型
     * 
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public int modifyIshomeoffice(LoginUser loginUser) throws RuntimeException;

    /**
     * 检查微信号是否存在
     * 
     * @param user
     * @return
     * @throws RuntimeException
     */
    public List<LoginUser> checkwxcode(LoginUser user) throws RuntimeException;

    // 检查密码
    public Integer checkPassword(LoginUser loginUser) throws RuntimeException;

    // 修改密码
    public Integer modifyPassword(LoginUser loginUser) throws RuntimeException;

    public HSSFWorkbook exportElect(LoginUser loginUser) throws RuntimeException;
}
