package cn.com.konyo.user.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;

import cn.com.konyo.user.dao.UserDao;
import cn.com.konyo.user.domain.LoginUser;
import cn.com.konyo.user.service.UserService;
import cn.com.konyo.util.Constants;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    
    @Autowired
    private UserDao userDao;

    public LoginUser loginUser(LoginUser loginUser) throws RuntimeException {
        try {
            Md5PasswordEncoder md5 = new Md5PasswordEncoder();
            String md5string = md5.encodePassword(loginUser.getPassword(), Constants.MD5_SLAT);
            // String pwd = MD5.Md5(md5string);
            // System.out.println("---md5string = "+md5string);

            loginUser.setPassword(md5string);

            // List<LoginUser> listUser = userDao.list(loginUser);
            // if(listUser.size() == 1){
            // return listUser.get(0);
            // }
            return userDao.loginUser(loginUser);

        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->loginUser ;");
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 用户列表
     */
    public List<LoginUser> list(LoginUser user) throws RuntimeException {
        List<LoginUser> list = new ArrayList<LoginUser>();
        try {
            user.setDeleted(0);
            list = userDao.list(user);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->list ;");
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 用户列表(无分页)
     */
    public List<LoginUser> listNopage(LoginUser user) throws RuntimeException {
        List<LoginUser> list = new ArrayList<LoginUser>();
        try {
            user.setDeleted(0);
            list = userDao.listNopage(user);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->listNopage ;");
            e.printStackTrace();
        }
        return list;
    }

    public LoginUser add(LoginUser user) throws RuntimeException {
        try {
            user.setCreateuser(user.getUserId());
            user.setCreatetime(new Date());
            user.setDeleted(0);
            userDao.save(user);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->add ;");
            e.printStackTrace();
        }
        return null;
    }

    public LoginUser get(LoginUser loginUser) throws RuntimeException {
        try {
            return userDao.get(loginUser);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->get ;");
            e.printStackTrace();
        }
        return null;
    }

    public int remove(LoginUser user) throws RuntimeException {
        return userDao.remove(user);
    }

    public int modify(LoginUser user) throws RuntimeException {
        int count = 0;
        try {
            user.setModifytime(new Date());
            count = userDao.modify(user);

        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->modify ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;
    }


    /*public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }*/

    /**
     * 根据OpenID 查询用户 是否已经注册，true:已经注册，false:未注册
     * 
     * @param user
     * @return
     * @throws RuntimeException
     */
    public boolean checkUserByWxcode(String wxcode) throws RuntimeException {
        LoginUser user = new LoginUser();
        user.setWxcode(wxcode);
        user = userDao.get(user);

        if (user == null || user.getUsername() == null) {
            return false;
        }
        return true;
    }

    /*
     * public static void main(String[] args) { Md5PasswordEncoder md5 = new Md5PasswordEncoder(); String md5string =
     * md5.encodePassword("konyo123", Constants.MD5_SLAT); System.out.println(md5string); }
     */

    /**
     * 设定第几个人中奖
     * 
     * @param num
     * @return
     * @throws RuntimeException
     */
    public int setAdmincreateuserNum(Integer num) throws RuntimeException {
        int count = 0;
        try {

            count = userDao.setAdmincreateuserNum(num);

        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->setAdmincreateuserNum ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;

    }

    /**
     * 设定第几个人中奖
     * 
     * @param num
     * @return
     * @throws RuntimeException
     */
    public long getAdmincreateuserNum(LoginUser loginUser) throws RuntimeException {
        long count = 0L;
        try {

            count = userDao.getAdmincreateuserNum(loginUser);
            System.out.println(count);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->setAdmincreateuserNum ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;

    }

    /**
     * 修改用户的类型
     */
    public int modifyIshomeoffice(LoginUser loginUser) throws RuntimeException {
        int count = 0;
        try {
            loginUser.setModifytime(new Date());
            loginUser.setIshomeoffice(loginUser.getIshomeoffice());
            count = userDao.modifyIshomeoffice(loginUser);

        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->modify ;", e.getMessage());
            throw new RuntimeException(e);
        }
        return count;
    }

    /*
     * 检查微信号 是否存在
     */
    public List<LoginUser> checkwxcode(LoginUser user) throws RuntimeException {
        return userDao.checkwxcode(user);
    }

    /**
     * 检查密码
     */
    public Integer checkPassword(LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            Md5PasswordEncoder md5 = new Md5PasswordEncoder();
            String md5string = md5.encodePassword(loginUser.getPassword(), Constants.MD5_SLAT);

            loginUser.setPassword(md5string);
            num = userDao.checkPassword(loginUser);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->checkPassword ;", e.getMessage());
            throw new RuntimeException(e);
        }

        return num;
    }

    /**
     * 修改密码
     */
    public Integer modifyPassword(LoginUser loginUser) throws RuntimeException {
        Integer num = 0;
        try {
            Md5PasswordEncoder md5 = new Md5PasswordEncoder();
            String md5string = md5.encodePassword(loginUser.getPassword(), Constants.MD5_SLAT);

            loginUser.setPassword(md5string);
            num = userDao.modifyPassword(loginUser);
        }
        catch (Exception e) {
            logger.info("Controller Error UserServiceImpl->modifyPassword ;", e.getMessage());
            throw new RuntimeException(e);
        }

        return num;
    }

    public HSSFWorkbook exportElect(LoginUser loginUser) throws RuntimeException {
        HSSFWorkbook workbook = new HSSFWorkbook();
        try {
            List<LoginUser> list = userDao.listNopage(loginUser);

            HSSFSheet sheet = workbook.createSheet("用户统计");
            // 创建列头
            HSSFRow row = sheet.createRow(0);
            row.createCell(0).setCellValue(new HSSFRichTextString("微信号"));
            row.createCell(1).setCellValue(new HSSFRichTextString("姓名"));
            row.createCell(2).setCellValue(new HSSFRichTextString("电话"));
            row.createCell(3).setCellValue(new HSSFRichTextString("性别"));
            row.createCell(4).setCellValue(new HSSFRichTextString("学历"));
            row.createCell(5).setCellValue(new HSSFRichTextString("兵种意愿"));
            row.createCell(6).setCellValue(new HSSFRichTextString("户籍"));
            row.createCell(7).setCellValue(new HSSFRichTextString("政治面貌"));
            row.createCell(8).setCellValue(new HSSFRichTextString("参军意向"));

            if (!list.isEmpty()) {
                Integer size = list.size();
                for (int i = 0; i < size; i++) {

                    row = sheet.createRow(i + 1);
                    row.createCell(0).setCellValue(new HSSFRichTextString(list.get(i).getWxcode()));
                    row.createCell(1).setCellValue(new HSSFRichTextString(list.get(i).getUsername()));
                    row.createCell(2).setCellValue(new HSSFRichTextString(list.get(i).getPhone()));
                    row.createCell(3).setCellValue(new HSSFRichTextString(list.get(i).getSex()));
                    row.createCell(4).setCellValue(new HSSFRichTextString(list.get(i).getEducation()));
                    row.createCell(5).setCellValue(new HSSFRichTextString(list.get(i).getArms()));
                    row.createCell(6).setCellValue(new HSSFRichTextString(list.get(i).getHouseholdregister()));
                    row.createCell(7).setCellValue(new HSSFRichTextString(list.get(i).getPoliticalstatus()));
                    row.createCell(8).setCellValue(new HSSFRichTextString(list.get(i).getDesire()));
                }
            }

        }
        catch (Exception e) {

            throw new RuntimeException(e);
        }

        return workbook;
    }
}
