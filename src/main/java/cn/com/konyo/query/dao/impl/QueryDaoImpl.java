package cn.com.konyo.query.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.query.dao.QueryDao;
import cn.com.konyo.query.domain.Query;
import cn.com.konyo.util.BaseDao;

/**
 * 前沿观点 DAO 实现类
 * 
 * @author 刘毅
 * @createtime 2014/7/30
 * @lastupdate 2014/7/30
 */
@Repository
public class QueryDaoImpl extends BaseDao implements QueryDao {

    /**
     * 获取列表
     */
    public List<Query> findQuery(Query query) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findQueryCount", query);
        if (count == 0)
            count = 1d;
        query.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / query.getPageSize());
        if (totalSize < query.getPageNo()) {
            query.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        query.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Query> list = getSqlSession().selectList("findQuery", query);
        return list;
    }

    /**
     * 获取上一周的数据列表
     */
    public List<Query> findQueryLastWeek(Query query) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findQueryLastWeekCount", query);
        if (count == 0)
            count = 1d;
        query.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / query.getPageSize());
        if (totalSize < query.getPageNo()) {
            query.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        query.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Query> list = getSqlSession().selectList("findQueryLastWeek", query);
        return list;

    }

    /**
     * 保存
     */
    public Integer saveQuery(Query query) throws Exception {
        return getSqlSession().insert("saveQuery", query);
    }

    /**
     * 删除
     */
    public Integer removeQuery(Query query) throws Exception {
        return getSqlSession().update("removeQuery", query);
    }

    /**
     * 删除所有
     */
    public Integer removeQueryAll(Query query) throws Exception {
        return getSqlSession().update("removeQueryAll", query);
    }

    /**
     * 获取单个实体
     */
    public Query getQuery(Query query) throws Exception {
        return getSqlSession().selectOne("getQuery", query);
    }

    /**
     * 通过编号获取单个实体
     */
    public Query getQueryByNo(Query query) throws Exception {
        return getSqlSession().selectOne("getQueryByNo", query);
    }

    /**
     * 修改
     */
    public Integer moidfyQuery(Query query) throws Exception {
        return getSqlSession().update("modifyQuery", query);
    }

    /**
     * 同步（ 上线下线操作）
     */
    public Integer syncQuery(Query query) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("syncQuery", query);
    }

    /**
     * 在线的前沿观点列表 不分页
     */
    public List<Query> findQueryNotPaged(Query query) throws Exception {

        List<Query> list = getSqlSession().selectList("findQueryNotPaged", query);
        return list;
    }

    /**
     * 上一周往期前沿观点列表 不分页
     */
    public List<Query> findQueryLastWeekNotPaged(Query query) throws Exception {
        return getSqlSession().selectList("findQueryLastWeekNotPaged", query);
    }

}
