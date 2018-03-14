package cn.com.konyo.query.dao;

import java.util.List;

import cn.com.konyo.query.domain.Query;

/**
 * 智能查询 DAO 接口
 * 
 * @author 刘毅
 * @createtime 2015/2/26
 * @lastupdate 2015/2/26
 */

public interface QueryDao {
    public List<Query> findQuery(Query query) throws Exception;

    public List<Query> findQueryLastWeek(Query query) throws Exception;

    public List<Query> findQueryNotPaged(Query query) throws Exception;

    public List<Query> findQueryLastWeekNotPaged(Query query) throws Exception;

    public Integer saveQuery(Query query) throws Exception;

    public Integer moidfyQuery(Query query) throws Exception;

    public Integer removeQuery(Query query) throws Exception;

    public Integer syncQuery(Query query) throws Exception;

    public Integer removeQueryAll(Query query) throws Exception;

    public Query getQuery(Query query) throws Exception;

    public Query getQueryByNo(Query query) throws Exception;

}
