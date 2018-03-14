package cn.com.konyo.util;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 公用的DAO
 * 
 * @author zhou.ji
 */

public abstract class BaseDao extends SqlSessionDaoSupport {

    /**
     * Autowired 必须要有
     */
    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {

        super.setSqlSessionFactory(sqlSessionFactory);
    }

}