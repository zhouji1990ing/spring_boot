package cn.com.konyo.commoncontent.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.commoncontent.dao.CommonContentDao;
import cn.com.konyo.commoncontent.domain.CommonContent;
import cn.com.konyo.util.BaseDao;

/**
 * 公共文本Dao实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class CommonContentDaoImpl extends BaseDao implements CommonContentDao {

    /**
     * 保存公共文本
     */
    public Integer saveCommonContent(CommonContent commonContent) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveCommonContent", commonContent);
    }

    /**
     * 修改公共文本
     */
    public Integer modifyCommonContent(CommonContent commonContent) throws Exception {
        return getSqlSession().update("modifyCommonContent", commonContent);
    }

    /**
     * 修改公共文本发布状态
     */
    public Integer modifyCommonContentIsSync(CommonContent commonContent) throws Exception {
        return getSqlSession().update("modifyCommonContentIsSync", commonContent);
    }

    /**
     * 修改公共文本推荐状态
     */
    public Integer modifyCommonContentRecommend(CommonContent commonContent) throws Exception {
        return getSqlSession().update("modifyCommonContentRecommend", commonContent);
    }

    /**
     * 删除公共文本
     */
    public Integer removeCommonContent(CommonContent commonContent) throws Exception {
        return getSqlSession().update("removeCommonContent", commonContent);
    }

    /**
     * 获取单个公共文本
     */
    public CommonContent getCommonContent(CommonContent commonContent) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getCommonContent", commonContent);
    }

    /**
     * 获取公共文本(有分页)
     */
    public List<CommonContent> findCommonContents(CommonContent commonContent) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findCommonContentsCount", commonContent);
        if (count == 0)
            count = 1d;
        commonContent.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / commonContent.getPageSize());
        if (totalSize < commonContent.getPageNo()) {
            commonContent.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        commonContent.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<CommonContent> list = getSqlSession().selectList("findCommonContents", commonContent);
        return list;
    }

    /**
     * 获取公共文本(无分页)
     */
    public List<CommonContent> findCommonContentsNopage(CommonContent commonContent) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findCommonContentsNopage", commonContent);
    }

    public Integer addPv(CommonContent commonContent) throws Exception {
        return getSqlSession().update("addPv", commonContent);
    }

    public List<CommonContent> findCommonContentsRecommend(CommonContent commonContent) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findCommonContentsRecommendCount", commonContent);
        if (count == 0)
            count = 1d;
        commonContent.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / commonContent.getPageSize());
        if (totalSize < commonContent.getPageNo()) {
            commonContent.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        commonContent.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<CommonContent> list = getSqlSession().selectList("findCommonContentsRecommend", commonContent);
        return list;
    }

    /**
     * 批量修改分类
     */
    public Integer modifyCommonContentType(CommonContent commonContent) throws Exception {
        return getSqlSession().update("modifyCommonContentType", commonContent);
    }

}
