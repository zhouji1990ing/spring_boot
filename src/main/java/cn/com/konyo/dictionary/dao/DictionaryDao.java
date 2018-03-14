package cn.com.konyo.dictionary.dao;

import java.util.List;

import cn.com.konyo.dictionary.domian.Dictionary;

/**
 * 字典DAO层接口
 * 
 * @author Hong Changgui
 */
public interface DictionaryDao {

    public Integer saveDictionary(Dictionary dictionary) throws Exception;

    public Integer modifyDictionary(Dictionary dictionary) throws Exception;

    public Integer removeDictionary(Dictionary dictionary) throws Exception;

    public Integer removeDictionaryChild(Dictionary dictionary) throws Exception;

    public Dictionary checkDictionary(Dictionary dictionary) throws Exception;

    public Dictionary getDictionary(Dictionary dictionary) throws Exception;

    public List<Dictionary> findDictionary(Dictionary dictionary) throws Exception;

    public List<Dictionary> findDictionaryChild(Dictionary dictionary) throws Exception;

    public List<Dictionary> findDictionaryNopage(Dictionary dictionary) throws Exception;

    public List<Dictionary> findDictionaryChildNopage(Dictionary dictionary) throws Exception;

}
