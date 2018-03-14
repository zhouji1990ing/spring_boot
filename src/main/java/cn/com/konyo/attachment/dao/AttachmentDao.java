package cn.com.konyo.attachment.dao;

import java.util.List;

import cn.com.konyo.attachment.domain.Attachment;

public interface AttachmentDao {

    public int saveAttachment(Attachment attachment);

    public int removeAttachment(Attachment attachment);

    public int removeAtt(Attachment attachment);

    public Attachment getAttachment(Attachment attachment);

    public List<Attachment> findAttachment(Attachment attachment);

    public List<Attachment> findAttachmentPage(Attachment attachment);
}
