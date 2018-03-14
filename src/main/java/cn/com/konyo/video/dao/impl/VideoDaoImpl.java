package cn.com.konyo.video.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.util.BaseDao;
import cn.com.konyo.video.dao.VideoDao;
import cn.com.konyo.video.domain.Video;

/**
 * 视频 Dao实现层
 * 
 * @author Hong Changgui
 */
@Repository
public class VideoDaoImpl extends BaseDao implements VideoDao {

    /**
     * 保存视频
     */
    public Integer saveVideo(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("saveVideo", video);
    }

    /**
     * 修改视频
     */
    public Integer modifyVideo(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyVideo", video);
    }

    /**
     * 修改发布状态
     */
    public Integer modifyIsSync(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyVideoIsSync", video);
    }

    /**
     * 删除视频
     */
    public Integer removeVideo(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removeVideo", video);
    }

    /**
     * 获取单个视频
     */
    public Video getVideo(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getOneVideo", video);
    }

    /**
     * 获取视频信息
     */
    public List<Video> findVideos(Video video) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findVideosCount", video);
        if (count == 0)
            count = 1d;
        video.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / video.getPageSize());
        if (totalSize < video.getPageNo()) {
            video.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        video.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Video> list = getSqlSession().selectList("findVideos", video);
        return list;
    }

    /**
     * 获取视频信息(没有分页)
     */
    public List<Video> findVideosNoPage(Video video) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectList("findVideosNoPage", video);
    }

}
