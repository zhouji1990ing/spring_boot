package cn.com.konyo.commontext.service;

import java.util.List;

import cn.com.konyo.commontext.domain.CommonText;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 公共文本Service层
 * 
 * @author Hong Changgui
 */
public interface CommonTextService {

    public Integer saveCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException;

    public Integer modifyCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException;

    public Integer removeCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException;

    public CommonText getCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException;

    public CommonText checkCommonText(CommonText commonText, LoginUser loginUser) throws RuntimeException;

    public List<CommonText> findCommonTexts(CommonText commonText, LoginUser loginUser) throws RuntimeException;
}
