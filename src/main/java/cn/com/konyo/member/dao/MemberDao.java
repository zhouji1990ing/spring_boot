package cn.com.konyo.member.dao;

import java.util.List;

import cn.com.konyo.member.domain.Member;

public interface MemberDao {

    public int save(Member member);

    public int modifyToken(Member member);

    public List<Member> list(Member member);

    public List<Member> listNopage(Member member);

    public int remove(Member member);

    public int modify(Member member);

    public Member get(Member member);

}
