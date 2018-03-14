package cn.com.konyo.glory.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.glory.dao.GloryDao;
import cn.com.konyo.glory.domain.Glory;
import cn.com.konyo.util.BaseDao;

/**
 * 光荣事迹 Dao实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class GloryDaoImpl extends BaseDao implements GloryDao {

    /**
     * 保存光荣事迹
     */
    public Integer saveGlory(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveGlory", glory);
    }

    /**
     * 修改光荣事迹
     */
    public Integer modifyGlory(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyGlory", glory);
    }

    /**
     * 修改发布状态
     */
    public Integer modifyIsSync(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyGloryIsSync", glory);
    }

    /**
     * 删除光荣事迹
     */
    public Integer removeGlory(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removeGlory", glory);
    }

    /**
     * 获取单个光荣事迹
     */
    public Glory getGlory(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getOneGlory", glory);
    }

    /**
     * 获取光荣事迹信息
     */
    public List<Glory> findGlorys(Glory glory) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findGlorysCount", glory);
        if (count == 0)
            count = 1d;
        glory.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / glory.getPageSize());
        if (totalSize < glory.getPageNo()) {
            glory.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        glory.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Glory> list = getSqlSession().selectList("findGlorys", glory);
        return list;
    }

    /**
     * 获取光荣事迹信息(没有分页)
     */
    public List<Glory> findGlorysNoPage(Glory glory) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findGlorysNoPage", glory);
    }

}
