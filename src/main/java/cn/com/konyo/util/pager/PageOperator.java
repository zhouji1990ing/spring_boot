package cn.com.konyo.util.pager;

/**
 * 通用分页操作类（有些情况可能不通用）
 * 
 * @author salcon
 * @date 2013-12-30
 */
public class PageOperator {

    public String getMobilePager(String url, int sum, int currnum, int length, String condtion, String language)
        throws Exception {

        String showsum = "总共";
        String showitem = "条数据";
        String showfirstpage = "首页";
        String showuppage = "上一页";
        String shownextpage = "下一页";
        String showlastpage = "末页";
        String showtotal = "共";
        String showpage = "页";

        String pagerinfo = "";
        StringBuffer sbinfo = new StringBuffer();

        int pagenum = 0;

        if (sum % length == 0) {

            pagenum = sum / length;

        }
        else {
            pagenum = sum / length + 1;
        }

        String first = "";
        if (url.indexOf("?") != -1) {
            first = "&";
        }
        else {
            first = "?";
        }
        String pageUrl = "";

        String firstUrl = url + first + "currpage=" + 1 + "&" + condtion;

        sbinfo.append("<li><a href=\"" + firstUrl + "\"><i class=\"fa fa-chevron-left\"></i></a></li>");

        String tempstr = "";
        if (pagenum < 10) {
            for (int i = 1; i < pagenum + 1; i++) {
                pageUrl = url + first + "currpage=" + i + "&" + condtion;
                if (i == currnum) {

                    tempstr = "<li class=\"active\"><a href=\"" + pageUrl + "\">" + i + "</a></li>";
                }
                else {
                    tempstr = "<li><a href=\"" + pageUrl + "\">" + i + "</a></li>";
                }
                sbinfo.append(tempstr);
            }
        }

        String endUrl = url + first + "currpage=" + pagenum + "&" + condtion;
        sbinfo.append("<li><a href=\"" + endUrl + "\"><i class=\"fa fa-chevron-right\"></i></a></li>");
        pagerinfo = sbinfo.toString();

        return pagerinfo;
    }

    public String getPager(String url, int sum, int currnum, int length, String condtion, String language)
        throws Exception {

        String showsum = "总共";
        String showitem = "条数据";
        String showfirstpage = "首页";
        String showuppage = "上一页";
        String shownextpage = "下一页";
        String showlastpage = "末页";
        String showjump = "跳转到";
        String showselect = "请选择";
        String showtotal = "共";
        String showpage = "页";

        String pagerinfo = "";
        StringBuffer sbinfo = new StringBuffer();

        int pagenum = 0;

        if (sum % length == 0) {

            pagenum = sum / length;

        }
        else {
            pagenum = sum / length + 1;
        }

        String first = "";
        if (url.indexOf("?") != -1) {
            first = "&";
        }
        else {
            first = "?";
        }
        String pageUrl = "";
        sbinfo.append(showsum + "<font color=\"red\">" + sum + "</font>" + showitem + "   ");

        String firstUrl = url + first + "currpage=" + 1 + "&" + condtion;
        sbinfo.append("<a href=\"" + firstUrl + "\">" + showfirstpage + "</a>  ");
        if (1 == currnum) {

            sbinfo.append(showuppage);

        }
        else {

            pageUrl = url + first + "currpage=" + (currnum - 1) + "&" + condtion;
            sbinfo.append("<a stlye=\"text-decoration: none;\" href=\"" + pageUrl + "\" >" + showuppage + "</a>");
        }

        String tempstr = "";
        if (pagenum < 10) {
            for (int i = 1; i < pagenum + 1; i++) {
                pageUrl = url + first + "currpage=" + i + "&" + condtion;
                if (i == currnum) {

                    tempstr = "<a stlye=\"text-decoration: none;\" href=\"" + pageUrl + "\" ><b><font color=\"red\">"
                        + i + "</font></b></a> ";
                }
                else {
                    tempstr = "<a stlye=\"text-decoration: none;\" href=\"" + pageUrl + "\" >" + i + "</a> ";
                }
                sbinfo.append(tempstr);
            }
        }
        else if (pagenum >= 10) {

            // sbinfo.append(". . . ");

            int min = currnum % 10 > 0 ? (currnum - currnum % 10) + 1 : currnum - 9;
            int max = currnum % 10 > 0 ? (((currnum - currnum % 10) + 11) > pagenum ? pagenum + 1
                : ((currnum - currnum % 10) + 11)) : (currnum + 1) > pagenum ? pagenum + 1 : (currnum + 1);
            for (int i = min; i < max; i++) {
                pageUrl = url + first + "currpage=" + i + "&" + condtion;
                if (i == currnum) {

                    tempstr = "<a stlye=\"text-decoration: none;\" href=\"" + pageUrl + "\" ><b><font color=\"red\">"
                        + i + "</font></b></a> ";
                }
                else {
                    tempstr = "<a stlye=\"text-decoration: none;\" href=\"" + pageUrl + "\" >" + i + "</a> ";
                }
                sbinfo.append(tempstr);
            }

        }
        else {
        }

        if (currnum == pagenum) {

            sbinfo.append(shownextpage);

        }
        else {
            pageUrl = url + first + "currpage=" + (currnum + 1) + "&" + condtion;
            sbinfo.append("<a href=\"" + pageUrl + "\">" + shownextpage + "</a>");

        }

        String endUrl = url + first + "currpage=" + pagenum + "&" + condtion;
        sbinfo.append(" <a href=\"" + endUrl + "\">" + showlastpage + "</a>   ");

        String selecturl = url + first + condtion;
        sbinfo
            .append(showjump + "<select onchange=\"window.location.href='" + selecturl + "&currpage='+this.value;\">");

        for (int i = 1; i < pagenum + 1; i++) {
            if (i == currnum) {
                sbinfo.append("<option value=\"" + i + "\" selected>" + i + "</option>");
            }
            else {
                sbinfo.append("<option value=\"" + i + "\">" + i + "</option>");
            }

        }
        sbinfo.append("</select>");
        sbinfo.append("  " + showtotal + "<font color=\"red\">" + pagenum + "</font>" + showpage);
        pagerinfo = sbinfo.toString();

        return pagerinfo;
    }

    /**
     * 获取分页字符串 如：首页 上一页 1 2 3 ... 7 8 9 10 下一页 末页
     * 
     * @param url
     * @param sum
     * @param currnum
     * @param length
     * @param condtion
     * @return
     * @throws Exception
     */
    public String getPager(String url, int sum, int currnum, int length, String condtion) throws Exception {

        return getPager(url, sum, currnum, length, condtion, null);
    }

    /**
     * 重写获取分页字符串方法，少了一个条件 如：首页 上一页 1 2 3 ... 7 8 9 10 下一页 末页
     * 
     * @param url
     * @param sum
     * @param currnum
     * @param length
     * @return
     * @throws Exception
     */
    public String getPager(String url, int sum, int currnum, int length) throws Exception {

        return getPager(url, sum, currnum, length, "", null);
    }

    // 前台分页
    public String getFrontPager(String url, int sum, int currnum, int length) throws Exception {
        return getFrontPager(url, sum, currnum, length, "", null);
    }

    // 前台分页
    public String getFrontPager(String url, int sum, int currnum, int length, String condtion, String language)
        throws Exception {

        String showuppage = "上一页";
        String shownextpage = "下一页";

        String pagerinfo = "";
        StringBuffer sbinfo = new StringBuffer();

        int pagenum = 0;

        if (sum % length == 0) {

            pagenum = sum / length;

        }
        else {
            pagenum = sum / length + 1;
        }

        String first = "";
        if (url.indexOf("?") != -1) {
            first = "&";
        }
        else {
            first = "?";
        }
        String pageUrl = "";
        // 上一页
        if (1 == currnum) {
            // sbinfo.append("<span>"+showuppage+"</span>");
        }
        else {
            pageUrl = url + first + "currpage=" + (currnum - 1) + "&" + condtion;
            sbinfo.append("<a class=\"ui-btn  ui-btn-prev \" data-ajax=\"false\" href=\"" + pageUrl + "\" >"
                + showuppage + "</a>");
        }
        sbinfo.append(" &nbsp;&nbsp;&nbsp; ");
        // 下一页
        if (currnum == pagenum) {
            // sbinfo.append("<span>"+shownextpage+"</span>");
        }
        else {
            pageUrl = url + first + "currpage=" + (currnum + 1) + "&" + condtion;
            sbinfo.append("<a class=\"ui-btn  ui-btn-next\" data-ajax=\"false\" href=\"" + pageUrl + "\">"
                + shownextpage + "</a>");
        }
        pagerinfo = sbinfo.toString();

        return pagerinfo;
    }

}