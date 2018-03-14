package cn.com.konyo.menutype.dao;

import java.util.List;

import cn.com.konyo.menutype.domain.MenuType;

/**
 * 主菜单类型DAO层接口
 * 
 * @author Hong Changgui
 */
public interface MenuTypeDao {

    public Integer saveMenuType(MenuType menuType) throws Exception;

    public Integer modifyMenuType(MenuType menuType) throws Exception;

    public Integer removeMenuType(MenuType menuType) throws Exception;

    public MenuType getMenuType(MenuType menuType) throws Exception;

    public MenuType getMenuTypeByCode(MenuType menuType) throws Exception;

    public MenuType checkMenuType(MenuType menuType) throws Exception;

    public List<MenuType> findMenuTypes(MenuType menuType) throws Exception;

    public List<MenuType> findMenuTypesNopage(MenuType menuType) throws Exception;
}
