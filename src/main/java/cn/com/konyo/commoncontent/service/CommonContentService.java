package cn.com.konyo.commoncontent.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 公共文本 Service层
 * 
 * @author Hong Changgui
 */
public interface CommonContentService {

    public Integer saveCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer modifyCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer addPv(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer modifyCommonContentIsSync(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer modifyCommonContentType(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer modifyCommonContentRecommend(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException;

    public Integer removeCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public CommonContent getCommonContent(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public List<CommonContent> findCommonContents(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException;

    public List<CommonContent> findCommonContentsRecommend(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException;

    public List<CommonContent> findCommonContentsNopage(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException;

    public List<Map<Object, Object>> findCommonContentsView(CommonContent commonContent, LoginUser loginUser)
        throws RuntimeException;

    public String downImage(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

    public Integer importContentsWeixin(CommonContent commonContent, LoginUser loginUser) throws RuntimeException;

}
