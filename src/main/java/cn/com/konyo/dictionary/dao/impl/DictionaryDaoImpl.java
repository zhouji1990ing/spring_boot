package cn.com.konyo.dictionary.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.dictionary.dao.DictionaryDao;
import cn.com.konyo.dictionary.domian.Dictionary;
import cn.com.konyo.util.BaseDao;

/**
 * 字典DAO实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class DictionaryDaoImpl extends BaseDao implements DictionaryDao {

    /**
     * 保存
     */
    public Integer saveDictionary(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveDictionary", dictionary);
    }

    /**
     * 修改
     */
    public Integer modifyDictionary(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyDictionary", dictionary);
    }

    /**
     * 删除
     */
    public Integer removeDictionary(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeDictionary", dictionary);
    }

    /**
     * 删除子类别
     */
    public Integer removeDictionaryChild(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeDictionaryChild", dictionary);
    }

    /**
     * 验证重复
     */
    public Dictionary checkDictionary(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkDictionary", dictionary);
    }

    /**
     * 获取单个
     */
    public Dictionary getDictionary(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getDictionary", dictionary);
    }

    /**
     * 获取列表(有分页)
     */
    public List<Dictionary> findDictionary(Dictionary dictionary) throws Exception {
        Double count = getSqlSession().selectOne("findDictionaryCount", dictionary);
        if (count == null) {
            count = 1d;
        }
        // 总条数
        dictionary.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / dictionary.getPageSize());
        if (totalSize < dictionary.getPageNo()) {
            // 当前页数
            dictionary.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        // 总页数
        dictionary.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        return getSqlSession().selectList("findDictionary", dictionary);
    }

    /**
     * 获取子类别列表(有分页)
     */
    public List<Dictionary> findDictionaryChild(Dictionary dictionary) throws Exception {
        Double count = getSqlSession().selectOne("findDictionaryChildCount", dictionary);
        if (count == null) {
            count = 1d;
        }
        // 总条数
        dictionary.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / dictionary.getPageSize());
        if (totalSize < dictionary.getPageNo()) {
            // 当前页数
            dictionary.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        // 总页数
        dictionary.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        return getSqlSession().selectList("findDictionaryChild", dictionary);
    }

    /**
     * 获取列表(无分页)
     */
    public List<Dictionary> findDictionaryNopage(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findDictionaryNopage", dictionary);
    }

    /**
     * 获取子列表(无分页)
     */
    public List<Dictionary> findDictionaryChildNopage(Dictionary dictionary) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findDictionaryChildNopage", dictionary);
    }

}
