package cn.com.konyo.attachment.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

import cn.com.konyo.attachment.dao.AttachmentDao;
import cn.com.konyo.attachment.domain.Attachment;
import cn.com.konyo.attachment.service.AttachmentService;
import cn.com.konyo.member.domain.Member;
import cn.com.konyo.member.service.MemberService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.FilePathUtils;
import cn.com.konyo.util.WeixinUtil;

@Service
public class AttachmentServiceImpl implements AttachmentService {

    private static final Logger logger = LoggerFactory.getLogger(AttachmentServiceImpl.class);

    @Autowired
    private AttachmentDao attachmentDao;

    @Autowired
    private MemberService memberService;

    public AttachmentDao getAttachmentDao() {
        return attachmentDao;
    }

    public void setAttachmentDao(AttachmentDao attachmentDao) {
        this.attachmentDao = attachmentDao;
    }

    public MemberService getMemberService() {
        return memberService;
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }

    /**
     * 上传附件
     */
    public List<Attachment> saveAttachment(Attachment attachment, MultipartFile[] files, LoginUser loginUser)
        throws RuntimeException {
        List<Attachment> list = new ArrayList<Attachment>();
        try {
            // eu.medsea.mimeutil.MimeUtil
            logger.info("Service Start AttachmentServiceImpl->saveAttachment");
            for (int i = 0, j = files.length; i < j; i++) {
                Attachment domain = new Attachment();
                domain.setAttachmentId(UUID.randomUUID().toString());
                domain.setDeleted(0);
                domain.setCreateuser(loginUser.getUserId());
                domain.setCreatetime(new Date(System.currentTimeMillis()));
                if (files[i].isEmpty()) {
                    continue;
                }
                String originalFilename = files[i].getOriginalFilename();
                domain.setFileName(originalFilename);// 原文件名
                int dot = originalFilename.lastIndexOf(".");
                String extension = "";
                if (dot > 0) {
                    extension = originalFilename.substring(dot, originalFilename.length());
                }
                domain.setModule(attachment.getModule());
                domain.setEntity(attachment.getEntity());
                domain.setEntityAttribute(attachment.getEntityAttribute());
                domain.setLogoUrl(attachment.getLogoUrl());
                String contentType = files[i].getContentType();
                domain.setFileType(contentType);// TODO 文件类型 使用配置文件读取设置

                domain.setFileSize(files[i].getSize());// 文件大小

                StringBuffer filePath = new StringBuffer(attachment.getFilePath());
                File dir = new File(filePath.toString());// 文件保存路径
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                // 新文件名
                filePath.append(UUID.randomUUID().toString()).append(extension);

                domain.setFilePath(filePath.toString());

                File out = new File(filePath.toString());

                FileCopyUtils.copy(files[i].getBytes(), out);// 上传
                filePath.delete(0, filePath.length());

                // 验证上传是否成功
                if (out.exists() && out.length() > 0) {
                    logger.info("upload file absolute path : {}", out.getAbsolutePath());
                    // 将附件路径保存到数据库附件表中
                    attachmentDao.saveAttachment(domain);// 记录数据库
                    domain.setFilePath(FilePathUtils.getAbsoluteFilePath(domain.getFilePath()));

                    list.add(domain);
                }
            }
            logger.info("Service End AttachmentServiceImpl->saveAttachment");
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->saveAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 删除附件
     */
    public int removeAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException {
        int result = 0;
        try {
            attachment.setDeleted(1);
            attachment.setModifytime(new Date(System.currentTimeMillis()));
            attachment.setModifyuser(loginUser.getUserId());

            result = attachmentDao.removeAttachment(attachment);
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->removeAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return result;
    }

    /**
     * 删除附件（实现批量删除或者单个删除）
     */
    public int removeAtt(Attachment attachment, LoginUser loginUser) throws RuntimeException {
        int result = 0;
        try {
            attachment.setDeleted(1);
            attachment.setModifytime(new Date(System.currentTimeMillis()));
            attachment.setModifyuser(loginUser.getUserId());

            result = attachmentDao.removeAtt(attachment);
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->removeAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return result;
    }

    /**
     * 查找单个实体附件
     * 
     * @param attachment 附件
     * @param loginUser 当前登陆用户
     * @return 附件信息
     * @throws RuntimeException
     */
    public Attachment getAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException {
        try {
            logger.info("Service Start AttachmentServiceImpl->getAttachment");
            attachment = attachmentDao.getAttachment(attachment);
            logger.info("Service End AttachmentServiceImpl->getAttachment");
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->getAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return attachment;

    }

    /**
     * 根据 模块module 和 实体entity 查找上传附件列表
     */
    public List<Attachment> findAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException {
        List<Attachment> list = new ArrayList<Attachment>();
        try {

            list = attachmentDao.findAttachment(attachment);
            logger.info("Service End AttachmentServiceImpl->findAttachment");
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->findAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return list;
    }

    /**
     * 根据 模块module 和 实体entity 查找上传附件列表(有分页)
     */
    public List<Attachment> findAttachmentPage(Attachment attachment, LoginUser loginUser) throws RuntimeException {
        List<Attachment> list = new ArrayList<Attachment>();
        try {

            list = attachmentDao.findAttachmentPage(attachment);
            logger.info("Service End AttachmentServiceImpl->findAttachment");
        }
        catch (Exception e) {
            logger.error("Service Error AttachmentServiceImpl->findAttachment ; {}", e.getMessage());
            throw new RuntimeException(e);
        }
        return list;
    }

    // list<String>

    /**
     * 上传封面 例如 人物头像 视频封面等 该方法的路径不会保存到附件表，在文件上传成功之后， 路径会返回到页面，页面会在提交表单时一并保存至对应的主表里
     */
    public String uploadLogo(String filepath, MultipartFile[] files, LoginUser loginUser) throws RuntimeException {
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
                    // 将附件路径返回
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
     * 上传视频
     */
    public String uploadVideo(String filepath, MultipartFile file, LoginUser loginUser) throws Exception {
        String logopath = "";

        if (file != null && !file.isEmpty()) {

            String originalFilename = file.getOriginalFilename();

            int dot = originalFilename.lastIndexOf(".");

            String extension = "";

            if (dot > 0) {
                extension = originalFilename.substring(dot, originalFilename.length());
            }

            StringBuffer filePath = new StringBuffer(filepath);
            File dir = new File(filePath.toString());// 文件保存路径
            if (!dir.exists()) {
            }

            filePath.append(UUID.randomUUID().toString()).append(extension);
            logopath = filePath.toString();

            DataOutputStream out = null;
            InputStream is = null;
            try {
                out = new DataOutputStream(new FileOutputStream(filePath.toString()));
                is = file.getInputStream();
                byte[] buffer = new byte[1024];
                while (is.read(buffer) > 0) {
                    out.write(buffer);
                }
                logopath = FilePathUtils.getAbsoluteFilePath(logopath);
            }
            catch (IOException e) {
                throw new RuntimeException(e);
            }
            finally {
                if (is != null) {
                    is.close();
                }
                if (out != null) {
                    out.close();
                }
            }

        }

        return logopath;
    }

    public String uploadQiniu(String filepath, MultipartFile[] files, LoginUser loginUser) throws RuntimeException {
        String logopath = "";
        try {
            // eu.medsea.mimeutil.MimeUtil
            for (int i = 0, j = files.length; i < j; i++) {
                if (files[i].isEmpty()) {
                    continue;
                }

                String accessKey = Constants.QINIU_ACCESS_KEY;
                String secretKey = Constants.QINIU_SECRET_KEY;
                String bucketName = Constants.QINIU_BUCKET;
                String key = UUID.randomUUID().toString();
                UploadManager uploadManager = new UploadManager();
                Auth auth = Auth.create(accessKey, secretKey);
                String token = auth.uploadToken(bucketName);
                Response r = uploadManager.put(files[i].getBytes(), key, token);
                System.out.println(r.toString());
                if (r.statusCode == 200) {
                    logopath = key;
                }
                else {
                    logopath = "";
                }

                System.out.println(r.url());

            }
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logopath;
    }

    public String uploadWeixin(String filepath, LoginUser loginUser) throws RuntimeException {
        String logopath = "";
        try {
            Member member = new Member();
            member.setOriginalId(Constants.WEIXIN_TEST_ORIGINAL_ID);
            Map<String, Object> tmap = memberService.modifyToken(member, loginUser);
            if (tmap.get("errcode").toString() == "0") {
                String token = tmap.get("token").toString();
                Map<String, Object> back = WeixinUtil.add_material(token, filepath, "image");
                if (back.containsKey("media_id")) {
                    logopath = back.get("media_id").toString();
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

    public String uploadQiniuUrl(String link) throws RuntimeException {
        String logopath = "";
        try {
            // new一个URL对象
            URL url = new URL(link);
            // 打开链接
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // 设置请求方式为"GET"
            conn.setRequestMethod("GET");
            // 超时响应时间为5秒
            conn.setConnectTimeout(5 * 1000);
            // 通过输入流获取图片数据
            InputStream inStream = conn.getInputStream();
            // 得到图片的二进制数据，以二进制封装得到数据，具有通用性
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            // 创建一个Buffer字符串
            byte[] buffer = new byte[1024];
            // 每次读取的字符串长度，如果为-1，代表全部读取完毕
            int len = 0;
            // 使用一个输入流从buffer里把数据读取出来
            while ((len = inStream.read(buffer)) != -1) {
                // 用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
                outStream.write(buffer, 0, len);
            }
            // 关闭输入流
            inStream.close();
            // 把outStream里的数据写入内存
            byte[] data = outStream.toByteArray();

            String accessKey = Constants.QINIU_ACCESS_KEY;
            String secretKey = Constants.QINIU_SECRET_KEY;
            String bucketName = Constants.QINIU_BUCKET;
            String key = UUID.randomUUID().toString();
            UploadManager uploadManager = new UploadManager();
            Auth auth = Auth.create(accessKey, secretKey);

            String token = auth.uploadToken(bucketName);
            Response r = uploadManager.put(data, key, token);
            // System.out.println(r.toString());
            if (r.statusCode == 200) {
                logopath = key;
            }
            else {
                logopath = "";
            }

            System.out.println(r.url());

        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logopath;
    }

    public String uploadQiniuData(String data) throws RuntimeException {
        String logopath = "";
        try {

            String accessKey = Constants.QINIU_ACCESS_KEY;
            String secretKey = Constants.QINIU_SECRET_KEY;
            String bucketName = Constants.QINIU_BUCKET;
            String key = UUID.randomUUID().toString();
            UploadManager uploadManager = new UploadManager();
            Auth auth = Auth.create(accessKey, secretKey);

            String token = auth.uploadToken(bucketName);
            Response r = uploadManager.put(data, key, token);
            // System.out.println(r.toString());
            if (r.statusCode == 200) {
                logopath = key;
            }
            else {
                logopath = "";
            }

        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logopath;
    }
}
