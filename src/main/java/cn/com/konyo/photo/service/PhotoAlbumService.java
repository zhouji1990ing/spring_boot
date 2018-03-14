package cn.com.konyo.photo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.photo.domain.PhotoAlbum;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 相册 Service层
 * 
 * @author zhouji
 * @date 2015-2-26
 */
public interface PhotoAlbumService {

    public Integer savePhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public Integer modifyPhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public Integer modifyPhotoAlbumIsSync(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public Integer removePhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public PhotoAlbum getPhotoAlbum(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public List<PhotoAlbum> findPhotoAlbums(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    public String uploadPhotoAlbumLogo(String filepath, MultipartFile[] files, LoginUser loginUser)
        throws RuntimeException;

    public List<PhotoAlbum> findPhotoAlbumsWeixin(PhotoAlbum photoAlbum, LoginUser loginUser) throws RuntimeException;

    /**
     * 获取相册信息不分页（微信前端）
     */
    public List<PhotoAlbum> findPhotoAlbumsWeixinNoPage(PhotoAlbum photoAlbum, LoginUser loginUser)
        throws RuntimeException;

}
