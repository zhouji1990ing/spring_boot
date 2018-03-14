package cn.com.konyo.commontext.dao;

import java.util.List;

import cn.com.konyo.commontext.domain.CommonText;

/**
 * 公共文本Dao层
 * 
 * @author Hong Changgui
 */
public interface CommonTextDao {

    public Integer saveCommonText(CommonText commonText) throws Exception;

    public Integer modifyCommonText(CommonText commonText) throws Exception;

    public Integer removeCommonText(CommonText commonText) throws Exception;

    public CommonText getCommonText(CommonText commonText) throws Exception;

    public CommonText checkCommonText(CommonText commonText) throws Exception;

    public List<CommonText> findCommonTexts(CommonText commonText) throws Exception;
}
