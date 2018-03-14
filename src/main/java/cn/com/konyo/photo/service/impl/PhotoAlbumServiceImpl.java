package cn.com.konyo.photo.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.photo.dao.PhotoAlbumDao;
import cn.com.konyo.photo.domain.PhotoAlbum;
import cn.com.konyo.photo.service.PhotoAlbumService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.FilePathUtils;

/**
 * 相册 service实现层
 * 
 * @author zhouji
 * @date 2015-2-26
 */
@Service
public class PhotoAlbumServiceImpl implements PhotoAlbumService {

    @Autowired
    private PhotoAlbumDao photoAlbumDao;

    public PhotoAlbumDao getPhotoAlbumDao() {
        return photoAlbumDao;
    }

    public void setPhotoAlbumDao(PhotoAlbumDao photoAlbumDao) {
        this.photoAlbumDao = photoAlbumDao;
    }

    /**
     * 保存相册
     */
    public Integer savePhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            photoAlbum.setCreateuser(loginUser.getUserId());
            photoAlbum.setCreatetime(new Date(System.currentTimeMillis()));
            num = photoAlbumDao.savePhotoAlbum(photoAlbum);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改相册
     */
    public Integer modifyPhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            photoAlbum.setModifyuser(loginUser.getUserId());
            photoAlbum.setModifytime(new Date(System.currentTimeMillis()));
            num = photoAlbumDao.modifyPhotoAlbum(photoAlbum);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改发布状态
     */
    public Integer modifyPhotoAlbumIsSync(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            if (photoAlbum.getIspublic() == 0) {
                photoAlbum.setIspublic(1);
            }
            else {
                photoAlbum.setIspublic(0);
            }
            num = photoAlbumDao.modifyPhotoAlbumIsPublic(photoAlbum);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 删除相册
     */
    public Integer removePhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = photoAlbumDao.removePhotoAlbum(photoAlbum);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取单个相册
     */
    public PhotoAlbum getPhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        PhotoAlbum _photoAlbum = null;
        try {
            _photoAlbum = photoAlbumDao.getPhotoAlbum(photoAlbum);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return _photoAlbum;
    }

    /**
     * 获取相册信息
     */
    public List<PhotoAlbum> findPhotoAlbums(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        List<PhotoAlbum> list = null;
        try {
            list = photoAlbumDao.findPhotoAlbums(photoAlbum);

            // 文件路径
            /*
             * if(list != null && list.size() >0){ for (PhotoAlbum photoAlbum2 : list) { if(photoAlbum2.getFilepath() !=
             * null){ photoAlbum2.setFilepath(Constants.WEB_URL_SITE+photoAlbum2.getFilepath()); } } }
             */
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 上传照片
     */
    public String uploadPhotoAlbumLogo(String filepath, MultipartFile[] files, LoginUser loginUser)
        throws RuntimeException {
        String logopath = "";
        try {
            // eu.medsea.mimeutil.MimeUtil
            for (int i = 0, j = files.length; i < j; i++) {
                if (files[i].isEmpty()) {
                    continue;
                }
                String originalFilename = files[i].getOriginalFilename();

                int dot = originalFilename.lastIndexOf(".");

                String extension = "";

                if (dot > 0) {
                    extension = originalFilename.substring(dot, originalFilename.length());
                }

                StringBuffer filePath = new StringBuffer(filepath);
                File dir = new File(filePath.toString());// 文件保存路径
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // 新文件名
                filePath.append(UUID.randomUUID().toString()).append(extension);
                logopath = filePath.toString();
                File out = new File(filePath.toString());

                FileCopyUtils.copy(files[i].getBytes(), out);// 上传
                filePath.delete(0, filePath.length());

                // 验证上传是否成功
                if (out.exists() && out.length() > 0) {
                    // 将附件路径保存到数据库附件表中
                    logopath = FilePathUtils.getAbsoluteFilePath(logopath);
                }
                else {
                    logopath = "";
                }
            }
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logopath;
    }

    /**
     * 获取相册信息（微信前端）
     */
    public List<PhotoAlbum> findPhotoAlbumsWeixin(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException {
        List<PhotoAlbum> list = null;
        try {
            list = photoAlbumDao.findPhotoAlbums(photoAlbum);

            // 文件路径
            if (list != null && list.size() > 0) {
                for (PhotoAlbum photoAlbum2 : list) {
                    if (photoAlbum2.getFilepath() != null) {
                        photoAlbum2.setFilepath(Constants.WEB_URL_SITE + photoAlbum2.getFilepath());
                    }
                }
            }
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取相册信息不分页（微信前端）
     */
    public List<PhotoAlbum> findPhotoAlbumsWeixinNoPage(PhotoAlbum photoAlbum, LoginUser loginUser)
        throws RuntimeException {
        List<PhotoAlbum> list = null;
        try {
            list = photoAlbumDao.findPhotoAlbumsNoPage(photoAlbum);

            // 文件路径
            /*
             * if(list != null && list.size() >0){ for (PhotoAlbum photoAlbum2 : list) { if(photoAlbum2.getFilepath() !=
             * null){ photoAlbum2.setFilepath(Constants.WEB_URL_SITE+photoAlbum2.getFilepath()); } } }
             */
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
