package cn.com.konyo.user.domain;

import java.util.Map;

import cn.com.konyo.core.BaseDomain;

/**
 * 用户实体类
 * 
 * @author bsh
 */
public class LoginUser extends BaseDomain {
    private static final long serialVersionUID = 5998195363025668763L;

    private Long userId;

    private String wxcode;// 微信号

    private String username; // 用户姓名

    private Integer isadmin; // 是否是管理员 1：true 0:false

    private String password;

    private String phone;// 电话

    private String email;// 邮箱

    private String province;// 省份ID

    private String city;// 城市ID

    private String company;// 地区+公司

    private String post;// 岗位

    private String address;// 住址

    private String sex; // 性别

    private String education; // 学历

    private String arms; // 兵种

    private String householdregister; // 户籍

    private String birthday; // 获取生日

    private String desire; // 参军意愿

    private String politicalstatus; // 政治面貌

    // -------
    private String provinceName;// 省份名称

    private String cityName;// 城市名称

    private String idnumber; // 身份证号

    private Integer ishomeoffice;// 用户的类型:1未定，2本部，3非本部

    private transient Map<String, Object> params;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getWxcode() {
        return wxcode;
    }

    public void setWxcode(String wxcode) {
        this.wxcode = wxcode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Integer getIshomeoffice() {
        return ishomeoffice;
    }

    public void setIshomeoffice(Integer ishomeoffice) {
        this.ishomeoffice = ishomeoffice;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getArms() {
        return arms;
    }

    public void setArms(String arms) {
        this.arms = arms;
    }

    public String getHouseholdregister() {
        return householdregister;
    }

    public void setHouseholdregister(String householdregister) {
        this.householdregister = householdregister;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getDesire() {
        return desire;
    }

    public void setDesire(String desire) {
        this.desire = desire;
    }

    public String getPoliticalstatus() {
        return politicalstatus;
    }

    public void setPoliticalstatus(String politicalstatus) {
        this.politicalstatus = politicalstatus;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }
}
