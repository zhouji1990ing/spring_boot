package cn.com.konyo.menutype.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.menutype.dao.MenuTypeDao;
import cn.com.konyo.menutype.domain.MenuType;
import cn.com.konyo.util.BaseDao;

/**
 * 主菜单类型Dao实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class MenuTypeDaoImpl extends BaseDao implements MenuTypeDao {

    /**
     * 保存菜单类型
     */
    public Integer saveMenuType(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveMenuType", menuType);
    }

    /**
     * 修改菜单类型
     */
    public Integer modifyMenuType(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyMenuType", menuType);
    }

    /**
     * 删除菜单类型
     */
    public Integer removeMenuType(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeMenuType", menuType);
    }

    /**
     * 获取单个主菜单类型
     */
    public MenuType getMenuType(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getMenuType", menuType);
    }

    /**
     * 根据code获取单个主菜单类型
     */
    public MenuType getMenuTypeByCode(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getMenuTypeByCode", menuType);
    }

    /**
     * 检查主菜单类型是否重复
     */
    public MenuType checkMenuType(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkMenuType", menuType);
    }

    /**
     * 获取主菜单类型(有分页)
     */
    public List<MenuType> findMenuTypes(MenuType menuType) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findMenuTypesCount", menuType);
        if (count == 0)
            count = 1d;
        menuType.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / menuType.getPageSize());
        if (totalSize < menuType.getPageNo()) {
            menuType.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        menuType.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<MenuType> list = getSqlSession().selectList("findMenuTypes", menuType);
        return list;
    }

    /**
     * 获取主菜单类型(无分页)
     */
    public List<MenuType> findMenuTypesNopage(MenuType menuType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findMenuTypesNopage", menuType);
    }

}
