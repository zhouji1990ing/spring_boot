package cn.com.konyo.video.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.konyo.attachment.service.AttachmentService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.video.dao.VideoDao;
import cn.com.konyo.video.domain.Video;
import cn.com.konyo.video.service.VideoService;

/**
 * 视频 service实现层
 * 
 * @author Hong Changgui
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoDao videoDao;

    @Autowired
    private AttachmentService attachmentService;

    public VideoDao getVideoDao() {
        return videoDao;
    }

    public void setVideoDao(VideoDao videoDao) {
        this.videoDao = videoDao;
    }

    public AttachmentService getAttachmentService() {
        return attachmentService;
    }

    public void setAttachmentService(AttachmentService attachmentService) {
        this.attachmentService = attachmentService;
    }

    /**
     * 保存视频
     */
    public Integer saveVideo(Video video, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            video.setCreateuser(loginUser.getUserId());
            video.setCreatetime(new Date(System.currentTimeMillis()));
            num = videoDao.saveVideo(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改视频
     */
    public Integer modifyVideo(Video video, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            video.setModifyuser(loginUser.getUserId());
            video.setModifytime(new Date(System.currentTimeMillis()));
            num = videoDao.modifyVideo(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改发布状态
     */
    public Integer modifyIsSync(Video video, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            if (video.getIssync() == 0) {
                video.setIssync(1);
            }
            else {
                video.setIssync(0);
            }
            video.setModifyuser(loginUser.getUserId());
            video.setModifytime(new Date(System.currentTimeMillis()));
            num = videoDao.modifyIsSync(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除视频
     */
    public Integer removeVideo(Video video, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = videoDao.removeVideo(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个视频
     */
    public Video getVideo(Video video, LoginUser loginUser) throws RuntimeException {
        Video _video = null;
        try {
            _video = videoDao.getVideo(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _video;
    }

    /**
     * 获取视频信息
     */
    public List<Video> findVideos(Video video, LoginUser loginUser) throws RuntimeException {
        List<Video> list = null;
        try {
            list = videoDao.findVideos(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取视频信息(没有分页)
     */
    public List<Video> findVideosNoPage(Video video, LoginUser loginUser) throws RuntimeException {
        List<Video> list = null;
        try {
            list = videoDao.findVideosNoPage(video);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

}
