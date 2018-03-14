package cn.com.konyo.constants.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.constants.dao.ConstantsDao;
import cn.com.konyo.constants.domain.Constants;
import cn.com.konyo.util.BaseDao;

/**
 * 常量 Dao实现层
 * 
 * @author Hong Changgui
 */

@Repository
public class ConstantsDaoImpl extends BaseDao implements ConstantsDao {

    /**
     * 保存常量
     */
    public Integer saveConstants(Constants constants) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveConstants", constants);
    }

    /**
     * 修改常量
     */
    public Integer modifyConstants(Constants constants) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyConstants", constants);
    }

    /**
     * 删除常量
     */
    public Integer removeConstants(Constants constants) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removeConstants", constants);
    }

    /**
     * 获取单个常量
     */
    public Constants getConstants(Constants constants) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getConstants", constants);
    }

    /**
     * 获取单个常量
     */
    public Constants checkConstants(Constants constants) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkConstants", constants);
    }

    /**
     * 获取常量信息
     */
    public List<Constants> findConstantss(Constants constants) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findConstantssCount", constants);
        if (count == 0)
            count = 1d;
        constants.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / constants.getPageSize());
        if (totalSize < constants.getPageNo()) {
            constants.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        constants.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Constants> list = getSqlSession().selectList("findConstantss", constants);
        return list;
    }

    /**
     * 获取常量信息没有分页
     */
    public List<Constants> findConstantssNopage(Constants constants) throws Exception {
        List<Constants> list = getSqlSession().selectList("findConstantssNopage", constants);
        return list;
    }

}
