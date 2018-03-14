package cn.com.konyo.keyword.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.keyword.dao.KeyWordDao;
import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.util.BaseDao;

/**
 * <Description> 关键词<br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年5月3日 <br>
 * @since V8.1<br>
 * @see cn.com.konyo.keyword.dao.impl <br>
 */
@Repository
public class KeyWordDaoImpl extends BaseDao implements KeyWordDao {

    /**
     * 保存关键词
     */
    public Integer saveKeyWord(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveKeyWord", KeyWord);
    }

    /**
     * 修改关键词
     */
    public Integer modifyKeyWord(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyKeyWord", KeyWord);
    }

    /**
     * 删除关键词
     */
    public Integer removeKeyWord(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeKeyWord", KeyWord);
    }

    /**
     * 检查关键词是否重复
     */
    public KeyWord checkKeyWord(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("checkKeyWord", KeyWord);
    }

    /**
     * 获取主菜单类型(有分页)
     */
    public List<KeyWord> findKeyWords(KeyWord KeyWord) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findKeyWordsCount", KeyWord);
        if (count == 0)
            count = 1d;
        KeyWord.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / KeyWord.getPageSize());
        if (totalSize < KeyWord.getPageNo()) {
            KeyWord.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        KeyWord.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<KeyWord> list = getSqlSession().selectList("findKeyWords", KeyWord);
        return list;
    }

    /**
     * 获取主菜单类型(无分页)
     */
    public List<KeyWord> findKeyWordsNopage(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findKeyWordsNopage", KeyWord);
    }

    /**
     * 保存关键词关系
     */
    public Integer saveKeyWordRel(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveKeyWordRel", KeyWord);
    }

    /**
     * 修改关键词关系
     */
    public Integer removeKeyWordRel(KeyWord KeyWord) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removeKeyWordRel", KeyWord);
    }

    public List<KeyWord> findKeyWordsRel(KeyWord keyWord) throws Exception {
        List<KeyWord> list = getSqlSession().selectList("findKeyWordsRel", keyWord);
        return list;
    }
}
