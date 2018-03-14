package cn.com.konyo.material.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.material.dao.MaterialDao;
import cn.com.konyo.material.domain.Material;
import cn.com.konyo.util.BaseDao;

@Repository
public class MaterialDaoImpl extends BaseDao implements MaterialDao {

    public int save(Material material) {
        return getSqlSession().insert("saveMaterial", material);
    }

    public List<Material> list(Material user) {
        Double count = getSqlSession().selectOne("findMaterialCount", user);
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
        return getSqlSession().selectList("findMaterial", user);
    }

    public List<Material> listNopage(Material user) {
        return getSqlSession().selectList("findMaterialNopage", user);
    }

    public int remove(Material material) {
        return getSqlSession().update("removeMaterial", material);
    }

    public int modifyToken(Material material) {
        return getSqlSession().update("modifyToken", material);
    }

    public int modify(Material material) {
        return getSqlSession().update("modifyMaterial", material);
    }

    public Material get(Material material) {
        return getSqlSession().selectOne("getMaterial", material);
    }

}
