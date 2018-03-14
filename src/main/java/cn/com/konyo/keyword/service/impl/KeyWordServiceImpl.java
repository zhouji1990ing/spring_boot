package cn.com.konyo.keyword.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.keyword.dao.KeyWordDao;
import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.keyword.service.KeyWordService;
import cn.com.konyo.user.domain.LoginUser;

/***
 * <Description>关键词 <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年5月3日 <br>
 * @since V8.1<br>
 * @see cn.com.konyo.keyword.service.impl <br>
 */
@Service
public class KeyWordServiceImpl implements KeyWordService {

    @Autowired
    private KeyWordDao keyWordDao;

    public KeyWordDao getKeyWordDao() {
        return keyWordDao;
    }

    public void setKeyWordDao(KeyWordDao keyWordDao) {
        this.keyWordDao = keyWordDao;
    }

    /**
     * 保存主菜单类型
     */
    public Integer saveKeyWord(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            keyWord.setCreateuser(loginUser.getUserId());
            keyWord.setCreatetime(new Date(System.currentTimeMillis()));
            num = keyWordDao.saveKeyWord(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改主菜单类型
     */
    public Integer modifyKeyWord(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            keyWord.setModifyuser(loginUser.getUserId());
            keyWord.setModifytime(new Date(System.currentTimeMillis()));
            num = keyWordDao.modifyKeyWord(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除主菜单类型
     */
    public Integer removeKeyWord(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            keyWord.setModifyuser(loginUser.getUserId());
            keyWord.setModifytime(new Date(System.currentTimeMillis()));
            num = keyWordDao.removeKeyWord(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 检查主菜单类型是否重复
     */
    public KeyWord checkKeyWord(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        KeyWord _keyWord = null;
        try {
            _keyWord = keyWordDao.checkKeyWord(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _keyWord;
    }

    /**
     * 获取主菜单类型信息
     */
    public List<KeyWord> findKeyWords(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        List<KeyWord> list = null;
        try {
            list = keyWordDao.findKeyWords(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取主菜单类型信息（无分页）
     */
    public List<KeyWord> findKeyWordsNopage(KeyWord keyWord, LoginUser loginUser) throws RuntimeException {
        List<KeyWord> list = null;
        try {
            list = keyWordDao.findKeyWordsNopage(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public List<KeyWord> findKeyWordsRel(KeyWord keyWord) throws RuntimeException {
        List<KeyWord> list = null;
        try {
            list = keyWordDao.findKeyWordsRel(keyWord);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
