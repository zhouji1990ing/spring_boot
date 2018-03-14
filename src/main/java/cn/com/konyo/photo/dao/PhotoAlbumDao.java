package cn.com.konyo.photo.dao;

import java.util.List;

import cn.com.konyo.photo.domain.PhotoAlbum;

/**
 * 相册 Dao层
 * 
 * @author zhouji
 * @date 2015-2-26
 */
public interface PhotoAlbumDao {

    public Integer savePhotoAlbum(PhotoAlbum photoAlbum) throws Exception;

    public Integer modifyPhotoAlbum(PhotoAlbum photoAlbum) throws Exception;

    public Integer modifyPhotoAlbumIsPublic(PhotoAlbum photoAlbum) throws Exception;

    public Integer removePhotoAlbum(PhotoAlbum photoAlbum) throws Exception;

    public PhotoAlbum getPhotoAlbum(PhotoAlbum photoAlbum) throws Exception;

    public List<PhotoAlbum> findPhotoAlbums(PhotoAlbum photoAlbum) throws Exception;

    public List<PhotoAlbum> findPhotoAlbumsNoPage(PhotoAlbum photoAlbum) throws Exception;
}
