package cn.com.konyo.member.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.NumberUtils;

import cn.com.konyo.member.dao.MemberDao;
import cn.com.konyo.member.domain.Member;
import cn.com.konyo.util.BaseDao;

@Repository
public class MemberDaoImpl extends BaseDao implements MemberDao {

    public int save(Member member) {
        return getSqlSession().insert("saveMember", member);
    }

    public List<Member> list(Member user) {
        Double count = getSqlSession().selectOne("findMemberCount", user);
        if (count == null) {
            count = 1d;
        }
        // 总条数
        user.setTotal(NumberUtils.convertNumberToTargetClass(count, Integer.class));
        Double totalSize = Math.ceil(count / user.getPageSize());
        if (totalSize < user.getPageNo()) {
            // 当前页数
            user.setPageNo(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        }
        // 总页数
        user.setPages(NumberUtils.convertNumberToTargetClass(totalSize, Integer.class));
        return getSqlSession().selectList("findMember", user);
    }

    public List<Member> listNopage(Member user) {
        return getSqlSession().selectList("findMemberNopage", user);
    }

    public int remove(Member member) {
        return getSqlSession().update("removeMember", member);
    }

    public int modifyToken(Member member) {
        return getSqlSession().update("modifyToken", member);
    }

    public int modify(Member member) {
        return getSqlSession().update("modifyMember", member);
    }

    public Member get(Member member) {
        return getSqlSession().selectOne("getMember", member);
    }

}
