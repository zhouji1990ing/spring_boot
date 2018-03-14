package cn.com.konyo.keyword.dao;

import java.util.List;

import cn.com.konyo.keyword.domain.KeyWord;

/**
 * <Description> 关键词 <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年5月3日 <br>
 * @since V8.1<br>
 * @see cn.com.konyo.keyword.dao <br>
 */
public interface KeyWordDao {

    public Integer saveKeyWord(KeyWord keyWord) throws Exception;

    public Integer modifyKeyWord(KeyWord keyWord) throws Exception;

    public Integer removeKeyWord(KeyWord keyWord) throws Exception;

    public KeyWord checkKeyWord(KeyWord keyWord) throws Exception;

    public List<KeyWord> findKeyWords(KeyWord keyWord) throws Exception;

    public List<KeyWord> findKeyWordsNopage(KeyWord keyWord) throws Exception;

    public Integer saveKeyWordRel(KeyWord keyWord) throws Exception;

    public Integer removeKeyWordRel(KeyWord keyWord) throws Exception;

    public List<KeyWord> findKeyWordsRel(KeyWord keyWord) throws Exception;
}
