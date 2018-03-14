package cn.com.konyo.user.dao;

import java.util.List;

import cn.com.konyo.user.domain.LoginUser;

public interface UserDao {

    public int save(LoginUser loginUser);

    public LoginUser loginUser(LoginUser loginUser);

    public List<LoginUser> list(LoginUser loginUser);

    public List<LoginUser> listNopage(LoginUser loginUser);

    public int remove(LoginUser loginUser);

    public int modify(LoginUser loginUser);

    public LoginUser get(LoginUser loginUser);

    // 设定抽奖第几个人中
    public int setAdmincreateuserNum(Integer num);

    // 获取抽奖第几个人中
    public long getAdmincreateuserNum(LoginUser loginUser);

    // 修改用户类型
    public int modifyIshomeoffice(LoginUser loginUser);

    // 检查微信号是否已存在
    public List<LoginUser> checkwxcode(LoginUser loginUser);

    // 检查密码
    public Integer checkPassword(LoginUser loginUser);

    // 修改密码
    public Integer modifyPassword(LoginUser loginUser);
}
