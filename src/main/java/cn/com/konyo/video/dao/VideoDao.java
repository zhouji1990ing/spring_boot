package cn.com.konyo.video.dao;

import java.util.List;

import cn.com.konyo.video.domain.Video;

/**
 * 视频 Dao层
 * 
 * @author Hong Changgui
 */
public interface VideoDao {

    public Integer saveVideo(Video video) throws Exception;

    public Integer modifyVideo(Video video) throws Exception;

    public Integer modifyIsSync(Video video) throws Exception;

    public Integer removeVideo(Video video) throws Exception;

    public Video getVideo(Video video) throws Exception;

    public List<Video> findVideos(Video video) throws Exception;

    public List<Video> findVideosNoPage(Video video) throws Exception;

}
