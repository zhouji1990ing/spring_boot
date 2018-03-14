package cn.com.konyo.video.service;

import java.util.List;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.video.domain.Video;

/**
 * 视频 Service层
 * 
 * @author Hong Changgui
 */
public interface VideoService {

    public Integer saveVideo(Video video, LoginUser loginUser) throws RuntimeException;

    public Integer modifyVideo(Video video, LoginUser loginUser) throws RuntimeException;

    public Integer modifyIsSync(Video video, LoginUser loginUser) throws RuntimeException;

    public Integer removeVideo(Video video, LoginUser loginUser) throws RuntimeException;

    public Video getVideo(Video video, LoginUser loginUser) throws RuntimeException;

    public List<Video> findVideos(Video video, LoginUser loginUser) throws RuntimeException;

    public List<Video> findVideosNoPage(Video video, LoginUser loginUser) throws RuntimeException;
}
