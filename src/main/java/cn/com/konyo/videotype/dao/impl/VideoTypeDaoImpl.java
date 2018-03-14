package cn.com.konyo.videotype.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.util.BaseDao;
import cn.com.konyo.videotype.dao.VideoTypeDao;
import cn.com.konyo.videotype.domain.VideoType;

/**
 * 视频类型 DAO层实现
 * 
 * @author Hong Changgui
 */
@Repository
public class VideoTypeDaoImpl extends BaseDao implements VideoTypeDao {

    /**
     * 保存
     */
    public Integer saveVideoType(VideoType videoType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveVideoType", videoType);
    }

    /**
     * 修改
     */
    public Integer modifyVideoType(VideoType videoType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyVideoType", videoType);
    }

    /**
     * 删除
     */
    public Integer removeVideoType(VideoType videoType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("removeVideoType", videoType);
    }

    /**
     * 获取单个
     */
    public VideoType getVideoType(VideoType videoType) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getVideoType", videoType);
    }

    /**
     * 检查是否有重复
     */
    public VideoType checkVideoType(VideoType videoType) throws Exception {
        return getSqlSession().selectOne("checkVideoType", videoType);
    }

    /**
     * 获取列表(有分页)
     */
    public List<VideoType> findVideoType(VideoType videoType) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findVideoTypeCount", videoType);
        if (count == 0)
            count = 1d;
        videoType.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / videoType.getPageSize());
        if (totalSize < videoType.getPageNo()) {
            videoType.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        videoType.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<VideoType> list = getSqlSession().selectList("findVideoType", videoType);
        return list;
    }

    /**
     * 获取列表(无分页)
     */
    public List<VideoType> findVideoTypeNopage(VideoType videoType) throws Exception {
        // TODO Auto-generated method stub
        List<VideoType> list = getSqlSession().selectList("findVideoTypeNopage", videoType);
        return list;
    }

}
