package cn.com.konyo.member.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import cn.com.konyo.member.dao.MemberDao;
import cn.com.konyo.member.domain.Member;
import cn.com.konyo.member.service.MemberService;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.util.Constants;
import cn.com.konyo.util.WeixinUtil;

@Service
public class MemberServiceImpl implements MemberService {

    private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

    /**
     * 用户列表
     */
    public List<Member> list(Member member, LoginUser loginUser) throws RuntimeException {
        List<Member> list = new ArrayList<Member>();
        try {
            member.setDeleted(0);
            list = memberDao.list(member);
        }
        catch (Exception e) {
            logger.info("Controller Error MemberServiceImpl->list ;");
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 用户列表(无分页)
     */
    public List<Member> listNopage(Member member, LoginUser loginUser) throws RuntimeException {
        List<Member> list = new ArrayList<Member>();
        try {
            member.setDeleted(0);
            list = memberDao.listNopage(member);
        }
        catch (Exception e) {
            logger.info("Controller Error MemberServiceImpl->listNopage ;");
            e.printStackTrace();
        }
        return list;
    }

    public Integer add(Member member, LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            member.setCreateuser(loginUser.getUserId());
            member.setCreatetime(new Date());
            member.setDeleted(0);
            num = memberDao.save(member);
        }
        catch (Exception e) {
            logger.info("Controller Error MemberServiceImpl->add ;");
            e.printStackTrace();
        }
        return num;
    }

    public Member get(Member member, LoginUser loginUser) throws RuntimeException {
        try {
            return memberDao.get(member);
        }
        catch (Exception e) {
            logger.info("Controller Error MemberServiceImpl->get ;");
            e.printStackTrace();
        }
        return null;
    }

    public int remove(Member member, LoginUser loginUser) throws RuntimeException {
        return memberDao.remove(member);
    }

    public int modify(Member member, LoginUser loginUser) throws RuntimeException {
        int count = 0;
        try {
            member.setModifytime(new Date());
            count = memberDao.modify(member);

        }
        catch (Exception e) {
            logger.info("Controller Error MemberServiceImpl->modify ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;
    }

    @Autowired
    private MemberDao memberDao;

    public static void main(String[] args) {
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();
        String md5string = md5.encodePassword("konyo123", Constants.MD5_SLAT);
        System.out.println(md5string);
    }

    public Map<String, Object> modifyToken(Member member, LoginUser loginUser) throws RuntimeException {
        String token = "";
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            Member mem = memberDao.get(member);
            Date lastupdate = mem.getLastupdate();
            String appId = mem.getAppId();
            String appSecret = mem.getAppSecret();
            Date now = new Date();
            // 如果token不存在，重新生成

            if (!mem.getToken().isEmpty()) {
                // 如果token过期，重新生成并保存到数据库
                if ((now.getTime() - lastupdate.getTime()) > 7190 * 1000) {

                    map = WeixinUtil.getToekn(appId, appSecret);
                    String errcode = map.get("errcode").toString();
                    if (errcode == "0") {
                        token = map.get("token").toString();
                        mem.setToken(token);
                        mem.setLastupdate(new Date());
                        memberDao.modifyToken(mem);
                    }

                }
                else {
                    token = mem.getToken();
                    map.put("errcode", "0");
                    map.put("token", token);
                }
            }
            else {
                map = WeixinUtil.getToekn(appId, appSecret);
                String errcode = map.get("errcode").toString();
                if (errcode == "0") {
                    token = map.get("token").toString();
                    mem.setToken(token);
                    mem.setLastupdate(new Date());
                    memberDao.modifyToken(mem);
                }
            }

        }
        catch (Exception e) {
            map.put("errcode", "602");
            map.put("errmsg", "程序异常");
            map.put("token", "");
            logger.info("Controller Error MemberServiceImpl->getToken ;");
            e.printStackTrace();
        }
        return map;
    }

}
