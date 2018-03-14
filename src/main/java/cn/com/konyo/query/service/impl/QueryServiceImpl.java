package cn.com.konyo.query.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.query.dao.QueryDao;
import cn.com.konyo.query.domain.Query;
import cn.com.konyo.query.service.QueryService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.DateTimeUtils;

/**
 * 前沿观点 Service 实现类
 * 
 * @author 刘毅
 * @createtime 2014/7/30
 * @lastupdate 2014/7/30
 */
@Service
public class QueryServiceImpl implements QueryService {

    @Autowired
    private QueryDao queryDao;

    public QueryDao getQueryDao() {
        return queryDao;
    }

    public void setQueryDao(QueryDao queryDao) {
        this.queryDao = queryDao;
    }

    /**
     * 获取列表 分页
     */
    public List<Query> findQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        List<Query> list = null;
        try {
            query.setDeleted(0);
            list = queryDao.findQuery(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取上周往期 观点列表 分页
     */
    public List<Query> findQueryLastWeek(Query query, LoginUser kpiUser) throws RuntimeException {
        List<Query> list = null;
        try {
            query.setDeleted(0);
            list = queryDao.findQueryLastWeek(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取列表 分页
     */
    public List<Query> findQueryNotPaged(Query query, LoginUser kpiUser) throws RuntimeException {
        List<Query> list = null;
        try {
            list = queryDao.findQueryNotPaged(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 获取上周往期 观点列表 不分页
     */
    public List<Query> findQueryLastWeekNotPaged(Query query, LoginUser kpiUser) throws RuntimeException {
        List<Query> list = null;
        try {
            query.setDeleted(0);
            list = queryDao.findQueryLastWeekNotPaged(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 保存
     */
    public Integer saveQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        Integer num = 0;
        try {

            query.setCreateUser(kpiUser.getUserId());
            query.setCreateTime(new Date(System.currentTimeMillis()));

            num = queryDao.saveQuery(query);

        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 修改
     */
    public Integer moidfyQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        Integer num = 0;
        try {

            query.setModifyTime(new Date());
            query.setModifyUser(kpiUser.getUserId());
            if (query.getPublishDateStr() != null) {
                query.setPublishDate(new Date(DateTimeUtils.parseDate(query.getPublishDateStr())));
            }

            MultipartFile file = (MultipartFile) query.getParams().get("file");
            if (file == null || file.isEmpty()) {
                num = queryDao.moidfyQuery(query);
            }
            else {

                String originalFileName = file.getOriginalFilename();
                int dot = originalFileName.lastIndexOf(".");
                String extension = "";
                // String contentType = file.getContentType();
                long fileSize = file.getSize();
                // 文件的大小超过最大限制大小时
                if (fileSize > Constants.UPLOAD_FRONT_VIEW_COVER_MAX_SIZE * 1024) {
                    num = -1;
                    return num;
                }

                // 获取文件后缀
                if (dot > 0) {
                    extension = originalFileName.substring(dot, originalFileName.length());
                }
                // 验证文件格式
                System.out.println(extension);
                if (!extension.equals(".jpg") && !extension.equals(".png") && extension != ".bmp") {
                    num = -2;
                    return num;
                }
                String filePath = Constants.UPLOAD_FILE_SAVE_PATH
                    + Constants.UPLAOD_IMAGES_FILE_FRONT_NEW_COVER_SAVE_PATH;
                // 判断目录是否存在，若不存在，新建一个
                File dir = new File(filePath);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // 新的文件名
                filePath = filePath + UUID.randomUUID().toString() + extension;

                // 移动文件到指定目录
                File out = new File(filePath);
                FileCopyUtils.copy(file.getBytes(), out);

                // 保存成功
                if (out.exists() && out.length() > 0) {
                    num = queryDao.moidfyQuery(query);
                }

            }

        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
	 * 
	 */
    public Integer removeQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = queryDao.removeQuery(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

    /**
     * 获取实体信息
     */
    public Query getQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        Query gr = null;
        try {
            gr = queryDao.getQuery(query);

        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return gr;
    }

    /**
     * 根据编号获取实体信息
     */
    public Query getQueryByNo(Query query, LoginUser kpiUser) throws RuntimeException {
        Query gr = null;
        try {
            gr = queryDao.getQueryByNo(query);

        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return gr;
    }

    /**
     * 同步（上线下线操作）
     */
    public Integer syncQuery(Query query, LoginUser kpiUser) throws RuntimeException {
        Integer num = 0;
        try {
            num = queryDao.syncQuery(query);
        }
        catch (Throwable e) {
            throw new RuntimeException(e);
        }
        return num;
    }

}
