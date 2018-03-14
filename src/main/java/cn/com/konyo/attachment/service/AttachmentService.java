package cn.com.konyo.attachment.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import cn.com.konyo.attachment.domain.Attachment;
import cn.com.konyo.user.domain.LoginUser;

/**
 * 附件
 * 
 * @author bsh
 */
public interface AttachmentService {

    public List<Attachment> saveAttachment(Attachment attachment, MultipartFile[] files, LoginUser loginUser)
        throws RuntimeException;

    public int removeAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException;

    public int removeAtt(Attachment attachment, LoginUser loginUser) throws RuntimeException;

    public Attachment getAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException;

    public List<Attachment> findAttachment(Attachment attachment, LoginUser loginUser) throws RuntimeException;

    public List<Attachment> findAttachmentPage(Attachment attachment, LoginUser loginUser) throws RuntimeException;

    /**
     * 上传封面 例如 人物头像 视频封面等 该方法的路径不会保存到附件表，在文件上传成功之后， 路径会返回到页面，页面会在提交表单时一并保存至对应的主表里
     * 
     * @param filepath
     * @param files
     * @param loginUser
     * @return
     * @throws RuntimeException
     */
    public String uploadLogo(String filepath, MultipartFile[] files, LoginUser loginUser) throws RuntimeException;

    /**
     * 上传视频
     * 
     * @param filepath
     * @param files
     * @param loginUser
     * @return
     * @throws Exception
     */
    public String uploadVideo(String filepath, MultipartFile files, LoginUser loginUser) throws Exception;

    public String uploadQiniu(String filepath, MultipartFile[] files, LoginUser loginUser) throws RuntimeException;

    public String uploadQiniuUrl(String filepath) throws RuntimeException;

    public String uploadQiniuData(String data) throws RuntimeException;

    public String uploadWeixin(String filepath, LoginUser loginUser) throws RuntimeException;
}
