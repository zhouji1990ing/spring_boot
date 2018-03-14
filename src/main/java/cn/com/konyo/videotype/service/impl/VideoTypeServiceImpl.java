package cn.com.konyo.videotype.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.videotype.dao.VideoTypeDao;
import cn.com.konyo.videotype.domain.VideoType;
import cn.com.konyo.videotype.service.VideoTypeService;

/**
 * 视频类型 service层实现类
 * 
 * @author Hong Changgui
 */
@Service
public class VideoTypeServiceImpl implements VideoTypeService {

    @Autowired
    private VideoTypeDao videoTypeDao;

    public VideoTypeDao getVideoTypeDao() {
        return videoTypeDao;
    }

    public void setVideoTypeDao(VideoTypeDao videoTypeDao) {
        this.videoTypeDao = videoTypeDao;
    }

    /**
     * 保存
     */
    public Integer saveVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            videoType.setCreateuser(loginUser.getCreateuser());
            videoType.setCreatetime(new Date(System.currentTimeMillis()));
            num = videoTypeDao.saveVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer modifyVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            videoType.setCreateuser(loginUser.getCreateuser());
            videoType.setCreatetime(new Date(System.currentTimeMillis()));
            num = videoTypeDao.modifyVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除
     */
    public Integer removeVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = videoTypeDao.removeVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个
     */
    public VideoType getVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        VideoType _videoType = new VideoType();
        try {
            _videoType = videoTypeDao.getVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _videoType;
    }

    /**
     * 检查是否重复
     */
    public VideoType checkVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        VideoType _videoType = new VideoType();
        try {
            _videoType = videoTypeDao.checkVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _videoType;
    }

    /**
     * 获取列表(有分页)
     */
    public List<VideoType> findVideoType(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        List<VideoType> list = null;
        try {
            list = videoTypeDao.findVideoType(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取列表(无分页)
     */
    public List<VideoType> findVideoTypeNopage(VideoType videoType, LoginUser loginUser) throws RuntimeException {
        List<VideoType> list = null;
        try {
            list = videoTypeDao.findVideoTypeNopage(videoType);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
