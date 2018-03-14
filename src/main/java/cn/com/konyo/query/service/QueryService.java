package cn.com.konyo.query.service;

import java.util.List;

import cn.com.konyo.query.domain.Query;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 前沿观点 Service接口
 * 
 * @author 刘毅
 * @createtime 2014/7/30
 * @lastupdate 2014/7/30
 */
public interface QueryService {
    public List<Query> findQuery(Query query, LoginUser kpiUser) throws RuntimeException;

    public List<Query> findQueryLastWeek(Query query, LoginUser kpiUser) throws RuntimeException;

    public List<Query> findQueryNotPaged(Query query, LoginUser kpiUser) throws RuntimeException;

    public List<Query> findQueryLastWeekNotPaged(Query query, LoginUser kpiUser) throws RuntimeException;

    public Integer saveQuery(Query query, LoginUser kpiUser) throws RuntimeException;

    public Integer moidfyQuery(Query query, LoginUser kpiUser) throws RuntimeException;

    public Integer removeQuery(Query query, LoginUser kpiUser) throws RuntimeException;

    public Query getQuery(Query query, LoginUser kpiUser) throws RuntimeException;

    public Query getQueryByNo(Query query, LoginUser kpiUser) throws RuntimeException;

    public Integer syncQuery(Query query, LoginUser kpiUser) throws RuntimeException;
}
