package cn.com.konyo.menutype.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.menutype.dao.MenuTypeDao;
import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.menutype.service.MenuTypeService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 主菜单类型 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class MenuTypeServiceImpl implements MenuTypeService {

    @Autowired
    private MenuTypeDao menuTypeDao;

    public MenuTypeDao getMenuTypeDao() {
        return menuTypeDao;
    }

    public void setMenuTypeDao(MenuTypeDao menuTypeDao) {
        this.menuTypeDao = menuTypeDao;
    }

    /**
     * 保存主菜单类型
     */
    public Integer saveMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            menuType.setCreateuser(loginUser.getUserId());
            menuType.setCreatetime(new Date(System.currentTimeMillis()));
            num = menuTypeDao.saveMenuType(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改主菜单类型
     */
    public Integer modifyMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            menuType.setModifyuser(loginUser.getUserId());
            menuType.setModifytime(new Date(System.currentTimeMillis()));
            num = menuTypeDao.modifyMenuType(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除主菜单类型
     */
    public Integer removeMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            menuType.setModifyuser(loginUser.getUserId());
            menuType.setModifytime(new Date(System.currentTimeMillis()));
            num = menuTypeDao.removeMenuType(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个主菜单类型
     */
    public MenuType getMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        MenuType _menuType = null;
        try {
            _menuType = menuTypeDao.getMenuType(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _menuType;
    }

    /**
     * 根据code获取单个主菜单类型
     */
    public MenuType getMenuTypeByCode(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        MenuType _menuType = null;
        try {
            _menuType = menuTypeDao.getMenuTypeByCode(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _menuType;
    }

    /**
     * 检查主菜单类型是否重复
     */
    public MenuType checkMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        MenuType _menuType = null;
        try {
            _menuType = menuTypeDao.checkMenuType(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _menuType;
    }

    /**
     * 获取主菜单类型信息
     */
    public List<MenuType> findMenuTypes(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        List<MenuType> list = null;
        try {
            list = menuTypeDao.findMenuTypes(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取主菜单类型信息（无分页）
     */
    public List<MenuType> findMenuTypesNopage(MenuType menuType, LoginUser loginUser) throws RuntimeException {
        List<MenuType> list = null;
        try {
            list = menuTypeDao.findMenuTypesNopage(menuType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
