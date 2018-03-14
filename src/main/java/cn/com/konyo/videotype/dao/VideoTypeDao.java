package cn.com.konyo.videotype.dao;

import java.util.List;

import cn.com.konyo.videotype.domain.VideoType;

/**
 * 视频类型 DAO层接口
 * 
 * @author Hong Changgui
 */
public interface VideoTypeDao {

    public Integer saveVideoType(VideoType videoType) throws Exception;

    public Integer modifyVideoType(VideoType videoType) throws Exception;

    public Integer removeVideoType(VideoType videoType) throws Exception;

    public VideoType getVideoType(VideoType videoType) throws Exception;

    public VideoType checkVideoType(VideoType videoType) throws Exception;

    public List<VideoType> findVideoType(VideoType videoType) throws Exception;

    public List<VideoType> findVideoTypeNopage(VideoType videoType) throws Exception;

}
