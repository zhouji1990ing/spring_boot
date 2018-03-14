package cn.com.konyo.commoncontent.dao;

import java.util.List;

import cn.com.konyo.commoncontent.domain.CommonContent;

/**
 * 公共文本DAO层接口
 * 
 * @author Hong Changgui
 */
public interface CommonContentDao {

    public Integer saveCommonContent(CommonContent commonContent) throws Exception;

    public Integer modifyCommonContent(CommonContent commonContent) throws Exception;

    public Integer addPv(CommonContent commonContent) throws Exception;

    public Integer modifyCommonContentIsSync(CommonContent commonContent) throws Exception;

    public Integer modifyCommonContentType(CommonContent commonContent) throws Exception;

    public Integer modifyCommonContentRecommend(CommonContent commonContent) throws Exception;

    public Integer removeCommonContent(CommonContent commonContent) throws Exception;

    public CommonContent getCommonContent(CommonContent commonContent) throws Exception;

    public List<CommonContent> findCommonContents(CommonContent commonContent) throws Exception;

    public List<CommonContent> findCommonContentsRecommend(CommonContent commonContent) throws Exception;

    public List<CommonContent> findCommonContentsNopage(CommonContent commonContent) throws Exception;
}
