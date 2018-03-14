package cn.com.konyo.videotype.service;

import java.util.List;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.videotype.domain.VideoType;

/**
 * 视频类型 service层接口
 * 
 * @author Hong Changgui
 */
public interface VideoTypeService {

    public Integer saveVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public Integer modifyVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public Integer removeVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public VideoType getVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public VideoType checkVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public List<VideoType> findVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException;

    public List<VideoType> findVideoTypeNopage(VideoType videoType, LoginUser loginUser) throws RuntimeException;
}
