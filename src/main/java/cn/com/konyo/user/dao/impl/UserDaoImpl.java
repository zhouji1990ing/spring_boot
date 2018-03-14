package cn.com.konyo.user.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.user.dao.UserDao;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.BaseDao;

@Repository
public class UserDaoImpl extends BaseDao implements UserDao {

    public int save(LoginUser loginUser) {
        return getSqlSession().insert("saveUser", loginUser);
    }

    public List<LoginUser> list(LoginUser user) {
        Double count = getSqlSession().selectOne("findUserCount", user);
        if (count == null) {
            count = 1d;
        }
        // 总条数
        user.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / user.getPageSize());
        if (totalSize < user.getPageNo()) {
            // 当前页数
            user.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        // 总页数
        user.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        return getSqlSession().selectList("findUser", user);
    }

    public List<LoginUser> listNopage(LoginUser user) {
        return getSqlSession().selectList("findUserNopage", user);
    }

    public int remove(LoginUser loginUser) {
        return getSqlSession().update("removeUser", loginUser);
    }

    public LoginUser loginUser(LoginUser loginUser) {
        return getSqlSession().selectOne("loginUser", loginUser);
    }

    public int modify(LoginUser loginUser) {
        return getSqlSession().update("modifyUser", loginUser);
    }

    public LoginUser get(LoginUser loginUser) {
        return getSqlSession().selectOne("getUser", loginUser);
    }

    // 设定抽奖第几个人中
    public int setAdmincreateuserNum(Integer num) {
        return getSqlSession().update("setAdmincreateuserNum", num);
    }

    // 获取抽奖第几个人中
    public long getAdmincreateuserNum(LoginUser loginUser) {
        return getSqlSession().update("getAdmincreateuserNum", loginUser);
    }

    // 修改用户类型
    public int modifyIshomeoffice(LoginUser loginUser) {
        return getSqlSession().update("modifyIshomeoffice", loginUser);
    }

    // 检查微信号是否已存在
    public List<LoginUser> checkwxcode(LoginUser loginUser) {
        return getSqlSession().selectList("checkwxcode", loginUser);
    }

    // 检查密码是否正确
    public Integer checkPassword(LoginUser loginUser) {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkPassword", loginUser);
    }

    // 修改密码
    public Integer modifyPassword(LoginUser loginUser) {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyPassword", loginUser);
    }
}
