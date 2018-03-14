package cn.com.konyo.attachment.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.attachment.dao.AttachmentDao;
import cn.com.konyo.attachment.domain.Attachment;
import cn.com.konyo.util.BaseDao;

@Repository
public class AttachmentDaoImpl extends BaseDao implements AttachmentDao {

    public int saveAttachment(Attachment attachment) {
        return getSqlSession().insert("saveAttachment", attachment);
    }

    public int removeAttachment(Attachment attachment) {
        return getSqlSession().update("removeAttachment", attachment);
    }

    public int removeAtt(Attachment attachment) {
        return getSqlSession().update("removeAtt", attachment);
    }

    public Attachment getAttachment(Attachment attachment) {
        return getSqlSession().selectOne("getAttachment", attachment);
    }

    public List<Attachment> findAttachment(Attachment attachment) {
        return getSqlSession().selectList("findAttachment", attachment);
    }

    /**
     * 获取附件列表（有分页）
     */
    public List<Attachment> findAttachmentPage(Attachment attachment) {
        Double count = (Double) getSqlSession().selectOne("findAttachmentPageCount", attachment);
        if (count == 0)
            count = 1d;
        attachment.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / attachment.getPageSize());
        if (totalSize < attachment.getPageNo()) {
            attachment.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        attachment.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        List<Attachment> list = getSqlSession().selectList("findAttachmentPage", attachment);
        return list;
    }

}
