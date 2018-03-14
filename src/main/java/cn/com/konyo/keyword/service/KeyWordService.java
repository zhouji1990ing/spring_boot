package cn.com.konyo.keyword.service;

import java.util.List;

import cn.com.konyo.keyword.domain.KeyWord;
import cn.com.konyo.user.domain.LoginUser;

/**
 * <Description>关键词 <br>
 * 
 * @author zhou.ji<br>
 * @version 1.0<br>
 * @taskId <br>
 * @CreateDate 2017年5月3日 <br>
 * @since V8.1<br>
 * @see cn.com.konyo.keyword.service <br>
 */
public interface KeyWordService {

    public Integer saveKeyWord(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public Integer modifyKeyWord(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public Integer removeKeyWord(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public KeyWord checkKeyWord(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public List<KeyWord> findKeyWords(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public List<KeyWord> findKeyWordsNopage(KeyWord KeyWord, LoginUser loginUser) throws RuntimeException;

    public List<KeyWord> findKeyWordsRel(KeyWord keyWord) throws RuntimeException;
}
