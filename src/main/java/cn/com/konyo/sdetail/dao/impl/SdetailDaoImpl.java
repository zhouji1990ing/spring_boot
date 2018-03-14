package cn.com.konyo.sdetail.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.sdetail.dao.SdetailDao;
import cn.com.konyo.sdetail.domain.Sdetail;
import cn.com.konyo.util.BaseDao;

/**
 * 屈爱光影---屈爱基金会相关的公益活动视频内容 DAO层实现接口
 * 
 * @author huadaoqing
 */
@Repository
public class SdetailDaoImpl extends BaseDao implements SdetailDao {

    /**
     * 保存
     */
    public Integer saveSdetail(Sdetail sdetail) throws Exception {
        return getSqlSession().insert("saveSdetail", sdetail);
    }

    /**
     * 修改
     */
    public Integer modifySdetail(Sdetail sdetail) throws Exception {
        return getSqlSession().update("modifySdetail", sdetail);
    }

    /**
     * 修改发布状态
     */
    public Integer modifySdetailIssync(Sdetail sdetail) throws Exception {
        return getSqlSession().update("modifySdetailIssync", sdetail);
    }

    /**
     * 删除
     */
    public Integer removeSdetail(Sdetail sdetail) throws Exception {
        return getSqlSession().update("removeSdetail", sdetail);
    }

    /**
     * 获取单个
     */
    public Sdetail getSdetail(Sdetail sdetail) throws Exception {
        return getSqlSession().selectOne("getSdetail", sdetail);
    }

    /**
     * 获取集合
     */
    public List<Sdetail> findSdetails(Sdetail sdetail) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findSdetailsCount", sdetail);
        if (count == 0)
            count = 1d;
        sdetail.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / sdetail.getPageSize());
        if (totalSize < sdetail.getPageNo()) {
            sdetail.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        sdetail.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Sdetail> list = getSqlSession().selectList("findSdetails", sdetail);
        return list;
    }

    /**
     * 获取集合
     */
    public List<Sdetail> findSdetailsNopage(Sdetail sdetail) throws Exception {
        List<Sdetail> list = getSqlSession().selectList("findSdetailsNopage", sdetail);
        return list;
    }

    /**
     * 获取分类集合
     */
    public List<Sdetail> findTypeNopage(Sdetail sdetail) throws Exception {
        List<Sdetail> list = getSqlSession().selectList("findTypeNopage", sdetail);
        return list;
    }

}
