package cn.com.konyo.dictionary.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.dictionary.domian.Dictionary;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 字典Service接口
 * 
 * @author Hong Changgui
 */
public interface DictionaryService {

    public Integer saveDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Integer modifyDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Integer removeDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Integer removeDictionaryChild(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Dictionary checkDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Dictionary getDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public List<Dictionary> findDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public List<Dictionary> findDictionaryChild(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

    public Map<String, Object> findDictionaryNopage(Dictionary dictionary, LoginUser loginUser) throws RuntimeException;

}
