package cn.com.konyo.menutype.service;

import java.util.List;

import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 主菜单类型 Service层
 * 
 * @author Hong Changgui
 */
public interface MenuTypeService {

    public Integer saveMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public Integer modifyMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public Integer removeMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public MenuType getMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public MenuType getMenuTypeByCode(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public MenuType checkMenuType(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public List<MenuType> findMenuTypes(MenuType menuType, LoginUser loginUser) throws RuntimeException;

    public List<MenuType> findMenuTypesNopage(MenuType menuType, LoginUser loginUser) throws RuntimeException;

}
