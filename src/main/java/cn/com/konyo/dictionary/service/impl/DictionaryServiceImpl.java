package cn.com.konyo.dictionary.service.impl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.dictionary.dao.DictionaryDao;
import cn.com.konyo.dictionary.domian.Dictionary;
import cn.com.konyo.dictionary.service.DictionaryService;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 字典 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryDao dictionaryDao;

    public DictionaryDao getDictionaryDao() {
        return dictionaryDao;
    }

    public void setDictionaryDao(DictionaryDao dictionaryDao) {
        this.dictionaryDao = dictionaryDao;
    }

    /**
     * 保存
     */
    public Integer saveDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Integer num = 0;
        try {
            dictionary.setCreateuser(loginUser.getUserId());
            dictionary.setCreatetime(new Date(System.currentTimeMillis()));
            num = dictionaryDao.saveDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifyDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Integer num = 0;
        try {
            dictionary.setModifyuser(loginUser.getUserId());
            dictionary.setModifytime(new Date(System.currentTimeMillis()));
            num = dictionaryDao.modifyDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除
     */
    public Integer removeDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Integer num = 0;
        try {
            num = dictionaryDao.removeDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除子类别
     */
    public Integer removeDictionaryChild(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Integer num = 0;
        try {
            num = dictionaryDao.removeDictionaryChild(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 验证重复
     */
    public Dictionary checkDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Dictionary _dictionary = new Dictionary();
        try {
            _dictionary = dictionaryDao.checkDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _dictionary;
    }

    /**
     * 获取单个
     */
    public Dictionary getDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        Dictionary _dictionary = new Dictionary();
        try {
            _dictionary = dictionaryDao.getDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _dictionary;
    }

    /**
     * 获取列表(有分页)
     */
    public List<Dictionary> findDictionary(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        List<Dictionary> list = null;
        try {
            list = dictionaryDao.findDictionary(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取子类别列表(有分页)
     */
    public List<Dictionary> findDictionaryChild(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        List<Dictionary> list = null;
        try {
            list = dictionaryDao.findDictionaryChild(dictionary);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 下拉列表接口
     */
    public Map<String, Object> findDictionaryNopage(Dictionary dictionary, LoginUser loginUser) throws RuntimeException {
        // TODO Auto-generated method stub
        Map<String, Object> map = new LinkedHashMap<String, Object>();
        try {
            List<Dictionary> list = dictionaryDao.findDictionaryChildNopage(dictionary);
            for (Dictionary d : list) {
                map.put(d.getValue(), d.getValue());
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return map;
    }

}
