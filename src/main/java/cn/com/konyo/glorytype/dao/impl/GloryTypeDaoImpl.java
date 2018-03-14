package cn.com.konyo.glorytype.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.glorytype.dao.GloryTypeDao;
import cn.com.konyo.glorytype.domain.GloryType;
import cn.com.konyo.util.BaseDao;

/**
 * 光荣事迹(巢籍官兵)类型 DAO层实现
 * 
 * @author Hong Changgui
 */
@Repository
public class GloryTypeDaoImpl extends BaseDao implements GloryTypeDao {

    /**
     * 保存
     */
    public Integer saveGloryType(GloryType gloryType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveGloryType", gloryType);
    }

    /**
     * 修改
     */
    public Integer modifyGloryType(GloryType gloryType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyGloryType", gloryType);
    }

    /**
     * 删除
     */
    public Integer removeGloryType(GloryType gloryType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeGloryType", gloryType);
    }

    /**
     * 获取单个
     */
    public GloryType getGloryType(GloryType gloryType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getGloryType", gloryType);
    }

    /**
     * 检查是否有重复
     */
    public GloryType checkGloryType(GloryType gloryType) throws Exception {
        return getSqlSession().selectOne("checkGloryType", gloryType);
    }

    /**
     * 获取列表(有分页)
     */
    public List<GloryType> findGloryType(GloryType gloryType) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findGloryTypeCount", gloryType);
        if (count == 0)
            count = 1d;
        gloryType.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / gloryType.getPageSize());
        if (totalSize < gloryType.getPageNo()) {
            gloryType.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        gloryType.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<GloryType> list = getSqlSession().selectList("findGloryType", gloryType);
        return list;
    }

    /**
     * 获取列表(无分页)
     */
    public List<GloryType> findGloryTypeNopage(GloryType gloryType) throws Exception {
        // TODO Auto-generated method stub
        List<GloryType> list = getSqlSession().selectList("findGloryTypeNopage", gloryType);
        return list;
    }

}
