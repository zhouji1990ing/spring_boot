package cn.com.konyo.photo.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.photo.dao.PhotoAlbumDao;
import cn.com.konyo.photo.domain.PhotoAlbum;
import cn.com.konyo.util.BaseDao;

/**
 * 相册 Dao实现层
 * 
 * @author zhouji
 * @date 2015-2-26
 */
@Repository
public class PhotoAlbumDaoImpl extends BaseDao implements PhotoAlbumDao {

    /**
     * 保存相册
     */
    public Integer savePhotoAlbum(PhotoAlbum photoAlbum) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().insert("savePhotoAlbum", photoAlbum);
    }

    /**
     * 修改相册
     */
    public Integer modifyPhotoAlbum(PhotoAlbum photoAlbum) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyPhotoAlbum", photoAlbum);
    }

    /**
     * 修改发布状态
     */
    public Integer modifyPhotoAlbumIsPublic(PhotoAlbum photoAlbum) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().update("modifyPhotoAlbumIsPublic", photoAlbum);
    }

    /**
     * 删除相册
     */
    public Integer removePhotoAlbum(PhotoAlbum photoAlbum) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().delete("removePhotoAlbum", photoAlbum);
    }

    /**
     * 获取单个相册
     */
    public PhotoAlbum getPhotoAlbum(PhotoAlbum photoAlbum) throws Exception {
        // TODO Auto-generated method stub
        return getSqlSession().selectOne("getOnePhotoAlbum", photoAlbum);
    }

    /**
     * 获取相册信息
     */
    public List<PhotoAlbum> findPhotoAlbums(PhotoAlbum photoAlbum) throws Exception {
        Double count = (Double) getSqlSession().selectOne("findPhotoAlbumsCount", photoAlbum);
        if (count == 0)
            count = 1d;
        photoAlbum.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / photoAlbum.getPageSize());
        if (totalSize < photoAlbum.getPageNo()) {
            photoAlbum.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        photoAlbum.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<PhotoAlbum> list = getSqlSession().selectList("findPhotoAlbums", photoAlbum);
        return list;
    }

    public List<PhotoAlbum> findPhotoAlbumsNoPage(PhotoAlbum photoAlbum) throws Exception {
        List<PhotoAlbum> list = getSqlSession().selectList("findPhotoAlbumsNoPage", photoAlbum);
        return list;
    }
}
