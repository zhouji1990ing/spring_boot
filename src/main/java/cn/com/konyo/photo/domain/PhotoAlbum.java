package cn.com.konyo.photo.domain;

import cn.com.konyo.core.BaseDomain;
import cn.com.konyo.util.Constants;

/**
 * 相册实体类
 * 
 * @author zhouji
 * @date 2015-2-26
 */
public class PhotoAlbum extends BaseDomain {

    /**
	 * 
	 */
    private static final long serialVersionUID = 1263055577555014377L;

    private Long albumid;

    private String photoname;

    private String filepath;

    private Integer ispublic;

    public Long getAlbumid() {
        return albumid;
    }

    public void setAlbumid(Long albumid) {
        this.albumid = albumid;
    }

    public String getPhotoname() {
        return photoname;
    }

    public void setPhotoname(String photoname) {
        this.photoname = photoname;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public Integer getIspublic() {
        return ispublic;
    }

    public void setIspublic(Integer ispublic) {
        this.ispublic = ispublic;
    }

    public String getLogoUrl() {
        return Constants.WEB_URL_SITE + filepath;
    }

}
