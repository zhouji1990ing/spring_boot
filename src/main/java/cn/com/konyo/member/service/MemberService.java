package cn.com.konyo.member.service;

import java.util.List;
import java.util.Map;

import cn.com.konyo.member.domain.Member;
import cn.com.konyo.user.domain.LoginUser;

public interface MemberService {

    public List<Member> list(Member member, LoginUser loginUser) throws RuntimeException;

    public List<Member> listNopage(Member member, LoginUser loginUser) throws RuntimeException;

    public Integer add(Member member, LoginUser loginUser) throws RuntimeException;

    public int remove(Member member, LoginUser loginUser) throws RuntimeException;

    public Member get(Member member, LoginUser loginUser) throws RuntimeException;

    public Map<String, Object> modifyToken(Member member, LoginUser loginUser) throws RuntimeException;

    public int modify(Member member, LoginUser loginUser) throws RuntimeException;

}
