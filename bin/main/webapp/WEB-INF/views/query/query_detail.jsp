<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前沿观点 -- 详情页面</title>
<script type="text/javascript" charset="utf-8" src="<c:url value='/ueditor/ueditor.parse.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<style type="text/css">
 p{
 color: #333332;
margin-bottom:30px;
font-family: 'Open Sans', Arial, 'Hiragino Sans GB', 'Microsoft YaHei', 微软雅黑, STHeiti, 'WenQuanYi Micro Hei', SimSun, sans-serif;
font-size: 18px;
line-height: 30px;
font-style: normal;
font-variant: normal;
font-weight: normal;
}
</style>

</head>
<body>
<div class="cen_rht">
  <div class="top_search">
  	<!-- 中间内容 -->
      <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
          <TR>
            <TD vAlign=top width="100%" bgColor=#ffffff>
              <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TR>
                 <TD class=manageHead>当前位置：管理首页 &gt; 新闻管理 &gt; 前沿观点  &gt;详情</TD>
              </TR>
              <TR>
                <TD height=2></TD>
              </TR>
              </TABLE>
              <!-- 主数据区域，查询表单区域 -->
              <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
                <TBODY>
                  <!-- 数据筛选区域，查询表单区域 -->
                  <TR>
                  <div>
                   <span class="title_menu">功能菜单：</span>
		            <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/query/list' />'" />
                  </div>
                  <div class="content-wrapper" style="width:620px;margin:0px auto;">
                  <h1 class="title" style="font-size: 2.2rem;font-weight: bold;line-height: 1.5;padding:20px 0px;color: #38485a;">${query.title }</h1>
                  <div class="article">${query.content }</div>
                  </div>
                   
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE>
  </div>
</div>
<script>
uParse('.article', {
    rootPath: "<c:url value='/ueditor'/>"
})
</script>
</body> 
</html>
